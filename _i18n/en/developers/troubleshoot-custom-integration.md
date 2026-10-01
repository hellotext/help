Use this guide when a custom API or Hellotext.js integration returns errors, creates duplicate records, or sends events that do not appear where expected.

Start with one recognizable customer and one request. Confirm each layer before testing a complete import or enabling playbooks. Investigate writes in an authorized isolated environment with fictional data and inactive flows. A diagnostic does not require sending messages, subscribing contacts, or inventing purchases.

## 1. Confirm the API token and business

Test the token from the backend with a read query. This example shows the HTTP status and limits the response to one profile; resolve the environment variable on your server without publishing its value:

```bash
curl --request GET \
  --url 'https://api.hellotext.com/v1/profiles?limit=1' \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --include
```

Check that:

- The header uses `Authorization: Bearer TOKEN` and the token is active.
- It belongs to the intended Hellotext business and is loaded only in the backend.
- The subscription allows the specific operation you want to perform.
- The response belongs to that business; an empty list with HTTP `200` can also be a valid query.

In **Settings → Authorization tokens**, **Token name** helps identify its purpose. In this fictional draft, “Custom store · development” is a readable name, not the credential to put in the header.

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

Do not create another token just because a write fails. A profile read can return `200` even when the write operation requires an active subscription. This confirms authentication for the query, not every permission or the business selected by your application. Hellotext.js uses the public business ID; the private backend API uses the authorization token. Keep those identifiers distinct.

Never paste the token into browser code, screenshots, tickets, or application logs.

## 2. Read the HTTP status before the response body

Handle the HTTP status and then the body. These cases guide diagnosis; exact validation depends on the endpoint:

| Status | Diagnosis and next step |
| --- | --- |
| `400` | Check syntax, required fields, and body format. Compare the request with the endpoint contract. |
| `401` | Check a missing, invalid, or revoked token, or an incorrect public business ID in the SDK. Correct the credential before repeating it. |
| `403` | Check authorization, subscription, and access to that operation; a successful earlier read does not guarantee them. |
| `404` | Check the route, resource, action name, and business scope. Do not replace the ID with one from another business. |
| `422` | Read each validation error and its parameter. An incompatible object or invalid profile/session combination can return this status. |
| `500`, `502`, `503`, `504` | Treat the result as uncertain for a write. Investigate and reconcile possible effects before applying the retries in section 7. |

Responses can contain `error` or `errors`, with fields such as `type`, `message`, and `parameter`; some routes nest that data. Do not assume a single shape or decide only from the English message. Store the HTTP status, structured type when available, and a sanitized summary. A proxy or server failure can also return HTML or an empty body: check content type and handle JSON parsing failure without losing the original status.

In Hellotext.js **2.6.0**, tracking returns a `Response` wrapper: check `response.failed` or `response.succeeded` and read the body with `await response.json()`. For a network response, `response.data` is the `fetch` response, not parsed JSON. A network failure can reject the promise; handle it separately and preserve uncertainty about processing. Repeated identification may return from a local cache without a new request.

See [API errors](https://www.hellotext.com/api#errors).

## 3. Reduce the request to the smallest valid example

When a large payload fails:

1. Keep the endpoint, business, and identity under investigation, with valid backend credentials.
2. First compare method, route, `Content-Type`, and required fields with the reference.
3. Verify the smallest case in an authorized environment; for a write, reconcile its outcome before repeating it.
4. Add optional fields back one group at a time.
5. Compare the first failing field with its API contract and retain a minimal version without secrets for support.

Private tracking at `/v1/attribution/events` expects a JSON body containing `action`; submitting form data to that route is not equivalent to the JSON example. Do not assume every endpoint accepts the same format or returns the same status for a malformed body.

Common validation failures, although they do not always return `422`, include:

- A missing required name or delivery value, or an unsupported option.
- A product, order, coupon, action, property, or profile ID from another business or the wrong resource type.
- A reference or code violating a uniqueness rule; an ambiguous SKU also cannot safely identify the intended product.
- A custom property assigned before its definition exists.
- `currency` without `amount`, or an invalid `tracked_at` format.
- A profile and session that are not correctly associated.

An action name, its definition ID, and an occurrence ID are different identifiers. Send the exact tracking name in `action`, not the translated title shown in the interface.

## 4. Separate resource creation from event tracking

A resource and an event answer different questions:

- A product, order, coupon, or custom object describes **what** the activity involved.
- An event describes **what happened, to which customer, and when**.

If an order exists but no purchase appears on the customer profile, verify the event request. If an event fails because its object is missing, verify resource synchronization first. A resource creation or retrieval response provides its own ID; a tracking `status: received` response provides neither that ID nor an event ID.

For tracked events, confirm:

- The action is exact, compatible with the object, and available to the business or as a built-in action.
- `profile` contains a public profile ID for the business, or `session` identifies the corresponding session. If private tracking includes both, verify their association with the same profile first; do not force another customer's session.
- `object` identifies the expected resource. For a custom object, distinguish the `object_type` structure from the instance; built-in actions have their own contracts.
- `tracked_at` represents the original time: Unix seconds or ISO 8601 with a timezone, without accidentally treating milliseconds as seconds. Omitting it does not automatically preserve the source system's time.
- Amount and currency agree. Send decimal values, such as `89.90` with `USD`, and check when the event inherits the object's amount. Do not confuse item quantity with price or total.

The **New Event** form helps recognize these concepts: action, associated object, and amount. This capture shows an unsaved manual **Appointment booked** draft with **Save changes** disabled. This form requires an object for that custom action; the API/SDK can omit one according to its contract. The draft does not demonstrate that a tracking request was processed.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="New Event for Demo Caso 1 with Appointment booked selected, required associated object unfilled, and Save changes disabled.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/manual-en-mobile.png 2x" width="778" height="1300" />
        <img src="/images/developers/custom-actions/manual-en.png" srcset="/images/developers/custom-actions/manual-en.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1300" loading="lazy" decoding="async" alt="New Event for Demo Caso 1 with Appointment booked selected, required associated object unfilled, and Save changes disabled." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real unsaved manual form for a fictional non-deliverable customer. There is no associated object or recorded event; Save changes remains disabled.</figcaption>
</figure>

Using `object_parameters` to create an object during tracking can produce a write in addition to the event. To isolate a failure, prefer the public ID of an already verified object when the contract allows it, and see [Tracking events]({% link _developers/tracking-events.md %}).

## 5. Interpret a received event correctly

An accepted tracking request returns HTTP `200` with:

```json
{
  "status": "received"
}
```

This confirms receipt for processing. It does not guarantee that an occurrence was created, a profile updated, a playbook triggered, or a report changed. The public endpoint used by the SDK accepts and queues work; the private endpoint validates part of the request and can also delegate event creation. A later failure or a specific deduplication rule can prevent a new occurrence.

If the event still does not appear after a reasonable processing interval:

1. Confirm the business, public profile ID, and associated session. A UUID or local browser acknowledgment does not itself prove that the session exists and is attached on the server.
2. Confirm action, object type, and existing resource; retain the mapping between Hellotext and source IDs.
3. Check `tracked_at`, timezone, view period, and filters. A historical event may fall outside the period you are viewing.
4. Check whether the native integration or your backend already recorded that activity; do not resend it to speed up the screen.
5. Inspect profile activity first. Then examine segment, playbook, and report conditions; a visible occurrence does not imply that it meets every filter or attribution window.

The event list uses a cursor; do not assume profile, date, or action filters that the endpoint does not implement, or a unique match just because a recent result appears. Absence from the first page also does not prove that the request failed.

Use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) for product-facing checks after the API request is valid.

## 6. Find the cause of duplicate records

Check both identities that change between requests and emitters that record the same activity twice.

For customer profiles:

- Store the returned public Hellotext ID and update that business's profile.
- Normalize phone numbers with the correct country and emails before synchronization; do not change a real identity to bypass validation.
- Creation can recognize a profile by an existing phone or email. Do not treat it as general idempotency for any payload; some property updates finish in the background.
- Do not reuse another account's session. `forget()` clears only identity cookies and retains the session and its association; see [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}) for separating sessions correctly.

For products and orders:

- Keep `source` and `reference` stable and retain their mapping to the public Hellotext ID.
- A stable SKU can help locate products depending on the endpoint, but it is not the public ID or a guarantee of uniqueness across all sources.
- Use the public ID when references or SKUs are ambiguous. Do not guess which match a reference lookup selected.
- Prevent browser, backend, and native integrations from creating parallel objects for the same activity.

In this fictional order, **Order ID** displays the `ORDER-1001` reference. The public API ID is stored separately; `source: custom_store` describes the origin and does not change on every request. The `USD 89.90` total also does not identify the order.

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

For events:

- Give the source event a stable internal ID and retain an outbox record with its outcome.
- Deduplicate repeated notifications before calling Hellotext. An ID stored in your system does not automatically become an API idempotency key.
- Do not repeat a request that returned `received` just because effects are not visible yet.
- Deduplication for certain order actions is limited to the retained order and action; do not generalize it to custom events, product views, or new objects.
- In Hellotext.js 2.6.0, await `initialize()` and record `page.viewed` once per real view. Initialization does not track it automatically. Avoid recording the same view through multiple tags, SPA navigation, and the backend.

## 7. Retry without creating uncertain duplicates

Classify the result before scheduling another attempt:

- Do not retry `400`, `401`, `403`, `404`, or `422` unchanged. Correct the cause or send the case to a review queue.
- Retry a read only for transient network failures or retryable `5xx` responses, with progressive backoff, random delay, and a maximum attempt count.
- A write with a timeout, disconnect, or `5xx` has an uncertain result: it may have completed before the failure. Reconcile first; the status alone does not prove there were no effects.
- A `received` response is accepted with processing pending; monitor its outcome without automatically resending the same fact.

Before repeating a `POST`, check the stored ID, reference/source, and subsequent resource queries. Consider partial inline-object writes or queued work as well. For tracking without a response ID, combine the source outbox record and actual activity; if you cannot establish whether it was processed, retain an uncertain state and request review. Do not manufacture a new event to prove that the earlier request finished.

The API does not expose a general idempotency-key parameter. Your integration must retain its event identifier, attempts, and states: pending, accepted, confirmed, rejected, or uncertain. These are states in your outbox, not values Hellotext returns from every endpoint.

## 8. Log enough context without exposing secrets

For each API call, keep:

- Method, route, integration/SDK version, and content type.
- HTTP status, structured error type, and parameter when available; distinguish network failure from HTTP rejection.
- Source record or event ID and Hellotext business.
- Public resource ID when known and a protected profile/session mapping, without confusing them with internal IDs.
- Original occurrence time, request start time, timezone, and duration.
- Attempt number and outbox state; do not record `received` as “delivered.”

Redact authorization tokens, full phone numbers and emails, message contents containing customer data, and full bodies with personal or payment information. Browser or server dumps can include headers, cookies, and session parameters: share only a reviewed minimal version, not the whole log.

## 9. Run an end-to-end diagnostic

Use this sequence to isolate the failing layer in an authorized test environment with fictional non-sendable contacts and inactive automations:

1. Authenticate with a one-profile query and confirm the business.
2. Retrieve the existing profile and its public ID; create one only if the scenario requires that write.
3. Retrieve the product and its public ID; compare reference, source, and price.
4. Check the request for a real product view and the corresponding identity, avoiding duplicate emission from two places.
5. Retrieve the order for that activity; if creation is authorized for the case, first check whether it already exists.
6. Track a real order event only when that scenario is authorized and it has not already been sent. Do not invent a purchase or delivery to diagnose another failure.
7. Confirm profile activity and retain outcome evidence, including an uncertain result when applicable.
8. Only then check segments, playbooks, and reports with their conditions and periods.

If the first failing step is clear, fix it before continuing. Later layers cannot compensate for an invalid resource or event. Identification, marketing consent, and sending enablement are separate checks; this diagnostic does not require changing the last two.

## 10. Contact Hellotext with a reproducible example

If the documented request still fails, provide:

- Hellotext business or workspace ID, integration version, and SDK version if applicable.
- Endpoint, HTTP method, and content type.
- Date, time, and timezone of the request and original event.
- HTTP status and sanitized response body, or the network failure type.
- Source reference, known public IDs, and reconciliation outcome without unnecessary personal data.
- Whether the failure is consistent or intermittent, how many attempts occurred, and what remains uncertain.
- The smallest payload that reproduces the issue, without a token, cookies, or real customer data.

In **Settings**, recognize **Business ID**. This fictional example shows where to find that public identifier; it is not the private token or a profile or order ID.

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

See [Contact Hellotext support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Create and track coupons with the API]({% link _developers/coupons-with-api.md %})
- [External tracking]({% link _developers/external-tracking.md %})
