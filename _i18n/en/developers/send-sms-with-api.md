Use the Hellotext API when your system needs to trigger an individual SMS, such as a confirmation, reminder, or transactional notification. To send the same message to an audience, use a Hellotext campaign, where you can select recipients and review send performance.

## Before you start

You need:

- a business with an active subscription that permits API access and SMS sending enabled;
- an authorization token for the business;
- a valid destination number or the identifier of a customer profile with a phone number; and
- permission to send the corresponding type of message.

The token can act on the data of the business that created it. Store it only in your backend or a secret manager. Do not include it in Hellotext.js, browser code, or a distributed mobile application.

## 1. Create an authorization token

In Hellotext, open the business and go to **Settings → Authorizations**. Select **Create new token** and use a name that identifies the integration. The field below only names the token; when you complete creation in your business, securely store the generated secret. This example is an unsaved fictional draft.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual token-name field with fictional data and current label spacing; unsaved and without revealing a secret.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-en-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-en.png" srcset="/images/developers/custom-store-integration/token-spacing/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Actual token-name field with fictional data and current label spacing; unsaved and without revealing a secret." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictional token-name draft in Authorizations. No token was created; keep the secret only on your backend.</figcaption>
</figure>

Send the token with every request:

```text
Authorization: Bearer YOUR_TOKEN
```

Each token belongs to one business. Use different tokens for different businesses or environments, and replace a token if it is no longer private. See the [API authentication section](https://www.hellotext.com/api#authentication) for the complete reference.

## 2. Choose how to identify the recipient

You can send the SMS in two ways:

- **With a phone number:** send `destination` in international E.164 format, for example `+14155552671`. During asynchronous processing, Hellotext looks for a customer profile with that phone and may create one if none exists. The initial response does not confirm that this step has finished.
- **With a customer profile:** send its public Hellotext ID in `profile`, rather than your external reference or an internal database ID. It must belong to the token’s business and have an available phone number. To choose among several phones, also include `destination` with the exact E.164 number already associated with that profile. This combination does not add a new phone.

Creating or finding the customer profile during the send does not automatically subscribe it to promotional communications. Customer identity and consent are separate data.

## 3. Send your first SMS

Make a `POST` request to `https://api.hellotext.com/v1/messages` with:

- `technology`: use `sms` to force the SMS channel;
- `body`: the message content; and
- `destination` or `profile`: the recipient.

This example requests a send to a phone number and lets Hellotext find or create the customer profile during processing. Replace the token and recipient in your authorized environment:

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

With `technology: sms` and no `origin`, Hellotext looks for an available SMS route to the destination. Availability can depend on the country and the business channels. For a specific sender, `origin` must be the identifier of the SMS channel configured for that business, such as its phone number; not the public ID of a channel object. An invalid sender or profile can fail after the initial response. Attachments are not sent over SMS. See [Send a Message in the API reference](https://www.hellotext.com/api#create_a_message) for every parameter.

## 4. Interpret the response

When the request is valid, the API responds with:

```json
{
  "status": "received"
}
```

The HTTP `200` response confirms that Hellotext received the request and passed it to asynchronous processing. It contains no message ID and does not confirm that a message has been created, the profile found, or the SMS delivered. Store the attempt with your own operation reference, recipient, time, and intended content; this reference is not an idempotency parameter for this endpoint.

States of an already created message can include:

- `pending`: waiting for processing;
- `dispatched`: left the queue for the sending process, without delivery confirmation;
- `routed`: routed to the provider;
- `delivered`: delivery confirmed; and
- `error`: failure in the state currently exposed by the API. The public reference also uses `failed`; account for this difference when integrating error handling.

The `received` response to a `POST` acknowledges the request. When it appears as the state of an incoming message object, it means receipt of that message; not delivery of your outgoing SMS.

You can review the customer profile conversation in Inbox or query [the message list in the API](https://www.hellotext.com/api#list_all_messages). Query bounded pages, for example `limit=25`, and use the `starting_after` or `ending_before` cursors and `has_more`. The current list does not filter by profile, date, or template: compare available information in your own system and do not assume the first result is your newly requested SMS. Two attempts with identical recipients and content may be ambiguous.

Once you obtain the message’s public ID through a query or the interface, you can retrieve that object in the API. Exposed date fields use Unix seconds and may be `null` depending on state; they do not form a complete transition history. If you cannot identify an unambiguous result, keep the attempt uncertain instead of sending it again.

## 5. Test the complete flow

In an authorized test environment, before enabling the send in production:

1. Send a message to a test number controlled by your team.
2. Confirm that the API responds with `status: received`.
3. Check that the SMS appears in the correct conversation and reaches the phone.
4. Review the final message state.
5. Check validation and authentication error handling with controlled cases, without using unrelated recipients or repeating uncertain sends.

Do not interpret a successful response as final delivery. Keep the result of each attempt and avoid automatically sending the same message again when a request has an uncertain outcome. The endpoint does not accept an idempotency key, so your system must prevent duplicates when retrying.

## Messages with links

Do not paste a long URL directly if you want Hellotext to generate a tracked short link. Use this syntax inside `body`:

```text
Track your order here: {shortlink:https://shop.example.com/orders/123}
```

Use a complete, valid URL. Hellotext creates the link and replaces the instruction during processing; this is neither delivery nor a click. The final text with its short link, resolved properties, and opt-out notice may differ in length from the original request. If the business uses its own short-link domain, see [Set up a custom domain for short links]({% link _integrations/custom-domain-for-short-links.md %}). To understand how the session is preserved after a click, read [Track campaign, route, and playbook links]({% link _developers/tracking-on-campaigns-and-journeys.md %}).

## When to use a template

For reusable content, property-based personalization, or named dynamic links, you can send a template identifier instead of `body`. When you send `template`, Hellotext uses that template's content and ignores `body`. SMS uses its text body; a header, buttons, or files do not become an SMS with those elements. A WhatsApp approval does not confirm SMS delivery. Check that the recipient’s required properties are complete.

Under **Settings → Templates**, **Message** mode lets you prepare a reusable body and property tags. This fictional draft shows the name and a complete SMS with a URL and opt-out instruction; it was neither saved nor sent. Its preview does not validate API request parameters.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual Message editor with a complete SMS draft, name property, URL, and opt-out instruction.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/send-messages-with-api/editor-en-mobile.png 2x" width="668" height="718" />
        <img src="/images/developers/send-messages-with-api/editor-en.png" srcset="/images/developers/send-messages-with-api/editor-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Actual Message editor with a complete SMS draft, name property, URL, and opt-out instruction." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved fictional return follow-up in Message mode with SMS preview. It does not establish sending, approval, or delivery; name resolves using recipient data.</figcaption>
</figure>

Templates with dynamic links require you to send their URLs under `template.shortlinks`. The [message sending reference](https://www.hellotext.com/api#create_a_message) contains the complete structure.

For example, if your existing template contains `{shortlink:order}`, the send object can include:

```json
{
  "technology": "sms",
  "profile": "PROFILE_ID",
  "template": {
    "id": "TEMPLATE_ID",
    "shortlinks": {
      "order": "https://shop.example.com/orders/123"
    }
  }
}
```

Replace both IDs with public IDs from the same business and provide a valid URL for every defined dynamic link. The name `order` must match your template.

See [Create and send templates with the API]({% link _developers/templates-with-api.md %}) for template creation, property tags, dynamic short links, channel targeting, and WhatsApp approval.

## Length, encoding, and cost

The capacity of a single SMS depends on the final text encoding:

| Encoding | Single-segment capacity |
| --- | --- |
| 7-bit GSM | Up to 160 units; some symbols consume two. |
| Latin-1 | Up to 140 one-byte units. |
| UCS-2 / Unicode | Up to 70 16-bit units; an emoji may occupy more than one. |

Special characters, accents, and emoji can change the selected encoding. In GSM, symbols such as `{` and `]` take two units because of an escape character. Long messages reserve space for concatenation and can split into multiple billable segments. The route and provider can apply different splitting limits, especially with Unicode. Evaluate the final body after replacing properties and links; counting characters in the JSON or an unresolved template is insufficient to estimate segments or cost.

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
- **`403 Forbidden`:** check that the business subscription permits API use. A valid token does not enable that feature by itself.
- **Timeout or server error:** record the attempt as uncertain. The request may have arrived even if your system did not read its response. Check the outcome before deciding on another send; progressive backoff alone does not prevent duplicates. Internal or provider processing may also still be underway.
- **The request was received, but the message is missing or fails:** check the profile’s public ID and existing phone, `origin`, available state, limits, and channel. Some checks happen after the initial acknowledgement, including before message creation. Do not turn `received` into success confirmation or assume every asynchronous failure has a queryable object.

The [API errors section](https://www.hellotext.com/api#errors) explains the response format.

## Related guides

- [SMS channel fundamentals]({% link _numbers/sms-channel-fundamentals.md %})
- [Send messages with the API]({% link _developers/send-messages-with-api.md %})
- [Integrate a custom store]({% link _developers/custom-store-integration.md %})
- [Hellotext API reference](https://www.hellotext.com/api)
- [Tracking events]({% link _developers/tracking-events.md %})
- [Tracked links and short-link domains]({% link _analytics-reporting-attribution/tracked-links.md %})
