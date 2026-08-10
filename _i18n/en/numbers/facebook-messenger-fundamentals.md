Connect Facebook Messenger when customers use your Facebook Page to ask about products, purchases, or support. Hellotext can bring eligible Page conversations into the Inbox so your team, routes, and compatible playbooks can respond with shared context.

Messenger in Hellotext is tied to a Facebook Page. It is separate from personal Messenger conversations and from the Instagram integration.

To set up the channel, follow [Connect Facebook Messenger]({% link _integrations/connect-facebook-messenger.md %}). This guide explains what happens after connection.

## What Facebook Messenger is best for

Use Messenger for:

- Product and support questions sent to your Facebook Page.
- One-to-one replies from the Inbox during an eligible conversation.
- Supported quick replies, buttons, and postback interactions.
- Routes that send messages, ask questions, branch, or assign an active conversation.
- Playbooks that explicitly support Messenger.
- Keeping Page conversation history available to the team in Hellotext.

A Page follower is not automatically reachable in Messenger. The customer must first create an eligible interaction with the Page before Hellotext can reply through that Page-scoped identity.

## Know the current automation scope

Messenger does not currently have the same product coverage as WhatsApp or Instagram DM:

- It is not a delivery option in the campaign creator.
- It is not currently selectable under **Incoming channels** for a custom AI agent.
- Routes and playbooks can use Messenger only when that specific flow supports it.

Do not assume a playbook supports Messenger because it works on another channel. Review the channels exposed by that playbook and test the complete Messenger flow before launch.

## How Messenger conversations begin

A customer starts an eligible conversation by messaging the connected Facebook Page or using a supported Messenger interaction. Hellotext then:

1. Receives the Page-scoped Messenger identity and supported message content.
2. Finds or creates the corresponding customer profile.
3. Adds that Messenger identity to the customer profile.
4. Opens or updates the private conversation in the Inbox.
5. Makes the conversation available to the team, route, or compatible playbook handling it.

The identity is scoped to the connected Facebook Page. It is not a general Facebook identifier that can be reused with another Page.

Messages sent directly as the connected Page can also synchronize into the Hellotext conversation. This keeps the Inbox history aligned with supported activity sent from Messenger or Meta's own Page tools.

## Understand the messaging window

Meta applies a standard 24-hour messaging window after the customer messages the Page. A new eligible customer message opens the window again. Meta controls final delivery eligibility even when the conversation remains visible in Hellotext.

Hellotext does not currently provide a campaign or approved utility-template flow for reopening a closed Messenger conversation. When the standard window is no longer available, wait for the customer to write again or continue through another channel only when that customer is eligible there.

Do not use another channel to bypass consent or a closed Messenger conversation. Each destination must satisfy its own reachability and subscription rules.

## Messages and interactions Hellotext supports

Hellotext can process supported Messenger activity such as:

- Text messages of up to 2,000 characters.
- Compatible images, GIFs, audio, video, and PDF attachments.
- Voice messages and stickers.
- Replies to previous messages.
- Quick replies and postback button interactions.
- Buttons and product cards created by compatible playbooks or message flows.
- Delivery, read, edit, and reaction activity when Meta provides it.

Public Facebook comments, Page posts, and conversations sent to a personal Facebook profile are not ordinary Messenger conversations for the connected Page in Hellotext. Test the exact customer entry point you plan to use.

## Manage Messenger conversations in the Inbox

Messenger conversations use the same Inbox ownership model as other supported customer channels. Your team can:

- Reply from an eligible Messenger conversation.
- Assign or reassign the conversation to a teammate or team.
- Add internal context without sending it to the customer.
- Apply response rules for Messenger when the plan supports channel-specific rules.
- Close the conversation when no further action is needed.
- Continue work when a new eligible customer message arrives.

Content available on WhatsApp, Instagram, or Webchat may not have the same presentation or compatibility in Messenger. Preview and test the Messenger version of attachments, buttons, and product cards you intend to use.

Keep reading: [Inbox and conversations overview]({% link _team/inbox-overview.md %}), [Assign conversations]({% link _team/assigning-conversations.md %}), and [Response times and response rules]({% link _team/understanding-response-times.md %}).

## Use routes and compatible playbooks

Routes can use Messenger while the customer, Page, and conversation remain eligible. Test message and question steps, branches, replies, and Assignment steps, including what should happen when the Messenger window closes or the integration becomes unavailable.

Some playbooks can consider Messenger when the customer already has a reachable Page-scoped identity and that playbook includes Messenger support. The playbook still evaluates channel availability, message compatibility, and provider eligibility before sending.

Custom AI agents do not currently expose Messenger in their incoming-channel selector. Do not promise AI handling for a Messenger conversation unless the exact playbook or route you configured supports it and you verified it end to end.

Keep reading: [Getting started with routes]({% link _journeys/getting-started-with-journeys.md %}) and [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Customer profiles and consent

An incoming Messenger conversation can add a Page-scoped Messenger identity to a customer profile. That identity is specific to the connected Facebook Page and should not be treated as a phone number, WhatsApp subscription, or permission to send marketing through another channel.

If the same customer exists under another profile, review the data before merging profiles. Preserve the correct conversation, identifiers, properties, and purchase history.

Respect unsubscribe and block requests. A customer writing to the Page does not provide unlimited permission for future outbound messages.

Keep reading: [Customer profiles]({% link _audience/customer-profiles.md %}) and [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Pricing and usage

Facebook Messenger messages are included in Hellotext's non-SMS messaging calculation. The variable amount becomes the Hellotext charge only when it is higher than the plan minimum, performance fee, and SMS amount for the billing period.

Review [Fair-use message policy]({% link _billing/fair-use-message-policy.md %}) for the current published rate and calculation.

## Troubleshoot a missing or failed Messenger message

If an incoming message does not appear:

- Confirm that the correct Facebook Page is connected in Hellotext.
- Send a private message to the Page from a personal Facebook account.
- Check that the interaction is a Messenger message rather than a public comment, Page post, personal-profile message, or Instagram DM.
- Confirm that the Facebook account and Hellotext still have the required Page permissions.
- Check whether the customer profile or conversation is blocked.

If a reply does not send:

- Confirm that the customer messaged the Page within the standard messaging window.
- Check that the Messenger integration and channel are active.
- Review the exact failure reason before retrying.
- Confirm that the text, attachment type, and attachment size are compatible with Messenger.
- Avoid repeated retries when Meta has rejected the Page, destination, or conversation state.

See [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) for the shared delivery checklist.

## First Messenger launch checklist

Before relying on Facebook Messenger, confirm that:

1. The intended Facebook Page is connected to the correct Hellotext business.
2. A test Page message creates or updates the correct customer profile.
3. The conversation appears in the Inbox with the correct Messenger identity.
4. The right teammate, team, route, or compatible playbook receives the conversation.
5. Text, attachments, replies, buttons, and product cards you plan to use were tested.
6. Assignment reaches the correct person or team.
7. Your team understands the 24-hour window and reauthorization process.

## Related guides

- [Connect Facebook Messenger]({% link _integrations/connect-facebook-messenger.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Instagram DM fundamentals]({% link _numbers/instagram-dm-fundamentals.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Getting started with routes]({% link _journeys/getting-started-with-journeys.md %})
