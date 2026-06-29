Use this guide after a playbook, AI agent, or journey route has been live long enough to collect real customer activity.

Playbook reporting is not one single number. Review revenue, performance, attribution, and operational signals together so you can tell whether the playbook is creating value, creating support load, or missing the signals it needs.

## Where to start

Start from the reports that match the question you are trying to answer.

Use the **Revenue** report when you want to understand attributed sales, revenue split between campaigns and playbooks, and which playbooks or routes generated revenue.

Use the **Performance** report when you want to compare conversion rate, time to conversion, and escalation rate across playbooks, channels, campaigns, AI-assisted conversations, and human-assisted conversations.

Use the **Inbox** and conversation history when you need to understand why a playbook escalated, what the customer asked, and whether the handoff gave the team enough context.

Before comparing results, choose the right date range and confirm that the playbook had enough traffic to learn from.

## Review revenue from playbooks

In the Revenue report, look for:

- **AI-driven revenue**, when Hellotext can connect the sale to an AI-assisted interaction or playbook.
- **Human-driven revenue**, when a teammate's participation influenced the attributed sale.
- **Total revenue**, to understand the full attributed amount.
- **Playbook breakdowns**, to compare workflows by attributed revenue.
- **Campaigns vs Playbooks**, to understand whether one-time sends or always-on workflows are driving more attributed sales.
- **Playbooks section**, to compare revenue, conversion behavior, delivered messages, and customer reach by workflow.

Use revenue reporting to answer questions like:

- Which playbook or route is producing the most attributed revenue?
- Is revenue coming from autonomous playbooks, human-assisted conversations, or campaigns?
- Are certain channels, audiences, or workflows outperforming others?
- Does a playbook need better product data, timing, offer logic, or handoff rules?

If a playbook has strong revenue but many human handoffs, it may still be valuable. Review whether the handoffs are expected, profitable, and routed to the right person or team.

## Review performance and handoffs

Use the Performance report to understand whether a playbook is healthy, not just whether it produced revenue.

Check:

- **Conversion rate**, to compare how often conversations or workflows reach the intended outcome.
- **Time to conversion**, to see how long it takes customers to convert after the interaction starts.
- **Escalation rate**, to see how often the playbook needs human help.
- **Playbook breakdown**, to compare workflows side by side.
- **AI vs human breakdown**, to understand how automation and team participation affect results.

High escalation is not always bad. It can mean the playbook is correctly sending sensitive, angry, defective-product, or unresolved conversations to a person. It becomes a problem when the same issue keeps escalating because the playbook lacks knowledge, context, permissions, or a clear next step.

## Use attribution evidence

Revenue reports and exports help you explain why Hellotext attributed a sale.

When reviewing attribution, look for:

- The campaign, route, or playbook connected to the sale.
- The channel and source that influenced the customer.
- Whether the interaction was AI-driven, human-driven, or both.
- The attribution reason and supporting evidence.
- Whether another commercial touchpoint happened before purchase.

Use [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}) when you need to understand attribution windows, last-click behavior, cancellations, refunds, or human intervention.

## Compare playbooks carefully

Compare playbooks only when the context is similar enough.

Before making a decision, check:

- The same date range.
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
| High human-driven revenue | Whether handoff is expected and whether the playbook should answer more before escalating. |
| Missing attributed revenue | Tracking, links, order events, attribution windows, and whether another channel received last-click credit. |
| High opt-outs or negative replies | Audience quality, consent, frequency, tone, and offer relevance. |

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
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Measure success in your first 7 days]({% link _getting-started/measure-success-first-7-days.md %})
