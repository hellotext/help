Use these practices before submitting a campaign. They help you make the audience, message, channel, and timing work together while leaving enough room for testing and approval.

For the complete product workflow, read [Create a campaign]({% link _campaigns/creating-a-campaign.md %}).

## Start with one outcome

Define what the campaign should accomplish before selecting an audience or writing the message. A useful goal is specific enough to measure, such as:

- Announce a product launch or restock.
- Drive visits to a promotion or collection.
- Generate purchases from a selected audience.
- Communicate a time-sensitive update.
- Invite customers to an event or other planned moment.

Use a campaign when the business chooses the message, audience, and delivery time for a one-time send. Use a playbook when Hellotext should keep responding to customer signals and decide when an action is relevant.

Give each campaign one main call to action. Competing links or requests make both the message and its report harder to interpret.

## Focus the audience

Start with the smallest audience that matches the goal. You can include or exclude lists, segments, and audiences from previous scheduled or delivered campaigns.

- Use a **list** for a fixed group of customer profiles.
- Use a **segment** when membership should update from profile data or behavior.
- Use **exclusions** to remove groups that should not receive this particular message.

Hellotext removes overlaps and calculates the estimated target from the selected channels, subscription state, usable destinations, inclusions, and exclusions. Compare the **Estimated target** with your expectations before continuing; it can be smaller than the total membership of the selected groups and does not by itself confirm permission to send.

Use the audience limit when you intentionally want to send to a maximum number of eligible customers. A limit controls campaign size but does not make an ineligible profile contactable.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot ht-editorial-visual--campaign-audience-limit" aria-label="Audience limit options">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/campaign-best-practices/audience-limit-en-mobile.png" width="450" height="96" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/campaign-best-practices/audience-limit-en.png" width="1152" height="626" loading="lazy" decoding="async" alt="Audience limit options, including the Limit to control and its customer-count field." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Set the limit from the estimated target settings; the image shows an unsent fictional draft.</figcaption>
</figure>

Keep reading: [Lists vs. segments]({% link _audience/lists-and-segments.md %}) and [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}).

## Choose the delivery option intentionally

Select the option that matches the audience and content:

- **WhatsApp and SMS** tries WhatsApp first and uses SMS when WhatsApp is not available for an eligible customer.
- **WhatsApp only** keeps delivery on WhatsApp and can support richer campaign content.
- **SMS only** keeps the campaign concise and delivers it through SMS.
- **Email only** sends only through Email and requires channel access and a verified, active sender.

The creator shows these options, but sending depends on channel access and a ready sender for the selected option. In this demonstration account, SMS can be selected while WhatsApp appears unavailable.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Delivery channel selection for a demonstration campaign">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 711px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/campaign-best-practices/channel-choice-en-mobile.png" width="716" height="1130" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/campaign-best-practices/channel-choice-en.png" width="1350" height="1100" loading="lazy" decoding="async" alt="On How it will be sent, SMS only is selected and WhatsApp and SMS is unavailable in a fictional account." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with a fictional account; channel availability depends on the business.</figcaption>
</figure>

Confirm the sender, estimated target, and preview for every selected channel instead of assuming that the same customer profiles are eligible everywhere.

## Write for the selected channels

Keep the message focused and make the next action obvious. In the editor:

- Put the main value near the beginning.
- Use the tracked-link tool for destinations you want to measure.
- Add fallback values to personalization tags, such as `{name|customer}`.
- Reference an available coupon with the coupon tool instead of typing the code as ordinary text.
- Review attachments, buttons, footer, location, and other WhatsApp content when used.
- Check the SMS length and message-part estimate shown by the editor.

When WhatsApp is selected, new or changed content may need Meta approval as a template. Avoid making unnecessary last-minute changes after testing because changed content can require another review.

Keep reading: [Message editor overview]({% link _numbers/message-editor-overview.md %}).

## Test what the customer will receive

Send a test to a number you control for SMS or WhatsApp, or to your own address for an Email-only campaign. Review every selected channel and confirm:

- The first line and call to action are clear.
- Personalization and fallback values read naturally.
- Every tracked link opens the intended destination.
- Coupon rules and expiration are correct.
- Media, buttons, footer, and location appear as expected.
- The SMS message-part estimate is acceptable.

A WhatsApp test with new content can wait for Meta approval. A test lets you review the message at the chosen number or address; it does not prove that every profile in the final audience is eligible.

## Leave time for review and delivery windows

Campaigns can be sent now or scheduled for a future date and time. Hellotext applies communication windows for the destination country and the business's night-hour settings.

Campaigns targeting at least 100 customers can require editorial review; a campaign whose WhatsApp templates are already approved can skip that step. New WhatsApp content can also require Meta approval. Schedule important launches with enough time for the applicable reviews instead of submitting immediately before the desired delivery time.

## Coordinate campaigns with ongoing playbooks

Campaigns and playbooks can be active at the same time. Before a major campaign, review other scheduled campaigns and relevant active playbooks so customers do not receive messages that repeat or contradict each other.

The campaign should add a clear planned moment to the customer experience. It should not duplicate an ongoing playbook that already decides when the same message is relevant.

## Monitor delivery and replies

After submitting, use the Campaigns tabs to follow review, scheduling, and delivery. If an active campaign needs to stop temporarily, pause it and resume only after confirming that the audience, content, and timing are still appropriate.

Customer replies arrive in the Inbox through the corresponding channel. Make sure someone is ready to handle questions or purchase intent created by the campaign.

## Learn from the automatic report

Hellotext generates the campaign report automatically after delivery. Review the metrics that match the original goal:

- Delivery and tracked clicks.
- Conversion and attributed purchases.
- ROI, attributed revenue, and revenue per message.
- Customer activity and performance by channel when available.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campaign report delivery funnel">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-en-mobile.png" width="740" height="860" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-en.png" width="1560" height="860" loading="lazy" decoding="async" alt="Demonstration funnel with Sent, Delivered, Engaged, and Conversion stages for checking where response drops off." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">This reuses an approved Campaign reporting screenshot with fictional data; no campaign was sent for this guide.</figcaption>
</figure>

Do not optimize one metric in isolation. A high CTR with weak conversion can mean that the message created interest but the offer, destination, audience, or purchase experience did not complete the job.

Keep reading: [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Final checklist

Before selecting **Send**, confirm that:

- The goal belongs in a one-time campaign rather than a playbook or route.
- The audience and exclusions match that goal.
- Customer profiles have consent for the selected channels.
- The message has one clear call to action.
- Links, personalization, coupons, and rich content pass a test.
- The delivery time leaves enough room for editorial or Meta review.
- Other scheduled campaigns and active playbooks will not create a confusing experience.
- The team is ready to monitor delivery, replies, and the report.

## Related guides

- [Campaigns overview]({% link _campaigns/campaigns-overview.md %})
- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
