Use this guide when a Dashboard card, report metric, breakdown, or attributed sale is missing or does not match another Hellotext view or external system.

A difference is not always a tracking failure. Two views can use different periods, populations, timestamps, currencies, denominators, or attribution rules. Establish what each number measures before changing the integration.

## Define the exact difference

Record both sides of the comparison:

- Hellotext business and report.
- Metric and breakdown selected.
- Start and end dates.
- Business and user timezone.
- Reporting currency.
- Channel, campaign, playbook, route, team, or segment filter.
- Value shown in Hellotext and value expected from the other source.
- One customer, order, conversation, or event that demonstrates the difference.

Avoid reporting only that “revenue is wrong” or “data is missing.” A concrete record lets you determine whether the gap began at collection, identity matching, report eligibility, or attribution.

## 1. Align the period and definition

Confirm that both views measure the same thing.

### Match the date range

The Dashboard overview and Actions table always use the latest 14 days. Detailed reports have their own date selector and can use 7, 14, 30 days, or a custom period.

Using the same dates is necessary, but it is not enough. You must also confirm what event the selected period is based on.

### Understand how each report counts results

Hellotext reports can assign a result to one of three kinds of dates:

- **The date the source activity began:** the period selects messages, playbook triggers, conversations, or requests. Eligible outcomes that happen later remain assigned to the original source date.
- **The date the result happened:** the period selects purchases, reviews, resolutions, or other events completed during that range.
- **The current state:** the section shows what is true at the displayed time, such as current workload, pending follow-ups, or audience membership.

The report or section should explain which date it uses. The most common rules are:

| Report or section | Date used by the selected period |
| --- | --- |
| Dashboard | Revenue uses purchase date, activity uses the date each event occurred, and current-state cards reflect the displayed time. |
| Revenue report | Purchase date. Campaign and playbook rows identify the credited source for purchases completed during the selected period. |
| Campaign performance | Message delivery date. Eligible clicks and purchases recorded later remain assigned to the original delivery. |
| Playbook report | Playbook trigger date. Later messages and attributed purchases remain assigned to the original trigger. |
| Performance, Conversations, and Service Quality | Conversation start date. Later conversion, escalation, resolution, and satisfaction outcomes follow the originating conversation. |
| Channel performance | Message sent date. Later delivery, engagement, and attributed-sales outcomes follow those messages. |
| Demand insights | Date the unfulfilled request began. Later recovery follows the original request. |
| Reviews and feedback | Submitted feedback uses submission date; collection performance uses request-delivery date; pending follow-ups show current state. |
| Workload and capacity | Handled and resolved work uses the date of each action; queue, backlog, and risk sections show current state. |

For example, if a playbook is triggered on April 7 and the customer purchases on April 10, the playbook report counts the result on April 7. The Revenue report counts that same purchase on April 10. Both are correct because they answer different questions.

The date-counting rule does not extend or replace the attribution window. A later purchase is added to the original source date only when it qualifies under Hellotext's attribution rules.

### Match the metric definition

Commonly confused numbers include:

- **Total revenue:** commerce revenue available to Hellotext for the selected period, including attributed and unattributed revenue.
- **Attributed revenue:** eligible revenue credited to Hellotext under its attribution methodology.
- **Conversion rate:** a report-specific numerator divided by its report-specific eligible population.
- **CTR:** tracked clicks divided by delivered messages where that definition applies.
- **Conversations:** conversations started, not messages, unique customers, or the current Inbox queue.
- **Action amount:** monetary value attached to tracked occurrences of an action, not automatically attributed revenue.

Do not compare two percentages until you confirm that they use the same numerator and denominator.

## 2. Follow one record end to end

Choose one missing customer, purchase, conversation, or event and trace it through the measurement path.

### Confirm the customer profile

In **Audience**, verify that:

- the profile exists in the correct business;
- its phone, email, external ID, or connected identity is correct;
- duplicate profiles did not split the activity;
- the expected property, subscription state, list, or segment is present; and
- the activity appears on the expected profile rather than another customer.

When a click lands on one profile and the purchase lands on another, the report may not be able to connect the journey even though both events exist.

### Confirm the source event

Look for the event the metric needs:

- message sent or delivered;
- tracked link click;
- conversation start, assignment, escalation, or resolution;
- product view, cart, or checkout;
- purchase or custom conversion;
- cancellation, refund, or replacement order; or
- the custom action and monetary value expected in the Actions table.

If the event is absent from the customer activity, the problem is upstream of reporting. Check the connected store, channel, capture, Hellotext.js implementation, API request, or custom integration.

### Confirm the event context

An event can exist but still lack the context required by the report. Check the customer identifier, order or product reference, channel, campaign or playbook source, currency, amount, status, and timestamp.

For custom tracking, use the exact action name expected by Hellotext. Small variations can create separate actions and split the results.

## 3. Check report eligibility

After confirming the event, check whether it belongs in the metric you are reviewing.

### Dashboard

- The event must fall inside the fixed 14-day period.
- Attributed revenue needs an active positive attribution record.
- The revenue benchmark also needs total commerce revenue for the period.
- Conversations counts conversation-start activity, not current queue state.
- The Actions table shows actions that have recorded events in the period.

### Campaign reporting

- The eligible message delivery must fall inside the selected campaign period.
- Delivery metrics require a recorded delivery result.
- CTR requires a tracked click and delivered-message denominator.
- Conversion and revenue require an eligible attributed purchase, which can happen later and remain assigned to the original delivery date.

### Playbook and performance reporting

- The playbook, route, or agent must be active and receive eligible traffic.
- The required trigger, interaction, conversion, escalation, or resolution event must be recorded.
- A playbook report selects original trigger dates; a performance report selects conversation start dates. Later eligible outcomes remain attached to that original activity.
- A channel, playbook, AI-versus-human, or team breakdown needs that dimension on the underlying activity.

### Operations reporting

- Service quality depends on conversation lifecycle and resolution data.
- SLA metrics need the relevant response and timing records.
- Workload and capacity depend on assignments, transfers, handling, resolution, teams, and teammates.
- Operational pressure is a current snapshot and is not restricted by the historical period selected elsewhere in the report.

### Demand insights

Demand insights require supported unfulfilled-request signals and enough product, intent, commerce, and value context to calculate the selected metric. A customer question in Inbox does not automatically become an unfulfilled demand signal.

## 4. Check attribution separately

An order can be present in total revenue without being attributed to Hellotext.

For a missing attributed sale, verify:

- Hellotext received the purchase or positive monetary event.
- The purchase is connected to the expected customer and order.
- An eligible campaign, route, playbook, click, delivery, recommendation, or commercial interaction exists.
- The evidence falls inside its attribution window.
- A recognized external source did not take precedence.
- Human checkout ownership or commercial activity did not change the applicable decision.
- A later cancellation, refund, replacement, or stronger source did not revoke or adjust the attribution.

Hellotext selects attribution according to the available evidence and does not credit the full amount independently to every campaign and playbook that touched the customer.

Read [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}) before treating an unattributed order as a missing event.

## Common comparisons that do not match directly

| Comparison | Why it can differ |
| --- | --- |
| Dashboard vs detailed report | The Dashboard uses a fixed 14 days; the report has its own range and metric. |
| Playbook report vs Revenue report | The playbook report assigns later outcomes to the original trigger date; Revenue includes the purchase on its purchase date. |
| Campaign report vs Revenue report | Campaign performance assigns an eligible purchase to the original delivery date; Revenue includes it on its purchase date. |
| Hellotext total revenue vs store revenue | Hellotext can only report the supported orders and updates it received; date, currency, status, duplicate, refund, tax, shipping, or net/gross definitions can also differ. |
| Total revenue vs attributed revenue | Total revenue includes unattributed commerce revenue; attribution requires eligible Hellotext evidence. |
| Actions amount vs Revenue report | An action can carry money without representing canonical order revenue or receiving attribution. |
| Campaign CTR vs conversion rate | CTR measures tracked engagement; conversion measures eligible attributed purchases against its delivery population. |
| Campaign revenue vs playbook revenue | Attribution source precedence selects the eligible credited source rather than duplicating the sale across every touchpoint. |
| Conversations vs Inbox workload | The Dashboard counts starts; the operations report measures assignments, active load, handling, transfers, and resolutions. |
| Current report vs an earlier export | Late events, open attribution, cancellations, refunds, or source corrections can update the live report after the export was generated. |

## Reconcile revenue with an external system

Compare individual orders before comparing totals.

1. Export or identify the same date range in both systems.
2. Use order references and customer identifiers to match records.
3. Confirm which order timestamp determines inclusion.
4. Compare currency and conversion behavior.
5. Check whether totals include taxes, shipping, discounts, cancellations, refunds, test orders, or duplicate/replacement orders.
6. Separate missing total revenue from missing attribution.
7. Use the Revenue export when you need Hellotext's attribution reason and supporting context for credited rows.

Document the agreed comparison definition so the next reconciliation uses the same rules.

## Understand recent and changing results

Recent results may change because:

- attribution windows are still open;
- an order or conversion arrives after the original interaction;
- a channel or commerce integration finishes processing late data;
- an order is cancelled, refunded, or replaced;
- stronger source evidence arrives; or
- corrected identity data connects previously separate activity.

For source-based reports, a recent date can keep increasing while its outcome or attribution window remains open. Use an older period whose windows have closed for final comparisons. For current campaigns or always-on playbooks, treat early numbers as provisional.

## When to contact Support

If the source event exists with the required context but the expected report still does not include it, send Support:

- business ID and report URL;
- metric, breakdown, and exact date range;
- business and user timezone;
- customer profile, order, conversation, campaign, or playbook ID;
- event name and timestamp;
- source integration or API path;
- expected and actual values; and
- screenshots or exports that show both sides of the comparison.

Use one or two representative records rather than a broad total without examples. Do not include passwords, API secrets, or unnecessary customer data.

If the event itself is missing, follow [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) first.

## Related guides

- [Dashboard guide]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Analytics overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
