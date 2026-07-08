Use this guide when you want Hellotext to ask customers whether they were satisfied after a support, Inbox, AI, or playbook conversation is resolved.

CSAT Pulse is a post-interaction feedback playbook. It sends a lightweight satisfaction prompt after a conversation is closed, records the response for CSAT reporting, and can create a recovery path when the customer gives negative feedback.

It is not a product review request and it is not a brand-loyalty survey. Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) for product reviews after delivery, and use [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) when the goal is loyalty or likelihood to recommend.

## What CSAT Pulse does

CSAT Pulse helps you measure whether the customer was satisfied with a resolved interaction.

It can:

- Send a CSAT prompt after a conversation is resolved or closed.
- Use a simple thumbs-up or thumbs-down response by default.
- Record positive and negative satisfaction responses.
- Avoid asking twice for the same conversation.
- Respect channel, consent, and send-eligibility rules.
- Create a recovery path when the customer responds negatively.
- Assign or route negative feedback to the right teammate or team.
- Feed CSAT reports by channel, time range, resolution path, agent, intent, or playbook when that context is available.

The goal is to learn whether the interaction worked and recover quickly when it did not.

## When to use it

Use CSAT Pulse when:

- Your team closes support or sales conversations in the Inbox.
- AI agents or playbooks resolve conversations and you want satisfaction feedback.
- You want to compare AI-only, human-only, and escalated conversation outcomes.
- You want negative feedback to create a follow-up path instead of disappearing into a report.
- You have enough conversation volume to learn from the results.

It works best after an actual resolution event. If the customer never had a meaningful interaction, do not send a CSAT prompt.

## When not to use it

Do not use CSAT Pulse for every kind of feedback.

Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) when the goal is to collect a product rating and written review after delivery.

Use [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) when the goal is to measure loyalty or likelihood to recommend the brand.

Use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) or a [Custom Agent]({% link _journeys/custom-agent-playbook.md %}) when the customer still needs an answer, not a satisfaction survey.

Use the Inbox directly when the customer is actively upset, still waiting for help, or the conversation is not actually resolved.

## What it needs before launch

Before enabling CSAT Pulse, confirm:

- Your team has a clear way to mark conversations as resolved or closed.
- Conversation history is available so Hellotext can tell whether the interaction was meaningful.
- The channels where you want to ask for CSAT are connected and eligible.
- Customer profiles have consent for the channel.
- Your team knows who reviews and follows up on negative feedback.
- Your team knows where CSAT results will be reviewed.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Edit the CSAT message

Open **Playbooks**, click **Explore playbooks**, and choose **CSAT Pulse**.

Open **CSAT message** to edit the question customers receive after the conversation is resolved.

The default CSAT message is short and conversational, such as:

Before we close: were you satisfied with the help? 👍 / 👎

You can adapt the message to your tone. Keep it short and easy to answer.

Avoid asking multiple questions at once. CSAT works best when the first response is simple.

## Choose when it should trigger

The trigger is **on resolved**: CSAT Pulse sends after a conversation is marked resolved or closed.

Do not use CSAT Pulse as a replacement for post-delivery product review timing. If the timing is based on delivered products, use [Review Builder]({% link _journeys/review-builder-playbook.md %}) instead.

## Understand eligibility

CSAT Pulse should ask only when the interaction was meaningful.

A prompt may be skipped when:

- The conversation did not have enough customer activity.
- The same conversation already received a CSAT prompt.
- The customer is not eligible for the channel.
- The channel cannot send the prompt compliantly.
- Consent, rate limits, or other send guardrails block the message.

If a CSAT prompt is skipped because of eligibility, do not treat that as a failed survey. It means Hellotext avoided asking at the wrong time.

## Handle positive and negative responses

When the customer responds positively, CSAT Pulse records the response.

When the customer responds negatively, CSAT Pulse should create a recovery path.

Negative feedback can:

- Reopen the conversation or send it to the Inbox for follow-up.
- Create a recovery item for the team.
- Keep the feedback connected to the original conversation.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Review CSAT reports

CSAT reporting helps you understand satisfaction after resolved conversations.

Review:

- CSAT percentage.
- Response rate.
- Positive and negative response counts.
- Channel breakdown.
- AI-only, human-only, and escalated resolution paths.
- Agent or team breakdown when available.
- Intent or playbook breakdown when available.
- Negative feedback reasons.
- Time range trends.
- Conversation links for follow-up.

For the thumbs response, CSAT percentage is positive responses divided by positive plus negative responses.

## How to test it

Test with realistic resolved conversations before enabling CSAT Pulse broadly.

Try:

- A conversation that is resolved and should receive CSAT.
- A conversation that is too short and should not receive CSAT.
- A positive response.
- A negative response that should create a recovery path.
- A channel that is outside its send window.
- A conversation resolved by AI only.
- A conversation resolved by a person.
- A conversation that was escalated from AI to a person.

Confirm that the prompt is sent only when expected, responses are recorded correctly, negative feedback reaches the right owner, and reporting reflects the test cases.

## What to review after launch

During the first days, review:

- How many resolved conversations were eligible.
- How many prompts were sent, skipped, delivered, and answered.
- CSAT percentage and response rate.
- Negative feedback reasons.
- Recovery follow-up and response speed.
- Differences between AI-only, human-only, and escalated conversations.
- Differences by channel, team, agent, intent, or playbook.
- Any signs that prompts are being sent at the wrong moment.

Tune one thing at a time: message copy, resolution process, channel readiness, or negative-feedback ownership.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
