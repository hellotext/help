Hellotext can track activity before knowing a visitor's identity. A session connects that browser activity to a customer profile when your application confirms who they are. Attachment can recover compatible anonymous activity; it does not guarantee recovery of events that never arrived, resolve identity conflicts, or attribute every conversion to a message.

Distinguish these values before integrating:

| Value | Purpose |
| --- | --- |
| **Public Business ID** | Initializes Hellotext.js in the browser. |
| **Hellotext session** | Identifies the activity context; it can be a browser UUID or an existing session ID. It does not authenticate your customer. |
| **Public customer profile ID** | Your backend resolves it in Hellotext to attach the session. It differs from your storefront's customer ID. |
| **Private API token** | Authorizes the backend request for that business; never publish it in JavaScript. |
| **Consent** | Authorizes messages through a channel. Identifying or attaching a session does not establish it. |

If you are connecting a custom store from the beginning, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}). The examples below match the published `@hellotext/hellotext` SDK **2.6.0** and require the library to be loaded already.

## 1. Get the anonymous session

In Settings, locate the public **Business ID** to use as `BUSINESS_ID`:

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

Session selection follows this order: `hello_session` in the URL, the initialization `session` option, then the existing cookie. If no session is available and `autoGenerateSession` is enabled, the SDK generates a UUID. A personalized link may carry a session already associated with its recipient: having an identifier does not mean the session is anonymous or belongs to the account that just logged in.

Initialize once and await the Promise before continuing:

```javascript
(async () => {
  await Hellotext.initialize('BUSINESS_ID')

  const sessionId = Hellotext.session
  if (!sessionId) {
    throw new Error('Hellotext session is not available')
  }

  // Use sessionId only after resolving your application's authentication state.
})().catch(error => console.error(error))
```

`Hellotext.isInitialized` indicates that a session value exists; it can be true before the initialization Promise finishes. It also does not prove that the session has been persisted on the server.

If you need to observe session changes, register this listener **before** calling `initialize()`:

```javascript
Hellotext.on('session-set', sessionId => {
  if (!sessionId) return

  // Observe the local session change; do not identify a customer here.
})
```

The event can emit an empty value before generating the UUID and fires when writing the cookie, rather than when confirming attachment. It does not replace `await` or replay because a listener was registered late.

The SDK attempts to acknowledge the session with an acknowledgment request. The local value and acknowledgment cookie do not prove that the server has materialized it: only temporary information may exist until activity or identification is processed. Do not track fabricated events to eliminate a `404`. Track `page.viewed` explicitly once per real view if your integration needs it; initialization does not track it automatically. Apply your consent policy before loading the SDK or sending activity.

See [Sessions in Hellotext.js](https://github.com/hellotext/hellotext.js/blob/main/docs/sessions.md) for library options. Use the published-version clarifications above for execution order and persistence limits.

## 2. Identify the customer at the right moment

Associate the session when your application can reliably recognize the customer:

- After an authenticated login or completed registration.
- During checkout when the backend resolves a verified identity.
- After checking that the supplied session belongs to that account's current context.

An email address or phone number entered in a field does not confirm identity or consent. Resolve the account through your application's authentication; do not accept a profile chosen by the browser. In a single-page application, wait for that resolution before identifying or tracking authenticated events, and avoid sending the same activity through both browser and backend.

## 3. Attach the session from the backend

For a custom store, use the backend with a private token for the same business and a subscription allowing API access. The **Token name** helps recognize its purpose; it is not the credential to include in `Authorization`:

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

1. Await initialization and read `Hellotext.session`.
2. Send the session to your backend in an authenticated request. Validate its relationship to the current browser and account; the Hellotext session does not replace authentication.
3. Create or find the correct profile and retain the mapping between your application ID and the **public Hellotext ID**.
4. Confirm that the session exists in that business and does not belong to another person.
5. Attach the session, verify the outcome, and retain evidence of the association before sending authenticated events with both values.

If you need to create the profile, use [Create a customer profile](https://www.hellotext.com/api#create_a_profile). Creating a profile can save data and trigger configured flows; it does not establish consent. `PROFILE_ID` must be that profile's public ID, rather than its email, the Business ID, or a Shopify ID.

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID"
  }'
```

`HELLOTEXT_SESSION_ID` accepts the SDK UUID or an existing session ID. Both resources are looked up within the token's business. A session that does not yet exist returns `404`.

The current implementation returns `200` with the session object after attempting attachment, **even if it rejects changing the owner**. Do not use the HTTP status alone as confirmation. Also, `profile` in the current response represents an internal numeric contact identifier or `null`; it is not the public ID supplied in the request, and you must not reuse it as `PROFILE_ID`. Verify identity through a trusted mapping and the correct profile's activity, as explained below. If you cannot confirm that mapping, treat attachment as pending.

When accepted, history completion happens in the background: it associates activity without a profile, processes eligible anonymous activity, and can associate carts. It does not move already identified events to another person or overwrite all attribution. Preserve original timestamps; attribution windows and each event's origin still apply.

See [Attach a session](https://www.hellotext.com/api#attach_session). This guide clarifies limits observed in the current implementation alongside the endpoint's general description.

## 4. Use browser identification only when necessary

`identify()` requires an actual configured source integration. For Shopify, use a real customer's stable ID from the connected store; the first argument is the **Shopify ID**, rather than a Hellotext profile's public ID. Call this function after awaiting initialization and confirming authentication:

```javascript
async function identifyShopifyCustomer(shopifyCustomerId) {
  if (!Hellotext.session || !shopifyCustomerId) {
    throw new Error('A session and authenticated Shopify customer are required')
  }

  const response = await Hellotext.identify(String(shopifyCustomerId), {
    source: 'shopify',
  })

  if (response.failed) {
    throw new Error('Identification request was rejected')
  }

  return await response.json()
}
```

Handle network errors in the code calling the function as well. The wrapper provides `failed`, `succeeded`, and `json()`. In SDK2.6.0 the cached result uses that wrapper too: `await response.json()` returns `{ already_identified: true }`. For a request, `data` contains the `fetch` response; on the local path it contains the reading adapter. Use `json()` to obtain the parsed object in both cases.

An accepted HTTP response may contain `received`: the server queues identification. It does not return a profile ID or guarantee that the shop, customer, or attachment has been processed. The SDK remembers identity locally on HTTP success even if the later job fails. Confirm the outcome in the profile before treating it as complete.

If the session, customer, and normalized data match the remembered identification, the SDK can return `already_identified: true` without another request. This indicates a local match, rather than a fresh server check. Do not retry in a loop to manufacture confirmation. For a custom store, attach from the backend; inventing `source: 'custom_store'` does not create a compatible integration. Do not send a subscription state without valid evidence of consent.

## 5. Forget the identity on logout

When the customer logs out of your application, if you used `identify()`, call:

```javascript
Hellotext.forget()
```

This removes the remembered identity, user source, and identification fingerprint cookies. **It retains the Hellotext session and its previous server attachment**: it does not make future activity anonymous by itself, log out of your application, or delete the profile, history, or consent.

Before tracking another account's activity, stop tracking that retains the previous context and establish a separate session through your integration's initialization lifecycle. You can supply a new valid UUID with the `session` option, but first prevent an old `hello_session` in the URL from overriding it; then await initialization and verify the effective ID. Do not generate a new session on every view or reuse another person's personalized link to start the next account.

## 6. Handle sessions that already have a customer

Attaching to the same customer again does not mean moving a session between accounts. The implementation can merge an anonymous contact into a compatible known contact, but rejects replacing a different known owner. Do not use that merge as a general account-switching mechanism.

Before treating attachment as successful:

- Validate the public profile resolved by your backend and the supplied session context.
- Remember that the current response's numeric `profile` cannot be compared directly with your public ID. `null` indicates no attachment; a non-null value alone does not identify the expected customer.
- Check the expected activity in the correct profile after processing. If you lack a trusted mapping or the result points to another person, stop authenticated events and investigate the conflict.

`forget()` does not detach or repair a shared session. Do not reassign earlier history to the new customer. When sending `profile` and `session` together while tracking an event, both must belong to the same customer in the same business; see [External tracking]({% link _developers/external-tracking.md %}).

## 7. Verify the complete flow

In an authorized test environment, with coherent fictional identity and consent:

1. Confirm the SDK version, public business, and awaited initialization.
2. Check the effective ID, its URL/configuration/cookie precedence, and whether it already exists on the server.
3. Track only legitimate test activity with original timestamps, without duplicating it.
4. Authenticate the account in your application and resolve its public Hellotext profile from the backend.
5. Attach the session and inspect the returned object, including its internal-identifier limitation.
6. Allow processing and check that eligible earlier activity and later activity appear in the correct profile. Verify identity, attribution, and subscription separately.
7. Log out, call `forget()` when applicable, and validate a separate session before tracking another account's activity.
8. Check a conflict and a network failure as well, without moving history or repeating a request with an uncertain outcome.

## Troubleshoot common problems

- **Session `undefined`:** await the Promise, check `autoGenerateSession`, configuration, and browser context. A late listener may miss the event; a local event does not prove completed initialization.
- **`401` or `403`:** check the private token, business, `Authorization` header, and the subscription's API access.
- **`404`:** a materialized session may be missing in that business. The local UUID or acknowledgment does not guarantee existence; inspect real activity and processing without creating fabricated events.
- **HTTP `200`, but attachment unconfirmed:** validate the existing profile, session ownership, and processing. Do not compare the internal response identifier with the public one or assume that `received` or `already_identified` proves the outcome.
- **`identify()` does not work:** confirm the compatible source, connection, and actual platform ID. A source name does not implement an integration; use the backend for a custom store.
- **Another account's activity after logout:** `forget()` retains the session. Check its rotation and personalized-link parameters before continuing.
- **Earlier activity pending:** inspect queues, timestamps, eligibility, and the correct profile. Attachment does not recover requests that were never recorded or guarantee retroactive attribution.
- **Timeout or interrupted connection:** the operation may have arrived. Inspect the outcome before retrying; do not assume general idempotency or that repeating identification completes the previous job.

If signals are still missing, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
