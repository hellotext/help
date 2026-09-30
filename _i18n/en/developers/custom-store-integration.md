Use this guide when your store does not have a native Hellotext integration and your team needs to connect it through the API and Hellotext.js.

The implementation has two parts:

- **Your backend** uses a private authorization token to create and update customer profiles, properties, products, orders, and trusted server-side events.
- **Your storefront** uses the public Business ID with Hellotext.js to create visitor sessions and track browser activity such as page views, product views, and cart changes.

> **Keep the credentials separate:** the API authorization token belongs only on your server. Never put it in browser code. The Business ID used by Hellotext.js is the public identifier intended for the storefront.

This guide provides the recommended implementation order. Use the [API reference]({% link _developers/api.md %}) for the complete request and response contract of every endpoint.

## Before you start

Prepare:

- Owner or Administrator access to the Hellotext business.
- Access to the store backend and storefront code.
- Stable customer, product, cart, and order identifiers from your system.
- The currency, product structure, and order states used by the store.
- A clear record of consent. Creating a customer profile does not prove that the customer consented to receive messages.

Choose a consistent source name, such as `custom_store`, and reuse it for products, carts, and orders. This source describes your records; it does not by itself enable a source supported by `identify()`.

Keep a mapping in your backend:

| Store record | Hellotext value to retain |
| --- | --- |
| Customer `customer-4821` | `PROFILE_ID` returned when creating or synchronizing the profile |
| Customer ID field | `PROPERTY_ID` of its reusable definition |
| Product or variant `product-100` | `PRODUCT_ID` of the exact product or variant |
| Cart `CART-9001` and order `ORDER-1001` | Separate object IDs, together with `source` and `reference` |
| Browser session | The real `Hellotext.session`, associated with the authenticated customer |

Uppercase values in the examples are placeholders to replace. Names, domains, and amounts are fictional; the examples do not represent requests that have been executed.

## 1. Create an API authorization token

1. In Hellotext, open **Settings → Authorization Tokens**.
2. Select **Create new token**. Enter a recognizable **Token name**, such as “Custom store · development”.
3. Continue to create the token, then copy it when Hellotext displays it. It cannot be displayed again.
4. Store it in your backend secret manager or environment as `HELLOTEXT_API_TOKEN`.

The figure shows only the name in an unsaved draft. No token has been created or displayed yet.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Create a new token with Token name Custom store · development, in an unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-en-mobile.png 2x" width="748" height="480" />
        <img src="/images/developers/custom-store-integration/token-en.png" srcset="/images/developers/custom-store-integration/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="524" loading="lazy" decoding="async" alt="Create a new token with Token name Custom store · development, in an unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real authorization form with an unsaved fictional name. No private token was created or exposed.</figcaption>
</figure>

Before creating it, verify the selected business. Keep its public Business ID and private secret in separate backend configuration variables. To check authentication from the server:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/profiles \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

A successful response confirms that the request authenticated; it does not by itself prove this is the expected business. Check the business where you created the token and a known profile. A `401` response usually means that the token is missing, invalid, or revoked. Creation, update, and tracking operations also require a compatible active subscription.

See [Hellotext API authentication](https://www.hellotext.com/api#authentication) for the authorization header format and possible responses.

## 2. Create the property definitions you need

Hellotext already includes first name and last name as standard customer profile data, as well as properties for phone, email, address, company, gender, and birthday. Use these built-in fields instead of recreating them as custom properties.

Create any additional properties your customer profiles need to represent business-specific data, such as a loyalty identifier, preferred store, customer tier, size, or account type.

Create each reusable property once:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/properties \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Customer ID",
    "kind": "text",
    "unique": true
  }'
```

Save the returned property `id`. You will use that ID when assigning a value to a customer profile. The definition describes the field; `customer-4821` will be its value on a profile. `unique: true` restricts duplicate values, but does not turn this property into an automatic customer lookup or update mechanism. Choose the correct `kind` before importing values, because it determines how Hellotext validates, displays, and segments the property.

See [Create a property in the API](https://www.hellotext.com/api#create_a_property) for every supported type, parameter, and option. For more about global and customer-profile-specific properties, see [Custom properties and events]({% link _audience/custom-properties-and-events.md %}).

## 3. Create or synchronize customer profiles

Create a customer profile with the identifiers and attributes you already know:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/profiles \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "first_name": "Ana",
    "last_name": "Silva",
    "email[primary]": "ana@example.test",
    "property_by_id[PROPERTY_ID]": "customer-4821"
  }'
```

The response includes the Hellotext customer profile `id`. Store it beside the customer record in your system and use `PATCH /v1/profiles/PROFILE_ID` to update it. Do not assume every attribute has finished processing when the ID is returned: confirm its values with `GET /v1/profiles/PROFILE_ID` before relying on them in segments or playbooks.

Hellotext can match an existing customer profile by phone or email when you create or update it. Even so, your integration should keep the returned Hellotext ID and update the existing customer profile instead of blindly creating a new one on every synchronization.

Do not mark imported customer profiles as subscribed unless you have valid consent for the relevant channel. Customer profile creation, identity, and messaging permission are separate concerns. See [Create a customer profile in the API](https://www.hellotext.com/api#create_a_profile) for every available field and [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}) for consent guidance.

## 4. Synchronize the product catalog

Create the products and variants that Hellotext needs for recommendations, product activity, carts, orders, and playbooks:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/products \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Everyday Sneakers",
    "reference": "product-100",
    "sku": "SKU-100",
    "source": "custom_store",
    "url": "https://shop.example.com/products/everyday-sneakers",
    "image_url": "https://shop.example.com/images/everyday-sneakers.jpg",
    "price": {
      "amount": 89.90,
      "currency": "USD"
    },
    "categories": ["Shoes"],
    "tags": ["Everyday"]
  }'
```

Save the returned product `id`. Use that ID when tracking product views and when adding items to carts or orders. If the store sells a variant, retain that variant’s ID; do not substitute the parent product ID.

Keep `source`, `reference`, and SKU values stable. Update the existing product when its name, price, image, URL, categories, tags, variants, or other supported data changes. Do not create a new Hellotext product for every catalog sync. Use `PATCH /v1/attribution/products/PRODUCT_ID` for the mapped record; a stable reference helps locate it but does not guarantee that every POST becomes an update.

See [Create a product in the API](https://www.hellotext.com/api#create_a_product) for all supported product and variant data.

The public product endpoint does not currently expose stock quantity or live availability. Do not add inventory values to `metadata` and assume that inventory-aware playbooks will use them. Read [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %}) before enabling a workflow that depends on stock.

## 5. Import historical orders

Historical orders give Hellotext purchase context before the first live event arrives. Each imported order needs:

- A stable order reference and source.
- The correct customer profile.
- Products and quantities.
- Total amount and currency.
- The original event time.

First create the order and keep its returned `id`:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/orders \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "reference": "ORDER-1001",
    "source": "custom_store",
    "delivery": "deliver",
    "items": [
      {
        "product": "PRODUCT_ID",
        "quantity": 1,
        "price": {
          "amount": 89.90,
          "currency": "USD"
        }
      }
    ]
  }'
```

In this example, one unit at USD 89.90 produces a USD 89.90 total calculated from the items. The creation endpoint calculates that total from item prices and quantities; do not rely on sending a separate `total` in this request. The following event’s `amount` is the monetary value associated with the milestone, not an item count. Use an explicit ISO 4217 currency.

Then record the order event against the customer profile. `tracked_at` is the original event time as a Unix timestamp in **seconds**, not milliseconds:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "order.confirmed",
    "profile": "PROFILE_ID",
    "object": "ORDER_ID",
    "amount": 89.90,
    "currency": "USD",
    "tracked_at": 1751328000
  }'
```

Use the event that reflects what really happened, such as `order.placed`, `order.confirmed`, `order.cancelled`, `order.shipped`, or `order.delivered`. Do not invent lifecycle events that your store cannot verify.

Creating the order object does not by itself record a purchase milestone. A tracking response with `status: "received"` confirms receipt, not that the event is already in the history or a sale has been attributed. Check processing after import. This historical order and the live order in step 9 are implementation alternatives; do not record an occurrence that has already been imported again.

Preserve original timestamps during the historical import. Otherwise, old purchases can look like current activity and distort segmentation, playbook eligibility, and reporting.

See [Create and track orders with the API]({% link _developers/orders-with-api.md %}), [Create an order](https://www.hellotext.com/api#create_an_order), and [track order events](https://www.hellotext.com/api#track_order_events) for all available options.

## 6. Install Hellotext.js on the storefront

Install the package with npm:

```bash
npm install @hellotext/hellotext@2.6.0
```

Import and initialize it once when the storefront starts:

```javascript
import Hellotext from '@hellotext/hellotext'

await Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
```

The `HELLOTEXT_BUSINESS_ID` is the public identifier labeled **Business ID** in **Settings**. Use your own business’s value; the one in the figure belongs only to the local demonstration. It is not the private API authorization token.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Settings for the fictional Enterprise business with Business ID 4ONLdN32 and Edit business.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Settings for the fictional Enterprise business with Business ID 4ONLdN32 and Edit business." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface in an isolated local database. The public ID belongs only to the fictional business; it is not a private token or an Enterprise pricing example.</figcaption>
</figure>

The examples pin version 2.6.0. `initialize()` returns a Promise: wait for it to resolve before continuing the setup flow. Run snippets containing `await` in a JavaScript module or an `async` function; on a storefront with internal navigation, initialize once and track activity for each new view.

For a site without a JavaScript bundler, use the script build:

```html
<script src="https://unpkg.com/@hellotext/hellotext@2.6.0/dist/hellotext.js"></script>
<script>
  Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
    .then(() => Hellotext.track('page.viewed'))
    .then(response => {
      if (response.failed) console.error(response.data)
    })
    .catch(error => console.error(error))
</script>
```

Use the [Hellotext.js repository](https://github.com/hellotext/hellotext.js) for the current package, framework, Forms, and Webchat instructions.

## 7. Track browser activity

Hellotext.js creates or restores the visitor session and automatically adds page information to tracking requests. In the version used here, initializing the library does not itself record `page.viewed`: call it once per page load or navigation after initialization.

```javascript
const pageResponse = await Hellotext.track('page.viewed')

if (pageResponse.failed) {
  console.error(pageResponse.data)
}
```

If you used the no-bundler script in the previous step, it already records the first view; do not send it again. In an SPA, record subsequent views after each navigation completes. The current URL is included without having to pass it manually.

A page view does not identify which product the customer is viewing. On every product page, explicitly include the corresponding product. If you have already synchronized the catalog, use the ID returned by Hellotext:

Track a known product view:

```javascript
await Hellotext.track('product.viewed', {
  object: 'PRODUCT_ID',
})
```

If the Hellotext ID is not yet available in the storefront, you can send the data needed to create or find the product. Keep `reference` and `source` stable to prevent duplicates:

```javascript
await Hellotext.track('product.viewed', {
  object_parameters: {
    name: 'Everyday Sneakers',
    reference: 'product-100',
    source: 'custom_store',
    url: window.location.href,
    image_url: 'https://shop.example.com/images/everyday-sneakers.jpg',
    price: {
      amount: 89.90,
      currency: 'USD',
    },
  },
})
```

Track a cart item with a stable cart reference:

```javascript
const response = await Hellotext.track('cart.added', {
  object_parameters: {
    reference: 'CART-9001',
    source: 'custom_store',
    items: [
      {
        product: 'PRODUCT_ID',
        quantity: 1,
      },
    ],
  },
})

if (response.failed) {
  console.error(response.data)
}
```

Reuse the same reference and source for the same cart. In `cart.added`, `quantity` is the resulting quantity of that product in the cart, not an increment. When it changes from one to two units, send `quantity: 2`.

The `received` response does not return the cart ID. Use `GET /v1/attribution/carts`, paginate the list to locate your reference/source, and retain its `id`. `cart.abandoned` requires that existing cart in `object`; sending `object_parameters` again is not enough. Track it only when your store has actually determined abandonment. For removals, use `cart.removed` with the products that were actually removed and check the resulting state.

Hellotext.js can also track an order when the confirmation page is the only available integration point. You must explicitly include the order and its products:

```javascript
await Hellotext.track('order.placed', {
  amount: 89.90,
  currency: 'USD',
  object_parameters: {
    reference: 'ORDER-1001',
    source: 'custom_store',
    delivery: 'deliver',
    items: [
      {
        product: 'PRODUCT_ID',
        quantity: 1,
      },
    ],
  },
})
```

Browser events are appropriate for browsing and cart behavior. Whenever possible, record trusted purchase and fulfillment milestones from the backend so customers cannot fabricate orders by calling browser code. Do not send the same order event from both the browser and the backend.

Version 2.6.0 requires the explicit `page.viewed` call shown above, although [Tracking events]({% link _developers/tracking-events.md %}) retains an automatic-tracking description. Use steps 6 and 7 of this guide to implement page views. See [product events](https://www.hellotext.com/api#track_product_events), [cart events](https://www.hellotext.com/api#track_cart_events), and [order events](https://www.hellotext.com/api#track_order_events) for every supported action and parameter.

## 8. Connect anonymous activity to the customer

Hellotext.js starts with an anonymous visitor session. When the visitor logs in, registers, or completes checkout, connect that session to the Hellotext customer profile.

The preferred method is server-to-server:

1. Read `Hellotext.session` after initialization. Wait for a tracking request to register that session with Hellotext.
2. Send that real session ID to your backend. The backend must resolve the profile from the authenticated customer, rather than trusting a `PROFILE_ID` chosen by the browser.
3. Attach the session to the stored Hellotext customer profile ID using the private API token.

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID"
  }'
```

Assigning the session allows its anonymous activity to become part of the profile; event promotion and cart updates are processed afterward. Check the profile history after that processing completes. If the session does not exist yet, do not invent another ID to get past the error: register the real session first and verify it again.

For a custom store, do not use `identify()` with an invented `source` value. That method is reserved for sources supported by Hellotext.js when server-to-server identification is unavailable. If a compatible integration uses `identify()`, it must call `Hellotext.forget()` when the customer logs out. This clears browser identity but keeps `hello_session`; it does not detach a session on the server. Include account switching and shared-device use in your checks so another person’s activity is not transferred into the current profile.

See [Attach a session in the API](https://www.hellotext.com/api#attach_session) for every parameter and [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}) for the complete flow, the `identify()` alternative, and logout handling.

## 9. Track trusted events from the backend

Use `POST /v1/attribution/events` for activity that happens outside the browser or must be trusted, including:

- Order placement and confirmation.
- Payment or purchase events.
- Cancellation, shipping, and delivery milestones.
- Physical-store or marketplace activity.
- Events created by jobs, webhooks, or internal systems.

Send either the Hellotext customer profile ID when the customer is known or the Hellotext session ID when only the session is available. Include `tracked_at` in seconds when the event happened before the request was sent. When a purchase originates from a visit or campaign, also retain the real session that led to it and pass it as `session` if it belongs to the same customer. A `PROFILE_ID` identifies the customer but does not by itself prove a campaign’s origin.

For example, track `order.placed` when your backend confirms that the order was created:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "order.placed",
    "profile": "PROFILE_ID",
    "object": "ORDER_ID",
    "amount": 89.90,
    "currency": "USD"
  }'
```

Reuse the same `ORDER_ID` for `order.confirmed`, `order.shipped`, `order.delivered`, or `order.cancelled` as the order changes state. Send only events your backend can verify. Keep a record of milestones sent for each order and choose one source for each occurrence. After a timeout or uncertain response, check the history before retrying: repeating the same reference does not guarantee that an event is idempotent.

See [Tracking in the API](https://www.hellotext.com/api#tracking), [order events](https://www.hellotext.com/api#track_order_events), and [External tracking]({% link _developers/external-tracking.md %}) for every parameter and additional server-side examples.

## 10. Verify the complete integration

Before enabling playbooks or campaigns, test one recognizable customer from beginning to end:

1. Create or update the customer profile and confirm its phone, email, and custom properties.
2. Confirm that the product and variant IDs match the store catalog.
3. Open the storefront and verify that Hellotext.js creates a session.
4. Track a product view and a cart update.
5. Identify the customer or attach the session from the backend.
6. Create a test order and record its real lifecycle event server-side.
7. Confirm processed profile values and that events appear in the correct history with the expected object, amount, currency, and timestamp. `received` alone is not verification.
8. Review playbook and reporting activity only after the underlying customer profile, product, cart, and order records are correct.

Run this check with isolated fictional data, non-deliverable contacts, and disabled playbooks. It does not require campaigns, messages, or test deliveries. Verify retries and account switching before activating live workflows.

If data is missing, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Go-live checklist

- The private token exists only in backend secrets.
- The public Business ID is used by Hellotext.js.
- Customer, product, cart, and order mappings use stable IDs.
- Product updates do not create duplicate catalog records.
- Historical orders preserve their original timestamps and currencies.
- Browser tracking covers browsing and cart activity.
- Server-side tracking covers trusted order and fulfillment events.
- Anonymous sessions are attached when a customer becomes known.
- Page views are recorded once per navigation without duplicating the first event.
- Logout clears identity; `forget()` is not treated as server-side session detachment.
- Received events are verified after processing and retries do not duplicate milestones.
- Subscription status is set only from valid consent evidence.

## Related guides

- [Developers and API overview]({% link _developers/developers-overview.md %})
- [Product catalog synchronization]({% link _integrations/product-catalog-sync.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Create and track coupons with the API]({% link _developers/coupons-with-api.md %})
- [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
