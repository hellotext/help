Connect Instagram when customers discover your business there and expect to continue through direct messages. Hellotext can bring eligible Instagram conversations into the Inbox so teammates, playbooks, routes, and AI agents can respond with shared context.

Instagram DM is primarily a customer-initiated conversational channel. It is different from SMS and WhatsApp campaign delivery: following your account or knowing a username does not, by itself, let the business start a new direct message.

To set up the channel, follow [Connect Instagram DM]({% link _integrations/connect-instagram-dm.md %}). This guide explains what happens after connection.

## What Instagram DM is best for

Use Instagram DM for:

- Product questions from people browsing your Instagram profile or content.
- Support conversations that begin as a direct message.
- Supported replies to an Instagram story.
- AI agents and reactive playbooks that answer in the channel where the customer wrote.
- Routes that ask questions, collect context, branch, or assign an active conversation.
- One-to-one replies from the Inbox during an eligible conversation.

Instagram DM is not currently a delivery option in the campaign creator. The creator offers its SMS, WhatsApp, and Email options according to available access and configuration; Instagram is used in compatible conversations and flows. Confirm the exact playbook or route type, your plan, and your permissions before relying on that flow.

## How Instagram conversations begin

An Instagram customer starts the conversation by sending a direct message or a supported story reply. Hellotext then:

1. Receives the Instagram identity and supported message content.
2. Finds or creates the corresponding customer profile.
3. Adds the Instagram identity to that customer profile.
4. Opens or updates the private conversation in the Inbox.
5. Records the conversation for the applicable handling. Receiving it, assigning an owner, and replying are distinct stages; appearing in the Inbox does not guarantee immediate attention.

A follower is not automatically reachable by direct message. The customer must first create an eligible Instagram interaction before Hellotext can reply through this channel.

Messages sent directly from the connected account can also synchronize when Meta supplies compatible activity. An outgoing echo or a button response keeps its own references; it is not a new ordinary customer message. Synchronization does not guarantee that all history appears or that the person has read the message.

## Understand the messaging window

Meta applies a standard **24-hour** window after an eligible customer message. Each new eligible customer entry opens it again. Check current requirements in [Meta's official Instagram collection](https://www.postman.com/meta/instagram/folder/uxudqu0/send-api) and its [standard-window documentation](https://github.com/fbsamples/messenger-platform-samples/blob/354ee221ac1d081cc6105a1515a8468cc44f6710/postman/instagram-platform-api.postman_collection.json). An exception authorized by Meta does not imply that Hellotext offers that flow.

Review the latest eligible customer entry to the connected account. An outgoing message, enabled editor, or open Inbox state does not itself restart Meta's window. Hellotext can keep its local window open after outgoing activity; Meta retains the final acceptance decision. Closing, assigning, or changing a response rule does not extend the 24 hours either.

Unlike WhatsApp, Instagram does not use an approved message template in Hellotext to restart a closed conversation. When the window is no longer available, wait for the customer to write again or continue through another channel only when that customer is eligible there.

Do not use another channel to bypass consent or a closed Instagram conversation. Each destination must satisfy its own reachability and subscription rules.

## Messages and interactions Hellotext supports

Hellotext can process supported Instagram direct-message activity such as:

- Supported text messages, respecting the length admitted by the editor and Meta's limit for the particular operation.
- Images, video, audio, and files supported for the particular direction and operation; receiving a format does not guarantee that it can be sent the same way.
- Voice messages, stickers, and replies to previous messages.
- Supported story replies.
- Quick replies, buttons, and product cards created by compatible playbooks or message flows.
- Read activity and message reactions when Meta provides them.

Public comments, story mentions, and ephemeral content are not treated as ordinary Instagram DM conversations in the Inbox. Validate the exact interaction before relying on it: a story reply needs accessible content and media, and may be omitted if these cannot be obtained. Receiving voice, a sticker, or a reaction does not guarantee every outgoing operation for that format. Cards can look up products and create links; showing them does not prove stock, a reservation, payment, or purchase.

Instagram text delivery uses plain text; the common editor's rich formatting does not guarantee bold or italics in this channel. **Create a shortlink** is shared with the compatible composer. The figure was captured from **Message** opened from SMS and shows the fictional **shop.example.test/returns** URL without adding it; it is not an Instagram conversation. **Add short link** or Enter creates the resource before final save; **Cancel** discards only the pending URL. A created link does not establish sending, a click, or a purchase.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Shared link form with a fictional URL without adding it">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 464px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/link-en-mobile.png 2x" width="728" height="428" />
        <img class="ht-editorial-visual__image" src="/images/numbers/message-editor-basics/link-en.png" srcset="/images/numbers/message-editor-basics/link-en.png 2x" width="892" height="436" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Shared link form with a fictional URL without adding it" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Shared link form with a fictional URL without adding it.</figcaption>
</figure>

## Manage Instagram conversations in the Inbox

Instagram conversations use the same Inbox ownership model as other supported customer channels. Your team can:

- Reply from the active Instagram conversation.
- Assign or reassign the conversation to a teammate or team.
- Add internal context without sending it to the customer.
- Close the conversation when no further action is needed.
- Reopen work when a new eligible customer message arrives.

Receiving a conversation does not confirm ownership, team membership, available capacity, business hours, or a human reply. Closing or snoozing does not answer the customer or universally cancel pending work or AI.

Response rules let you recognize Instagram among the technologies. This menu shows five options with **WhatsApp** highlighted: Instagram was not selected and no rule was saved.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Instagram available in the response-rule technology menu">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 463px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/technology-en-mobile.png 2x" width="742" height="464" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/technology-en.png" srcset="/images/team/understanding-response-times/technology-en.png 2x" width="890" height="464" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Instagram available in the response-rule technology menu" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Instagram available in the response-rule technology menu.</figcaption>
</figure>

The following new rule has no technology selected. Both gray **60** values are placeholders, not saved minutes. **First response to new conversations** and **Subsequent replies** are separate targets, subject to the response policy and business hours. Saving a rule does not guarantee a reply or extend Meta's window.

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

The active channel matters. Validate the exact presentation in an authorized test environment; a preview does not establish acceptance or delivery.

Keep reading: [Inbox and conversations overview]({% link _team/inbox-overview.md %}) and [Assign conversations]({% link _team/assigning-conversations.md %}).

## Use playbooks, routes, and AI agents

Compatible reactive playbooks and AI agents can admit Instagram through their incoming-channel controls. The type, enabled flow, tools, access, and available data govern answers, collection, recommendations, or handoff; enabling the channel does not create tools or permission to send.

The figure shows the shared **Incoming channels** control in an independent Property Collector draft: **All incoming channels** is selected and **Manual selection** is available. Instagram appears in the description, but there is no saved manual selection, connected account, received message, or generated reply.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Automatic incoming channels and manual selection in an independent draft">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-en-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-en.png" srcset="/images/captures/property-collector/channels-en.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Automatic incoming channels and manual selection in an independent draft" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Automatic incoming channels and manual selection in an independent draft.</figcaption>
</figure>

For an AI agent, confirm that:

- Instagram is included in its incoming channels.
- Its knowledge and instructions cover the questions customers ask there.
- Its handoff destination is configured for cases it cannot resolve.
- Responses and limits of the exact flow are validated in an authorized environment. Playground can save simulations or call providers; it does not establish identity, consent, or real delivery.

Routes can use Instagram when the customer, account, channel, and particular step are eligible. Define what should happen if the window becomes unavailable, no usable destination exists, or Meta rejects the message; selecting a route does not guarantee sending.

**Assignment** can open, close, or assign a conversation and add or remove labels. Action order matters, and these actions do not themselves generate a reply. The figure is a new independent route form, without saving, connecting steps, or running an Instagram conversation.

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

Some proactive autonomous playbooks can consider Instagram only when the customer already has a reachable Instagram identity and the message is eligible under Meta and Hellotext rules. The playbook retains its own admission, availability, and preparation rules; Meta can reject sending. There is no shared guarantee of permission, timing, lowest cost, or delivery for every playbook.

Keep reading: [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}) and [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Customer profiles and consent

An incoming Instagram conversation can add an Instagram identity to a customer profile. Hellotext uses the received Instagram identifier to associate it with the business's profile. Knowing a username does not create that identity or verify account access. The identifier and reachable destination are not a phone number, WhatsApp subscription, or permission for marketing through another channel.

If the same customer exists under another profile, review the data before merging profiles. Preserve the correct conversation, identifiers, properties, and purchase history.

Profile fields do not replace the Instagram identity or permission for a particular use. **Camila Torres** is a fictional **Unconfirmed** profile with an example email and no phone number. This independent figure does not show an Instagram identity, connection, consent, or received conversation. The narrow view is a focus from the desktop profile.

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

Respect unsubscribe and block requests. A customer writing on Instagram does not provide unlimited permission for future outbound messages.

Keep reading: [Customer profiles]({% link _audience/customer-profiles.md %}) and [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Pricing and usage

Instagram Direct messages are included in Hellotext's non-SMS messaging calculation. The variable amount becomes the Hellotext charge only when it is higher than the plan minimum, performance fee, and SMS amount for the billing period.

Review [Fair-use message policy]({% link _billing/fair-use-message-policy.md %}) for the canonical rate and calculation, and confirm current conditions on [Hellotext pricing](https://www.hellotext.com/pricing). The variable amount is not added to the other three when one of them is higher; taxes or a custom agreement are considered separately.

## Troubleshoot a missing or failed Instagram message

If an incoming message does not appear:

- Confirm that the correct Instagram professional account is connected and active.
- Review an existing private interaction and its references before creating another. If a new test is needed, use an authorized environment and a recipient with permission and eligibility for that test.
- Check that the interaction is a DM or supported story reply rather than a comment, story mention, or ephemeral item.
- Confirm that Hellotext still has the requested Instagram permissions.
- Check whether the customer profile or conversation is blocked.

If a reply does not send:

- Confirm that the messaging window is still eligible.
- Check that the Instagram integration and channel are active.
- Review the exact failure reason before retrying.
- Confirm support, type, size, and length for that operation; do not extrapolate an image, audio, or editor limit to every format.
- Avoid repeated retries when Meta has rejected the destination or conversation state.

Distinguish a draft, a created message, Meta acceptance, delivery state, and read state. Some Hellotext delivery states update from the API acknowledgement; they do not themselves establish receipt or reading by the person. Text and an attachment can have separate outcomes. If the outcome is uncertain, reconcile the message and its references before repeating it to avoid duplicates.

See [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) for the shared delivery checklist.

## First Instagram launch checklist

Before relying on Instagram DM, confirm that:

1. The intended professional account is connected and active.
2. An existing interaction or an authorized test creates or updates the correct profile and preserves the account and customer references.
3. The conversation appears in the Inbox with the right Instagram identity.
4. Teammates, teams, playbooks, routes, or AI agents receive the conversation as expected.
5. The format and limits of text, attachments, stories, buttons, and cards were validated for the exact flow; these forms are not results of those tests.
6. The handoff destination, assignment, capacity waiting, and a reply are verified separately.
7. Your team distinguishes Meta's window, response targets, and account permissions, and knows how to reconcile an uncertain result before retrying.

## Related guides

- [Connect Instagram DM]({% link _integrations/connect-instagram-dm.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Getting started with routes]({% link _journeys/getting-started-with-journeys.md %})
- [Send messages with the API]({% link _developers/send-messages-with-api.md %})
