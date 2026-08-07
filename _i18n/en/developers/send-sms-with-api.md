Use the Hellotext API when your system needs to trigger an individual SMS, such as a confirmation, reminder, or transactional notification. To send the same message to an audience, use a Hellotext campaign, where you can select recipients and review send performance.

## Before you start

You need:

- an active Hellotext business with SMS sending enabled;
- an authorization token for the business;
- a valid destination number or the identifier of a customer profile with a phone number; and
- permission to send the corresponding type of message.

The token can act on the data of the business that created it. Store it only in your backend or a secret manager. Do not include it in Hellotext.js, browser code, or a distributed mobile application.

## 1. Create an authorization token

In Hellotext, open the business and go to **Settings → Authorizations**. Select **Create new token**, use a name that identifies the integration, and store the generated value.

Send the token with every request:

```text
Authorization: Bearer YOUR_TOKEN
```

Each token belongs to one business. Use different tokens for different businesses or environments, and replace a token if it is no longer private. See the [API authentication section](https://www.hellotext.com/api#authentication) for the complete reference.

## 2. Choose how to identify the recipient

You can send the SMS in two ways:

- **With a phone number:** send `destination` in international E.164 format, for example `+14155552671`. Hellotext looks for a customer profile with that phone and creates one automatically if none exists.
- **With a customer profile:** send its identifier in `profile`. The profile must have an available phone number. If it has several and you need to choose a specific one, also include `destination`.

Creating or finding the customer profile during the send does not automatically subscribe it to promotional communications. Customer identity and consent are separate data.

## 3. Send your first SMS

Make a `POST` request to `https://api.hellotext.com/v1/messages` with:

- `technology`: use `sms` to force the SMS channel;
- `body`: the message content; and
- `destination` or `profile`: the recipient.

This example sends to a phone number and lets Hellotext find or create the customer profile:

```bash
curl -X POST "https://api.hellotext.com/v1/messages" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{
    "technology": "sms",
    "destination": "+14155552671",
    "body": "Your order is ready for pickup."
  }'
```

If you already know the customer profile identifier, you can use it instead of the phone number:

```bash
curl -X POST "https://api.hellotext.com/v1/messages" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{
    "technology": "sms",
    "profile": "PROFILE_ID",
    "body": "Your order is ready for pickup."
  }'
```

Hellotext automatically chooses an available SMS channel. Only send `origin` when you need to use a specific sender configured for the business. See [Send a Message in the API reference](https://www.hellotext.com/api#create_a_message) for every parameter.

## 4. Interpret the response

When the request is valid, the API responds with:

```json
{
  "status": "received"
}
```

This response confirms that Hellotext accepted the request and scheduled it for processing. It does not confirm that the mobile carrier delivered the SMS.

The send is processed asynchronously. Later message states can include:

- `pending`: created and waiting for processing;
- `routed`: sent to the external provider;
- `delivered`: confirmed as delivered; and
- `failed`: could not be delivered.

You can review the customer profile conversation in Inbox or query [the message list in the API](https://www.hellotext.com/api#list_all_messages). The reference also lets you retrieve a specific message once you know its identifier.

## 5. Test the complete flow

Before enabling the send in production:

1. Send a message to a test number controlled by your team.
2. Confirm that the API responds with `status: received`.
3. Check that the SMS appears in the correct conversation and reaches the phone.
4. Review the final message state.
5. Test an invalid phone number and invalid token to verify how your integration records errors.

Do not interpret a successful response as final delivery. Keep the result of each attempt and avoid automatically sending the same message again when a request has an uncertain outcome. The endpoint does not accept an idempotency key, so your system must prevent duplicates when retrying.

## Messages with links

Do not paste a long URL directly if you want Hellotext to generate a tracked short link. Use this syntax inside `body`:

```text
Track your order here: {shortlink:https://shop.example.com/orders/123}
```

Hellotext replaces the instruction during processing. If the business uses its own short-link domain, see [Set up a custom domain for short links]({% link _integrations/custom-domain-for-short-links.md %}). To understand how the session is preserved after a click, read [Track campaign, route, and playbook links]({% link _developers/tracking-on-campaigns-and-journeys.md %}).

## When to use a template

For reusable content, property-based personalization, or named dynamic links, you can send a template identifier instead of `body`. When you send `template`, Hellotext uses that template's content and ignores `body`.

Templates with dynamic links require you to send their URLs under `template.shortlinks`. The [message sending reference](https://www.hellotext.com/api#create_a_message) contains the complete structure.

See [Create and send templates with the API]({% link _developers/templates-with-api.md %}) for template creation, property tags, dynamic short links, channel targeting, and WhatsApp approval.

## Length, encoding, and cost

The character capacity of one SMS segment depends on its encoding:

- 7-bit GSM: up to 160 characters in a single segment;
- Latin-1: up to 140 characters in a single segment; and
- UCS-2: up to 70 characters in a single segment.

Special characters and emoji can change the encoding. Long messages can be split into multiple billable SMS segments, and part of each segment is used to concatenate them. Do not estimate cost from character count alone without considering encoding.

Pricing also depends on the destination country, plan, and included SMS messages. See [SMS pricing and number types]({% link _billing/sms-pricing-and-number-types.md %}) to estimate a send.

## Consent and sending limits

The API does not replace consent rules. Before sending:

- verify that the customer can receive that type of communication;
- do not send promotional messages to profiles that are not subscribed or have opted out;
- include the appropriate opt-out mechanism when required; and
- follow the laws and sending hours that apply in the destination country.

See [Who can you message?]({% link _audience/consent-and-subscriber-status.md %}) to distinguish identity, verification, and subscription. [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}) also apply to messages initiated through the API.

## Common errors

- **`401 Unauthorized`:** the token is missing, invalid, or has been replaced.
- **`422 Request Failed`:** check the phone number, `body`, `profile`, `technology`, and SMS availability for the business. Correct the request before retrying.
- **Server errors:** record the response and retry with progressive backoff. Protect the flow against duplicate sends.
- **The request was accepted, but the message fails:** check the message state, phone number, account limits, and channel availability.

The [API errors section](https://www.hellotext.com/api#errors) explains the response format.

## Related guides

- [Send messages with the API]({% link _developers/send-messages-with-api.md %})
- [Integrate a custom store]({% link _developers/custom-store-integration.md %})
- [Hellotext API reference](https://www.hellotext.com/api)
- [Tracking events]({% link _developers/tracking-events.md %})
- [Tracked links and short-link domains]({% link _analytics-reporting-attribution/tracked-links.md %})
