Use SMS when you need a concise text message and broad reach without depending on a messaging app. Hellotext can use SMS for campaigns, autonomous playbooks, routes, Inbox conversations, captures, and API messages.

SMS supports text and links. It does not provide the richer product, button, attachment, and location experiences available on WhatsApp. SMS does not use Meta's WhatsApp template approval process, although carrier, account, consent, and content rules still apply.

Many businesses use both channels and let the type of message and each customer's reachability determine which one fits.

## Before you use SMS

Confirm that:

- An approved SMS sender is active for your account and destination country.
- Customer profiles have complete phone numbers in international format.
- Your audience has valid consent for SMS.
- Your account has no billing, balance, or temporary sending restriction that blocks SMS.
- Replies can reach the people or playbooks expected to handle them.

The sender available to your business depends on its country and account setup. Hellotext can use approved senders or shared short codes where supported.

If no SMS sender is available on your account, contact Hellotext before building a launch around SMS.

## How Hellotext uses SMS

### Campaigns

When creating a campaign, you can choose:

- **WhatsApp and SMS:** Hellotext tries WhatsApp first and uses SMS when WhatsApp is not available for an eligible customer.
- **WhatsApp only:** the campaign stays on WhatsApp.
- **SMS only:** the campaign stays on SMS.

The available options depend on the channels connected to the business. SMS fallback does not bypass subscription, reachability, or channel consent.

Keep reading: [Campaign best practices]({% link _campaigns/campaign-best-practices.md %}).

### Autonomous playbooks

When a proactive autonomous playbook controls channel selection, Hellotext can evaluate the eligible channels available for that customer and choose a cost-efficient option. The playbook sends only when its decision engine identifies a valid opportunity under its rules.

Do not assume that enabling SMS makes every playbook send an SMS. The customer still needs to be eligible, the opportunity must remain relevant, and the playbook may select another available channel.

A reactive support playbook normally responds in the channel where the customer started the conversation, subject to that channel's availability and conversation rules.

### Routes

A route follows the channels and logic configured in its steps. A send step can target SMS, another channel, or use the eligible channel behavior available to that route.

Test every branch that can send or receive SMS. Confirm what happens when the phone number is missing, the customer is unsubscribed, or the selected channel cannot deliver.

### Inbox and replies

When the active sender supports replies, an SMS response can open or continue a conversation in the Inbox. Teammates can reply, assign the conversation, or let an eligible playbook handle it according to the business configuration.

Shared short codes can be used by more than one business. The most recent outbound message helps determine which business receives a reply, so businesses that require a dedicated sender should review [Exclusive short codes]({% link _numbers/exclusive-short-codes.md %}).

### API messages

API sends follow the channel, sender, destination, and content supplied by the integration. An accepted API request means Hellotext received the request; it does not yet confirm carrier delivery.

Keep reading: [Send messages with the API]({% link _developers/send-messages-with-api.md %}).

## Understand SMS length and message parts

One message in the editor can use more than one billable SMS part.

The number of parts depends on:

- message length;
- the characters and encoding used;
- personalization after tags are replaced with customer data; and
- the complete link included in the final message.

Some accents, symbols, or emoji can change the encoding and reduce the number of characters that fit in one part. A long personalized value can also make one customer's final message longer than the preview example.

Review the SMS part estimate shown by the message editor before sending. Keep the purpose and call to action concise, and test with realistic personalization values. Each part can affect SMS usage and cost.

Keep reading: [SMS pricing and number types]({% link _billing/sms-pricing-and-number-types.md %}) and [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %}).

## Consent and opt-outs

A phone number being valid does not prove that the customer agreed to receive marketing SMS. Hellotext considers both the customer profile's subscription state and whether the destination is reachable through the selected channel.

Before sending:

- Explain what customers are subscribing to and which channel you will use.
- Keep evidence of the subscription source.
- Exclude unsubscribed, invalid, blocked, internal, and test profiles as appropriate.
- Make the business and purpose of the message clear.
- Respect opt-outs and do not retry through SMS to bypass another channel's consent rules.

See [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}) for the complete distinction between subscription, identity, and reachability.

## Delivery states and failed messages

An SMS can move through these states:

- **Pending:** waiting for processing.
- **Routed:** sent to the external provider.
- **Delivered:** the provider confirmed delivery.
- **Not sent:** Hellotext or the provider could not complete delivery and shows a reason.

Do not retry while a message is still processing. If it is not sent, open the reason first. Common causes include an invalid number, carrier rejection, unavailable sender, account limit, billing condition, or a temporary provider problem.

New prepaid businesses can also begin with a temporary SMS limit while Hellotext reviews sending quality.

Keep reading: [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) and [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

## First SMS launch checklist

Before your first SMS launch, confirm that:

1. An SMS sender is active for the destination country.
2. The audience has valid SMS consent and reachable phone numbers.
3. The final message identifies the business and has one clear purpose.
4. The SMS part estimate is acceptable after personalization.
5. Replies reach the expected Inbox, team, or playbook.
6. You tested delivery, replies, links, personalization, and opt-out handling.
7. You know where to review delivery reasons and reporting after launch.

## Related guides

- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Exclusive short codes]({% link _numbers/exclusive-short-codes.md %})
- [SMS pricing and number types]({% link _billing/sms-pricing-and-number-types.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
