Use this guide when a playbook is enabled, but you expected a message and nothing was sent yet, the message was delayed, another channel was used, or the conversation was handed off.

The short version: **enabled** means the playbook is allowed to participate. It does not mean every signal, reply, or customer profile will produce a message.

Hellotext checks whether the playbook has a reason to act, whether the customer profile can be contacted, whether a channel can carry the message, whether frequency or timing limits apply, and whether the best outcome is to send, wait, skip, or hand off.

## First, separate trigger from send

When a playbook does not send, start by separating two questions.

**Did the playbook trigger?**

This is about the reason to act. A playbook may not trigger if the signal is missing, the customer profile does not match the audience, the customer message does not match an intent, the route condition fails, or the playbook is not enabled for that mission.

**Did the playbook trigger but not send?**

This is about delivery readiness. A playbook may have a valid reason to act, but still wait or skip because the customer profile is not reachable, the channel is unavailable, the customer has opted out, a frequency limit was reached, the timing is not allowed, the customer already purchased, or the conversation should be handled by a person.

For missing activity or trigger problems, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## The decision map

The exact checks vary by playbook, but the decision usually moves through these questions.

### 1. Is the playbook enabled and available?

The playbook must be enabled before it can accept new eligible customers or conversations.

Some playbooks can be enabled only once for the business. Others, such as custom agents, may allow multiple versions. Availability can also depend on the account, integration, channel, or feature set.

If the playbook is disabled, it should not accept new activity. Existing conversations, routes, or proposals may still need time to finish depending on the playbook type.

### 2. Did the right signal, intent, or condition happen?

Active sales playbooks usually need a signal, such as an abandoned cart, product interest, recent purchase, browsing behavior, or another commerce event.

Reactive support playbooks usually need an incoming customer message that fits the playbook's purpose.

Custom agents may depend on configured intents. If intents overlap, the Supervisor may choose another agent or decide that no active playbook is the right owner.

Journey routes depend on their trigger, conditions, waits, and branch logic. A route can start, wait, branch, assign, or end without sending another message if the next step does not apply.

### 3. Is the customer profile eligible to receive a message?

Before sending, Hellotext checks whether the customer profile can be contacted in the relevant channel.

A send can be blocked or skipped when:

- The customer profile is unsubscribed or opted out.
- The profile is blocked.
- The profile does not have a reachable phone, WhatsApp, Instagram, Webchat, or other required identity.
- The customer is not eligible for the audience or channel.
- The playbook requires a live conversation window and that window is not available.

For the broader consent and contactability model, see [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}).

### 4. Is the channel ready for this message?

A customer may be reachable in one channel and not another.

Hellotext checks whether the business has the channel enabled, whether the channel is active, whether the customer profile is reachable there, and whether the message format can work in that channel.

For example, a rich WhatsApp message, a product recommendation, an SMS message, a Webchat reply, and an Instagram DM do not have the same requirements. Buttons, media, templates, reply windows, and live conversation windows can all affect what is possible.

If multiple channels are available, the playbook may prefer the channel that best fits the conversation and message format. If no channel is eligible, the playbook cannot send.

### 5. Would this over-message the customer?

Some playbooks apply frequency and suppression checks before sending.

Hellotext may stop a proactive attempt when:

- The same playbook has already contacted this customer profile too recently.
- The customer profile has already received too much proactive activity from the business in the current window.
- Another campaign, journey, or playbook has already created enough contact pressure.
- The customer recently bought the product or product family the playbook was going to recover or recommend.

This is why an active playbook can skip a specific customer even when the signal exists. The system is trying to avoid duplicate, stale, or annoying messages.

### 6. Is it an allowed time to send?

Some playbooks can wait for a better send time instead of sending immediately.

Timing can be affected by:

- Quiet hours or night-hour settings.
- The business timezone.
- The business working calendar.
- The customer's recent engagement patterns.
- Whether the send window has already passed.

If all possible send times are blocked, the playbook may skip. If a later send time is better and allowed, the playbook may wait.

### 7. Can Hellotext build a valid send candidate?

Even after eligibility passes, the playbook still needs a message that can become a real send.

It may stop before sending if:

- There is no valid message variant for the available channel.
- The route or channel record disappeared before send time.
- Required product, cart, order, link, button, or template data is missing.
- The generated response fails a safety or relevance check.
- The AI agent cannot answer within scope.

When this happens, review the playbook configuration, Playground result, Inbox conversation, and reports to see which part of the path failed.

### 8. Should the conversation be handed off instead?

Some playbooks should not send a final AI response. They should bring in a person or team.

This can happen when:

- The support or sales agent cannot answer confidently.
- A rule says the case needs a person.
- The customer is angry.
- The customer reports a defective product.
- The Supervisor cannot find another active playbook that should own the request.
- A journey route reaches an assignment step.
- A custom agent's intent matches, but the agent reaches its limits.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## What to check when a playbook did not send

Use this checklist before changing the playbook.

| Check | Where to look |
| --- | --- |
| Is the playbook enabled? | **Playbooks** list and playbook settings. |
| Did the signal or intent happen? | Customer profile activity, event history, route trigger, or Inbox conversation. |
| Is the customer profile reachable? | Profile contact methods, subscription state, and blocked status. |
| Is the channel active? | Channel settings, WhatsApp/SMS/Webchat/Instagram setup, and template readiness. |
| Did another send already happen? | Inbox timeline, campaign activity, journey activity, and playbook reports. |
| Did timing delay the send? | Quiet-hour settings, business timezone, and first activity timestamps. |
| Did the playbook hand off? | Inbox assignment, team ownership, and conversation notes. |
| Did reporting show a skip or low activity? | [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %}). |

## When to edit the playbook

Do not change the playbook until you know which part failed.

If the issue is missing data, fix the integration or tracking first.

If the issue is channel readiness, finish channel setup before changing the playbook.

If the issue is frequency, recent purchase, consent, or timing, the playbook may be working correctly. In that case, adjust limits only if the business strategy really changed.

If the issue is prompt, intents, knowledge, handoff, offer, or route logic, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Related guides

- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
