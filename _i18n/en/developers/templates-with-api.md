A template stores reusable message content in Hellotext. Create it once through the Templates API, keep its Hellotext ID, and use that ID when your backend sends an individual message through the Messages API.

Creating a template does not send a message, create a campaign, or enable a playbook. Delivery still depends on the selected channel, the customer profile, consent, channel availability, and, for WhatsApp, Meta approval and the customer service window.

Use the [Templates API reference](https://www.hellotext.com/api#templates) for the complete contract. This guide covers the recommended implementation flow.

## Before you start

Prepare:

- A private API authorization token stored only on your backend and a subscription with API access. Do not use the public Business ID as a token or expose the token in browser JavaScript.
- An active Hellotext business with the channels you intend to use.
- A connected WhatsApp Business account if the template targets WhatsApp.
- A stable template name unique within the business. Store the public Hellotext `id` separately: the name and Meta identifier do not replace that ID.
- A clear decision between `sms`, `whatsapp`, or `any` technology.
- A `marketing` or `utility` category that matches the real purpose of a WhatsApp message.
- The Hellotext customer profile ID and, when needed, the specific destination for the send.
- Definitions and values for every customer property used for personalization.

The token determines the business for every operation. The profile, template and channel must belong to that same business; creating a template does not obtain consent or subscribe the customer. In Settings, open API authorizations to create and store a private credential in your authorized environment. The figure shows only a draft name, with no credential created.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional authorization token name, unsaved and without showing a secret.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558.0px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-en-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-en.png" srcset="/images/developers/custom-store-integration/token-spacing/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Fictional authorization token name, unsaved and without showing a secret." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Actual draft in a fictional business: it does not create or reveal a token. Keep the secret only on your backend.</figcaption>
</figure>

Create custom customer properties before using their names as tags. See [Custom properties and events]({% link _audience/custom-properties-and-events.md %}).

## 1. Choose the template technology

The `technology` value determines where the template can be used and which components it accepts.

### SMS

An `sms` template supports the message body only. Do not send a header, footer, or buttons with an SMS-only template.

SMS length and encoding determine how many billable segments the final message uses. Keep the final message concise and first check controlled fictitious values, including Unicode characters and already-shortened URLs. See [Send SMS with the API]({% link _developers/send-sms-with-api.md %}).

### WhatsApp

A `whatsapp` template can include:

- A required body.
- An optional attachment or address header compatible with the channel. See the current text-header limitation below.
- An optional footer.
- Optional quick-reply, URL, phone, or copy buttons.

WhatsApp templates are synchronized with Meta. A new template needs an approved version available to the connected account before sending; the creation response does not confirm that approval.

### Any compatible technology

Use `any` when the same reusable content should be available to compatible connected channels. If the business has WhatsApp connected, Hellotext also submits the WhatsApp version to Meta. When the template is sent through SMS, only its body is used.

Always specify `technology` when creating and updating: the current flow uses `any` when it is omitted. This value belongs to the template; choose `sms` or `whatsapp`, not `any`, when sending through the Messages API. Email templates in the editor are outside this message flow.

Use a channel-specific template when its wording or components only make sense on one channel.

## 2. Create an SMS template

Create an SMS-only template with a name and body:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/templates \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Order ready SMS",
    "technology": "sms",
    "body": "Hi {name}, your order is ready. View it here: {shortlink:order}"
  }'
```

A valid creation returns HTTP `201` with the serialized template; failed validation returns `422`. Store its public `id` and requested content on your backend. SMS-only templates are represented as approved because they do not require Meta review; that state does not confirm a send.

The example uses a dynamic short link. Your backend must provide the `order` destination URL every time it sends this template.

The Settings → Templates editor shows the same name and body controls. The figure uses a different fictitious example, “Return follow-up”, in an unsaved Message/SMS draft; it does not represent the response to the request above.

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

## 3. Create a WhatsApp template

For WhatsApp, explicitly set the category and include only the components the message needs:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/templates \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Order ready WhatsApp",
    "technology": "whatsapp",
    "category": "utility",
    "body": "Hi {name}, your order is ready. View the details here: {shortlink:order}.",
    "footer": "Reply if you need help",
    "buttons": [
      {
        "type": "quick_reply",
        "text": "I need help"
      }
    ]
  }'
```

Use `utility` for an expected transactional update and `marketing` for a promotion, offer, or re-engagement message. Set the real purpose instead of choosing the category based on price. Meta can reject or reclassify content that does not match its category.

The version submitted to Meta uses the business’s configured language; this endpoint does not accept a `language` parameter. Confirm that language before creating the template.

The current adapter has a limitation: a text-only header can be stored and appear in Hellotext’s response, but is not included in the content submitted to Meta. Put essential text in the body, as in the example, and check the actual approved content before depending on another header type.

Important component rules include:

- The WhatsApp body supports up to 1024 characters and cannot begin or end with a standalone parameter.
- Local text-header validation allows up to 60 characters; this does not remove the sending limitation above. The footer allows up to 160 characters.
- An attachment header requires a publicly accessible `attachment_url`; Hellotext downloads and stores the file.
- A template supports up to 10 buttons in total.
- Button text is limited to 25 characters.
- A template can contain at most two URL buttons, one phone button, and one copy button.

See [Create a template](https://www.hellotext.com/api#create_a_template) and the [component reference](https://www.hellotext.com/api#header_a_template) for current field and file limits.

## 4. Personalize the body safely

Template bodies support customer property tags inside braces. Common examples include:

- `{name}`
- `{full_name}`
- `{last_name}`
- `{email}`
- `{phone}`
- `{birthday}`
- A custom customer property such as `{membership_level}`

Property tags are resolved from the customer profile used for the send. Define custom properties first: an unknown name does not create a property or guarantee substitution. Before launch, check fictitious profiles with present, missing and unusually long values; then validate the final body and consent within your authorized flow.

WhatsApp does not accept a body that starts or ends with a parameter standing by itself. For example:

- Valid: `Hi {name}, your order is ready.`
- Invalid: `{name}, your order is ready.`

See [Template body and property tags](https://www.hellotext.com/api#body_a_template).

## 5. Use static and dynamic short links

Use a static short link when every recipient should reach the same destination:

```text
View the collection: {shortlink:https://shop.example.com/collections/new}
```

Use a named dynamic short link when your backend supplies a different URL for each send:

```text
View your order: {shortlink:order}
```

Every named dynamic short link requires a nonempty value under `template.shortlinks` when the message is sent. Hellotext shortens the supplied URL and associates click activity with the message context. Check every key before POST and use the correct customer destination with its own access authorization; a short link does not add authentication to the destination site.

In the current flow, PATCHing a body with a static short link can fail during conversion. Do not assume that resubmitting that body is enough: verify the case in your controlled environment or create a new template with the desired content. Named dynamic links avoid that static-URL conversion.

## 6. Wait for WhatsApp approval

Retrieve the template and inspect its `state`:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/templates/TEMPLATE_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Treat the main states as follows:

- `pending`: Meta is still reviewing the WhatsApp template.
- `approved`: the API represents a version as approved; confirm which version and account are active before depending on its content.
- `rejected`: revise the content or category before depending on it.

SMS-only templates do not go through Meta approval. An `any` template can still be pending when it includes a WhatsApp version.

The current `state` comes from an associated WhatsApp instance and does not guarantee that the latest edit is approved or that every connected account has an available version. Check the active version in Hellotext and its availability to the sending account. A pending edit can coexist with an older approved, active version; a new template without an approved version must wait. Do not treat a GET of local content as proof that Meta already uses that content.

The listing includes reusable Message templates in Settings, not every internal campaign, journey or email template. Use `GET /v1/templates?limit=25`, follow `has_more` with `starting_after` set to the last public ID, and compare the name on your backend; this endpoint has no name filter.

Do not interpret a successful `POST /v1/templates` response as WhatsApp approval. It confirms that Hellotext created the template and started the applicable synchronization flow.

## 7. Send an approved template

Send the template through the Messages API. Specify `sms` or `whatsapp` and verify the profile ID, existing destination, channel and consent beforehand:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/messages \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID",
    "technology": "whatsapp",
    "template": {
      "id": "TEMPLATE_ID",
      "shortlinks": {
        "order": "https://shop.example.com/account/orders/1001"
      }
    }
  }'
```

When `template` is present, Hellotext uses the template body and ignores a separate message `body`. You can pass the template ID as a string when the template has no dynamic short links.

A valid request returns:

```json
{
  "status": "received"
}
```

HTTP `200` with `received` confirms receipt of the request for processing; it contains no message ID and does not guarantee that the later job creates or delivers a message. Review the conversation and message state separately when a message exists. The API exposes `dispatched` and `error`; do not assume a `failed` state or a unique correspondence between this response and the message listing. See the messages guide for query and tracking limits.

In this Hellotext endpoint, a free-form WhatsApp message needs an open customer service window; use an approved, available template version to initiate a conversation or send outside it. This rule describes this Hellotext flow, not other Meta direct-send options.

See [Template messages](https://www.hellotext.com/api#templates_a_message) and [Send a message](https://www.hellotext.com/api#create_a_message).

## 8. Update or retire a template safely

Use `PATCH /v1/templates/:id` to change supported content. Retrieve the template first and construct the complete desired content: explicitly send body, technology, category and the components you want to retain, including header, footer, buttons and the file URL where applicable. The current flow does not guarantee that an omitted field is preserved: it can clear content or components, default the category to `marketing`, or switch technology to `any`. Do not treat PATCH as a partial edit without checking these effects.

A valid update returns HTTP `200`, which does not prove that Meta has activated the edit. Check the response, retrieve the template again and inspect the active version. Account for the static-link limitation above.

For WhatsApp templates:

- Content changes may require another Meta review.
- Do not assume the changed content is live while its state is pending.
- Do not use an update to rename a WhatsApp template; create a new template when the reusable identity must change.
- Changing the target technology can make the template unavailable on its previous channel.

Use `DELETE /v1/templates/:id` only when the reusable standard template should no longer be available. Do not delete a template merely to change copy, and verify that campaigns, routes, playbooks, or backend jobs no longer depend on its ID.

An accepted deletion returns HTTP `202` and retires the template from the available catalog; it does not automatically erase its history. After a creation timeout, query the catalog and look for the name before repeating POST. After an update timeout, query content and versions before another PATCH. No documented idempotency key makes repeating these operations or message sends safe.

See [Update a template](https://www.hellotext.com/api#update_a_template) and [Delete a template](https://www.hellotext.com/api#delete_a_template).

## 9. Troubleshoot common errors

Check these causes before retrying:

- **`401`:** the API token is missing, invalid, or revoked.
- **`403`:** the business cannot perform the requested API operation.
- **`422` on `technology`:** WhatsApp is not connected or the value is not `sms`, `whatsapp`, or `any`.
- **`422` on components:** an SMS-only template includes a header, footer, or buttons, or a component exceeds its limit.
- **`422` on `body`:** the body is blank, too long, or contains a dangling WhatsApp parameter.
- **`422` on buttons:** a button is missing its matching URL, phone, copy value, or text, or the allowed count was exceeded.
- **Message request fails:** the template does not belong to the business, a dynamic short link is missing, the customer profile cannot be reached, or the selected channel is unavailable.
- **WhatsApp message does not send:** no approved version exists because the template is new and pending or was rejected, or the approved version is paused, disabled, or otherwise unavailable in Meta. A pending edit can keep an older version active; verify the specific account and availability.

A template-resolution or link-conversion failure does not always arrive as a structured `422`; store the HTTP status and a sanitized response without the token or private data. Do not retry an unchanged validation error. Correct the named parameter first. Use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}) for authentication, logging, retries, and end-to-end diagnostics.

## Related guides

- [Developers and API overview]({% link _developers/developers-overview.md %})
- [Send messages with the API]({% link _developers/send-messages-with-api.md %})
- [Send SMS with the API]({% link _developers/send-sms-with-api.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})
- [Troubleshoot WhatsApp templates]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %})
