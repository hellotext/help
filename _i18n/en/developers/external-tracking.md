Use this guide to send trusted events to Hellotext when they happen outside the browser, for example in your backend, POS, CRM, ERP, marketplace, logistics provider, jobs, or webhooks.

External tracking complements Hellotext.js. Use Hellotext.js for navigation and cart activity that happens in the storefront. Use the API from your backend for orders, payments, cancellations, shipments, deliveries, and other actions the server can verify. Choose one source for each occurrence: if an existing integration already tracks an order, do not submit it again through a webhook and Hellotext.js. Track only actions that already happened and that your system can verify.

If you are connecting a custom store from the beginning, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}) to implement customer profiles, catalog data, orders, Hellotext.js, and identity in the recommended order.

## Before you start

Prepare:

- A private API authorization token for the correct business, stored only in your backend, and a subscription that permits API use.
- The action name you want to track, such as `product.viewed`, `order.placed`, or an existing custom action.
- The Hellotext customer profile ID or a Hellotext session ID.
- The related object ID, such as a product or order, or the data needed to create it.
- Stable identifiers from the source system to prevent duplicate objects.

Every example sends a `POST` request to:

```text
https://api.hellotext.com/v1/attribution/events
```

In the business you want to integrate, open **Settings**, select **Manage your authorization tokens**, then **Create new token**. The example shows only an unsaved fictional name: it contains no credential and does not confirm token creation.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Create a new token with Token name Custom store · development, in an unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-en-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-en.png" srcset="/images/developers/custom-store-integration/token-spacing/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Create a new token with Token name Custom store · development, in an unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real authorization form with an unsaved fictional name. No private token was created or exposed.</figcaption>
</figure>

Send the private token through the `Authorization` header. The public Business ID used by Hellotext.js and the token name do not replace its secret value. See [API authentication](https://www.hellotext.com/api#authentication) to create and use the token correctly.

The examples use IDs and an environment token as placeholders. Replace them with resources from the same business and facts your system can confirm.

## 1. Choose the customer profile or session

Every event needs either `profile` or `session`. Do not use `profile_id` or `session_id` in this request body.

### When the customer is known

Use `profile` with the Hellotext customer profile ID. For example, track a view for a product that already exists in the catalog:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "product.viewed",
    "profile": "PROFILE_ID",
    "object": "PRODUCT_ID"
  }'
```

Keep the ID returned by Hellotext when you create the customer profile and its mapping to the customer in your own system. Resolve that identity in your backend; do not trust an arbitrary ID supplied by the browser. Tracking activity does not subscribe the customer or grant permission to message them. If it does not exist yet, see [Create a customer profile](https://www.hellotext.com/api#create_a_profile).

### When only the session is known

After loading SDK **2.6.0**, await initialization before reading the visitor’s actual session. The Business ID in this example is public:

```javascript
async function initializeTracking() {
  await Hellotext.initialize("YOUR_BUSINESS_ID")
  const sessionId = Hellotext.session
  // Send sessionId to your backend here.
}

initializeTracking()
```

Send that ID to your backend in the correct visitor context and use `session` when tracking the event. Do not invent a session or reuse another visitor’s session; check that the SDK exposes an ID before constructing the request:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "product.viewed",
    "session": "HELLOTEXT_SESSION_ID",
    "object": "PRODUCT_ID"
  }'
```

If you send `profile` and `session` together, use a session already attached to that same profile and business. For a session that is still unidentified, complete its attachment through the documented session flow first, after verifying the customer’s identity; do not use a tracking request as a substitute for attachment. Do not try to reassign another customer’s session.

Initialization does not automatically track `page.viewed` in SDK 2.6.0. For navigation tracking, follow the explicit Hellotext.js example in the custom-store guide linked above and avoid duplicating the first view. Retaining the session can provide attribution context, but does not guarantee that an event will attribute revenue.

See [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}) to learn how to retain and attach sessions.

## 2. Associate the correct object

Most built-in actions require a related object:

- `object` identifies an object that already exists in Hellotext.
- `object_parameters` contains the data needed to create or find the object while the event is tracked.

Use `object` when you have synchronized the catalog or order and retained the ID returned by Hellotext. Use `object_parameters` when the source system has all the required information but the Hellotext ID is not yet available.

This example tracks a view and creates or finds the product through `reference` and `source`:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "product.viewed",
    "profile": "PROFILE_ID",
    "object_parameters": {
      "name": "Everyday Sneakers",
      "reference": "product-100",
      "source": "custom_store",
      "url": "https://shop.example.com/products/everyday-sneakers",
      "price": {
        "amount": 89.90,
        "currency": "USD"
      }
    }
  }'
```

Keep `reference` and `source` stable. Store their mapping to a Hellotext object ID only when a separate resource creation or lookup request returns that ID; the tracking response `{"status":"received"}` does not return the created or matched object’s ID. Changing them between requests can create separate objects for the same product, cart, or order. Use one alternative, `object` or `object_parameters`, to express which resource to associate.

Object creation and event acceptance are separate operations. Some object data is validated or saved during the request: if the event fails, check whether the resource already exists before creating it again. Finding or creating a product also does not necessarily update an existing catalog record; use the update endpoint when its data changes.

See [product events](https://www.hellotext.com/api#track_product_events), [cart events](https://www.hellotext.com/api#track_cart_events), and [order events](https://www.hellotext.com/api#track_order_events) for the object and parameters required by each action.

## 3. Track the order lifecycle

To track several states for one order, create or synchronize the order first and retain its Hellotext ID. Then reuse that ID for every real lifecycle event:

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

The example amount is **USD 89.90**, in major currency units, not 8,990 cents. It must match the actual order. If the change occurred earlier, add `tracked_at` with its original time, as explained below.

Reuse the same `ORDER_ID` to track only the changes your system can confirm:

- `order.confirmed` when the business confirms the order.
- `order.shipped` when the order leaves for delivery.
- `order.delivered` when delivery is confirmed.
- `order.cancelled` when the order is cancelled.

Do not track every state when the order is created. Send each event only when that change actually happens. Do not replace the order ID with its display code or assume that tracking `order.placed` confirms a payment or attributes a sale. See [Create an order](https://www.hellotext.com/api#create_an_order) for every available field.

## 4. Track custom actions

Hellotext includes actions for products, carts, orders, forms, coupons, and other common objects. When none represents your business activity, create a custom action first and then use its name in `action`:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "appointment.booked",
    "profile": "PROFILE_ID",
    "tracked_at": "2026-08-07T12:30:00Z"
  }'
```

In **Settings > Actions > Custom**, the fictional “Appointment booked” definition has the tracking name `appointment.booked`. Use that exact name in `action`, not the display title or definition ID. The screenshot shows a definition without events; the JSON above illustrates an occurrence and does not confirm it was sent.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional Appointment booked action with tracking name appointment.booked in the Actions Custom tab, beside Create new action.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 894px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/catalog-en-mobile.png 2x" width="764" height="346" />
        <img src="/images/developers/custom-actions/catalog-en.png" srcset="/images/developers/custom-actions/catalog-en.png 2x" style="width: auto; margin: 0 auto;" width="1752" height="838" loading="lazy" decoding="async" alt="Fictional Appointment booked action with tracking name appointment.booked in the Actions Custom tab, beside Create new action." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real action catalog with a fictional definition without events; the mobile focus shows its row and Create new action.</figcaption>
</figure>

A custom action can be tracked without a related object. If you send an object, also provide `object_type` with a compatible type from the same business and its ID or required parameters. Creating a definition does not track activity; review its goal and passive options in [Custom actions]({% link _developers/custom-actions.md %}) before using it.

See [Create an action](https://www.hellotext.com/api#create_an_action) before tracking the first custom event.

## 5. Preserve timestamps and monetary values

If the event happened before the request was sent, include `tracked_at` as an ISO 8601 date with a time zone or a Unix timestamp **in seconds**, not milliseconds. For example, `2026-08-07T12:30:00Z` indicates UTC. If omitted, the event processing time is used; a delayed job can make it differ from the actual occurrence time.

Use the original event time for historical imports, delayed jobs, and retried webhooks. This preserves activity chronology, but does not make a historical event eligible for a playbook or attribution: those results depend on their own rules and windows.

When the event has a monetary value, send `amount` and `currency` together:

```json
{
  "amount": 89.90,
  "currency": "USD"
}
```

If you include `currency`, `amount` is required. Always send both when specifying a value: use major units, the original ISO 4217 currency code, and do not manually convert it into the reporting currency. If you omit the values, some actions can inherit them from the object; check the resource before assuming a zero amount.

## 6. Interpret the response and handle errors

A valid request responds with HTTP `200`:

```json
{
  "status": "received"
}
```

This confirms that the request passed initial validation and was received for processing. It does not confirm that the event is already saved, appears in activity, triggered an automation, or attributed a sale. Check the result for the corresponding profile or object before marking your process complete. Always inspect the HTTP status and response body:

- `401` means the token is missing, invalid, or revoked.
- `403` can mean the subscription does not permit the operation.
- `404` can mean the action does not exist for that business; use its exact name.
- `422` means parameters are missing or the customer profile, session, object, or object data is invalid.

Correct credentials, permissions, or data before repeating a permanent error. Record the status, `errors` fields, and source identifier in your logs, but never log the token or complete customer personal data. Retain “received” and “result verified” as separate states.

## 7. Prevent duplicate events

Most accepted tracking requests can create a new event, even when the same object is reused. Finding the same object through `reference` and `source` does not remove repeated events.

Built-in order lifecycle actions have a specific protection during identified-event processing: if the same order already has a kept event for that action, another one is not added, such as another `order.shipped`. Do not generalize that protection to anonymous events or other actions. It is not a request idempotency key; prevent repeated submissions in your integration.

- Store which source event has already been accepted by Hellotext in your own system.
- Do not retry `200` responses.
- After a timeout, disconnection, or server error following submission, the outcome can be uncertain: check whether the operation was received or processed before repeating it. Do not retry blindly.
- For temporary failures you can retry safely, use progressive backoff and retain the source event identifier in your own queue. That identifier does not create an idempotency guarantee in Hellotext.
- Do not send the same event through Hellotext.js and the backend.
- Process repeated provider webhooks only once before calling Hellotext.

See the complete [tracking API reference](https://www.hellotext.com/api#tracking) for every supported action, object, and parameter.

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Create and track coupons with the API]({% link _developers/coupons-with-api.md %})
- [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
