Use the Service quality report to understand how conversations are resolved, whether response-time commitments are being met, and where AI agents, teammates, teams, or channels need attention.

Open it from the **Service quality report** card under **Operations & Experience** on the Dashboard.

## How this report counts results

The selected period is based on when a conversation started. Resolution, escalation, SLA, and other eligible outcomes that happen later remain assigned to the originating conversation.

For example: **Conversation started April 7 → Resolved April 10 → Counted on April 7.**

Recent dates can change while conversations remain open or their service-analysis window has not closed. Compare older periods when you need stable results, and use Inbox or Workload & capacity when you need the current queue rather than the outcome of conversations that started during a period.

## Read the main metrics

Select a metric to update the timeline and available breakdowns.

### AI Resolution Rate

The percentage of conversations fully resolved by AI without escalation to a teammate.

A higher rate means AI completed more eligible conversations on its own. It does not mean AI participated in every other resolution, and it should not be optimized without reviewing whether customers received correct and useful outcomes.

### Resolved by team

The number of conversations resolved or closed by teammates from the selected conversation population.

A conversation can include AI activity before the team takes over. When a teammate completes the final resolution, it belongs to the team-resolved result.

### SLA compliance

The percentage of eligible response obligations that met the configured response-time threshold.

Hellotext applies the response policy and Business hours that were in effect when each timer started. Internal notes, drafts, Campaigns, and system-only activity do not count as customer-facing responses.

Read [Response times and response rules]({% link _team/understanding-response-times.md %}) to understand first-response and subsequent-response timers.

### Unresolved rate

The percentage of conversations that remain unresolved or pending within the selected population.

This metric can decrease as recent conversations close. Use it to find a pattern by channel, team, teammate, AI versus human handling, or resolution path rather than treating every open conversation as a service failure.

## Use the breakdowns

Available breakdowns depend on the selected metric:

- **AI Resolution Rate:** channel, AI agent, or resolution path.
- **Resolved by team:** team, teammate, channel, or resolution path.
- **SLA compliance:** team, teammate, channel, AI agent, or AI versus human handling.
- **Unresolved rate:** channel, team, teammate, AI versus human handling, or resolution path.

Use one dimension at a time when investigating a change. A channel difference can come from customer intent or operating hours; a team difference can come from routing, capacity, or the types of conversations it receives.

## Understand Resolution path

**Resolution path** compares conversations whose final resolution was completed by AI with those completed by the team.

This chart describes the final resolver, not every participant. A conversation that started with AI and was later resolved by a teammate appears as **Resolved by team**. An AI resolution must complete without escalation to appear as **Resolved by AI**.

Use the timeline breakdown when you need more detail such as AI only, human from beginning, escalated to human, active AI, or active human.

## Understand Response time distribution

**Response time distribution** shows how answered response waits are distributed across these ranges:

- under 1 minute;
- 1–3 minutes;
- 3–5 minutes;
- 5–10 minutes; and
- more than 10 minutes.

Use the selector to compare all conversations, AI-handled conversations, human-handled conversations, or conversations escalated to the team.

The percentage in each bar is the share of answered waits that fell into that range. It is **not the SLA compliance rate**. SLA compliance compares each eligible response with its configured deadline, which can vary by channel and Business hours.

## Compare agent performance

The **Agent performance** table can show all individual agents, teams, AI agents, or teammates.

The **All** view compares individual teammates with AI agents. Teams are excluded from this view because they aggregate the same human work and would duplicate it.

The table can include:

- **Conversations:** conversation volume connected to that agent or team.
- **Resolved:** conversations completed by that row.
- **First response:** average time to the first eligible response.
- **Average handle:** active human handling time divided by handled conversations. AI rows show no value because there is no comparable active-work interval.
- **Resolution time:** time from the start of ownership to resolution, or to escalation when AI handed the conversation off.
- **FCR:** conversations resolved without escalation, reassignment, or reopening.
- **SLA:** eligible response obligations completed within their configured deadline.

Compare similar roles before drawing conclusions. AI and teammates can receive different intents and have different timing primitives, so a missing value is not the same as zero performance.

## Turn the report into an action

| If you see... | Review... |
| --- | --- |
| AI Resolution Rate falling | AI agent, channel, resolution-path breakdown, missing knowledge, unsupported requests, and escalation rules. |
| Team resolutions rising | Whether more conversations are being routed to people intentionally or AI is escalating cases it should resolve. |
| SLA compliance falling | Response policies, Business hours, channel differences, team capacity, and unassigned conversations. |
| Unresolved rate rising | Recent open conversations, routing, ownership, capacity, and repeated issue types. |
| Many waits above 10 minutes | Whether the delay is concentrated in human-handled, escalated, channel, team, or teammate activity. |
| Low FCR for one row | Escalations, reassignments, reopened conversations, and whether ownership is reaching the correct destination. |

Open representative conversations before changing a Playbook, routing rule, response policy, or team capacity. The report identifies a pattern; the conversation history explains what happened.

## When data is missing or unexpected

Confirm that:

- conversations have a recorded start, owner, and lifecycle outcome;
- AI resolutions and escalations were recorded by the Playbook or route;
- teammates closed completed conversations instead of leaving them open;
- response rules and Business hours are configured for the channels you are comparing;
- team and teammate assignments identify who handled the conversation; and
- both comparisons use the same date range, timezone, metric, and breakdown.

If the source records exist but the report remains inconsistent, follow [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Related guides

- [Dashboard guide]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Teams and Inbox capacity]({% link _team/teams-and-inbox-capacity.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
