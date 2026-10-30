Use Email when customers need a message they can receive and reply to in their usual email application. Your team sends from an address on your business domain and manages supported replies in the Hellotext Inbox alongside the customer's other conversations.

This guide explains everyday use of the Email channel after you have added a sender. For the sender form, DNS records, and domain verification, follow [Set up email sending]({% link _integrations/set-up-email-sending.md %}).

<div class="note">
  Email is available on Pro and Enterprise. A saved sender must finish domain verification before its channel becomes available for sending.
</div>

## What Email is best for

Use Email for:

- One-to-one customer conversations from the Inbox.
- Detailed answers that benefit from paragraphs and a written record.
- Support and order follow-up with customers who prefer email.
- Sharing images and information, with links to documents when needed.
- Continuing a conversation after the customer replies to an email sent from Hellotext.

Email does not require the customer to install a messaging app or have a phone number on their profile. You do need the correct email address and permission to contact the customer for the purpose of the message.

## Before sending from the Inbox

Before sending an individual Email from the Inbox, confirm that:

- You are working in the correct Hellotext business.
- The business has Email enabled and at least one verified, active email sender.
- The customer profile contains the email address you intend to use.
- You have access to that customer's Inbox conversation.
- The customer and conversation are available for the intended contact.
- Someone on your team is responsible for handling replies.

The sender integration and the customer's email address serve different purposes. Adding a sender does not add email addresses to customer profiles. Adding a customer's email address does not verify your sending domain or establish that customer's consent.

Keep reading: [Customer profiles]({% link _audience/customer-profiles.md %}) and [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Where you can use Email

The Inbox destination menu can show **Email** before sending is ready. To send, you need an address on the customer profile, channel access, and an active sender; seeing the option does not confirm those requirements.

The campaign creator shows Email as a delivery option, but selecting it does not by itself enable sending. To send an Email campaign, the business needs Email access through its subscription and a verified, active sender. Connecting a sender does not automatically change the delivery channels of an existing campaign.

Journeys can send Email from Message or Question steps configured with an Email design, and compatible proactive playbooks can select this channel. Each send depends on the flow's rules, an eligible recipient, and the business's Email access and sender. Use the Inbox for individual Email conversations and supported replies.

## Understand the sender, recipient, and reply address

An email conversation uses three addresses or identities:

| Detail | What it means | Where it comes from |
| --- | --- | --- |
| **Sender** | The name and business email address shown as the sender of the message. | The email sender associated with the active Email channel. |
| **Recipient** | The customer's address that will receive this message. | The email address you select from the customer's profile in the destination menu. |
| **Reply address** | The address the customer's email application uses when they choose Reply. | Hellotext supplies it automatically so it can associate the response with the conversation. |

For example, your sender might be `support@example.com` and your customer might receive the message at `alex@example.com`. The reply address can be different from `support@example.com`; that is how Hellotext receives the response for the conversation.

The destination menu lists the customer's email addresses. It is not a list of your business's senders. When you choose an address, Hellotext uses the existing Email conversation's active sender when available, or an available Email channel for a new destination.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-email-figure="email-recipient-menu" aria-label="Choose the recipient address">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 686px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/email-completion-20261011/email-recipient-menu-en-mobile.png 4x" width="2000" height="736" />
        <img class="ht-editorial-visual__image" src="/images/editorial/email-completion-20261011/email-recipient-menu-en-desktop.png" srcset="/images/editorial/email-completion-20261011/email-recipient-menu-en-desktop.png 4x" width="2672" height="632" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Inbox Email menu showing two email addresses for the same example customer." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data: choose the customer&#x27;s intended recipient address under Email.</figcaption>
</figure>

If your business has several active senders, verify which one is used before relying on a particular From address. The Inbox destination menu does not currently provide a separate Email sender picker.

To change a sender's name or email address, use its **Edit** action in **Settings > Integrations**. Changing its domain requires verification again. See [Set up email sending]({% link _integrations/set-up-email-sending.md %}) before making that change.

## Send an email from the Inbox

1. Open the customer's conversation in the **Inbox**.
2. Check the customer's profile and confirm the email address is correct. Add or correct the address on the profile if needed.
3. Open the destination menu beside the message editor.
4. Find the **Email** group.
5. Select the customer's intended email address. If the profile has more than one, choose the address that should receive this message.
6. Write the **Subject** and prepare the body in the Email editor. Organize the content into text blocks, adding images or actions when they help the customer.
7. Open **Preview** to review the desktop and mobile layouts. Check the recipient, subject, text, and links before sending, especially if you were previously replying over another channel.
8. Send the message and review its sending or delivery information in the conversation.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-email-figure="email-compose" aria-label="Prepare the email subject and body">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 535px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/email-completion-20261011/email-compose-en-mobile.png 4x" width="1560" height="1108" />
        <img class="ht-editorial-visual__image" src="/images/editorial/email-completion-20261011/email-compose-en-desktop.png" srcset="/images/editorial/email-completion-20261011/email-compose-en-desktop.png 4x" width="2068" height="980" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Inbox Email editor showing the subject and body of an unsent draft about picking up an example order." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Draft with fictional data: review the email subject and body before sending.</figcaption>
</figure>

When you send, only the selected address is used. No copies are sent to the other addresses on the profile. The Email destination menu does not provide CC or BCC fields.

For a customer whose only available destination is Email, Hellotext can open the composer with Email selected when an active sender is available. Always check the destination when the customer also has phone numbers or other connected channels.

If you cannot send through Email, check the profile's address, your plan access, and the sender's activation. A pending domain verification does not provide an active sending channel, even if the menu lets you explore the Email option.

Keep reading: [Message editor overview]({% link _numbers/message-editor-overview.md %}).

## What the customer receives

Hellotext prepares the email from the design you edited. The selected appearance supplies its branding and footer; the sender name and address come from the Email channel. A plain-text version is also included for email applications that use it.

Use **Subject** to write the email title. It is separate from the body and sender name; the sender name does not automatically change to the teammate who clicked Send.

The body retains the design's blocks, such as text, images, and buttons. Images added to the design appear within the email; they are not automatically offered as downloadable file attachments. Do not rely on copied styling or another channel's controls to appear identically.

Use **Preview** to review the unsent draft and switch between desktop and mobile layouts. Email applications can display the same design differently; a received test message lets you check the final appearance, line breaks, and links.

The preview footer may show **Unsubscribe**. That link is not automatically added when you send a manual email from the Inbox.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-email-figure="email-inline-preview" aria-label="Review the design in Preview">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 634px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/email-completion-20261011/email-inline-preview-en-mobile.png 4x" width="1464" height="2280" />
        <img class="ht-editorial-visual__image" src="/images/editorial/email-completion-20261011/email-inline-preview-en-desktop.png" srcset="/images/editorial/email-completion-20261011/email-inline-preview-en-desktop.png 4x" width="2464" height="2280" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Preview of the Casa Lila draft with the example message, footer, and desktop and mobile selector." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Preview of the draft with fictional data. Switch between desktop and mobile to check how the content is arranged.</figcaption>
</figure>

### Links and personalization

Use the editor's link tool when you need a tracked link, and check its destination before sending. Use personalization tags only when the customer's profile has the values needed to produce a complete message.

Review the final wording with realistic customer data. A missing name, an outdated address, or a link pointing to the wrong product can make a successfully delivered email unhelpful.

Keep reading: [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %}) and [Personalization tags]({% link _audience/personalization-tags.md %}).

## Text length and attachments

The Email editor organizes content into blocks. Use its image controls; the file list for other channels does not describe what you can add to this design.

| Item | Limit or behavior |
| --- | --- |
| **Subject** | Up to 998 characters. |
| **Formatted text** | Validated per block; formatting also uses space. Simplify or split a block if the editor rejects its length. |
| **Top-level blocks** | Up to 30 in the design. |
| **An uploaded image** | PNG, JPEG, GIF, or WebP up to 5 MB. It becomes part of the email body. |
| **Documents, audio, or video** | Share an appropriate link; the current Email editor does not offer the general file uploader for these attachments. |

The formatted-text limit is not a fixed character count for the entire email. The combined design size is also validated. Keep the message concise and split information into useful blocks without repeating content.

Wait for each image to finish loading and check its content in **Preview**. An accepted image does not guarantee that every email service will accept the complete message. Use smaller images when possible.

To share a document or a large file, add a download link and check that the customer has access. Changing only a filename extension does not convert the file to a supported format.

## How customer replies reach the Inbox

After receiving an email sent from Hellotext, the customer should:

1. Open the message in their usual email application.
2. Choose **Reply**.
3. Keep the reply address supplied by the email application.
4. Reply from the same email address that received the message.

Hellotext associates a supported reply with the original outgoing email, customer profile, and conversation. Your team can then read and answer it from the Inbox.

A reply can include text and supported attachments. The Inbox retains supported elements of the received email, such as images, tables, and lists, and can group quoted text from earlier messages. Some styles or elements of the original email may appear differently.

### Replies from another address

Reply matching expects the original recipient's email address. A customer replying from another account, or forwarding the email to someone else who then replies, may not create a matching Inbox message.

When testing replies, use the same address that received the email and leave the supplied reply address unchanged. The email subject alone is not enough to associate an arbitrary message with the conversation.

### New emails sent to your existing business mailbox

Verifying a sending domain does not move an existing mailbox into Hellotext. A new email written directly to `support@example.com` continues to follow that address's existing incoming-mail setup.

Sending from that address in Hellotext and receiving replies through the supplied reply address are separate from importing mailbox history or receiving every new email sent to the domain. If you need broader incoming-mail routing, discuss the setup with [Hellotext support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Conversation ownership and reply windows

Email conversations use the shared Inbox workflow. Teammates can assign work, add internal notes, close a conversation, and handle subsequent replies with the customer's history available.

Email does not have a 24-hour reply window. The channel does not become unavailable simply because the customer has not written recently. Your sender must still be active, and the customer, conversation, subscription, and other sending conditions must still allow the intended message.

Closing or snoozing an Inbox conversation is a team-workflow action. It is separate from the Email channel's ability to send. A supported new customer reply can bring the conversation back for attention.

Keep reading: [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %}) and [Assign conversations]({% link _team/assigning-conversations.md %}).

## Subscription status and unsubscribe requests

A customer's email address is a destination, not evidence that the customer wants marketing messages. Review the profile's subscription information and the purpose of the contact before sending.

An ordinary email sent manually from the Inbox does not automatically include an unsubscribe link in its footer. If the customer asks your team to stop marketing messages, record the request using the customer's subscription controls and follow the business's consent process.

For an email that includes an **Unsubscribe** link, the customer opens a confirmation page and presses **Unsubscribe** to submit the request. The page then displays **Request received** while Hellotext processes the preference update. Opening the link alone does not submit the unsubscribe request.

<div class="note">
  An email unsubscribe updates the customer's subscription status for that Hellotext business across channels. It is not limited to one email address or only the Email channel.
</div>

Unsubscribing does not delete the customer profile or its conversation history. Do not switch to another channel to bypass the recorded preference.

If Hellotext receives a spam or abuse complaint for a sent email, it records the customer's unsubscribe while preserving the message's existing delivery state. A bounced or rejected email is handled as a delivery failure; it is not the same as an unsubscribe request.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Understand sending, delivery, and read information

The conversation can show several kinds of message information as updates arrive:

| Information | What it tells you |
| --- | --- |
| **Sending** | Hellotext is processing the outbound message. |
| **Sent** | The message has been handed off for sending. This alone does not confirm delivery to the recipient. |
| **Delivered** | The recipient's mail service has accepted the message. It does not guarantee placement in the primary inbox. |
| **Seen or read information** | An email-open notification was reported. It does not prove the customer read or understood the message. |
| **Failed** | Sending could not be completed, or a rejection or bounce was reported. |
| **Received** | A supported customer reply was recorded in the conversation. |

Delivery and open information can arrive separately. An absent read timestamp does not prove that the customer has not opened the email. Treat the customer's reply or another explicit action as stronger evidence of engagement.

Inspect the message's information and any available failure reason before sending it again. Some failures provide only a general error, so do not expect a detailed mailbox diagnosis for every unsuccessful email.

Keep reading: [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Troubleshoot an Email conversation

### Email is missing from the destination menu

Check that the customer's profile has an email address and that the business has a verified, active sender. If the sender was recently added or its domain was changed, follow its DNS instructions and allow verification to complete.

If the only destination on the profile is Email and no Email sender is active, the conversation cannot offer a usable Email composer. Review the sender setup rather than repeatedly adding the same customer address.

### The message used an unexpected sender or subject

The destination menu chooses the recipient. The sender comes from the Email channel; you write the subject in **Subject**. Check that field before sending, including when replying to an earlier email.

Review the sender's name and address in **Settings > Integrations**. If you have several senders, check which channel the conversation used. Contact support if you need help identifying the sender before sending further messages.

### The customer cannot find a sent email

Confirm the exact recipient address and review whether the message has delivery information or a failure. Ask the customer to check their spam or junk folder as well as their usual inbox.

If your emails often land in spam, check that your sending domain has a DMARC record. See [Add the DMARC record]({% link _integrations/set-up-email-sending.md %}#add-the-dmarc-record).

If the email is still sending, give processing time to complete. If it failed, review the available reason, correct the destination or content when appropriate, and reduce images or simplify the design if its size prevents sending.

### The customer's reply does not appear

Confirm that the customer replied to an email sent from Hellotext, used the supplied reply address, and replied from the original recipient address. Check that the sending channel is still active and that the customer or conversation has not been blocked or removed.

Incoming replies must also pass the receiving checks. If a reply still does not appear, contact support with the original message, recipient address, approximate reply time, and whether the reply included attachments. There is no need to recreate the sender just to investigate a missing reply.

### An attachment fails or looks different

In the Email editor, add images through its image blocks. Check that they are PNG, JPEG, GIF, or WebP files up to 5 MB and wait for the upload to finish. A design image appears within the email; its appearance can vary between email applications.

For a large document or media file, consider sharing an appropriate download link. Keep access to the linked file suitable for the intended customer.

## First Email conversation checklist

Before your team relies on Email conversations in the Inbox, confirm that:

1. The intended sender is verified and active in the correct business.
2. A test customer's email address is saved correctly on the profile.
3. The selected destination is Email and shows the correct address.
4. The received test message shows the expected sender, subject, design, images, and links.
5. A reply from the same recipient address appears in the correct Inbox conversation.
6. The right teammate or team takes responsibility for the reply.
7. Your team understands sender selection, delivery information, and the scope of unsubscribe requests.

## Related guides

- [Set up email sending]({% link _integrations/set-up-email-sending.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Customer profiles]({% link _audience/customer-profiles.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
