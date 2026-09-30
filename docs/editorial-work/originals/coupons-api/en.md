A coupon object lets Hellotext reference a code, its description, and the destination where the customer can redeem it. A coupon event records that a customer actually redeemed that code.

Creating a coupon in Hellotext does not create the discount in your eCommerce platform and does not enforce its eligibility, expiration, usage limit, or single-use rules. Create and validate the promotion in the system that owns checkout first.

Use the [Coupons API reference](https://www.hellotext.com/api#coupons) for the complete contract.

## Before you start

Prepare:

- A private API authorization token.
- A coupon code that already works in the eCommerce platform.
- A public destination URL where the customer can redeem it.
- A short description that can be used in a message.
- A stable external reference when the source system has one.
- The customer profile and purchase data needed to confirm redemption.

## 1. Create the discount in the commerce system

Before creating the Hellotext coupon object, confirm in the system that owns checkout:

- Which products or customers are eligible.
- The discount amount or percentage.
- Start and expiration dates.
- Whether the code is single-use or reusable.
- Whether it can be combined with another promotion.
- The final destination URL.

Hellotext can deliver and track the coupon context, but the commerce system decides whether checkout accepts it.

## 2. Create the coupon object in Hellotext

Create the matching coupon:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/coupons \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "code": "WELCOME10",
    "description": "Get 10% off your first order",
    "destination_url": "https://shop.example.com/discount/WELCOME10",
    "reference": "promotion-2026-welcome"
  }'
```

The code is case-sensitive and must be unique. Keep the description under the supported limit and make the destination URL publicly reachable.

Save the returned coupon `id`. See [Create a coupon](https://www.hellotext.com/api#create_a_coupon) for every supported field.

## 3. Update the same coupon when its presentation changes

Use `PATCH /v1/coupons/:id` when the description or destination URL changes. Keep the same Hellotext coupon ID while it still represents the same promotion.

Do not rotate an expired code into an unrelated promotion just to reuse its record. Create a new coupon when the offer has a different commercial identity, eligibility, or code.

Because checkout rules live in the commerce system, updating the Hellotext object does not change those rules.

## 4. Use the coupon in a compatible message or playbook

After the coupon exists, it can be selected where Hellotext exposes coupon support, such as compatible captures, messages, routes, or playbooks.

Before launch, test the complete customer experience:

1. The message shows the intended code and description.
2. The destination opens the correct store and offer.
3. Checkout accepts the code for an eligible customer.
4. Expiration and reuse behavior match the commerce configuration.

Do not promise free shipping, bundles, or another benefit unless that exact offer exists in the commerce system.

## 5. Record a confirmed redemption

Send `coupon.redeemed` only after the commerce system confirms that the customer used the coupon:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "coupon.redeemed",
    "profile": "PROFILE_ID",
    "object": "COUPON_ID",
    "amount": 89.90,
    "currency": "USD",
    "tracked_at": 1786104000
  }'
```

Use the monetary value associated with the confirmed redemption according to your reporting implementation. Keep `amount` and `currency` together, and preserve the original event time.

Do not send `coupon.redeemed` when the coupon is displayed, delivered, clicked, or copied. Those actions do not prove that checkout accepted it.

See [Track coupon events](https://www.hellotext.com/api#track_coupon_events).

## 6. Prevent duplicate redemption events

The coupon object can be reused across many customers, but each confirmed redemption is a separate event.

- Give each commerce redemption a stable internal ID.
- Process the same checkout notification only once.
- Mark it as sent after Hellotext responds with `status: received`.
- Do not send the same redemption from browser and backend code.
- Preserve the same customer profile and coupon ID on retries.

The commerce platform remains responsible for preventing a code from being redeemed more times than its rules allow. Hellotext should receive the final confirmed outcome.

## 7. Verify the complete flow

Use one test coupon and one recognizable customer:

- The code works in the store before it is added to Hellotext.
- The Hellotext coupon opens the correct destination.
- A compatible message displays the expected offer.
- An unsuccessful checkout does not create `coupon.redeemed`.
- A successful checkout creates one redemption event on the correct customer profile.
- Amount, currency, and timestamp reflect the real transaction.

If the coupon request fails or a redemption event does not appear, use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}).

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Forms]({% link _captures/forms.md %})
- [Website Popup]({% link _captures/website-popup.md %})
