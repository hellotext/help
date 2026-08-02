Use a campaign when you want to send a planned, one-time message to a selected audience. You choose the channels, audience, message, and delivery time; Hellotext determines which eligible customer profiles can actually be reached through those channels.

## Before you start

Make sure you have:

- An active SMS or WhatsApp channel.
- Customer profiles with consent for the channel you plan to use.
- A clear campaign goal and call to action.
- Any lists, segments, tracked links, coupons, or media you need.
- A payment method or balance when required by your account and channels.

Keep reading: [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}).

## 1. Start the campaign and choose how it will be sent

1. Open **Campaigns**.
2. Select **New Campaign**.
3. Choose one of the available delivery options:

- **WhatsApp and SMS:** tries WhatsApp first and uses SMS when WhatsApp is not available for an eligible customer.
- **WhatsApp only:** sends only through WhatsApp.
- **SMS only:** sends only through SMS.

The options available depend on the channels connected to the business. The **Estimated target** updates to show how many customer profiles may be reachable through the selected delivery option.

Select **Next** to continue. Give the campaign a clear internal name in the header so teammates can recognize it later in Draft, Scheduled, Delivered, and reporting views.

## 2. Choose who will receive it

The audience step starts with **All audience**. You can keep it when every eligible customer profile should be considered, or replace it with a more focused selection.

You can include or exclude:

- Lists.
- Segments.
- Audiences from previously scheduled or delivered campaigns.

Use the add button to combine multiple audience rules. Change **Include** to **Exclude** when a group should be removed from the campaign.

Hellotext deduplicates overlapping groups and updates the estimated target automatically. The estimate considers the selected channels, subscription state, contactability, inclusions, and exclusions, so it can be smaller than the total size of the selected lists or segments.

Use the settings control beside **Estimated target** when you want to limit the campaign to a maximum number of eligible customers from the selected audience. This limit does not make an ineligible profile contactable.

Keep reading: [Lists vs. segments]({% link _audience/lists-and-segments.md %}).

## 3. Compose the message

Write one focused message with a clear next action. The editor shows a channel preview while you compose.

Available tools depend on the delivery option. A campaign can include:

- Formatted text supported by the selected channel.
- A tracked link.
- Personalization tags from customer profile properties.
- A coupon.
- A sending channel or sender.
- WhatsApp content such as an attachment, location, footer, or buttons when supported.

When WhatsApp is part of the campaign, the message is also prepared as a WhatsApp template. New or changed WhatsApp template content may need Meta approval before it can be delivered.

Keep reading: [Message editor overview]({% link _numbers/message-editor-overview.md %}).

## Add tracked links

Use the editor's link tool instead of pasting a long destination URL. Hellotext creates a short `hello.link` URL, records eligible clicks, and connects the visit with later tracked activity.

A tracked click can contribute active evidence for campaign attribution, but it is not the only evidence Hellotext evaluates.

Keep reading: [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %}).

## Add personalization tags

Tags insert customer profile properties into the delivered message. Use a fallback when the property may be missing, for example `{name|customer}`.

Check the preview carefully when using tags. The fallback should produce a natural sentence for customer profiles without that value.

Keep reading: [Personalization tags]({% link _audience/personalization-tags.md %}).

## Add a coupon

Use the coupon tool to reference a coupon already available in Hellotext. This keeps the coupon connected to the campaign and its results instead of treating a manually typed code as plain text.

Confirm that the coupon rules, expiration, and eligible products match the selected audience before sending.

## 4. Preview and send a test

Use the preview to check the message in every selected channel. Review:

- The first line and call to action.
- Personalization and fallback values.
- Tracked-link destinations.
- Coupon text and validity.
- WhatsApp attachments, buttons, footer, or location.
- SMS length and the message-part estimate shown by the editor.

Send a test to a phone number before continuing. An SMS test can be delivered directly. A WhatsApp test with new template content can remain scheduled until Meta approves that template.

A test confirms presentation and delivery to the test number. It does not prove that every customer profile in the final audience is eligible.

## 5. Choose when it will be sent

Choose one of these options:

- **Send now:** starts the approval and delivery process immediately.
- **Send later:** selects a future date and time.

Hellotext applies the communication windows required for the destination country and the business's night-hour settings. If the selected time is not allowed, the interface can require another time or move delivery to the next allowed window.

Use **Save & Close** at any step when you want to keep the campaign as a draft and finish it later.

## 6. Review and confirm

Before selecting **Send**, verify:

- The estimated number of targeted customers.
- Included and excluded audiences.
- Delivery channels and sender.
- Message preview for every channel.
- Tracked links, tags, coupon, and WhatsApp content.
- Delivery date and time.
- Estimated Meta cost when WhatsApp applies.

The confirmation screen is the last opportunity to catch a wrong audience or message before the campaign enters approval and delivery.

## Understand campaign review

Campaigns targeting at least 100 customers require editorial review. A WhatsApp campaign can also wait for Meta when its template has not already been approved.

While review is pending, the campaign appears **In review** or **WhatsApp in review**. Once approved, it follows the selected delivery time. If a reviewer or Meta rejects the content, open the campaign, review the feedback, make the requested changes, and submit it again.

Approval time can vary, especially when Meta must review new WhatsApp content. Leave enough time before a scheduled promotion or event.

## After sending

Use the Campaigns tabs to follow the campaign:

- **Draft:** saved but not submitted.
- **Scheduled:** submitted, in review, approved for a future time, or preparing to send.
- **Delivered:** delivery has started and results are available.
- **Archived:** completed campaigns moved out of the active Delivered list.

Replies from customers continue into the Inbox through the corresponding channel. Campaign reports are generated automatically after delivery so you can review delivered messages, engagement, conversion, ROI, and attributed revenue.

Keep reading: [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Preflight checklist

Before the final send, confirm that:

- The goal requires a one-time campaign rather than a playbook or route.
- The audience is focused and has channel-specific consent.
- Exclusions remove internal, test, invalid, or inappropriate customer profiles.
- The sender and fallback behavior are correct.
- The message has one clear next action.
- Links, tags, coupons, media, and buttons work in a test.
- The send time leaves room for editorial or Meta review.
- Someone will monitor replies, delivery issues, and results after launch.

## Related guides

- [Campaigns overview]({% link _campaigns/campaigns-overview.md %})
- [Campaign best practices]({% link _campaigns/campaign-best-practices.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [How Hellotext works]({% link _getting-started/how-hellotext-works.md %})
