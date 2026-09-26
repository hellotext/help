Campaign reports are generated automatically after delivery. They bring together message delivery, tracked link clicks, attributed purchases, and attributed revenue so you can understand both what happened and what to improve next.

To open one, go to **Campaigns → Delivered** and select a campaign.

## Choose the reporting period

The report opens with **First 14 days** selected. You can switch to the first 7 or 30 days, or choose a custom range.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campaign reporting period and summary">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1000px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-mobile.png" width="746" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en.png" width="2460" height="580" loading="lazy" decoding="async" alt="Demo report with 14 days selected and the Attributed revenue, Average ROI, Conversion, and Revenue/message summary metrics. On mobile, the first card and the arrow for the others are visible." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface with demonstration data; on mobile, use the arrow to move through the summary cards.</figcaption>
</figure>

The range filters results by when each event occurred. A send or delivery counts on its day; a click counts on the click date; and an attributed purchase counts on the purchase date. The summary cards and chart use those dates. The funnel's **Engaged** stage requires both a delivery and a tracked link click within the same range. In the message list, the range affects deliveries, clicks, conversions, and revenue; per-message ROI compares revenue from the period with that message's estimated delivery cost. Revenue breakdowns and **Time to conversion** include attributed purchases made within the range.

For example, if a message is delivered April 7 and an attributed purchase happens April 10, select a period that includes April 10 to see that revenue. The delivery still counts on April 7. If the range includes the purchase but no deliveries, the conversion rate can show zero because there are no delivered messages in its denominator.

Changing the reporting period does not change the attribution window used to decide whether a purchase belongs to the campaign.

A campaign message can remain listed even when its results fall outside the selected range. In that case, its row can show zero values until you choose a period that includes its activity.

## Read the campaign summary

The four summary cards answer different questions:

* **Attributed revenue:** revenue from eligible purchases attributed to the campaign and recorded during the selected period.
* **Average ROI:** attributed revenue divided by the estimated cost of delivering the campaign messages.
* **Conversion:** attributed purchases divided by delivered messages.
* **Revenue/message:** attributed revenue divided by delivered messages.

Select a card to update the chart and see how that metric changed over time. Conversion is based on attributed purchases and delivered messages; it is not the percentage of people who clicked and then purchased.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selected card and campaign metric over time">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 740px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/selected-kpi-chart-en-mobile.png" width="740" height="1250" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/selected-kpi-chart-en.png" width="1560" height="1180" loading="lazy" decoding="async" alt="A selected summary card and its chart showing how that campaign metric changes across the chosen reporting period." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Chart from the real English interface with demonstration data.</figcaption>
</figure>

## Follow the delivery funnel

The **Campaign delivery funnel** moves through four stages:

* **Sent:** campaign messages dispatched during the selected period.
* **Delivered:** messages that reached customers.
* **Engaged:** campaign messages whose delivery and at least one tracked link click occurred within the selected period. Each message counts once, even if it has multiple clicks.
* **Conversion:** purchases attributed to the campaign that happened during the period. Its percentage uses attributed purchases divided by delivered messages, matching the summary conversion metric.

The funnel counts sends, deliveries, and conversions on their event dates, while **Engaged** requires both a delivery and a click within the selected period. In a short range, its stages may not represent the same cohort of messages. Use it to spot possible problems: a large gap between sent and delivered can signal delivery or contactability issues; strong delivery with little engagement calls for reviewing the audience, message, and call to action.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campaign delivery funnel stages">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 740px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-en-mobile.png" width="740" height="860" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-en.png" width="1560" height="860" loading="lazy" decoding="async" alt="Delivery funnel with Sent, Delivered, Engaged, and Conversion stages and their percentages in a demonstration report." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Funnel from the real English interface with demonstration data.</figcaption>
</figure>

## Compare campaign messages

The **Messages** section shows the date and preview of each campaign message, followed by:

* **Delivered:** messages successfully delivered.
* **CTR:** tracked clicks divided by delivered messages.
* **Average ROI:** attributed revenue from the period divided by that message's estimated delivery cost.
* **Conversion:** attributed purchases divided by delivered messages.
* **Revenue/message:** attributed revenue divided by delivered messages.
* **Revenue:** revenue attributed to that message.

This lets you compare the actual messages without mixing click performance with purchase performance. A message can have a healthy CTR but a weaker conversion rate if customers click without completing a purchase.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campaign message metrics">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 600px; margin: 0 auto;">
      <picture style="width: calc(100% - 10px); display: block; margin: 0 auto;">
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/message-comparison-en-mobile.png" width="628" height="890" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/message-comparison-en.png" width="1200" height="1060" loading="lazy" decoding="async" alt="A demonstration message row with its preview and delivery, CTR, ROI, conversion, and revenue metrics; the mobile crop focuses on the metrics." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Demonstration message row in the real interface; the mobile image focuses on its metrics.</figcaption>
</figure>

## Understand time to conversion

**Time to conversion** groups attributed sales made during the selected period by how long they took after the campaign started, using ranges such as the same day, 1–3 days, 4–7 days, and later periods.

A sale can happen days after delivery and appear if its purchase date falls within the selected period and it belongs to the campaign under the applicable attribution rules.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Time to conversion distribution">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 610px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/time-to-conversion-en-mobile.png" width="740" height="800" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/time-to-conversion-en.png" width="1220" height="780" loading="lazy" decoding="async" alt="Time to conversion chart distributing attributed purchases across the same day, following days, and later periods." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Distribution from the real English interface with demonstration data.</figcaption>
</figure>

## Compare revenue by channel and segment

**Attributed revenue by channel** shows how attributed revenue is distributed across the available messaging channels. Use it to see which channel contributed more revenue, not just which one delivered more messages.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Attributed revenue by channel">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 710px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-channel-en-mobile.png" width="740" height="720" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-channel-en.png" width="1420" height="650" loading="lazy" decoding="async" alt="Comparison of revenue attributed to WhatsApp and SMS in a campaign report with demonstration data." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Channel breakdown from the real English interface with demonstration data.</figcaption>
</figure>

**Attributed revenue by segment** shows the distribution across customer segments when segment data is available. A customer can belong to multiple segments, so their percentages can overlap and need not add up to 100%. Treat small samples carefully before applying the result to a future audience.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Attributed revenue by segment">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 740px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-segment-en-mobile.png" width="740" height="560" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-segment-en.png" width="1572" height="520" loading="lazy" decoding="async" alt="Breakdown of attributed revenue across demonstration segments whose percentages may overlap." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Segment breakdown from the real English interface with demonstration data.</figcaption>
</figure>

## Review recent activity

**Recent activity** lists tracked customer events associated with the campaign during the selected period. You can search for a customer or activity and open an event to inspect more detail.

An event appearing here does not automatically mean it generated attributed revenue. The purchase still needs eligible customer, order, source, and timing evidence.

## Separate campaign activity from attribution

A tracked short-link click is active campaign evidence and normally opens a seven-day attribution window from the eligible click. A click is not the only possible evidence: an eligible campaign delivery can provide passive evidence within the default 24-hour window.

Hellotext evaluates the available evidence and its precedence before assigning a purchase. A recognized external marketing source can take precedence over Hellotext evidence. Read [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %}) for the complete methodology.

## Turn the report into a decision

* **Sent is much higher than delivered:** review consent, reachable customer profiles, channel availability, and delivery problems.
* **Delivery is healthy but CTR is low:** review audience relevance, message clarity, and the call to action.
* **CTR is healthy but conversion is low:** review the destination, product availability, offer, and checkout experience.
* **Revenue is present but ROI or revenue/message is weak:** compare delivery cost, channel mix, and audience quality.
* **One channel or segment contributes more revenue:** use it as a signal for the next campaign, while accounting for audience size and message volume.
* **Conversions arrive over several days:** wait long enough before treating the first day's result as final.

## When results are missing or unexpected

First confirm that the selected period includes the dates of the results you expect to see: deliveries, clicks, or attributed purchases. To interpret CTR and conversion, also include the delivery dates of messages in the denominator; a range containing only later clicks or purchases can show those rates as zero. In the funnel, **Engaged** requires both a delivery and a tracked link click within the selected period. Then verify that tracked links and purchase events are available. Supported commerce integrations can send purchase data automatically; custom storefronts can use [Hellotext.js or the API]({% link _developers/tracking-events.md %}).

If activity is still missing, follow [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

* [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
* [Campaign best practices]({% link _campaigns/campaign-best-practices.md %})
* [Campaigns overview]({% link _campaigns/campaigns-overview.md %})
* [Tracking links in campaigns and journeys]({% link _developers/tracking-on-campaigns-and-journeys.md %})
* [Using tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
* [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %})
* [Analytics overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
