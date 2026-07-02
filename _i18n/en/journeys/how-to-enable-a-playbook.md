Use this guide after you have chosen the first playbook you want to launch.

A playbook should be enabled only after the required signals, channels, messages, knowledge, and handoff rules are ready. The exact configuration cards vary by playbook type and account, but the launch pattern is the same: configure the mission, test the experience, enable it, then review early results.

If you are still deciding what to launch, start with [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %}).

## Before you start

Confirm the basics first:

- Your store, website, catalog, or data source is connected when the playbook depends on commerce activity.
- The customer signals the playbook needs are appearing on customer profiles.
- The channel the playbook will use is connected and ready.
- The audience has consent and is eligible for the channel.
- A teammate or team is ready to handle handoffs.
- You know which report or Inbox view you will use to review the first results.

If the playbook depends on product, order, cart, policy, or FAQ information, make sure that information is current before you enable the playbook.

## Open the playbook

Go to **Playbooks**, click **Explore playbooks**, and choose the playbook you want to configure.

Some playbooks can be enabled once for the business. If you already enabled that playbook before, Hellotext opens the existing configuration instead of creating a second copy.

Custom playbooks and custom agents may allow multiple versions. Give each version a clear name that explains its mission, audience, or channel.

## Review the configuration cards

Each playbook shows the configuration cards that apply to that mission.

You may see cards such as:

- **Incoming channels**, for channels where customers can contact the playbook.
- **Outgoing channels**, for channels the playbook can use when sending messages.
- **Agent prompt**, for instructions that tell the AI agent what to do and how to respond.
- **Intents**, for customer intentions that should activate a custom agent.
- **Knowledge**, for FAQs, policies, product notes, or documents the agent can use.
- **Discounts**, for offer strategy and incentive limits.
- **Tone**, for the voice used in AI-generated responses.
- **Escalation**, for the teammate or team that should take over when the agent needs help.
- **Web search**, for approved websites the agent can use when searching online.
- **Webchat settings**, for appearance, behavior, sequence, teaser, and handoff settings when the playbook is a webchat.

You do not need to change every card. Change only what affects the customer experience, the playbook's permissions, or the team that will own exceptions.

## Configure channels

Choose where the playbook can act.

For inbound playbooks, decide whether it should respond on all incoming channels or only selected channels such as WhatsApp, Webchat, Instagram DM, or SMS.

For outbound playbooks, confirm the outgoing channel, sender, WhatsApp account, or template requirements before enabling the playbook.

If a channel is not ready, do not enable a playbook that depends on it. Finish the channel setup first.

## Configure the agent or route logic

For AI playbooks and custom agents, review:

- The prompt and business instructions.
- The intents that should activate the agent.
- Uploaded knowledge, FAQs, policies, and product information.
- Tone and brand voice.
- Escalation rules.
- Whether the agent can use web search or external actions.

For route-style playbooks, review:

- The trigger or signal that starts the route.
- Messages, waits, conditions, branches, and assignments.
- Stop conditions and frequency expectations.
- Links, coupons, product recommendations, and personalization.

Use the smallest setup that can prove the playbook works. It is easier to expand a focused playbook than to diagnose a broad one.

## Test before enabling

Use the playbook preview or playground when available.

Test:

- A customer who should enter the playbook.
- A customer who should not enter the playbook.
- The main success path.
- A reply or question the playbook should answer.
- A case the playbook should escalate.
- Links, products, offers, and personalization.
- The Inbox handoff path and assignment target.

For AI playbooks, test several realistic messages. Confirm that the agent stays in scope, uses the right knowledge, and escalates when it should.

## Save and enable

When the setup looks ready, save the playbook and turn on **Enable this playbook**.

After a playbook is enabled, Hellotext can mark its workflow as active and customers who match the playbook conditions may begin entering it.

Enabled does not mean every matching signal will send immediately. Hellotext still checks customer eligibility, channel readiness, frequency, timing, and handoff rules before each send. For details, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

If you need to stop it, open the playbook list and disable the playbook. Disabling stops the workflow from accepting new eligible customers while you review or edit the setup.

## Watch the first activity

Do not launch and walk away.

During the first day, review:

- Whether the right customer profiles entered.
- Whether the expected messages were delivered.
- Whether replies reached the Inbox.
- Whether the agent answered within scope.
- Whether handoffs went to the right teammate or team.
- Whether links, products, discounts, and recommendations worked.
- Whether reporting started to show activity.

If the playbook touches revenue or support, keep the first audience narrow until the team has reviewed the first conversations.

## Tune after launch

Change one thing at a time.

Common adjustments include:

- Narrowing the audience or trigger.
- Improving the prompt.
- Adding or updating knowledge documents.
- Changing the channel selection.
- Updating tone or offer strategy.
- Adjusting handoff rules.
- Fixing tracking, links, templates, or product data.

After each change, give the playbook enough activity before comparing results again.

For a safer editing process, keep reading: [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Related guides

- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
