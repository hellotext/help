Use this guide after a playbook, AI agent, or journey route has been live long enough to collect real customer activity.

Playbook reporting is not one single number. Review revenue, performance, attribution, and operational signals together so you can tell whether the playbook is creating value, creating support load, or missing the signals it needs.

## Where to start

Start from the reports that match the question you are trying to answer.

Use the [Revenue report guide]({% link _analytics-reporting-attribution/revenue-report-guide.md %}) when you want to understand attributed sales, the revenue split between campaigns and playbooks, and which playbooks or routes received attributed revenue.

Use the [Performance report guide]({% link _analytics-reporting-attribution/performance-report-guide.md %}) to interpret the overall conversion and escalation rates and time to conversion. Its playbook, channel, and campaign breakdowns show counts, not per-category rates or average times.

Use the **Inbox** and conversation history when you need to understand why a playbook escalated, what the customer asked, and whether the handoff gave the team enough context.

Use a playbook-specific report when one is available for that type of playbook and it collects its own outcome, such as product reviews from [Review Builder]({% link _journeys/review-builder-playbook.md %}), loyalty scores from [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}), or satisfaction responses from [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}).

When you review feedback playbooks together, keep their outcomes separate. Review Builder explains product-level feedback, CSAT Pulse explains whether a resolved conversation worked, and NPS Pulse explains broader relationship loyalty after a delivery experience.

Before comparing results, choose the right date range and confirm that the playbook had enough traffic to learn from.

## Understand how dates are counted

The same purchase can appear on different dates across reports because their metrics do not always use the same date. Check the specific measure before comparing periods:

- A **playbook-specific report**, when one exists, can combine triggers, sends, deliveries, or clicks on their event dates with attributed revenue or conversions grouped by the credited source-message date. A products table may also use view and purchase dates. Do not assign every value to the trigger day.
- The **Playbooks overview** records sends and deliveries on their event dates. Some eligible sales are grouped by the credited source-message date, which may precede the purchase.
- The **Revenue report** uses purchase date. It shows purchases completed during the selected period and identifies the playbook, campaign, or other source that received credit.
- The **Performance report** groups interactions by start date for its main metrics. A conversion or escalation recorded later follows that interaction, even if it has no associated conversation.

For example: **A playbook message was delivered April 8 → A purchase occurred April 10.** If the purchase is eligible and credited to that message, a source-message revenue measure can show it on April 8, while **Revenue** counts it on April 10. The playbook may have been triggered on a different day from both.

Recent figures grouped by source message can increase while outcome and attribution windows remain open. Read [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}) for eligibility and timing rules.

## Review revenue from playbooks

In the Revenue report, look for:

- **Revenue attributed to AI**, which the engine assigns to AI based on eligible commercial evidence that may include campaigns, routes, or playbooks.
- **Revenue classified as team-managed**, which the engine classifies that way, together with eligible legacy teammate-managed records.
- **Total revenue**, all commerce revenue reported for the period, including attributed and unattributed revenue.
- **Playbook breakdowns**, to compare workflows by attributed revenue.
- **Campaigns vs Playbooks**, to compare attributed sales connected to one-time sends and always-on workflows.
- **Playbooks section**, to compare attributed orders, average attributed order value, and attributed revenue by workflow. Open a playbook-specific report, if available, for other metrics.

Use revenue reporting to answer questions like:

- Which playbook or route has the most attributed revenue?
- Which playbook, route, or campaign received credit for each attributed sale?
- Which attributed revenue did the engine classify as AI or team-managed?
- Are certain channels, audiences, or workflows outperforming others?
- Does a playbook need better product data, timing, offer logic, or handoff rules?

If a playbook has strong attributed revenue and, separately, many explicit AI escalations, it may still be valuable. Review representative interactions before deciding whether the handoffs are appropriate and reach the right person or team. **Revenue classified as team-managed** alone does not show that an escalation occurred.

## Review performance and handoffs

Use the Performance report to investigate interactions associated with a playbook without confusing its overall metrics with that playbook's own rate. The headline rates use all interactions started in the period; the playbook breakdown shows outcome counts, not a per-playbook denominator.

Check:

- **Conversion rate**, the share of started interactions with a recorded conversion, which may be an attributed purchase or a manually logged goal.
- **Time to conversion**, the visible average from start to conversion only for converted interactions without an explicit AI escalation; it is not each playbook's average time.
- **Escalation rate**, the share of started interactions with an explicit AI takeover request. A teammate's participation alone does not count.
- **Playbook breakdown**, a count of converted or escalated interactions associated with each workflow. To calculate a separate rate, you also need the total interactions started in that category.
- **AI vs human breakdown**, an option for **Conversion rate** and **Time to conversion** that classifies by association with a campaign or automation workflow and, otherwise, a teammate. It neither splits interactions by escalation nor matches the attributed-revenue classification.

A high overall escalation rate is not always bad. Review actual examples before concluding that a playbook is failing: a takeover may be appropriate for sensitive or unresolved cases. If the same issue repeatedly escalates because knowledge, context, or next steps are missing, adjust the workflow and measure again.

## Use attribution evidence

Revenue reports and exports help you explain why Hellotext attributed a sale.

When reviewing attribution, look for:

- The campaign, route, or playbook connected to the sale.
- The channel and source that influenced the customer.
- Whether the report classified the attributed purchase as AI or team-managed and, where commercial-driver evaluation applies, how team participation affected that decision.
- The attribution reason and supporting evidence.
- Whether another commercial touchpoint happened before purchase.

Use [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}) when you need to understand source precedence, evidence selection, attribution windows, cancellations, order changes, or team participation.

## Compare playbooks carefully

Compare playbooks only when the context is similar enough.

Before making a decision, check:

- The same date range and the date-counting rule used by each report.
- Similar audience size and traffic.
- Comparable channel mix.
- Whether the playbook was fully enabled for the whole period.
- Whether the playbook had access to the signals, product data, and policies it needed.
- Whether a campaign, discount, holiday, or store event changed the result.

Avoid judging a new AI playbook against a mature route too quickly. Early results often reveal missing knowledge, weak prompts, or unclear handoff rules before they reveal the playbook's long-term performance.

## Troubleshoot weak or confusing results

Use the pattern you see to decide what to inspect next.

| If you see... | Check... |
| --- | --- |
| Little or no activity | Triggers, signals, audience eligibility, channel readiness, and whether the playbook is active. |
| Messages delivered but few conversions | Timing, offer, message clarity, product relevance, and whether the audience is too broad. |
| Many unresolved conversations | Agent prompt, uploaded documents, product data, policies, and escalation rules. |
| High revenue classified as team-managed | Attribution evidence and the team's commercial role. Check escalations separately: this revenue classification does not prove AI requested a takeover. |
| Missing attributed revenue | Tracking, links, order events, attribution windows, and whether a recognized external source took precedence. |
| High opt-outs or negative replies | Audience quality, consent, frequency, tone, and offer relevance. |
| Weak review collection | Delivered-order signals, review timing, product spacing, channel support, and whether low ratings are handled correctly. |
| Weak NPS response or many detractors | Delivered-order signals, delivery timing, message clarity, channel eligibility, and whether detractor feedback creates the right recovery path. |
| Weak CSAT response or many negative CSAT responses | Resolution trigger, meaningful-interaction checks, duplicate-prompt safeguards, message clarity, channel eligibility, and whether negative feedback creates the right recovery path. |

If signals or activity are missing, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) before judging the playbook.

## What to tune next

Tune one thing at a time so the next report is easier to interpret.

Common improvements include:

- Narrowing the audience or trigger.
- Improving the prompt or uploaded knowledge for an AI agent.
- Adding missing product, policy, order, or customer profile data.
- Adjusting wait steps, conditions, or route branches.
- Changing the message, offer, or recommendation logic.
- Updating escalation rules so the right teammate or team receives the conversation.
- Adding tracking or attribution setup where the report cannot see the full path.

After changing a playbook, give it enough time and traffic before comparing again.

## Related guides

- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Measure success in your first 7 days]({% link _getting-started/measure-success-first-7-days.md %})
