Use this guide when a playbook did not behave the way you expected.

Start with one customer profile, one playbook, and one moment in time. Broad problems are much easier to diagnose after you can explain one concrete example.

If you are trying to understand the overall decision model first, read [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Before you change anything

Collect the facts first:

- The playbook name and type.
- The customer profile you expected to enter or receive a message.
- The approximate time the signal, message, or route step happened.
- The signal, intent, audience, route trigger, or customer message you expected to start the playbook.
- The channel you expected Hellotext to use.
- What actually happened: nothing, a delay, another channel, a handoff, or a different playbook.
- Any recent changes to integrations, tracking, channel setup, prompts, intents, knowledge, offers, or handoff settings.

Do not edit the prompt, intents, route, or channels until you know which part of the path failed.

## 1. Identify the playbook type

Different playbooks fail in different places.

| Playbook type | What usually starts it | What to check first |
| --- | --- | --- |
| Active sales playbook | A commerce or behavior signal | Signal, audience, customer eligibility, frequency, timing, product data. |
| Reactive support playbook | An incoming customer message | Incoming channel, intent/scope, knowledge, handoff rules. |
| Custom agent | A configured intent or routing decision | Intents, incoming channels, overlap with other agents, escalation target. |
| Journey route | A trigger and route conditions | Trigger, wait steps, conditions, branches, assignments, stop/end state. |
| Campaign-style playbook | A selected audience and send setup | Audience, channel readiness, consent, schedule, message validity. |

If the wrong playbook type is being used, the symptom may look like a bug when it is really a mismatch between the mission and the setup.

## 2. Confirm the playbook is enabled

Open **Playbooks** and check the playbook status.

If the playbook is disabled, it should not accept new eligible customers or conversations. Enable it only after the required signals, channels, knowledge, and handoff path are ready.

Also confirm you are looking at the correct version. Some playbooks can exist only once for the business. [Custom agents]({% link _journeys/custom-agent-playbook.md %}) and custom playbooks may have multiple versions with similar names.

## 3. If the playbook did not trigger

Use this section when there is no evidence that the playbook started.

Check:

- The expected signal exists on the customer profile.
- The signal happened after the integration, script, API, or capture was set up.
- The signal name and properties match what the playbook expects.
- The customer profile matches the playbook audience.
- The playbook is active in the same business where the activity happened.
- The route trigger, condition, or branch matches the profile.
- The incoming customer message matches the intent or support scope.
- Another active playbook or agent did not take ownership of the conversation first.

If the signal is missing from the customer profile, stop here and use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## 4. If the playbook triggered but did not send

Use this section when the signal or conversation exists, but no message was sent.

Check:

- The customer profile is subscribed or otherwise eligible for the channel.
- The profile is not blocked.
- The profile has a reachable phone, WhatsApp, Instagram, Webchat, or required identity.
- The channel is connected, active, and available for that customer.
- The message format works in the selected channel.
- The playbook did not hit a frequency or contact-pressure limit.
- The customer did not recently buy the product or product family the playbook was going to recover or recommend.
- The send was not blocked by quiet hours, night hours, or timing rules.
- The playbook could build a valid message, product, link, button, template, or route candidate.

If consent or contactability is unclear, use [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}).

## 5. If the playbook waited

A delay is not always a failure.

Some playbooks wait because:

- The route has a wait step.
- Quiet hours or night-hour settings apply.
- The business timezone changes which local hour is allowed.
- The playbook is waiting for a better send time.
- A conversation window or reply window is not currently available.
- A previous message already created contact pressure.

Check the route steps, business timing settings, and customer timeline before changing the playbook.

## 6. If the playbook used another channel

Some playbooks can choose among available channels.

Check:

- Which outgoing channels are allowed in the playbook.
- Whether the expected channel is active.
- Whether the customer profile is reachable in the expected channel.
- Whether the message format, buttons, media, template, or conversation window can work in that channel.
- Whether another available channel was a better match for the customer and message.

For WhatsApp-specific behavior, use [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %}).

## 7. If the playbook handed off

A handoff can be the correct outcome.

Check whether:

- The playbook has an **Escalation** setting.
- A journey route reached an assignment step.
- An AI step could not resolve the conversation and moved to assignment.
- A custom agent matched an intent but reached its limits.
- The customer was angry, reported a defective product, or needed a person.
- The Supervisor could not find another active playbook to handle the request.
- The target teammate or team is correct.

If the handoff was unexpected, review the agent prompt, knowledge, scope, intents, and escalation target. For details, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## 8. If the agent answered differently than expected

If the playbook sent or replied, but the content was wrong, this is usually not a trigger problem.

Check:

- The prompt says what the agent owns and what is out of scope.
- The knowledge documents are current and do not contradict each other.
- The agent has enough product, order, return, shipping, or policy data.
- The tone and offer settings match the business goal.
- The message was tested in the Playground with realistic customer language.
- The expected answer belongs to this playbook, not another playbook or team.

For safer changes, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## 9. Review reporting and one real timeline

Use reports to understand patterns, but use a real customer profile to debug.

Review:

- The customer profile timeline.
- Inbox conversation history.
- Playbook reporting.
- Campaign or journey activity that may have contacted the same profile.
- Channel delivery state.
- Recent integration or tracking activity.
- Handoff destination and owner.

If many customers show the same symptom, fix the shared cause: integration, tracking, channel readiness, audience, timing, frequency, prompt, or handoff settings.

## Quick symptom map

| Symptom | First place to look |
| --- | --- |
| No customer entered | Signal, audience, trigger, active status, or route condition. |
| Signal exists but no send | Consent, contactability, channel readiness, frequency, timing, or recent purchase. |
| Message sent later | Wait step, quiet hours, timezone, or send-time optimization. |
| Another channel was used | Channel availability, customer reachability, message format, or channel priority. |
| Conversation went to Inbox | Escalation settings, assignment step, unresolved AI path, or Supervisor routing. |
| Agent replied incorrectly | Prompt, knowledge, scope, product data, Playground test, or wrong playbook ownership. |
| Reports look low | Date range, attribution, event sync, channel delivery, or skipped/handed-off attempts. |

## Related guides

- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
