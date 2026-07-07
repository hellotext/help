Use this guide when a playbook is already configured and you want to adapt it without accidentally changing how it decides, replies, or sends messages.

Not every playbook is customized the same way. Some playbooks are autonomous AI agents, some are active sales playbooks that send or recommend based on signals, some are reactive support playbooks that respond when a customer writes in, and some are journey routes with defined steps. Before changing anything, identify which type of playbook you are editing and which configuration cards are available.

If you have not launched the playbook yet, start with [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

If the playbook is active but did not send, first check [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). The safest edit depends on whether the issue is trigger, eligibility, channel readiness, timing, handoff, or content.

If you need a checklist for one example, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}) before editing.

## Before you edit

Open **Playbooks**, choose the playbook, and review its configuration cards. Each playbook shows only the parts that can be customized for that case.

Ask based on the playbook type:

- For an active sales playbook: which signal, audience, or moment allows Hellotext to act?
- For a reactive support playbook: what kind of question should it answer, and when should it hand off?
- For a [custom agent]({% link _journeys/custom-agent-playbook.md %}): which intents should activate this agent, and what should stay out of scope?
- For a route: which trigger, steps, waits, conditions, branches, and assignments make up the flow?
- For any playbook: which report, Inbox conversation, or Playground test will show whether the change worked?

Not every playbook has a visible stop rule. In a route, there may be exit conditions or steps that end the flow. In a support agent, the conversation may end naturally if the customer stops replying, or it may hand off based on rules. In active sales playbooks, many eligibility, frequency, or completion rules are internal or controlled by the playbook logic.

## When to disable

You do not need to disable a playbook for every edit.

You can usually edit and test without disabling when you change:

- Tone.
- Knowledge documents.
- Web search sites.
- Handoff team.
- Small examples or clarifications.

Consider disabling temporarily only when the change could affect live customers while you edit, for example:

- You are changing the prompt of a playbook that allows prompt edits and the agent could reply incorrectly.
- You are changing intents for a custom agent.
- You are changing incoming or outgoing channels.
- You are changing discounts, incentives, or offers.
- You are editing a route with steps, conditions, branches, or assignments.

For active sales playbooks, the risk depends on which card you are changing. Many adjustments do not affect customers immediately, but a prompt, offer, channel, or route logic change should be tested before you broaden it again.

## What you can customize

Use this table as a quick map:

| If the playbook has... | Usually applies to... | What it changes |
| --- | --- | --- |
| **Agent prompt** | AI agents, custom agents, and some autonomous playbooks | Mission, tone, boundaries, and when to hand off. |
| **Intents** | Custom agents and custom playbooks | Which customer messages activate that agent. |
| **Knowledge** | Sales or support AI agents | What information the agent uses to answer. |
| **Incoming/outgoing channels** | Playbooks that allow channel selection | Where the playbook can reply or send. |
| **Discounts** | Sales playbooks that allow offers | Which incentives the agent may use. |
| **Escalation** | AI agents, support, [Webchat]({% link _journeys/webchat-widget-playbook.md %}), and some custom playbooks | Who takes over when the agent should not continue. |
| **Route steps** | Journeys or routes | Sequence, waits, branches, assignments, and exit from the flow. |

If a card does not appear in the playbook, do not force that concept into the setup. It means that part does not apply or is handled by the playbook's logic.

## Customize the prompt

This section applies only to playbooks that show the **Agent prompt** card.

The prompt should tell the agent what job it owns, how it should speak, what information it can use, and when it should hand off. Not every playbook has an editable prompt; many prebuilt playbooks already include internal logic.

Good prompt changes are specific:

- Describe the agent's mission in one or two sentences.
- Add brand tone and words the agent should avoid.
- Define what the agent may recommend, collect, or answer.
- State when the agent should ask a follow-up question.
- State when the agent should hand off instead of guessing.

Avoid broad instructions such as "sell more," "answer everything," or "do whatever helps the customer." They sound helpful, but they make the agent's boundaries harder to test.

For a deeper prompt structure, use [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Customize intents

This section mainly applies to [custom agents]({% link _journeys/custom-agent-playbook.md %}) or custom playbooks that show the **Intents** card.

Intents define which customer messages should activate that agent. A prebuilt playbook may react to signals or messages without requiring you to edit intents manually.

Use customer language, not internal labels. For example, "I want to change my order" is clearer than "post-purchase modification."

After editing intents, test:

- A message that should activate the agent.
- A message that should not activate it.
- An ambiguous message.
- A message that should be handled by another playbook.
- A message that should hand off to the Inbox.

If two intents overlap too much, the Supervisor may have a harder time choosing the right agent.

## Customize knowledge

This section applies to playbooks with a **Knowledge** card or document uploads.

Knowledge should make the agent more accurate. It does not change the playbook type and it does not replace a store, catalog, or order integration.

Before uploading or replacing documents:

- Remove outdated policies, old prices, expired offers, and duplicated FAQs.
- Use clear file names so your team knows what each document controls.
- Keep product, order, return, shipping, and warranty information consistent with your store.
- Avoid documents that contradict the prompt.
- Define what should happen when the agent cannot find an answer.

After updating knowledge, use the Playground to ask questions that depend on the changed information.

## Customize channels

In general, keep automatic channel selection if the playbook already works well. Many playbooks manage channels automatically based on the conversation type, customer availability, and business setup.

Change channels only when you have a clear reason:

- You want a reactive agent to reply only in specific channels.
- A channel is not ready yet.
- The playbook's tone or format does not work well in a specific channel.
- An outbound playbook needs to be limited to WhatsApp, SMS, or another channel for strategy reasons.

If you change channels, test the same scenario in each selected channel. Some content, buttons, templates, and response windows behave differently by channel.

## Customize offers and discounts

This section applies to sales playbooks that show **Discounts** or offer settings.

Offers affect customer expectations and revenue, so change them carefully.

Before changing discount settings:

- Confirm whether the playbook can use existing store offers, AI incentives, both, or no incentives.
- Set clear maximums for any AI-driven offer.
- Avoid stacking discounts beyond your business rules.
- Test what happens when a customer asks for a better offer.
- Review reports after the change to confirm the offer improves the right outcome.

If the playbook should never offer discounts, make that explicit in the discount settings and, if present, in the prompt.

## Customize handoff rules

This section applies to AI agents, support playbooks, [Webchat]({% link _journeys/webchat-widget-playbook.md %}), and custom playbooks that show **Escalation** settings.

Not every playbook needs manual rules. Some support playbooks hand off automatically when they cannot answer, when a rule says to hand off, or when the question needs a person. Some playbooks may also hand off if they detect anger, a defective product, or a request the active playbook cannot solve.

Review:

- Whether the conversation should go to a teammate or a team.
- Which cases should always hand off.
- What context the agent should leave for the team.
- Whether the Inbox team knows this playbook is active.

Keep reading: [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Customize journeys or routes

This section applies to **journey** or **route** playbooks.

Routes have visible steps and are sensitive to sequence changes. When editing a route, change one part at a time:

- The trigger or starting signal.
- The first message.
- A wait step.
- A condition or branch.
- An assignment step.
- An exit or stop condition.
- A coupon, link, or product recommendation.

If a route has no more steps to run, the flow ends. If you add conditions or branches, test both the expected path and the path that should not run.

## Test based on playbook type

Use the Playground or preview whenever it is available.

For an AI agent, test realistic language with typos, short replies, objections, and unclear intent.

For a custom agent, test messages that should activate that agent and messages that should go to another playbook.

For an active sales playbook, test that recommendations, offers, links, and eligibility conditions still make sense.

For a route, test one customer profile that should enter, another that should not enter, and at least one alternate branch.

For a support playbook, test a question it can answer, one it should hand off, and one that should stay out of scope.

## Review after the change

After the change is live, review early results before making another adjustment.

Look for:

- Unexpected handoffs.
- Repeated unanswered questions.
- Out-of-scope replies.
- Discount use that is too aggressive or too weak.
- Customers entering the wrong playbook.
- Changes in conversion, revenue, replies, opt-outs, or handoff rate.

If results move in the wrong direction, revert the smallest change first.

## Related guides

- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Webchat Widget playbook]({% link _journeys/webchat-widget-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
