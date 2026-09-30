Use the Messages API when your backend needs to send one message to one customer profile, for example a confirmation, support follow-up, or transactional notification.

For a one-time message to an audience, create a campaign instead. For autonomous messages based on signals and customer behavior, use a playbook. Sending through the API does not bypass consent, channel availability, messaging windows, account limits, or provider rules.

Use the [Send a Message reference](https://www.hellotext.com/api#create_a_message) for the complete endpoint contract. This guide explains how to make the main implementation decisions and verify the result.

## Before you start

Prepare:

- A private API authorization token stored only on your backend.
- A business with an active subscription that includes API access and the channel integrations you intend to use.
- A valid customer profile ID or, for a phone-based send, a destination number.
- Either a free-form message body or an existing compatible template.
- Valid consent and contactability for the message purpose and channel.
- Publicly accessible URLs for any attachments.

Create a token under **Settings → Authorizations** and send it as a bearer token:

```text
Authorization: Bearer YOUR_TOKEN
```

The token authorizes operations for its business; it is not the public business or profile ID. Never expose this token in Hellotext.js, browser code, a mobile application, or a public repository.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional authorization token name, unsaved and without showing a secret.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558.0px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-en-mobile.png 2x" width="748" height="480" />
        <img src="/images/developers/custom-store-integration/token-en.png" srcset="/images/developers/custom-store-integration/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="524" loading="lazy" decoding="async" alt="Fictional authorization token name, unsaved and without showing a secret." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Actual draft in a fictional business: it does not create or reveal a token. Keep the secret only on your backend.</figcaption>
</figure>

## 1. Choose a free-form message or a template

### Free-form message

Send `body` without `template` when the selected channel allows your business to write the message directly.

This is appropriate for SMS and for supported conversational channels while their provider rules allow a free-form reply. In this endpoint’s WhatsApp flow, use free-form content while the customer service window is open. The 24-hour window starts or refreshes when the customer messages the business.

### Template message

Send `template` when you want reusable content, customer-property personalization, or dynamic short links. To initiate a WhatsApp conversation or send outside the customer service window through this endpoint, use an approved WhatsApp template.

When `template` is present, Hellotext uses the template content and ignores a separate `body`. Do not create a new template for each send; create and approve reusable templates first.

See [Create and send templates with the API]({% link _developers/templates-with-api.md %}) for template creation, Meta approval, property tags, and dynamic short links.

Under **Settings → Templates**, **Message** mode lets you prepare reusable content. This SMS example is an unsaved draft; it does not represent an approved WhatsApp template. Editor preview options also do not determine which technologies this endpoint supports.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual Message editor with an unsaved fictional return follow-up, name tag, and complete URL.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/send-messages-with-api/editor-en-mobile.png 2x" width="668" height="718" />
        <img src="/images/developers/send-messages-with-api/editor-en.png" srcset="/images/developers/send-messages-with-api/editor-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Actual Message editor with an unsaved fictional return follow-up, name tag, and complete URL." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved draft in Settings → Templates, Message mode with SMS preview selected. It was neither sent nor approved for WhatsApp. The content includes an instruction and a usable URL.</figcaption>
</figure>

## 2. Select the technology and channel

Always set `technology` explicitly. Do not depend on automatic selection or a switch to another technology if the first send fails. The current Messages endpoint supports:

- `sms`
- `whatsapp`
- `instagram`
- `mercadolibre`

The corresponding integration must be active for the business. The customer profile must also be reachable through the selected technology.

`technology` and `origin` solve different problems:

- **`technology`:** selects the messaging technology.
- **`origin`:** optionally selects one exact configured channel or sender within that technology.

Omit `origin` when Hellotext can choose a compatible configured channel. Include it when the business has multiple senders or connected accounts and your integration must use a specific one. Use the channel identifier, such as its phone number, rather than its public object ID. The origin must belong to the business, match `technology`, and be available to send. Request acceptance alone does not confirm these conditions.

## 3. Identify the customer profile and destination

Prefer `profile` when your system already knows the **public profile ID** in Hellotext. First verify that it exists in the same business. Your internal system ID, an external reference, or a profile from another business cannot replace it; a request may be accepted before processing detects an invalid ID.

Hellotext resolves a profile identity for delivery. Verify that this identity is reachable through the selected technology and origin, especially when the profile has identities on multiple channels.

For phone-based sends, you can use `destination` without `profile`. Send the number in international E.164 format, for example `+14155552671`. During asynchronous processing, Hellotext looks for a customer profile with that phone number and creates one if none exists.

When a customer profile has more than one phone number and you need a particular one, send both `profile` and `destination`. The destination must match a phone number already on that profile; use the same stored E.164 format. Do not use this combination to add another phone number. For Instagram or Mercado Libre, use a reachable customer profile and let Hellotext resolve the channel-specific identity.

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
    "body": "Thanks for contacting us. Read your return instructions: https://shop.example.com/returns/1001"
  }'
```

Hellotext chooses an active WhatsApp origin when you omit `origin`. To force a specific configured WhatsApp sender, add its channel identifier:

```json
{
  "technology": "whatsapp",
  "origin": "+14155552671",
  "profile": "PROFILE_ID",
  "body": "Thanks for contacting us. Read your return instructions: https://shop.example.com/returns/1001"
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

The template must exist in the same business and support the selected technology. Check its ID and link names before making the POST. This example requires a template whose content includes the dynamic link `order`; the template name does not replace its ID.

For WhatsApp, also confirm an active approved version for the sending account and language. Local approval of an SMS template is not Meta approval. A pending edit may retain an older approved version: delivery uses the active version, which may differ from the pending edit. A new template still pending at Meta does not yet allow that send.

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

Each URL must be publicly accessible so Hellotext can download and store the file. Do not use local paths or URLs that require your browser session. Downloading and provider validation happen after acceptance; `received` does not confirm that a file is usable. Supported formats and size limits differ by channel. SMS does not support attachments and ignores this parameter.

Check the current [attachment requirements](https://www.hellotext.com/api#create_a_message_attachments) before sending files in production.

## 7. Interpret the accepted response

A request that passes initial validation returns HTTP `200`:

```json
{
  "status": "received"
}
```

This means Hellotext accepted the request and queued it for asynchronous processing. It does not mean that the provider accepted the message or delivered it to the customer. This response contains no message ID and does not guarantee that the outbound object exists yet: profile, channel, template, and attachment resolution can still fail.

Outbound message states include:

- `pending`: the message exists and is waiting for processing.
- `dispatched`: the message entered the sending flow; this is not a delivery confirmation.
- `routed`: the message was routed to the external provider; this does not yet confirm delivery.
- `delivered`: the provider confirmed delivery.
- `error`: processing or delivery encountered a failure. The public reference also describes this result as `failed`; handle both values in your integration. Do not wait only for `failed` to detect an error.

The `received` state on a message object describes an inbound message sent by the customer to the business. It is different from the `{ "status": "received" }` API acknowledgement.

Use [List all Messages](https://www.hellotext.com/api#list_all_messages) with a bounded limit, such as `limit=25`, and traverse its pages using the documented cursors and `has_more`. Do not assume the first page contains the newest messages. Compare profile, technology, origin, destination, rendered body, and time in your integration: the current listing has no profile, date, or template filters and does not expose the template ID on each message.

After finding the public message ID in the listing, use [Retrieve a Message](https://www.hellotext.com/api#retrieve_a_message) to inspect its state and timestamps. Timestamps are Unix seconds, and a stage field can be `null` in another state; these fields are not a complete transition history. You can also review the customer conversation in Inbox. When several identical sends overlap, this comparison may be ambiguous: it does not guarantee correlation with one particular POST.

## 8. Retry without creating duplicates

The endpoint does not accept an idempotency key. Your integration must prevent duplicate sends.

- Do not retry a `422` response without correcting the invalid parameter.
- If the connection fails before you receive a response, treat the result as uncertain instead of immediately sending the same message again.
- Record the business, customer profile, technology, template or body fingerprint, request time, and response.
- Traverse the bounded listing and check the Inbox conversation before retrying an uncertain request. A message being absent immediately does not prove the queue will not process it later.
- Retry a provider failure only after correcting or waiting out the reported condition.

Even after the request is accepted, asynchronous processing can stop because of account limits, an unavailable channel, an invalid origin, a closed WhatsApp or Instagram conversation window, template state, or a provider failure.

## 9. Troubleshoot common problems

- **`401 Unauthorized`:** the token is missing, invalid, or revoked. A valid token from another business resolves operations within that other business: always verify its scope.
- **`403 Forbidden` on creation:** confirm that this business subscription has active API access.
- **`422` on `technology`:** the value is unsupported or the matching integration is not active.
- **`422` on `destination`:** the phone number is missing or invalid when no customer profile is supplied.
- **`422` on `body`:** neither a usable body nor a valid template was provided.
- **Accepted but no outbound message appears:** verify the customer profile ID, origin, account limits, and channel availability.
- **WhatsApp message fails:** confirm the service window is open for free-form content or use an active approved template.
- **Instagram message fails:** confirm the customer initiated the conversation, the standard messaging window is still open, and the connected Instagram account is active.
- **Template request fails:** confirm the template belongs to the business and supply every required dynamic short link.
- **Message reaches `error` or `failed`:** inspect the conversation and provider reason before deciding whether another attempt is appropriate.

See [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) for channel and delivery diagnosis. Use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}) for authentication, logging, and retry problems.

## Go-live checklist

Before enabling the integration in production:

1. Send to a customer profile or number controlled by your team.
2. Confirm the request returns `status: received`.
3. Verify the message appears in the expected Inbox conversation.
4. Confirm the intended technology, origin, destination, and rendered content.
5. Check the later outcome; handle `delivered` and `error`/`failed` failures without confusing acceptance with delivery. If the channel does not confirm delivery, investigate a pending or routed state instead of assuming success.
6. Test a corrected validation error and an uncertain-response path without producing duplicates.
7. Confirm consent and channel-window rules for each production use case.

## Related guides

- [Developers and API overview]({% link _developers/developers-overview.md %})
- [Create and send templates with the API]({% link _developers/templates-with-api.md %})
- [Send SMS with the API]({% link _developers/send-sms-with-api.md %})
- [Who can you message?]({% link _audience/consent-and-subscriber-status.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Instagram DM fundamentals]({% link _numbers/instagram-dm-fundamentals.md %})
- [Hellotext API reference](https://www.hellotext.com/api)
