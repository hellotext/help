Campaign reports are generated automatically after delivery. They bring together message delivery, tracked engagement, attributed purchases, and attributed revenue so you can understand both what happened and what to improve next.

To open one, go to **Campaigns**, open the delivered campaigns view, and select a campaign.

## Choose the reporting period

The report opens with **First 14 days** selected. You can switch to the first 7 or 30 days, or choose a custom range.

The selected period updates the metrics, chart, funnel, message results, revenue breakdowns, and recent activity together. It filters when those results were recorded; it does not change the attribution window used to decide whether a purchase belongs to the campaign.

A campaign message can remain listed even when its results fall outside the selected range. In that case, its row can show zero values until you choose a period that includes its activity.

## Read the campaign summary

The four summary cards answer different questions:

* **Attributed revenue:** how much revenue came from purchases attributed to this campaign during the selected period.
* **Average ROI:** attributed revenue divided by the estimated cost of delivering the campaign messages.
* **Conversion:** attributed purchases divided by delivered messages.
* **Revenue/message:** attributed revenue divided by delivered messages.

Select a card to update the chart and see how that metric changed over time. Conversion is based on attributed purchases and delivered messages; it is not the percentage of people who clicked and then purchased.

## Follow the delivery funnel

The **Campaign delivery funnel** moves through four stages:

* **Sent:** campaign messages dispatched during the selected period.
* **Delivered:** messages that reached customers.
* **Engaged:** delivered messages that produced at least one tracked link click during the period. This is a count of engaged messages, not the total number of clicks.
* **Conversion:** purchases attributed to the campaign. Its percentage uses attributed purchases divided by delivered messages, matching the summary conversion metric.

Use the funnel to find where performance changes. A large difference between sent and delivered points to delivery or contactability. Strong delivery with little engagement points more toward the audience, message, or call to action.

## Compare campaign messages

The **Messages** section shows the date and preview of each campaign message, followed by:

* **Delivered:** messages successfully delivered.
* **CTR:** tracked clicks divided by delivered messages.
* **Average ROI:** attributed revenue divided by estimated delivery cost.
* **Conversion:** attributed purchases divided by delivered messages.
* **Revenue/message:** attributed revenue divided by delivered messages.
* **Revenue:** revenue attributed to that message.

This lets you compare the actual messages without mixing click performance with purchase performance. A message can have a healthy CTR but a weaker conversion rate if customers click without completing a purchase.

## Understand time to conversion

**Time to conversion** shows how long it took attributed sales to happen after the campaign launched, using ranges such as the same day, 1–3 days, 4–7 days, and later periods.

The report period filters when the attributed sale was recorded. A sale can therefore appear days after message delivery while still belonging to the campaign under the applicable attribution rules.

## Compare revenue by channel and segment

**Attributed revenue by channel** shows how attributed revenue is distributed across the available messaging channels. Use it to see which channel contributed more revenue, not just which one delivered more messages.

**Attributed revenue by segment** shows the distribution across customer segments when segment data is available. Treat small samples carefully before applying the result to a future audience.

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

First confirm that the selected period includes the campaign activity. Then verify that tracked links and purchase events are available. Supported commerce integrations can send purchase data automatically; custom storefronts can use [Hellotext.js or the API]({% link _developers/tracking-events.md %}).

If activity is still missing, follow [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

* [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
* [Campaign best practices]({% link _campaigns/campaign-best-practices.md %})
* [Campaigns overview]({% link _campaigns/campaigns-overview.md %})
* [Tracking links in campaigns and journeys]({% link _developers/tracking-on-campaigns-and-journeys.md %})
* [Using tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
* [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %})
* [Analytics overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
