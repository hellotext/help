Campaign reports show delivery, engagement, attributed purchases, and attributed revenue for a delivered campaign. Use them to compare messages and channels, inspect customer activity, and understand which orders were linked to the campaign under Hellotext's attribution methodology.

To open a report, go to **Campaigns** and select a delivered campaign. Reports are available after a campaign has been delivered.

## Select the report period

The report opens with the **First 14 days** preset. You can change the date range to inspect a different period.

The report period controls which activity appears in the report. It does not extend the attribution window used to decide whether an order belongs to the campaign.

## Read the main metrics

* **Revenue:** active revenue attributed to the campaign during the selected report period.
* **ROI:** attributed campaign revenue divided by the estimated cost of delivering its messages.
* **Conversion:** attributed purchase count divided by delivered messages.
* **Revenue/msg:** attributed campaign revenue divided by delivered messages.
* **CTR:** tracked clicks divided by delivered messages.

Conversion is not the percentage of unique clicks that purchased. It uses attributed purchases and delivered messages.

## Compare delivery and broadcasts

The delivery funnel shows how messages progressed through delivery and engagement. When a campaign has more than one broadcast or channel, the broadcast table helps you compare delivered messages, CTR, ROI, conversion, revenue per message, and attributed revenue.

## How clicks and deliveries support attribution

A tracked short-link click is active campaign evidence and normally opens a seven-day attribution window from the eligible click. A click is not the only campaign evidence: an eligible campaign delivery can provide passive evidence within the default 24-hour window.

Hellotext evaluates available source evidence and its precedence before assigning the order. A recognized external marketing source can take precedence over Hellotext evidence. Read [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %}) for the complete methodology.

## Explore revenue and activity

Depending on the campaign and available data, the report can also include:

* Time to conversion
* Revenue by channel
* Revenue by segment
* Delivery and engagement events
* Purchases and other tracked customer events

An event appearing in campaign activity does not automatically mean that it created attributed revenue. The event still needs eligible customer, order, source, and timing evidence.

Supported commerce integrations can send purchase data automatically. For custom storefronts and events, use [Hellotext.js or the API]({% link _developers/tracking-events.md %}).

## Related guides

* [Tracking links in campaigns and journeys]({% link _developers/tracking-on-campaigns-and-journeys.md %})
* [Using tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
* [Analytics overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
