Use the Performance report to understand how conversations convert, how long conversion takes, and how often AI explicitly hands work to a teammate.

Open it from the **Performance report** card under **Business Performance** on the Dashboard.

## How this report counts results

The selected period is based on when the conversation or interaction started. A conversion or escalation that happens later remains assigned to that originating start date.

For example: **Conversation started April 7 → Escalated April 8 → Purchase completed April 10 → Counted on April 7.**

This keeps the population consistent: the conversion rate, time to conversion, and escalation rate all follow conversations that started during the selected period. It avoids dividing purchases completed during one period by unrelated conversations that started during another.

Recent dates can change while conversations remain open or their outcome window has not closed. Compare older periods when you need stable results, and compare recent periods at the same age.

## Read the main metrics

Select a metric to update the timeline and available breakdowns.

### Conversion rate

The percentage of conversations in the selected start-date population that resulted in a completed purchase recorded by Hellotext.

The numerator and denominator follow the same originating population. A purchase completed later can increase the conversion rate on the earlier date when the conversation began.

Conversion rate is not total store conversion. It covers the eligible conversation and interaction records available to this report. Use the Revenue report when you need purchases by purchase date or total recorded revenue.

### Time to conversion

The average time between the start of a conversation and its completed purchase among conversations with a recorded conversion.

A lower value means conversions happened sooner for that population. It does not by itself mean the experience was better: product complexity, purchase consideration, channel, campaign, and Playbook can all change the expected time.

### Escalation rate

The percentage of conversations where AI explicitly requested a human takeover, regardless of the reason.

Human participation alone does not count as an escalation. A teammate can reply, claim ownership, or help during a conversation without changing this metric when AI did not request the handoff.

An escalation is not automatically a failure. Sales and support Playbooks can escalate because the customer is upset, reports a defective product, needs an unsupported answer, matches an escalation rule, or requires a person or team to continue.

Read [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}) for the available handoff paths.

## Use the breakdowns

The available breakdowns depend on the selected metric.

For **Conversion rate** and **Time to conversion**, compare by:

- channel;
- Playbook;
- Campaign; or
- AI versus human.

For **Escalation rate**, compare by:

- channel;
- Playbook;
- Campaign;
- reason;
- team;
- teammate; or
- AI agent.

Use one dimension at a time when investigating a change. A channel difference can come from customer intent or purchase behavior; a Playbook difference can come from its mission; and a team difference can come from which escalations it receives.

## Understand Time to conversion distribution

The distribution separates converted conversations into **AI-Only** and **Team-managed** paths.

- **AI-Only:** the conversion path did not include an explicit AI escalation. A teammate may still have participated without taking over through an escalation.
- **Team-managed:** AI explicitly escalated the conversation before the outcome.

Each chart shows the share and number of conversations that converted:

- the same day;
- in 1–3 days;
- in 4–7 days;
- in 8–30 days; or
- after more than 30 days.

Use the distribution together with the average. Two periods can have a similar average while one contains many same-day conversions and a smaller group of very late conversions.

## Compare Performance with other reports

Use the report whose date basis answers your question:

| Question | Report |
| --- | --- |
| How did conversations that started during this period eventually perform? | Performance report |
| How much revenue was purchased during this period? | Revenue report |
| How did one Playbook trigger population perform? | Playbook report |
| How did one Campaign delivery population perform? | Campaign report |
| How were conversations resolved and did they meet SLA? | Service quality report |

The same purchase can appear on different dates across these reports by design. Performance uses conversation start date, Revenue uses purchase date, and source reports use their own trigger or delivery date.

## Turn the report into an action

| If you see... | Review... |
| --- | --- |
| Conversion rate falling | Channel, Playbook, Campaign, AI versus human path, purchase signals, and whether orders connect to the correct customer profile. |
| Time to conversion increasing | The distribution, channel mix, purchase complexity, delayed follow-up, and whether escalations wait too long for a teammate. |
| Escalation rate increasing | Reason, Playbook, AI agent, channel, team destination, missing knowledge, and escalation rules. |
| One Playbook converts well but slowly | Whether the longer consideration period is expected for its mission before changing message timing or logic. |
| One team receives many escalations | Routing destinations, team capacity, repeated customer intents, and whether AI should resolve more of those requests. |
| Recent conversion is lower than usual | Whether the compared conversations have had equal time to convert before drawing a conclusion. |

Open representative conversations before changing a Playbook, prompt, knowledge source, routing rule, or team destination. The report identifies a pattern; the conversation and attribution history explain the cause.

## When data is missing or unexpected

Confirm that:

- conversation or interaction starts are recorded with the correct timestamp;
- purchases arrive from the connected eCommerce source and connect to the correct customer profile;
- eligible purchases are linked to the originating interaction under Hellotext's attribution rules;
- Playbook, Campaign, channel, AI agent, team, and teammate context is present where expected;
- explicit AI handoffs record an escalation event and destination; and
- both comparisons use the same date range, timezone, metric, and breakdown.

If a purchase appears in Revenue but not in Performance, check whether it has an eligible originating interaction. If the source records exist but the report remains inconsistent, follow [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Related guides

- [Dashboard guide]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Revenue report guide]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Service quality report guide]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
