Use the Workload & capacity report to understand how Inbox work is distributed, how much capacity is being consumed, and where the current queue needs attention.

Open it from the **Workload & capacity report** card under **Operations & Experience** on the Dashboard.

## How this report counts results

This report combines historical work from the selected period with a live operational snapshot. The date selector does not control every section in the same way:

- **Handled** uses when a teammate first handled the conversation by sending an eligible reply.
- **Resolved** uses when the conversation was resolved or closed.
- **Active load**, concurrency, capacity pressure, and session efficiency use work or session intervals that overlap the selected period.
- **Operational Pressure** shows the current queue at the time displayed by the section. It is not limited by the selected historical date range.

For example: **Conversation started April 7 → First handled April 8 → Resolved April 10**. It contributes to Handled on April 8 and Resolved on April 10. If a conversation is still waiting now, it appears in Operational Pressure now, regardless of when it started.

This report does not wait for an attribution window to mature. Historical values can still change if conversation ownership, lifecycle events, or session records are corrected.

## Read the main metrics

Select a metric to update the timeline and available breakdowns.

### Active load

The average number of open, active conversations assigned during the selected period.

Active load describes work in progress, not every conversation visible in Inbox. Compare it with capacity pressure, response health, and the current queue before deciding that a team is overloaded.

### Handled

The number of conversations where a teammate or team sent at least one eligible reply during the selected period.

A conversation can be handled in one period and resolved in another. Handled measures work taken on, not final completion.

### Resolved

The number of conversations resolved or closed by a teammate or team during the selected period.

Compare Resolved with Handled over time. A short-term difference can be normal when conversations span multiple days; a persistent gap can indicate growing unfinished work.

### Avg. concurrent

The average number of conversations handled at the same time during the selected period.

High concurrency can be appropriate for short or simple conversations. Review it together with response times, SLA risk, and conversation quality instead of treating one target as correct for every team.

### Assigned

The number of handled conversations where the selected teammate was the first human owner during the period.

This metric is available by teammate because it describes individual ownership rather than a team aggregate.

### Transferred to

The number of handled conversations the selected teammate inherited from another teammate during the period.

Transfers are not automatically a problem. Review repeated transfers when they suggest unclear routing, missing expertise, or ownership that starts in the wrong place.

## Compare teammates and teams

Most metrics can be broken down by teammate or team. **Assigned** and **Transferred to** use teammate-level ownership.

Compare like with like. Different teams can receive different intents, channels, schedules, or conversation complexity. A higher volume does not by itself mean better performance, and a lower volume does not by itself mean unused capacity.

## Understand Capacity pressure

**Capacity pressure** compares consumed handling time with the available handling capacity represented in the selected period. You can view it by teammate or team.

Each bar shows:

- **Available capacity:** the handling capacity available for the period.
- **Consumed capacity:** active handling time used during that period.
- **Pressure:** consumed capacity as a percentage of available capacity.

Capacity depends on the Inbox capacity settings for teams and teammates. A high percentage is a prompt to review the queue and response health, not proof that capacity should immediately be increased.

Read [Teams and Inbox capacity]({% link _team/teams-and-inbox-capacity.md %}) before changing these settings.

## Understand Session efficiency

**Session efficiency** compares active handling time with total logged-in time for the selected period. It can be viewed by teammate or team.

The chart separates:

- **Total logged-in time:** the session time recorded during the period.
- **Active time:** time spent actively handling conversations.
- **Idle time:** logged-in time without active conversation handling.

Use this view to understand how recorded Inbox time was distributed. It is not a complete productivity score: meetings, breaks, administrative work, and responsibilities outside the Inbox may not appear as active handling time.

## Read Operational Pressure

**Operational Pressure** is a live view of the current queue. Changing the historical date range does not move this section into the past.

View it by teammate or team and use these columns:

- **Unanswered:** current conversations still waiting for a reply.
- **Oldest waiting:** the longest current customer wait.
- **SLA risk:** whether active response obligations are Safe, At risk, or Imminent.
- **Utilization:** current active handling time compared with recorded available session time.
- **Concurrent:** current handling concurrency.
- **Burn:** an operational signal that combines utilization, concurrency, and SLA pressure. Its states are Normal, Watch, and At risk.

Burn is a queue-pressure indicator, not a diagnosis or a performance rating for a person. Open the underlying conversations and consider schedules, routing, and capacity before taking action.

## Turn the report into an action

| If you see... | Review... |
| --- | --- |
| Active load rising | New assignments, unresolved work, team capacity, and whether conversations are being closed when complete. |
| Handled staying above Resolved | Whether work is spanning periods normally or unfinished conversations are accumulating. |
| High concurrency with slower responses | Concurrent-conversation limits, conversation complexity, response rules, and staffing. |
| Transfers concentrated on one teammate | Routing destinations, team membership, expertise, and initial ownership. |
| Low recorded session efficiency | Whether the teammate was available for Inbox work and whether non-Inbox responsibilities explain the difference. |
| Unanswered or oldest waiting increasing | The live unassigned and assigned queues, teammate availability, and response health. |
| SLA risk or Burn worsening | The conversations causing pressure, Business hours, response rules, routing, concurrency, and available capacity. |

Use the historical metrics to identify a pattern and Operational Pressure to decide what needs attention now.

## When data is missing or unexpected

Confirm that:

- teams and teammate Inbox capacity modes are configured correctly;
- active teammates have realistic concurrent-conversation and daily handling capacity;
- assignments and transfers identify the correct owner;
- teammates send replies and close completed conversations in Inbox;
- logged-in sessions and active handling intervals are recorded for the period;
- response rules and Business hours are configured when reviewing SLA risk; and
- both comparisons use the same date range, timezone, metric, and breakdown.

If the source records exist but the report remains inconsistent, follow [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Related guides

- [Dashboard guide]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Teams and Inbox capacity]({% link _team/teams-and-inbox-capacity.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Service quality report guide]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
