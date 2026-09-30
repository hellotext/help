A coupon object lets Hellotext reference a code, its description, and the destination where the customer can redeem it. A coupon event records that a customer actually redeemed that code.

Creating a coupon in Hellotext does not create the discount in your eCommerce platform and does not enforce its eligibility, expiration, usage limit, or single-use rules. Create and validate the promotion in the system that owns checkout first.

Use the [Coupons API reference](https://www.hellotext.com/api#coupons) for the complete contract.

## Before you start

Prepare:

- A private API authorization token, stored in your backend. Do not put it in forms, public JavaScript, or messages.
- An active subscription to create or update coupons and track events.
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

The examples use fictional data. Replace `COUPON_ID` and `PROFILE_ID` with the corresponding Hellotext IDs, and load your token into the `HELLOTEXT_API_TOKEN` environment variable on your server. Create the matching coupon:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/coupons \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "code": "GUIA-QR-10",
    "description": "Get 10% off your first order",
    "destination_url": "https://shop.example.com/discount/GUIA-QR-10",
    "reference": "promotion-2026-guide"
  }'
```

The code is case-sensitive and must be unique within your business. Descriptions support up to 140 characters. Use a public URL with `https://` or `http://`, and check that it opens the correct offer.

Save the returned coupon `id`. It is different from the customer-facing `code` and the `reference` that identifies the promotion in your system. Use the Hellotext ID to retrieve, update, or track events for the object.

Check the saved object with [Retrieve a coupon](https://www.hellotext.com/api#retrieve_a_coupon):

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/coupons/COUPON_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

If creation returns a duplicate-code error or you do not know whether a request completed, use [List all coupons](https://www.hellotext.com/api#list_all_coupons) and review the result pages to identify the existing code and reference before creating the object again. See [Create a coupon](https://www.hellotext.com/api#create_a_coupon) for every supported field.

## 3. Update the same coupon when its presentation changes

Use `PATCH /v1/coupons/:id` when the description or destination URL changes. Keep the same Hellotext coupon ID while it still represents the same promotion. Send the fields you need to change:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/coupons/COUPON_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "description": "Get 10% off your first order with GUIA-QR-10",
    "destination_url": "https://shop.example.com/discount/GUIA-QR-10"
  }'
```

Retrieve the object again and check its new presentation. See [Update a coupon](https://www.hellotext.com/api#update_a_coupon).

Do not rotate an expired code into an unrelated promotion just to reuse its record. Create a new coupon when the offer has a different commercial identity, eligibility, or code.

Because checkout rules live in the commerce system, updating the Hellotext object does not change those rules.

## 4. Use the coupon in a compatible message or playbook

After the coupon exists, it can be selected where Hellotext exposes coupon support, such as compatible captures, messages, routes, or playbooks. In this demo example, a Shareable Link selects `GUIA-QR-10` and an optional draft welcome journey.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional GUIA-QR-10 coupon and optional welcome journey selected in a demo Shareable Link.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 692px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/captures/shareable-link/follow-up-refresh/assignment-en-mobile.png 2x" width="700" height="976" />
        <img src="/images/captures/shareable-link/follow-up-refresh/assignment-en.png" srcset="/images/captures/shareable-link/follow-up-refresh/assignment-en.png 2x" style="width: auto; margin: 0 auto;" width="1348" height="904" loading="lazy" decoding="async" alt="Fictional GUIA-QR-10 coupon and optional welcome journey selected in a demo Shareable Link." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Example of selecting an existing coupon in a Shareable Link. The welcome journey is optional; selecting it and the coupon does not create the discount rules in your store.</figcaption>
</figure>

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

`object` is the Hellotext coupon ID, and `profile` is the ID of the customer who redeemed it. `amount` represents the revenue associated with that purchase: in the example, USD 89.90 is the purchase value you record, not the value of the 10% discount. Always send the actual ISO 4217 currency together with the amount, and preserve the original redemption time in `tracked_at` as a Unix timestamp in seconds.

A `{"status":"received"}` response means the request was accepted for processing; check afterward that the event appears on the correct profile. If your integration has a real attribution session for the same customer, you can include its ID in `session`. Do not invent a session or attribute a redemption to a campaign solely because its coupon was used.

Do not send `coupon.redeemed` when the coupon is displayed, delivered, clicked, or copied. Those actions do not prove that checkout accepted it.

See [Track coupon events](https://www.hellotext.com/api#track_coupon_events).

## 6. Prevent duplicate redemption events

The coupon object can be reused across many customers, but each confirmed redemption is a separate event.

- Give each commerce redemption a stable internal ID and store its submission state in your integration.
- Process the same checkout notification only once, even if it reaches two processes at the same time.
- Mark it as accepted after Hellotext responds with `status: received`; verify processing afterward.
- Do not send the same redemption from browser and backend code.
- After a timeout, check the outcome before retrying: the request may have been accepted even if you did not receive the response.

Preserving the same profile, coupon, and time does not guarantee that a retry will be deduplicated. Your integration must prevent repeated submission of the same redemption.

The commerce platform remains responsible for preventing a code from being redeemed more times than its rules allow. Hellotext should receive the final confirmed outcome.

## 7. Verify the complete flow

Use one test coupon and one recognizable customer:

- The code works in the store before it is added to Hellotext.
- Retrieving the object confirms that its ID, code, reference, and destination match the promotion.
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
