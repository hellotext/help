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

If products are not synchronized yet, start with [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %}).

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

Each item requires a product or variant identifier. The API accepts its Hellotext ID, reference, or SKU. When an item price is omitted, Hellotext uses the current product price; include the item price when the order must preserve the amount charged at checkout.

Hellotext calculates the order total from its items when the total is not supplied by a compatible tracking flow. Save the returned order `id` in your system as `hellotext_order_id`.

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

Use `tracked_at` when the event happened before the request was sent. It should represent the source-system event time, not the retry time.

A valid request responds with:

```json
{
  "status": "received"
}
```

This means the event was accepted for processing. It can take a short time to appear in the customer profile and reports.

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

Do not send all states when the order is created. Do not infer shipment or delivery from elapsed time. Each event should come from a transition your system can verify.

See [Track order events](https://www.hellotext.com/api#track_order_events) for the current supported actions and parameters.

## 4. Correct order data separately from its lifecycle

Updating an order object changes its stored attributes; it does not create a lifecycle event.

Use `PATCH /v1/attribution/orders/:id` to correct fields such as delivery method, payment method, sales channel, metadata, or custom properties. Use the order-item endpoints when products, quantities, or charged prices need correction.

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

The API does not expose an idempotency-key parameter. Your integration must keep its own delivery state.

- Keep `source` and `reference` stable for the lifetime of the order.
- Store the Hellotext order ID returned by the first successful creation.
- Give each source lifecycle transition a stable internal event ID.
- Mark that source event as delivered only after Hellotext returns `status: received`.
- Do not send the same order event from Hellotext.js and your backend.
- If a create request times out, reconcile the order before sending another `POST`; the original request may have completed.

Hellotext avoids storing the same lifecycle action repeatedly for one order, but your integration should still prevent duplicate submissions and preserve a reliable source log.

## 7. Verify one order end to end

Before importing a complete order history:

1. Create one recognizable test customer profile.
2. Create or retrieve its products and variants.
3. Create one order and save the returned ID.
4. Send one real order event.
5. Confirm the event appears on the correct customer profile.
6. Confirm products, quantities, amount, currency, and original timestamp.
7. Send a later state and verify that the same order is reused.

If the request fails or the event does not appear, use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}).

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
