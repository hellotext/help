An order in Hellotext has two complementary parts:

- The **order object** stores the commercial snapshot: reference, source, products, quantities, prices, delivery method, and other order data.
- An **order event** connects that order to a customer profile at a real moment in its lifecycle, such as placement, confirmation, shipment, delivery, or cancellation.

Creating the order object alone does not record a purchase for a customer. Create or find the order, keep its Hellotext ID, and then send the lifecycle event with that order and the correct customer profile.

Use the [API reference](https://www.hellotext.com/api#orders) for the complete contract. This guide explains the recommended integration flow.

## Before you start

Prepare:

- A private API authorization token stored only on your backend.
- The Hellotext ID of the customer profile associated with the order.
- Stable product or variant identifiers already synchronized with Hellotext.
- A stable order `reference` from your system.
- One consistent `source`, such as `custom_store`, for every order from the integration.
- The original event dates, amounts, and ISO 4217 currency codes.

The token, profile, products, and order must belong to the same business, with an active subscription to create or update objects and record events. `PROFILE_ID`, `PRODUCT_ID`, and `ORDER_ID` are placeholders: replace them with actual IDs obtained in that business. A public business ID does not replace the private token.

If products are not synchronized yet, start with [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %}).

To prepare authorization, open **Settings → Authorizations → Create a new token**. Check the business before creating it and keep the secret only on your backend. The figure shows an unsaved name, without creating or revealing the token.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional authorization token name for a custom store, unsaved and without showing a secret.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-en-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-en.png" srcset="/images/developers/custom-store-integration/token-spacing/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Fictional authorization token name for a custom store, unsaved and without showing a secret." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Prepare authorization in the correct business; this draft does not create or expose a token. The secret belongs only on the backend.</figcaption>
</figure>

## 1. Create the order object

Create the order after your backend has accepted it. Include the final line-item snapshot known at that moment:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/orders \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Order #1001",
    "reference": "ORDER-1001",
    "source": "custom_store",
    "delivery": "deliver",
    "payment_method": "Visa",
    "sales_channel": "Website",
    "items": [
      {
        "product": "PRODUCT_ID",
        "quantity": 2,
        "price": {
          "amount": 44.95,
          "currency": "USD"
        }
      }
    ],
    "metadata": {
      "warehouse": "main"
    }
  }'
```

For `custom_store`, include `delivery`: `deliver` for delivery or `collect` for collection. Use positive whole quantities and unit prices with an explicit currency; the example is 2 × USD 44.95 = USD 89.90. Combine a repeated product into one line with its quantity: repeating it across lines does not guarantee separate items.

Each item requires a product or variant identifier. The API accepts its Hellotext ID, reference, or SKU. When an item price is omitted, Hellotext uses the current product price; include the item price when the order must preserve the amount charged at checkout.

This `POST /orders` calculates the total from the items; its contract does not include a `total` parameter. Successful creation returns the order object and its `id`; failed validation returns HTTP 422 with errors. Store that public ID as `hellotext_order_id` and use `GET /v1/attribution/orders/:id` to check the reference, source, items, and `total`. The object response is separate from an event’s `received` response.

Keep amounts and currencies from the actual transaction. Do not add amounts in different currencies as though they were one; check the converted amount when applicable. `reference` identifies the order in your system, `source` identifies its origin, and `id` identifies the order in Hellotext. Product and order-item IDs identify other resources.

The following figures show a fictional order’s data with no recorded events. In the editor, “Order ID” contains the `ORDER-1001` reference; it is separate from the public `id` you must keep from the API response.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual editor of fictional order ORDER-1001 with custom_store source, USD 89.90 total, and Deliver method.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/details-en-mobile.png 2x" width="778" height="914" />
        <img src="/images/developers/orders-with-api/details-en.png" srcset="/images/developers/orders-with-api/details-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Actual editor of fictional order ORDER-1001 with custom_store source, USD 89.90 total, and Deliver method." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Actual view of a fictional order with no events. “Order ID” displays the ORDER-1001 reference here; separately keep the public id returned by the API.</figcaption>
</figure>

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional order item: Weekly planner, quantity 2, and USD 44.95 unit price.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/items-en-mobile.png 2x" width="714" height="572" />
        <img src="/images/developers/orders-with-api/items-en.png" srcset="/images/developers/orders-with-api/items-en.png 2x" style="width: auto; margin: 0 auto;" width="942" height="572" loading="lazy" decoding="async" alt="Fictional order item: Weekly planner, quantity 2, and USD 44.95 unit price." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The line preserves product, quantity, and unit price: 2 × USD 44.95 = USD 89.90. This data view does not prove that a purchase or event was recorded.</figcaption>
</figure>

See [Create an order](https://www.hellotext.com/api#create_an_order) for every supported field.

## 2. Record the first real lifecycle event

After creating the order, connect it to the customer profile with the first state your backend can confirm:

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
    "currency": "USD",
    "tracked_at": 1786104000
  }'
```

Send `object` with the saved order ID and `profile` with the correct customer ID. Do not substitute the order name or a product ID. The `session` context is also supported: it must belong to the same business; if you send both profile and session, the session must already be attached to that profile. An anonymous session does not replace a verified customer association or grant messaging consent.

Use `tracked_at` when the event happened before the request was sent. It accepts Unix seconds or an ISO 8601 date with a time zone, not milliseconds. It should represent the source event time, not the retry time. The example `amount` is a decimal USD amount, not cents.

A valid request responds with:

```json
{
  "status": "received"
}
```

This means the event was received, not that it has been processed, appeared in a report, or triggered a playbook. The response does not return a new order ID or event ID. Check profile activity and order data afterwards; for HTTP 422, correct the validation errors before retrying.

## 3. Send each later state when it happens

Reuse the same order ID and customer profile for every verified transition:

- `order.confirmed` when the business confirms the order.
- `order.shipped` when the order leaves for delivery.
- `order.delivered` when delivery is confirmed.
- `order.cancelled` when the order is cancelled.

For example:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "order.shipped",
    "profile": "PROFILE_ID",
    "object": "ORDER_ID",
    "tracked_at": 1786190400
  }'
```

When a later event omits the amount, processing may inherit the order amount. Check the recorded value; do not add every lifecycle amount as though each state were a separate purchase.

Do not send all states when the order is created. Do not infer shipment or delivery from elapsed time. Each event should come from a transition your system can verify.

See [Track order events](https://www.hellotext.com/api#track_order_events) for the current supported actions and parameters.

## 4. Correct order data separately from its lifecycle

Updating an order object changes its stored attributes; it does not create a lifecycle event.

Use `PATCH /v1/attribution/orders/:id` to correct fields such as delivery method, payment method, sales channel, metadata, or custom properties. Use the order-item endpoints when products, quantities, or charged prices need correction.

Keep the order-item IDs returned in `items` for the item endpoints; do not confuse them with product IDs. After each correction, retrieve the order and its items again and compare quantities, unit prices, currencies, and total with your system. Do not assume that an order `PATCH` changes its items or that every line change leaves the final total you expect.

Send a new event only when a real lifecycle change occurred. For example, correcting the payment method does not justify sending `order.confirmed` again.

See [Update an order](https://www.hellotext.com/api#update_an_order) and the [order-item reference](https://www.hellotext.com/api#order_items).

## 5. Import historical orders without making them look new

Historical orders help Hellotext understand prior customer and product activity. For each imported order:

1. Create the order with its original reference, source, products, quantities, and charged prices.
2. Record only the lifecycle state that your historical data can verify.
3. Set `tracked_at` to the original event timestamp.
4. Preserve the original amount and currency.

Do not use the import date as `tracked_at`. Otherwise old purchases can appear as current behavior and affect segments, playbook decisions, and reporting.

## 6. Prevent duplicate orders and events

The API does not expose an idempotency-key parameter. Your integration must keep its own request and response log.

- Keep `source` and `reference` stable for the lifetime of the order.
- Store the Hellotext order ID returned by the first successful creation.
- Give each source lifecycle transition a stable internal event ID.
- Mark the request as received by Hellotext only after `status: received`; record later event verification separately. This does not mean a message or order was delivered.
- Do not send the same order event from Hellotext.js and your backend.
- If a create request times out, reconcile the order before sending another `POST`; the original request may have completed.

For processing with an identified profile, Hellotext prevents another built-in event for the same order and action pair while the previous event is retained. For example, repeating `order.shipped` for that order does not create another retained shipment event. Do not use this rule to correct the first event’s amount, timestamp, or profile, or extend it to anonymous sessions or deleted events.

If a response is lost or a request times out, its outcome is uncertain. Retrieve the order by its saved ID or reconcile the paginated order list with `source` and `reference` in your system before creating another; do not assume an undocumented list filter. Prefer the public ID to avoid ambiguity between references from different sources.

This rule is not general API idempotency. Other event types can still be duplicated, and a different lifecycle action for the same order remains a separate event. Your integration should prevent duplicate submissions and preserve a reliable source log.

## 7. Verify one order end to end

Before importing all history, verify an authorized case in an isolated test business, with fictional data, non-sendable contacts, and playbooks that do not send messages.

Before importing a complete order history:

1. Create one recognizable test customer profile.
2. Create or retrieve its products and variants.
3. Create one order and save the returned ID.
4. Send one real order event.
5. Confirm the event appears on the correct customer profile.
6. Retrieve the order through the API and open **Settings → Objects → Orders → Edit** to compare its reference, source, products, quantities, and amount. Check the event currency and original timestamp in profile activity.
7. Send a later state and verify that the same order is reused.

If the request fails or the event does not appear, use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}).

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
