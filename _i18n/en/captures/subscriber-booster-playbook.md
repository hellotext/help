Use this guide when you want Hellotext to turn relevant customer conversations into clear, consent-based subscriptions.

Subscriber Booster is an AI capture playbook. It uses the context of an active conversation to decide when a subscription invitation is useful, adapts the interaction to that moment, and collects the customer profile data you configure.

It is not a fixed journey route and it does not send the same subscription sequence every time. It can enter near the beginning of a Webchat conversation or near the end of a customer-initiated WhatsApp conversation.

## What Subscriber Booster does

Subscriber Booster helps grow your reachable audience without separating subscription from the conversation the customer is already having.

It can:

- Invite a Webchat visitor to subscribe near the beginning of the conversation.
- Use the Webchat teaser to present a relevant first-purchase incentive before the visitor opens the chat.
- Introduce a subscription near the end of a customer-initiated WhatsApp conversation.
- Present an incentive for a future purchase when that fits the WhatsApp conversation.
- Ask for explicit consent before marking the customer profile as subscribed.
- Use its Property Collector component to collect the customer profile properties you select.
- Prevent the offered discount from being redeemed more than once by the same customer profile.

The AI uses the conversation context to make the invitation feel like a useful next step rather than an unrelated interruption.

## How the entry moment changes

Subscriber Booster can participate at different points depending on how the customer started the conversation.

### At the beginning of Webchat

For a website visitor, the playbook can use the Webchat teaser to offer a first-purchase incentive. Opening the teaser starts the conversation, where the AI can explain the subscription and ask for consent.

This path works well when the visitor is new, has not purchased yet, and is already considering whether to engage with the business.

Webchat Widget must be enabled and installed for visitors to see the teaser. Review [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %}) before testing this path.

### At the end of a WhatsApp conversation

When a customer starts a WhatsApp conversation for another reason, Subscriber Booster can wait until that need has been handled and then offer a subscription as a relevant next step.

The incentive in this context can be positioned for a future purchase. The playbook should not replace the reason the customer contacted the business or interrupt an unresolved support or sales request.

This is not a broadcast or an unsolicited outbound subscription message. It works inside a conversation the customer initiated.

## How it works with Property Collector

Subscriber Booster includes a Property Collector component in its configuration.

Use that component to select the profile properties the playbook should collect during subscription, such as name, phone, email, or custom properties available in the business.

You can also indicate which properties must be collected. Subscriber Booster asks only for the configured data that is still missing from the customer profile.

Property Collector handles this part of the conversation without turning the subscription experience into a rigid form. Keep the collection short enough that customers can understand why each answer is useful.

For the full collection model, see [Property Collector playbook]({% link _captures/property-collector-playbook.md %}).

## Consent and incentive safeguards

A subscription should happen only after the customer clearly accepts it.

The conversation should explain:

- That the customer is subscribing to promotional messages.
- Which channel will be used.
- What incentive is being offered, when applicable.
- That the customer can unsubscribe later.

Subscriber Booster also protects the offer from repeat use: the discount presented by the playbook cannot be redeemed more than once by the same customer profile.

This lets the playbook use a meaningful incentive without repeatedly granting it to the same person across later conversations.

## When to use it

Use Subscriber Booster when:

- Website visitors need a conversational reason to subscribe.
- A first-purchase incentive can help a new visitor take the next step.
- Customers already start useful WhatsApp conversations with the business.
- You want to offer subscription after resolving the customer's original WhatsApp need.
- You need to collect a few profile properties together with consent.
- You want AI to adapt the subscription invitation to the conversation instead of following a fixed route.

Use a [Website Popup]({% link _captures/website-popup.md %}) or [Website Form]({% link _captures/forms.md %}) when you want a visual form-based experience rather than a conversation.

Use a [QR Code Subscriber]({% link _captures/qr-codes.md %}) or [Shareable Link]({% link _captures/shareable-link.md %}) when the customer should start the opt-in from a scan or link.

## What it needs before launch

Before enabling Subscriber Booster, confirm:

- Webchat Widget is enabled, installed, and tested if you want to use the website teaser.
- WhatsApp is connected and receiving customer-initiated conversations if you want to use the WhatsApp path.
- The subscription consent language matches the channel and experience you intend to offer.
- The incentive is valid and appropriate for a first or future purchase.
- The profile properties selected in Property Collector are useful and have clear labels.
- Your team understands how Subscriber Booster fits around other sales or support playbooks.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, find the **Captures** group, and choose **Subscriber Booster**.

Focus on:

- **Incentive or discount:** the offer Subscriber Booster can introduce when subscription is relevant.
- **Property collection:** which customer profile properties to request and which ones must be collected.
- **Webchat teaser:** the invitation shown near the Webchat launcher for the website path.

The conversation timing is contextual. You do not need to build a fixed sequence for the beginning or end of every conversation.

## How to test it

Test both entry contexts with customer profiles that match the intended experience.

For Webchat:

- Open the website as a new visitor.
- Confirm the teaser appears with the intended incentive.
- Open the teaser and continue through the subscription conversation.
- Verify that consent is required before the profile becomes subscribed.
- Confirm the configured profile properties are requested and saved.

For WhatsApp:

- Start a customer conversation for a realistic sales or support need.
- Complete the original task first.
- Confirm Subscriber Booster introduces subscription only when it is a useful next step.
- Verify that the future-purchase incentive and consent are clear.

Also test the same customer profile after redeeming the offered discount. The playbook should not allow that profile to redeem it again.

## What to review after launch

Review real conversations rather than assuming every invitation should look the same.

Check:

- Whether the Webchat teaser attracts visitors who continue into a useful conversation.
- Whether subscription invitations happen at a natural point.
- Whether the customer's original WhatsApp need is handled before subscription is introduced.
- Whether customers understand the consent request.
- Whether the configured profile properties are collected accurately.
- Whether the incentive is granted and protected from repeat redemption as expected.
- Whether another active playbook should handle the conversation before or after Subscriber Booster.

Adjust the incentive, selected properties, or teaser when the conversation shows a clear reason to change them.

## Related guides

- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Property Collector playbook]({% link _captures/property-collector-playbook.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
