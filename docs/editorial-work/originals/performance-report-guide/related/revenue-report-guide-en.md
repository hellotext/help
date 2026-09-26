Use the Revenue report to understand how much commerce revenue Hellotext received, which purchases were attributed, and whether AI, the team, a Campaign, or a Playbook received credit.

Open it from the **Revenue report** card on the Dashboard. Choose a period that matches the business question you want to answer before comparing totals or sources.

## How this report counts results

The selected period is based on **purchase date**. The summary metrics, timeline, revenue breakdowns, and source tables include purchases completed during that period.

Campaign and Playbook performance reports use a different date because they measure the activity that originated the result. For example:

**Campaign message delivered June 30 → Purchase completed July 5 → Counted on July 5 in Revenue and June 30 in Campaign performance.**

Both reports can be correct. Revenue answers what was purchased during the period; the source report answers what later results came from the messages, triggers, or conversations that began during its period.

A late order correction, cancellation, refund, replacement, or attribution update can change the value assigned to the original purchase date.

## Read the summary metrics

The report's main metrics separate three kinds of revenue:

- **Revenue attributed to AI:** revenue the attribution engine assigned to AI based on eligible commercial evidence.
- **Revenue classified as team-managed:** revenue classified as team-managed by the attribution engine, together with eligible legacy teammate-managed revenue that does not have an engine verdict.
- **Total revenue:** all supported revenue Hellotext received from eCommerce, marketplace, and retail activity during the selected period, including attributed and unattributed revenue.

Attributed revenue is a subset of total revenue. A support reply or any other team interaction does not automatically make a sale team-managed; Hellotext evaluates the applicable source path and commercial evidence.

Select a metric to update its timeline. Compare the chart only after confirming that the selected metric, period, currency, and breakdown are the same.

## Attributed revenue is not every influenced sale

Hellotext can interact with a customer without receiving attribution for the later purchase.

A purchase receives attribution only when Hellotext has eligible customer, order, source, and timing evidence and no stronger recognized source takes precedence. A purchase outside the applicable window, connected to another profile, or carrying a recognized external source can remain in total revenue without appearing in attributed revenue.

The page title may describe Hellotext's influence on sales, but **influenced revenue is not a separate catch-all metric** in this report. Use the attributed metrics for revenue that qualified under Hellotext's methodology. Attribution also does not prove that the entire amount was incremental growth.

Read [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}) for evidence, precedence, windows, team participation, and order adjustments.

## Break down the timeline

Use the breakdown control to understand where a selected metric came from. Available options depend on the metric and available data, and can include:

- channel, Campaign, or Playbook;
- segment, store, or region;
- product category, product, or variant;
- subscription state, payment method, or commerce context;
- intent, AI versus team, attribution reason, team, teammate, or AI agent.

Choose only the dimensions needed to answer the question. A small row can look unusually strong when the underlying purchase count is low, so review its volume before making a decision.

## Read the attributed-revenue widgets

The widgets below the timeline explain the composition of attributed revenue.

- **Campaigns vs Playbooks** compares the attributed amount credited to one-time Campaigns and always-on Playbooks.
- **Commerce context** separates supported eCommerce, marketplace, and retail revenue.
- **Commerce channel** shows which connected sales channel recorded the attributed purchases.

These widgets distribute attributed revenue; they do not replace total revenue or add the same purchase to every source that touched the customer.

## Review source tables

The Playbooks, Campaigns, and Channels sections group the attributed purchases included in the selected period by their credited source.

Use attributed orders, average attributed order value, and attributed revenue to compare the value assigned to each source. A row with no revenue does not necessarily mean that its messages failed to send: it can mean that no purchase completed during the selected period qualified for that source.

For source conversion, ROI, revenue per message, or later outcomes assigned back to an original message or trigger date, open the corresponding Campaign or Playbook performance report.

## Export and inspect attributed purchases

Use **Export** when you need order-level reconciliation or the evidence behind attributed rows. The export can include:

- order, customer, and conversation references;
- credited Campaign, Playbook, and channel;
- attributed amount and purchase timestamp;
- attribution type and reason;
- AI and human commercial evidence, when applicable;
- conversation state, commercial driver, and a plain-language explanation; and
- a link to relevant event or conversation context.

The export is prepared in the background. Hellotext downloads it when ready and can also email a completion notice.

## When a number looks wrong

Before contacting Support:

1. Confirm that both systems use the purchase date, timezone, currency, and order-status rules you expect.
2. Compare individual order references before comparing totals.
3. Separate missing total revenue from missing attribution.
4. Confirm that the purchase and source activity belong to the same customer profile.
5. Check cancellations, refunds, replacement orders, and recognized external sources.
6. Generate an export to inspect the credited source and explanation.

For a complete investigation, follow [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Related guides

- [Dashboard guide]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
