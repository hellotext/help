A template stores reusable message content in Hellotext. Create it once through the Templates API, keep its Hellotext ID, and use that ID when your backend sends an individual message through the Messages API.

Creating a template does not send a message, create a campaign, or enable a playbook. Delivery still depends on the selected channel, the customer profile, consent, channel availability, and, for WhatsApp, Meta approval and the customer service window.

Use the [Templates API reference](https://www.hellotext.com/api#templates) for the complete contract. This guide covers the recommended implementation flow.

## Before you start

Prepare:

- A private API authorization token stored only on your backend.
- An active Hellotext business with the channels you intend to use.
- A connected WhatsApp Business account if the template targets WhatsApp.
- A stable, unique template name.
- A clear decision between `sms`, `whatsapp`, or `any` technology.
- A `marketing` or `utility` category that matches the real purpose of a WhatsApp message.
- The Hellotext customer profile ID and, when needed, the specific destination for the send.
- Definitions and values for every customer property used for personalization.

Create custom customer properties before using their names as tags. See [Custom properties and events]({% link _audience/custom-properties-and-events.md %}).

## 1. Choose the template technology

The `technology` value determines where the template can be used and which components it accepts.

### SMS

An `sms` template supports the message body only. Do not send a header, footer, or buttons with an SMS-only template.

SMS length and encoding determine how many billable segments the final message uses. Keep the rendered message concise and test it with real customer data. See [Send SMS with the API]({% link _developers/send-sms-with-api.md %}).

### WhatsApp

A `whatsapp` template can include:

- A required body.
- An optional text, attachment, or address header.
- An optional footer.
- Optional quick-reply, URL, phone, or copy buttons.

WhatsApp templates are submitted to Meta and initially return a pending state. Do not depend on the template for a production send until its state is approved.

### Any compatible technology

Use `any` when the same reusable content should be available to compatible connected channels. If the business has WhatsApp connected, Hellotext also submits the WhatsApp version to Meta. When the template is sent through SMS, only its body is used.

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

Save the returned template `id`. SMS-only templates are represented as approved because they do not require Meta review.

The example uses a dynamic short link. Your backend must provide the `order` destination URL every time it sends this template.

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
    "header": {
      "type": "text",
      "text": "Your order is ready"
    },
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

Important component rules include:

- The WhatsApp body supports up to the limit documented by the API and cannot begin or end with a standalone parameter.
- Text headers are limited to 60 characters.
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

Property tags are resolved from the customer profile used for the send. Before launch, test profiles with values present, missing, and unusually long so the rendered message still reads naturally.

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

Every named dynamic short link in the template requires a value under `template.shortlinks` when the message is sent. Hellotext shortens the supplied URL and associates click activity with the message context.

## 6. Wait for WhatsApp approval

Retrieve the template and inspect its `state`:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/templates/TEMPLATE_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Treat the main states as follows:

- `pending`: Meta is still reviewing the WhatsApp template.
- `approved`: the template can be used for compatible WhatsApp sends.
- `rejected`: revise the content or category before depending on it.

SMS-only templates do not go through Meta approval. An `any` template can still be pending when it includes a WhatsApp version.

Do not interpret a successful `POST /v1/templates` response as WhatsApp approval. It confirms that Hellotext created the template and started the applicable synchronization flow.

## 7. Send an approved template

Send the template through the Messages API. Specify the technology explicitly when the channel matters:

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

This means the message was accepted for processing. It does not confirm delivery by WhatsApp or the mobile carrier. Retrieve the message or review the conversation and delivery state separately.

For WhatsApp, a free-form message can only be sent while the customer service window is open. An approved WhatsApp template is required to initiate a conversation or send outside that window.

See [Template messages](https://www.hellotext.com/api#templates_a_message) and [Send a message](https://www.hellotext.com/api#create_a_message).

## 8. Update or retire a template safely

Use `PATCH /v1/templates/:id` to change supported content such as the body, header, footer, buttons, or target technology.

For WhatsApp templates:

- Content changes may require another Meta review.
- Do not assume the changed content is live while its state is pending.
- Do not use an update to rename a WhatsApp template; create a new template when the reusable identity must change.
- Changing the target technology can make the template unavailable on its previous channel.

Use `DELETE /v1/templates/:id` only when the reusable standard template should no longer be available. Do not delete a template merely to change copy, and verify that campaigns, routes, playbooks, or backend jobs no longer depend on its ID.

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
- **WhatsApp message does not send:** the template or latest change is still pending, rejected, paused, or otherwise unavailable in Meta.

Do not retry an unchanged validation error. Correct the named parameter first. Use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}) for authentication, logging, retries, and end-to-end diagnostics.

## Related guides

- [Developers and API overview]({% link _developers/developers-overview.md %})
- [Send SMS with the API]({% link _developers/send-sms-with-api.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})
- [Troubleshoot WhatsApp templates]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %})
