Hellotext can track a visitor's activity before knowing who they are. Hellotext.js creates or reuses an anonymous session and includes it with browser activity. When the visitor becomes a known customer, you can associate that session with their customer profile to preserve the complete history.

The session, customer profile, and consent are separate concepts:

- The **session** connects activity from one browser.
- The **customer profile** brings together known identity, properties, conversations, and signals.
- **Consent** determines whether you can send messages through a channel. Identifying the customer does not automatically make them a subscriber.

If you are connecting a custom store from the beginning, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}).

## 1. Get the anonymous session

Hellotext.js looks for an existing session in the URL or browser. If none exists and automatic generation is enabled, it creates a new one.

After Hellotext.js initializes, read the current session:

```javascript
if (Hellotext.isInitialized) {
  const sessionId = Hellotext.session
}
```

If the library has not finished initializing, `Hellotext.session` can be `undefined`. You can listen for the session to become available:

```javascript
Hellotext.on('session-set', sessionId => {
  console.log('Hellotext session:', sessionId)
})
```

Hellotext.js automatically includes the session when it tracks activity. Store the ID in your backend only when you need to associate it with a known customer later. Never send the private API token to the browser.

See [Sessions in Hellotext.js](https://github.com/hellotext/hellotext.js/blob/main/docs/sessions.md) for current initialization options and library events.

## 2. Identify the customer at the right moment

Associate the session when your application can reliably recognize the customer, for example:

- After a successful login.
- After registration is complete and the account has been created.
- During checkout, when the backend creates or finds a reliable customer profile.

Do not identify someone only because they entered an email address or phone number in a field that has not been confirmed. Do not mark the customer profile as subscribed unless you have valid consent for the relevant channel.

In a single-page application, wait until the authentication state is known before associating the session. This prevents the first browser activity from being attributed to the wrong customer.

## 3. Attach the session from the backend

This is the recommended method for a custom store because the backend controls identity and keeps the API token private.

1. Read `Hellotext.session` in the browser.
2. Send the session ID to your backend with the customer's authenticated request.
3. Resolve the customer through your application's authentication session. Do not trust a customer profile ID supplied directly by the browser.
4. Create or find the Hellotext customer profile and retain its ID.
5. Attach the session with the private API token.

If the customer profile does not exist yet, create it first through [Create a customer profile](https://www.hellotext.com/api#create_a_profile). Creating the profile does not establish consent.

Attach the existing session:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID"
  }'
```

A valid request responds with HTTP `200` and the updated session object, including the associated customer profile. Earlier anonymous activity becomes part of the customer history; some data can finish associating in the background.

See [Attach a session](https://www.hellotext.com/api#attach_session) for the complete endpoint contract.

## 4. Use browser identification only when necessary

Hellotext.js provides `identify()` for compatible integrations that can only obtain identity in the browser:

```javascript
const response = await Hellotext.identify('user_123', {
  source: 'shopify',
  email: 'ana@example.com',
  name: 'Ana Silva',
})

if (response.failed) {
  console.error(response.data)
}
```

Use the stable customer identifier from the source platform as the first argument. The `source` value must correspond to a source supported by Hellotext.js. For a custom store, prefer attaching the session from the backend; do not invent a `source` value.

After successful identification, Hellotext.js retains the identity in the browser and includes it with later activity. You do not need to call `identify()` on every page when the customer and submitted data have not changed.

Do not include a subscription state unless your application has valid evidence of consent.

## 5. Forget the identity on logout

When the customer logs out of your application, call:

```javascript
Hellotext.forget()
```

This removes the identity persisted by `identify()` from the browser but keeps the Hellotext session active. It does not delete the customer profile, history, or consent, and it does not undo a previous backend attachment.

If several accounts can use the same browser, your backend must verify every login transition. Do not attempt to move a session that already belongs to a different customer profile.

## 6. Handle sessions that already have a customer

A session can be attached to the same customer profile again, but it must not be reused for another customer. Before treating the attachment as successful, inspect the `profile` field in the response.

If the session already belongs to another customer profile:

- Do not reassign the earlier activity to the current customer.
- Stop the attachment process and investigate why the session was shared.
- Confirm that `Hellotext.forget()` runs on logout when using `identify()`.
- Review your application's session lifecycle before tracking more authenticated events.

When you send `profile` and `session` together while tracking an event, both must belong to the same customer. See [External tracking]({% link _developers/external-tracking.md %}) for that validation.

## 7. Verify the complete flow

Test with one recognizable customer:

1. Open the storefront while logged out and confirm that Hellotext.js has a session.
2. Track anonymous activity, such as a product view or cart update.
3. Log in or complete checkout.
4. Create or find the correct Hellotext customer profile.
5. Attach the session from the backend.
6. Confirm that the response contains the expected customer profile.
7. Verify that earlier activity and new events appear on that customer profile.
8. Log out and confirm that your application calls `Hellotext.forget()` if it used `identify()`.

## Troubleshoot common problems

- **The session is `undefined`:** wait for Hellotext.js to initialize or listen for `session-set`.
- **The API responds with `401`:** check the private token and `Authorization` header.
- **The API responds with `404`:** the session might not exist for that business or might not have been sent to Hellotext through browser activity yet.
- **The response shows another customer profile:** treat it as an identity conflict and stop tracking authenticated events with that session.
- **Earlier activity does not appear immediately:** attachment can finish in the background; allow it to process and check again.

If signals are still missing, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
