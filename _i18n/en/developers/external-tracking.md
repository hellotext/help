Use this guide to send trusted events to Hellotext when they happen outside the browser, for example in your backend, POS, CRM, ERP, marketplace, logistics provider, jobs, or webhooks.

External tracking complements Hellotext.js. Use Hellotext.js for navigation and cart activity that happens in the storefront. Use the API from your backend for orders, payments, cancellations, shipments, deliveries, and other actions the server can verify.

If you are connecting a custom store from the beginning, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}) to implement customer profiles, catalog data, orders, Hellotext.js, and identity in the recommended order.

## Before you start

Prepare:

- A private API authorization token stored only in your backend.
- The action name you want to track, such as `product.viewed`, `order.placed`, or an existing custom action.
- The Hellotext customer profile ID or a Hellotext session ID.
- The related object ID, such as a product or order, or the data needed to create it.
- Stable identifiers from the source system to prevent duplicate objects.

Every example sends a `POST` request to:

```text
https://api.hellotext.com/v1/attribution/events
```

Send the token through the `Authorization` header. See [API authentication](https://www.hellotext.com/api#authentication) to create and use the token correctly.

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

Keep the ID returned by Hellotext when you create the customer profile. If it does not exist yet, see [Create a customer profile](https://www.hellotext.com/api#create_a_profile).

### When only the session is known

Hellotext.js exposes the current session after initialization:

```javascript
const sessionId = Hellotext.session
```

Send that ID to your backend and use `session` when tracking the event:

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

You can send `profile` and `session` together when you want to associate that session context with the customer. The session must be unassigned or belong to the same customer profile. Hellotext rejects the event if the session already belongs to another profile.

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

Keep `reference` and `source` stable. Changing them between requests can create separate objects for the same product, cart, or order.

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

Reuse the same `ORDER_ID` to track only the changes your system can confirm:

- `order.confirmed` when the business confirms the order.
- `order.shipped` when the order leaves for delivery.
- `order.delivered` when delivery is confirmed.
- `order.cancelled` when the order is cancelled.

Do not track every state when the order is created. Send each event only when that change actually happens. See [Create an order](https://www.hellotext.com/api#create_an_order) for every available field.

## 4. Track custom actions

Hellotext includes actions for products, carts, orders, forms, coupons, and other common objects. When none represents your business activity, create a custom action first and then use its name in `action`:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "appointment.completed",
    "profile": "PROFILE_ID",
    "tracked_at": "2026-08-07T12:30:00Z"
  }'
```

A custom action can be tracked without a related object. If you send a custom object, you must also specify its type according to the API contract.

See [Create an action](https://www.hellotext.com/api#create_an_action) before tracking the first custom event.

## 5. Preserve timestamps and monetary values

If the event happened before the request was sent, include `tracked_at` as an ISO 8601 date or Unix timestamp. If you omit it, Hellotext uses the time when the event is received.

Use the original event time for historical imports, delayed jobs, and retried webhooks. This prevents old activity from appearing recent and affecting segmentation, playbook eligibility, or reporting.

When the event has a monetary value, send `amount` and `currency` together:

```json
{
  "amount": 89.90,
  "currency": "USD"
}
```

If you include `currency`, `amount` is required. Use the ISO 4217 currency code and do not manually convert the value into the reporting currency.

## 6. Interpret the response and handle errors

A valid request responds with HTTP `200`:

```json
{
  "status": "received"
}
```

This confirms that Hellotext received the event for processing. Always inspect the HTTP status and response body:

- `401` means the token is missing, invalid, or revoked.
- `404` can mean the action does not exist for that business.
- `422` means parameters are missing or the customer profile, session, object, or object data is invalid.

Record the status and error in your logs, but never log the token or complete customer personal data.

## 7. Prevent duplicate events

Every accepted request can create a new event, even when the same product or order is reused. Finding the same object through `reference` and `source` does not remove repeated events.

- Store which source event has already been accepted by Hellotext in your own system.
- Do not retry `200` responses.
- Retry temporary errors with progressive backoff and retain the source event identifier in your own queue.
- Do not send the same event through Hellotext.js and the backend.
- Process repeated provider webhooks only once before calling Hellotext.

See the complete [tracking API reference](https://www.hellotext.com/api#tracking) for every supported action, object, and parameter.

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
