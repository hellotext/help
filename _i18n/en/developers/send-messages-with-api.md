Use the Messages API when your backend needs to send one message to one customer profile, for example a confirmation, support follow-up, or transactional notification.

For a one-time message to an audience, create a campaign instead. For autonomous messages based on signals and customer behavior, use a playbook. Sending through the API does not bypass consent, channel availability, messaging windows, account limits, or provider rules.

Use the [Send a Message reference](https://www.hellotext.com/api#create_a_message) for the complete endpoint contract. This guide explains how to make the main implementation decisions and verify the result.

## Before you start

Prepare:

- A private API authorization token stored only on your backend.
- An active Hellotext business and the channel integrations you intend to use.
- A valid customer profile ID or, for a phone-based send, a destination number.
- Either a free-form message body or an existing compatible template.
- Valid consent and contactability for the message purpose and channel.
- Publicly accessible URLs for any attachments.

Create a token under **Settings → Authorizations** and send it as a bearer token:

```text
Authorization: Bearer YOUR_TOKEN
```

Never expose this token in Hellotext.js, browser code, a mobile application, or a public repository.

## 1. Choose a free-form message or a template

### Free-form message

Send `body` without `template` when the selected channel allows your business to write the message directly.

This is appropriate for SMS and for supported conversational channels while their provider rules allow a free-form reply. On WhatsApp, a free-form message can only be sent while the customer service window is open. The 24-hour window starts or refreshes when the customer messages the business.

### Template message

Send `template` when you want reusable content, customer-property personalization, or dynamic short links. An approved WhatsApp template is required to initiate a WhatsApp conversation or send outside the customer service window.

When `template` is present, Hellotext uses the template content and ignores a separate `body`. Do not create a new template for each send; create and approve reusable templates first.

See [Create and send templates with the API]({% link _developers/templates-with-api.md %}) for template creation, Meta approval, property tags, and dynamic short links.

## 2. Select the technology and channel

Set `technology` explicitly so routing and provider requirements are predictable. The current Messages endpoint supports:

- `sms`
- `whatsapp`
- `instagram`
- `mercadolibre`

The corresponding integration must be active for the business. The customer profile must also be reachable through the selected technology.

`technology` and `origin` solve different problems:

- **`technology`:** selects the messaging technology.
- **`origin`:** optionally selects one exact configured channel or sender within that technology.

Omit `origin` when Hellotext can choose a compatible configured channel. Include it when the business has multiple senders or connected accounts and your integration must use a specific one. The origin must belong to the business and match `technology`.

## 3. Identify the customer profile and destination

Prefer `profile` when your system already knows the Hellotext customer profile ID. Hellotext uses the selected technology and origin to resolve a compatible destination on that profile.

For phone-based sends, you can use `destination` without `profile`. Send the number in international E.164 format, for example `+14155552671`. Hellotext looks for a customer profile with that phone number and creates one if none exists.

When a customer profile has more than one phone number and you need a particular one, send both `profile` and `destination`. For Instagram or Mercado Libre, use a reachable customer profile and let Hellotext resolve the channel-specific identity.

Finding or creating a customer profile does not subscribe it to marketing. Identity, verification, and consent remain separate.

## 4. Send a free-form message

This example sends a WhatsApp reply to a known customer profile. Use it only while that customer has an open service window:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/messages \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "technology": "whatsapp",
    "profile": "PROFILE_ID",
    "body": "Thanks for contacting us. Your return request is ready for review."
  }'
```

Hellotext chooses an active WhatsApp origin when you omit `origin`. To force a specific configured WhatsApp sender, add its channel identifier:

```json
{
  "technology": "whatsapp",
  "origin": "+14155552671",
  "profile": "PROFILE_ID",
  "body": "Thanks for contacting us. Your return request is ready for review."
}
```

For an SMS-specific implementation, including length, encoding, links, cost, and new-business limits, see [Send SMS with the API]({% link _developers/send-sms-with-api.md %}).

## 5. Send a template message

This example sends an approved WhatsApp template and supplies the destination for its named dynamic short link:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/messages \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "technology": "whatsapp",
    "profile": "PROFILE_ID",
    "template": {
      "id": "TEMPLATE_ID",
      "shortlinks": {
        "order": "https://shop.example.com/account/orders/1001"
      }
    }
  }'
```

You can send `template` as the template ID string when it has no dynamic short links. When it does, use the object form and provide every required name under `template.shortlinks`.

The template must belong to the business, support the selected technology, and have an active approved version when WhatsApp approval is required. A pending edit does not block an older approved version, but a new pending template cannot be used yet.

## 6. Add attachments when the channel supports them

Send attachment URLs in the top-level `attachments` array:

```json
{
  "technology": "whatsapp",
  "profile": "PROFILE_ID",
  "body": "Here is the document you requested.",
  "attachments": [
    "https://files.example.com/return-instructions.pdf"
  ]
}
```

Each URL must be publicly accessible so Hellotext can download and store the file. Supported formats and size limits differ by channel. SMS does not support attachments and ignores this parameter.

Check the current [attachment requirements](https://www.hellotext.com/api#create_a_message_attachments) before sending files in production.

## 7. Interpret the accepted response

A valid request returns:

```json
{
  "status": "received"
}
```

This means Hellotext accepted the request and queued it for asynchronous processing. It does not mean that the provider accepted the message or delivered it to the customer.

Outbound message states include:

- `pending`: the message exists and is waiting for processing.
- `routed`: Hellotext sent it to the external provider.
- `delivered`: the provider confirmed delivery.
- `failed`: the provider or delivery flow could not complete the send.

The `received` state on a message object describes an inbound message sent by the customer to the business. It is different from the `{ "status": "received" }` API acknowledgement.

Use [List all Messages](https://www.hellotext.com/api#list_all_messages) to find recent messages, then [Retrieve a Message](https://www.hellotext.com/api#retrieve_a_message) to inspect its final state and timestamps. You can also review the customer conversation in Inbox.

## 8. Retry without creating duplicates

The endpoint does not accept an idempotency key. Your integration must prevent duplicate sends.

- Do not retry a `422` response without correcting the invalid parameter.
- If the connection fails before you receive a response, treat the result as uncertain instead of immediately sending the same message again.
- Record the business, customer profile, technology, template or body fingerprint, request time, and response.
- Check recent messages or the Inbox conversation before retrying an uncertain request.
- Retry a provider failure only after correcting or waiting out the reported condition.

Even after the request is accepted, asynchronous processing can stop because of account limits, an unavailable channel, an invalid origin, a closed WhatsApp service window, template state, or a provider failure.

## 9. Troubleshoot common problems

- **`401 Unauthorized`:** the token is missing, invalid, revoked, or belongs to another business.
- **`422` on `technology`:** the value is unsupported or the matching integration is not active.
- **`422` on `destination`:** the phone number is missing or invalid when no customer profile is supplied.
- **`422` on `body`:** neither a usable body nor a valid template was provided.
- **Accepted but no outbound message appears:** verify the customer profile ID, origin, account limits, and channel availability.
- **WhatsApp message fails:** confirm the service window is open for free-form content or use an active approved template.
- **Template request fails:** confirm the template belongs to the business and supply every required dynamic short link.
- **Message reaches `failed`:** inspect the conversation and provider reason before deciding whether another attempt is appropriate.

See [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) for channel and delivery diagnosis. Use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}) for authentication, logging, and retry problems.

## Go-live checklist

Before enabling the integration in production:

1. Send to a customer profile or number controlled by your team.
2. Confirm the request returns `status: received`.
3. Verify the message appears in the expected Inbox conversation.
4. Confirm the intended technology, origin, destination, and rendered content.
5. Wait for the final `delivered` or `failed` state.
6. Test a corrected validation error and an uncertain-response path without producing duplicates.
7. Confirm consent and channel-window rules for each production use case.

## Related guides

- [Developers and API overview]({% link _developers/developers-overview.md %})
- [Create and send templates with the API]({% link _developers/templates-with-api.md %})
- [Send SMS with the API]({% link _developers/send-sms-with-api.md %})
- [Who can you message?]({% link _audience/consent-and-subscriber-status.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Hellotext API reference](https://www.hellotext.com/api)
