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

Confirm the exact playbook or route, its controls, your plan, and your permissions before depending on it. A Messenger identity in a profile does not guarantee that a flow can admit the customer, generate a response, or send it.

## How Messenger conversations begin

A customer starts an eligible conversation by messaging the connected Facebook Page or using a supported Messenger interaction. Hellotext then:

1. Receives the Page-scoped Messenger identity and supported message content.
2. Finds or creates the corresponding customer profile.
3. Adds that Messenger identity to the customer profile.
4. Opens or updates the private conversation in the Inbox.
5. Records the conversation for the applicable handling. Receipt, assignment to an owner, and a reply are separate stages; appearing in the Inbox does not guarantee immediate attention.

The identity is scoped to the connected Facebook Page. It is not a general Facebook identifier that can be reused with another Page.

Messages sent directly as the connected Page can also synchronize when Meta supplies supported activity. These outgoing messages and postback replies have their own history and references; they should not be counted as a new ordinary customer message. Synchronization does not guarantee that every historical message appears or that the recipient read the content.

## Understand the messaging window

For the standard messaging window, Meta requires the recipient to have messaged the Page within the last **24 hours**, unless a specific authorization permits messaging outside that window. Consult [Meta's Messenger API requirements](https://www.postman.com/meta/messenger-platform-api/documentation/iyp204x/messenger-platform-api?entity=request-22794852-e8ea7834-a144-4efb-9802-94c9e3148acc). A Meta exception does not establish that Hellotext offers that flow.

Before replying, check the customer's latest eligible incoming message to that Page. An outgoing message, an open Inbox state, or an enabled editor does not itself restart Meta's window. Hellotext can keep its local window open after outgoing activity; Meta retains the final acceptance decision. Closing, assigning, or changing a response rule does not extend the 24 hours.

Hellotext does not currently provide a campaign or approved utility-template flow for reopening a closed Messenger conversation. When the standard window is no longer available, wait for the customer to write again or continue through another channel only when that customer is eligible there.

Do not use another channel to bypass consent or a closed Messenger conversation. Each destination must satisfy its own reachability and subscription rules.

## Messages and interactions Hellotext supports

Hellotext can process supported Messenger activity such as:

- Compatible text messages. Respect the length allowed by the editor and Meta; a draft accepted by Hellotext does not guarantee provider acceptance.
- Compatible images, GIFs, audio, video, and PDF attachments, subject to the format and size allowed for the particular operation.
- Supported incoming voice messages and stickers. Receiving a format does not guarantee that every editor can send it again.
- Replies to previous messages.
- Quick replies and postback button interactions.
- Buttons and product cards created by compatible playbooks or message flows.
- Delivery, read, edit, and reaction activity when Meta provides it.

Message text is sent as plain text; rich formatting in the shared editor does not guarantee bold or italic in Messenger. Buttons, quick replies, and cards depend on the flow creating them, Meta limits, and available data. A card does not prove stock, purchase eligibility, payment, or delivery.

When the link tool is available in an eligible conversation, use a verified static URL. **Add short link** or Enter creates the link before the final message save; **Cancel** only discards the pending URL. Creating a link does not send a message or establish a click or purchase.

The figure shows the shared **Message** editor's form, opened from SMS with the fictitious `https://shop.example.test/returns` URL without adding it. It is the same link control used by the compatible Messenger composer; it does not show a Messenger conversation, a connected Page, or a sent Messenger message.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Shared link form with a fictitious URL that has not been added">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 464px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/link-en-mobile.png 2x" width="728" height="428" />
        <img class="ht-editorial-visual__image" src="/images/numbers/message-editor-basics/link-en.png" srcset="/images/numbers/message-editor-basics/link-en.png 2x" width="892" height="436" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Shared link form with a fictitious URL that has not been added" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Shared link form with a fictitious URL that has not been added.</figcaption>
</figure>

Public Facebook comments, Page posts, and conversations sent to a personal Facebook profile are not ordinary Messenger conversations for the connected Page in Hellotext. Validate the exact customer entry point you plan to use in an authorized environment.

## Manage Messenger conversations in the Inbox

Messenger conversations use the same Inbox ownership model as other supported customer channels. Your team can:

- Reply from an eligible Messenger conversation.
- Assign or reassign the conversation to a teammate or team.
- Add internal context without sending it to the customer.
- Apply response rules for Messenger when the plan supports channel-specific rules.
- Close the conversation when no further action is needed.
- Continue work when a new eligible customer message arrives.

Assignment to a team depends on assignable members and capacity, and can leave work waiting. Choosing a destination or closing a conversation does not establish a human reply. Closing does not universally cancel queues or every AI process.

Under **Response times**, a technology rule lets you choose **Messenger** when your plan and permissions allow it. The following fictional menu shows five choices and highlights **WhatsApp**; Messenger is available as an option, without selecting it or saving a rule.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Messenger as an option in the response-rule technology menu">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 463px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/technology-en-mobile.png 2x" width="742" height="464" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/technology-en.png" srcset="/images/team/understanding-response-times/technology-en.png 2x" width="890" height="464" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Messenger as an option in the response-rule technology menu" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Messenger as an option in the response-rule technology menu.</figcaption>
</figure>

The following new rule has no technology selected. Both gray **60** values are placeholders, not saved minutes. **First response to new conversations** and **Subsequent replies** are separate targets, subject to the response policy and business hours. Saving a rule does not guarantee a team reply or extend Meta's window.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="New rule with empty first-response and subsequent-reply targets">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/channel-en-mobile.png 2x" width="824" height="1058" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/channel-en.png" srcset="/images/team/understanding-response-times/channel-en.png 2x" width="972" height="1018" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="New rule with empty first-response and subsequent-reply targets" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">New rule with empty first-response and subsequent-reply targets.</figcaption>
</figure>

Content available on WhatsApp, Instagram, or Webchat can have a different presentation in Messenger. Validate the specific format in an authorized test environment; a preview does not establish acceptance or delivery.

Keep reading: [Inbox and conversations overview]({% link _team/inbox-overview.md %}), [Assign conversations]({% link _team/assigning-conversations.md %}), and [Response times and response rules]({% link _team/understanding-response-times.md %}).

## Use routes and compatible playbooks

Routes can use Messenger when the customer, Page, channel, and particular step are eligible. Define what should happen if the window becomes unavailable, no usable destination exists, or Meta rejects the message; selecting a route does not guarantee sending.

**Assignment** can open, close, or assign a conversation and add or remove labels. Action order matters, and these actions do not themselves generate a reply. The figure is a new independent route form, without saving, connecting steps, or running a Messenger conversation.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Five Assignment actions in a new unsaved route form">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-en-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-en.png" srcset="/images/team/ai-handoff-to-inbox/assignment-en.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Five Assignment actions in a new unsaved route form" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Five Assignment actions in a new unsaved route form.</figcaption>
</figure>

Some playbooks can consider Messenger when the customer already has a reachable Page-scoped identity and that playbook includes Messenger support. Channel availability and that playbook's own controls govern preparation; Meta can still reject sending. There is no shared guarantee of permission, timing, lowest cost, or delivery for every playbook.

Custom AI agents do not currently expose Messenger in their incoming-channel selector. Do not promise AI handling for a Messenger conversation unless the exact playbook or route you configured supports it and you verified it end to end.

Keep reading: [Getting started with routes]({% link _journeys/getting-started-with-journeys.md %}) and [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Customer profiles and consent

An incoming Messenger conversation can add a Page-scoped Messenger identity to a customer profile. That identity is specific to the connected Facebook Page and should not be treated as a phone number, WhatsApp subscription, or permission to send marketing through another channel.

If the same customer exists under another profile, review the data before merging profiles. Preserve the correct conversation, identifiers, properties, and purchase history.

Profile fields do not replace the Page-scoped identity or permission for a particular use. **Camila Torres** is a fictional **Unconfirmed** profile with an example email and no phone number. This independent figure shows those fields; it does not show a Messenger identity, connection, consent, or a received conversation. The narrow view is a focus from the desktop profile.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional unconfirmed profile with an example email and no phone number">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional unconfirmed profile with an example email and no phone number" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictional unconfirmed profile with an example email and no phone number.</figcaption>
</figure>

Respect unsubscribe and block requests. A customer writing to the Page does not provide unlimited permission for future outbound messages.

Keep reading: [Customer profiles]({% link _audience/customer-profiles.md %}) and [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Pricing and usage

Facebook Messenger messages are included in Hellotext's non-SMS messaging calculation. The variable amount becomes the Hellotext charge only when it is higher than the plan minimum, performance fee, and SMS amount for the billing period.

Review [Fair-use message policy]({% link _billing/fair-use-message-policy.md %}) for the canonical rate and calculation, and confirm current conditions on [Hellotext pricing](https://www.hellotext.com/pricing). The variable amount is not added to the other three when one of them is higher; taxes or a custom agreement are considered separately.

## Troubleshoot a missing or failed Messenger message

If an incoming message does not appear:

- Confirm that the correct Facebook Page is connected in Hellotext.
- Review an existing private interaction and its references before creating another. If a new test is needed, use an authorized test environment and a recipient with permission and eligibility for that test.
- Check that the interaction is a Messenger message rather than a public comment, Page post, personal-profile message, or Instagram DM.
- Confirm that the Facebook account and Hellotext still have the required Page permissions.
- Check whether the customer profile or conversation is blocked.

If a reply does not send:

- Confirm that the customer messaged the Page within the standard messaging window.
- Check that the Messenger integration and channel are active.
- Review the exact failure reason before retrying.
- Confirm that the text, attachment type, and attachment size are compatible with Messenger.
- Avoid repeated retries when Meta has rejected the Page, destination, or conversation state.

Distinguish a draft, a created message, Meta acceptance, delivery state, and read state. Some Hellotext delivery states update from the API acknowledgement; they do not themselves establish receipt or reading by the person. If an operation's outcome is uncertain, reconcile the message and its references before repeating it to avoid duplicates.

See [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) for the shared delivery checklist.

## First Messenger launch checklist

Before relying on Facebook Messenger, confirm that:

1. The intended Facebook Page is connected to the correct Hellotext business.
2. An existing interaction or an authorized test creates or updates the correct profile, without confusing identities from different Pages.
3. The conversation appears in the Inbox with the correct Messenger identity.
4. The right teammate, team, route, or compatible playbook receives the conversation.
5. The format and limits of planned text, attachments, replies, buttons, and cards were validated for the exact flow; this guide's forms are not results of those tests.
6. Assignment, capacity waiting, and a reply are verified separately.
7. Your team distinguishes Meta's window, response targets, and Page permissions, and knows how to reconcile an uncertain result before retrying.

## Related guides

- [Connect Facebook Messenger]({% link _integrations/connect-facebook-messenger.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Instagram DM fundamentals]({% link _numbers/instagram-dm-fundamentals.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Getting started with routes]({% link _journeys/getting-started-with-journeys.md %})
