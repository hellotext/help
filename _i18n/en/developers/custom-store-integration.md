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

Choose a consistent source name, such as `custom_store`, and reuse it for products, carts, orders, and browser identity. Do not change this value between requests.

## 1. Create an API authorization token

1. In Hellotext, open **Settings → Authorization Tokens**.
2. Select **Create new token** and give the token a name that identifies the integration.
3. Copy the token when Hellotext displays it. It cannot be displayed again.
4. Store it in your backend secret manager or environment as `HELLOTEXT_API_TOKEN`.

Test the token from your server:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/profiles \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

A successful response confirms that the token belongs to the expected business. A `401` response usually means that the token is missing, invalid, or revoked.

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

Save the returned property `id`. You will use that ID when assigning a value to a customer profile. Choose the correct `kind` before importing values, because it determines how Hellotext validates, displays, and segments the property.

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
    "email[primary]": "ana@example.com",
    "phone[mobile]": "+59899000001",
    "property_by_id[PROPERTY_ID]": "customer-4821"
  }'
```

The response includes the Hellotext customer profile `id`. Store it beside the customer record in your system and use it for later updates and server-side events.

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

Save the returned product `id`. Use that ID when tracking product views and when adding items to carts or orders.

Keep `source`, `reference`, and SKU values stable. Update the existing product when its name, price, image, URL, categories, tags, variants, or other supported data changes. Do not create a new Hellotext product for every catalog sync.

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
    "total": {
      "amount": 89.90,
      "currency": "USD"
    },
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

Then record the order event against the customer profile. `tracked_at` is the original event time as a Unix timestamp:

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

Preserve original timestamps during the historical import. Otherwise, old purchases can look like current activity and distort segmentation, playbook eligibility, and reporting.

See [Create and track orders with the API]({% link _developers/orders-with-api.md %}), [Create an order](https://www.hellotext.com/api#create_an_order), and [track order events](https://www.hellotext.com/api#track_order_events) for all available options.

## 6. Install Hellotext.js on the storefront

Install the package with npm:

```bash
npm install @hellotext/hellotext
```

Import and initialize it once when the storefront starts:

```javascript
import Hellotext from '@hellotext/hellotext'

Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
```

The `HELLOTEXT_BUSINESS_ID` is the public identifier shown in the Hellotext business settings. It is not the private API authorization token.

For a site without a JavaScript bundler, use the script build:

```html
<script src="https://unpkg.com/@hellotext/hellotext"></script>
<script>
  Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
</script>
```

Use the [Hellotext.js repository](https://github.com/hellotext/hellotext.js) for the current package, framework, Forms, and Webchat instructions.

## 7. Track browser activity

Hellotext.js creates the visitor session and automatically tracks `page.viewed` with the current URL. You do not need to send that event manually.

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

Reuse the same cart reference for later `cart.added` and `cart.removed` activity. Track `cart.abandoned` only when your store has actually determined that the cart was abandoned.

Hellotext.js can also track an order when the confirmation page is the only available integration point. You must explicitly include the order and its products:

```javascript
await Hellotext.track('order.placed', {
  amount: 89.90,
  currency: 'USD',
  object_parameters: {
    reference: 'ORDER-1001',
    source: 'custom_store',
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

See [Tracking events]({% link _developers/tracking-events.md %}) for automatic page views and [product events](https://www.hellotext.com/api#track_product_events), [cart events](https://www.hellotext.com/api#track_cart_events), and [order events](https://www.hellotext.com/api#track_order_events) for every supported action and parameter.

## 8. Connect anonymous activity to the customer

Hellotext.js starts with an anonymous visitor session. When the visitor logs in, registers, or completes checkout, connect that session to the Hellotext customer profile.

The preferred method is server-to-server:

1. Read `Hellotext.session` in the browser.
2. Send the session ID to your backend together with the authenticated customer.
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

This moves the earlier anonymous activity into the known customer profile.

For a custom store, do not use `identify()` with an invented `source` value. That method is reserved for sources supported by Hellotext.js when server-to-server identification is unavailable. If a compatible integration uses `identify()`, it must call `Hellotext.forget()` when the customer logs out.

See [Attach a session in the API](https://www.hellotext.com/api#attach_session) for every parameter and [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}) for the complete flow, the `identify()` alternative, and logout handling.

## 9. Track trusted events from the backend

Use `POST /v1/attribution/events` for activity that happens outside the browser or must be trusted, including:

- Order placement and confirmation.
- Payment or purchase events.
- Cancellation, shipping, and delivery milestones.
- Physical-store or marketplace activity.
- Events created by jobs, webhooks, or internal systems.

Send either the Hellotext customer profile ID when the customer is known or the Hellotext session ID when only the session is available. Include `tracked_at` when the event happened before the request was sent.

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

Reuse the same `ORDER_ID` for `order.confirmed`, `order.shipped`, `order.delivered`, or `order.cancelled` as the order changes state. Send only events your backend can verify.

See [Tracking in the API](https://www.hellotext.com/api#tracking), [order events](https://www.hellotext.com/api#track_order_events), and [External tracking]({% link _developers/external-tracking.md %}) for every parameter and additional server-side examples.

## 10. Verify the complete integration

Before enabling playbooks or campaigns, test one recognizable customer from beginning to end:

1. Create or update the customer profile and confirm its phone, email, and custom properties.
2. Confirm that the product and variant IDs match the store catalog.
3. Open the storefront and verify that Hellotext.js creates a session.
4. Track a product view and a cart update.
5. Identify the customer or attach the session from the backend.
6. Create a test order and record its real lifecycle event server-side.
7. Confirm that the events appear on the correct customer profile and use the expected timestamps.
8. Review playbook and reporting activity only after the underlying customer profile, product, cart, and order records are correct.

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
- Logout calls `Hellotext.forget()` when browser identification is used.
- Subscription status is set only from valid consent evidence.

## Related guides

- [Developers and API overview]({% link _developers/developers-overview.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Create and track coupons with the API]({% link _developers/coupons-with-api.md %})
- [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
