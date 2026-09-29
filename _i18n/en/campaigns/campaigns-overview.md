Campaigns let you send a planned, one-time message to a selected audience by SMS, WhatsApp with optional SMS fallback, or Email only when your business has access to that channel. You choose the audience, content, channels, and delivery time. Hellotext evaluates which customer profiles are eligible, handles approval and delivery, and creates the report automatically.

Use campaigns for promotions, product launches, announcements, restocks, event reminders, and other moments when you want to decide what will be sent and when.

## When to use a campaign

A campaign is a good fit when:

- The message has a defined launch date or delivery time.
- You want to include or exclude specific lists, segments, or previous campaign audiences.
- The same central message should reach many eligible customers.
- You want to preview, test, schedule, and review the send before it starts.
- You need campaign-level delivery, engagement, conversion, ROI, and attributed-revenue reporting.

Use [Create a campaign]({% link _campaigns/creating-a-campaign.md %}) for the complete workflow.

## Campaigns, playbooks, and routes

These terms describe different parts of Hellotext:

- A **campaign** is the one-time initiative you create. It contains the audience, message, channels, and delivery time.
- A **playbook** works toward a business mission using signals and decision logic. It can decide when a relevant customer should receive a message instead of sending to a manually selected audience at one fixed time.
- A **route** is a playbook with a predictable sequence of steps such as messages, waits, conditions, AI agents, and assignments.

Campaigns do not replace playbooks or routes. Use a campaign for a coordinated one-time launch; use a playbook or route for ongoing, signal-driven behavior.

Keep reading: [How Hellotext works]({% link _getting-started/how-hellotext-works.md %}).

## How a campaign moves through Hellotext

1. **Draft:** choose the delivery channels, audience, content, and timing. You can save and return before submitting it.
2. **Review:** depending on the target and templates, a campaign may require editorial review. New or changed WhatsApp content can also require Meta approval.
3. **Scheduled or sending:** an approved campaign waits for its selected time or begins delivery.
4. **Delivered:** results become available in the automatically generated report. An active send can be paused and resumed when needed.
5. **Archived:** move a completed campaign out of the active Delivered list without deleting its history.

The Campaigns page organizes this lifecycle into **Scheduled**, **Delivered**, **Draft**, and **Archived** tabs. A campaign can appear in Scheduled while it is still under review or preparing to send.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot ht-editorial-visual--campaign-tabs" aria-label="Campaign lifecycle tabs">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/campaigns-overview/campaign-tabs-en-mobile.png" width="410" height="130" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/campaigns-overview/campaign-tabs-en.png" width="1280" height="150" loading="lazy" decoding="async" alt="Scheduled, Delivered, Draft, and Archived campaign tabs, with Draft selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictional account interface. The mobile crop focuses on Delivered and Draft; the other tabs are named in the text.</figcaption>
</figure>

In **Delivered**, the table summarizes delivered messages, conversion, ROI, and attributed revenue for each campaign. A dash means that a metric is unavailable for that campaign.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot ht-editorial-visual--campaign-index" aria-label="Delivered campaign summary">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 600px; margin: 0 auto 12px;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/campaigns-overview/campaign-index-list-en-mobile.png" width="660" height="630" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/campaigns-overview/campaign-index-list-en.png" width="1200" height="630" loading="lazy" decoding="async" alt="Two fictional campaigns in the Delivered tab, with their delivery states." />
      </picture>
    </div>
    <div class="ht-editorial-visual__image-frame ht-editorial-visual__image-frame--mobile-only" style="max-width: 365px; margin: 0 auto 12px;">
      <img class="ht-editorial-visual__image" src="/images/campaigns/campaigns-overview/campaign-index-delivery-en-mobile.png" width="730" height="630" loading="lazy" decoding="async" alt="Delivered messages and conversion for the same two fictional campaigns in the mobile table." />
    </div>
    <div class="ht-editorial-visual__image-frame" style="max-width: 570px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/campaigns-overview/campaign-index-results-en-mobile.png" width="680" height="630" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/campaigns-overview/campaign-index-results-en.png" width="1140" height="630" loading="lazy" decoding="async" alt="Results columns for the same two fictional campaigns." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Crops of the same rows in a fictional account. On mobile, the table scrolls horizontally: three crops show names, delivery and conversion, then ROI and attributed revenue.</figcaption>
</figure>

## Prepare the essentials

Before creating a campaign, confirm:

- The channels you plan to use are available to your business: SMS needs an approved sender, WhatsApp a ready number, and Email channel access plus a verified, active sender.
- Customer profiles have consent for the selected channel.
- The audience and any exclusions match the goal.
- The message has one clear next action.
- Links, personalization, coupons, media, and buttons are ready.
- The delivery time leaves enough room for any required editorial or Meta review.

Use lists for fixed groups of customer profiles. Use segments when membership should update from customer data or behavior. Hellotext deduplicates overlaps and estimates the reachable target according to audience rules, subscription state, usable destinations, and selected channels. That estimate does not by itself confirm permission to send.

Keep reading: [Lists vs. segments]({% link _audience/lists-and-segments.md %}) and [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}).

## What happens to replies

Customers reply through the channel that delivered the message. Their replies arrive in the Inbox, where the team can continue the conversation and manage ownership.

A campaign is the outbound launch; the Inbox is where the resulting one-to-one conversations continue.

## Measure the result automatically

Hellotext creates the campaign report after delivery. Use it to review delivery, tracked clicks, conversion, ROI, attributed purchases and revenue, customer activity, and performance by channel when available.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campaign report delivery funnel">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-en-mobile.png" width="740" height="860" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-en.png" width="1560" height="860" loading="lazy" decoding="async" alt="Fictional campaign report funnel showing Sent, Delivered, Engagement, and Conversion stages." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Approved Campaign reporting screenshot with fictional data; no campaign was sent for this guide.</figcaption>
</figure>

Keep reading: [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Related guides

- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Campaign best practices]({% link _campaigns/campaign-best-practices.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [How Hellotext works: playbooks, campaigns, and Inbox]({% link _getting-started/how-hellotext-works.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})
