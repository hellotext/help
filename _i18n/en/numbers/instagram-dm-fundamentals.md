Connect Instagram when customers discover your business there and expect to continue through direct messages. Hellotext can bring eligible Instagram conversations into the Inbox so teammates, playbooks, routes, and AI agents can respond with shared context.

Instagram DM is primarily a customer-initiated conversational channel. It is different from SMS and WhatsApp campaign delivery: following your account or knowing a username does not, by itself, let the business start a new direct message.

## What Instagram DM is best for

Use Instagram DM for:

- Product questions from people browsing your Instagram profile or content.
- Support conversations that begin as a direct message.
- Supported replies to an Instagram story.
- AI agents and reactive playbooks that answer in the channel where the customer wrote.
- Routes that ask questions, collect context, branch, or assign an active conversation.
- One-to-one replies from the Inbox during an eligible conversation.

Instagram DM is not currently a delivery option in the campaign creator. Use campaigns for their available WhatsApp and SMS delivery options, and use Instagram for customer-initiated conversations and eligible conversational flows.

## Before you connect Instagram

Confirm that:

- The account is an Instagram professional account: Business or Creator.
- You can sign in to the Instagram account you want to connect.
- You can authorize the permissions Hellotext requests for messaging and synchronization.
- The account is not already connected to another Hellotext business.
- Your team knows who should receive and answer Instagram conversations in the Inbox.

Instagram and Facebook Messenger are separate integrations in Hellotext. Connecting one does not connect the other.

## Connect Instagram

1. In Hellotext, go to **Settings → Integrations**.
2. Find **Instagram** in the communication integrations and select it.
3. Sign in directly with the Instagram professional account you want to use.
4. Review and authorize the requested permissions.
5. Return to Hellotext and confirm that the connected Instagram username appears as active.
6. From a different Instagram account, send a test direct message and confirm that it reaches the Inbox.

One Instagram account can be connected to only one Hellotext business at a time. If Hellotext reports that the account belongs to another business, remove it from that business before trying again.

## How Instagram conversations begin

An Instagram customer starts the conversation by sending a direct message or a supported story reply. Hellotext then:

1. Receives the Instagram identity and supported message content.
2. Finds or creates the corresponding customer profile.
3. Adds the Instagram identity to that customer profile.
4. Opens or updates the private conversation in the Inbox.
5. Makes the conversation available to the configured teammate, route, playbook, or AI agent.

A follower is not automatically reachable by direct message. The customer must first create an eligible Instagram interaction before Hellotext can reply through this channel.

Messages sent directly from the connected Instagram account can also synchronize into the Hellotext conversation, keeping the Inbox history aligned with activity that happened in Instagram.

## Understand the messaging window

Meta applies a standard 24-hour messaging window after an eligible message from the customer. A new eligible customer message opens the window again. Hellotext treats an Instagram conversation as available for replies while that window remains open, and Meta controls final delivery eligibility.

Unlike WhatsApp, Instagram does not use an approved message template in Hellotext to restart a closed conversation. When the window is no longer available, wait for the customer to write again or continue through another channel only when that customer is eligible there.

Do not use another channel to bypass consent or a closed Instagram conversation. Each destination must satisfy its own reachability and subscription rules.

## Messages and interactions Hellotext supports

Hellotext can process supported Instagram direct-message activity such as:

- Text messages of up to 1,000 characters.
- Supported images, video, audio, and other attachments.
- Voice messages, stickers, and replies to previous messages.
- Supported story replies.
- Quick replies, buttons, and product cards created by compatible playbooks or message flows.
- Read activity and message reactions when Meta provides them.

Public comments, story mentions, and ephemeral content are not treated as ordinary Instagram DM conversations in the Inbox. Test the exact interaction you expect customers to use rather than assuming every Instagram notification becomes a conversation.

## Manage Instagram conversations in the Inbox

Instagram conversations use the same Inbox ownership model as other supported customer channels. Your team can:

- Reply from the active Instagram conversation.
- Assign or reassign the conversation to a teammate or team.
- Add internal context without sending it to the customer.
- Close the conversation when no further action is needed.
- Reopen work when a new eligible customer message arrives.

The active channel matters. Content available on WhatsApp or Webchat may not have the same presentation or support on Instagram, so preview and test the Instagram version of the response.

Keep reading: [Inbox and conversations overview]({% link _team/inbox-overview.md %}) and [Assign conversations]({% link _team/assigning-conversations.md %}).

## Use playbooks, routes, and AI agents

Reactive playbooks and AI agents can be configured to respond on all incoming channels or specifically on Instagram DM. They receive the conversation context and can answer, recommend products, collect information, or hand off the conversation according to their configuration.

For an AI agent, confirm that:

- Instagram is included in its incoming channels.
- Its knowledge and instructions cover the questions customers ask there.
- Its handoff destination is configured for cases it cannot resolve.
- Its Instagram responses were tested in the playground and through a real direct message.

Routes can use Instagram steps while the customer and channel remain eligible. Test sends, questions, branches, and assignment steps, including what should happen when the Instagram window closes or the integration becomes unavailable.

Some proactive autonomous playbooks can consider Instagram only when the customer already has a reachable Instagram identity and the message is eligible under Meta and Hellotext rules. Enabling Instagram does not make every playbook opportunity send through this channel.

Keep reading: [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}) and [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Customer profiles and consent

An incoming Instagram conversation can add an Instagram identity to a customer profile. That identity is specific to the connected Instagram account and should not be treated as a phone number, WhatsApp subscription, or permission to send marketing through another channel.

If the same customer exists under another profile, review the data before merging profiles. Preserve the correct conversation, identifiers, properties, and purchase history.

Respect unsubscribe and block requests. A customer writing on Instagram does not provide unlimited permission for future outbound messages.

Keep reading: [Customer profiles]({% link _audience/customer-profiles.md %}) and [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Pricing and usage

Instagram Direct messages are included in Hellotext's non-SMS messaging calculation. The variable amount becomes the Hellotext charge only when it is higher than the plan minimum, performance fee, and SMS amount for the billing period.

Review [Fair-use message policy]({% link _billing/fair-use-message-policy.md %}) for the current published rate and calculation.

## If Instagram disconnects

Hellotext can mark the integration as disconnected if the Instagram password changes, authorization expires, permissions are removed, or Meta logs Hellotext out.

When this happens:

1. Go to **Settings → Integrations**.
2. Find the disconnected Instagram account.
3. Select **Reconnect Instagram**.
4. Sign in again and authorize the requested permissions.
5. Send a new test direct message from another account.

Reconnecting restores the channel. It does not make a closed customer conversation eligible again.

## Troubleshoot a missing or failed Instagram message

If an incoming message does not appear:

- Confirm that the correct Instagram professional account is connected and active.
- Send a direct message from another account, not from the connected business account to itself.
- Check that the interaction is a DM or supported story reply rather than a comment, story mention, or ephemeral item.
- Confirm that Hellotext still has the requested Instagram permissions.
- Check whether the customer profile or conversation is blocked.

If a reply does not send:

- Confirm that the messaging window is still eligible.
- Check that the Instagram integration and channel are active.
- Review the exact failure reason before retrying.
- Confirm that the content and attachment are supported and that text does not exceed 1,000 characters.
- Avoid repeated retries when Meta has rejected the destination or conversation state.

See [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) for the shared delivery checklist.

## First Instagram launch checklist

Before relying on Instagram DM, confirm that:

1. The intended professional account is connected and active.
2. A test DM creates or updates the correct customer profile.
3. The conversation appears in the Inbox with the right Instagram identity.
4. Teammates, teams, playbooks, routes, or AI agents receive the conversation as expected.
5. Text, attachments, story replies, buttons, and product cards you plan to use were tested.
6. Handoff reaches the correct person or team.
7. Your team understands the messaging window and reconnect process.

## Related guides

- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Getting started with routes]({% link _journeys/getting-started-with-journeys.md %})
- [Send messages with the API]({% link _developers/send-messages-with-api.md %})
