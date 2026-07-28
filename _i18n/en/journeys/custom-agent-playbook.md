Use this guide when you need an AI agent for a specific business job that a prebuilt Hellotext playbook does not cover.

Custom Agent is a reactive AI playbook. It listens for the intents you define, follows your instructions, uses approved knowledge, responds in selected incoming channels, and hands off when it should not continue automatically.

It is not a journey route. You do not build a fixed sequence of waits, messages, conditions, and branches. You define what the agent owns, what should activate it, what knowledge it can use, and who should take over when the conversation needs a person.

## What Custom Agent does

Custom Agent helps you create one or more specialized AI agents.

It can:

- Activate when a customer message matches one of the intents you define.
- Follow a custom agent prompt for a specific mission.
- Use uploaded documents, approved websites, or other enabled knowledge sources.
- Respond in the incoming channels you allow.
- Use the tone you choose for the agent.
- Hand off to the configured teammate or team when the customer needs human help.
- Work alongside other active playbooks, as long as each one has a clear job.

Custom Agent works best when each agent owns a narrow mission. A good custom agent is not "answer anything." It is closer to "answer warranty questions for this product line," "qualify wholesale requests," "help customers choose a skincare routine," or "handle store pickup questions."

## When to use it

Use Custom Agent when the work is conversational, reactive, and specific.

It is a good fit when:

- No prebuilt playbook matches the job closely enough.
- You need multiple agents that activate from different customer intentions.
- The agent needs custom instructions that are specific to your business.
- The answer depends on uploaded policies, product notes, sizing guidance, warranty rules, store information, or approved websites.
- The agent should answer first, then hand off only when the request is sensitive, unresolved, or outside scope.
- A journey route would be too rigid because the customer can ask the same thing in many ways.

## When not to use it

Do not use Custom Agent just because it is flexible.

Use a prebuilt playbook when the mission already exists. For example:

- Use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) for product discovery and recommendations.
- Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) for order and shipment status.
- Use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) for common support questions that can be answered from approved knowledge.
- Use [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) for guided return or exchange support when the prebuilt mission fits.
- Use [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) for guided cancellation support and approved save-the-sale paths when the prebuilt mission fits.
- Use [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) for abandoned cart recovery.
- Use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) for satisfaction feedback after resolved conversations.

Use a [journey route]({% link _journeys/getting-started-with-journeys.md %}) when the experience must follow explicit steps, waits, questions, conditions, assignments, and branches.

Use a campaign when the message should be sent once to a selected audience. Use a capture when the job is to collect subscribers or profile data.

## What it needs before launch

Before enabling a custom agent, confirm the setup it depends on.

Check that:

- The agent has one clear mission.
- The intents are specific enough that they do not overlap heavily with other active agents or playbooks.
- The prompt explains what the agent should do, what it should not do, and when it should hand off.
- Uploaded documents or approved sites are current and do not contradict each other.
- The selected incoming channels are connected and ready.
- The agent has a configured handoff owner.
- Your team knows how to review conversations that were answered, unresolved, or handed off.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Custom Agent**.

Custom Agent exposes:

- **Intents:** the customer needs or phrases that should activate the agent.
- **Agent prompt:** the agent's mission, instructions, boundaries, tone guidance, and escalation rules.
- **Upload documents:** policies, product notes, FAQs, size guides, warranty rules, operational instructions, or other approved context.
- **Incoming channels:** where the agent can respond when customers message you.
- **Escalation or assignment:** who should take over when the agent needs help.
- **Tone:** the voice used in replies.
- **Web search or external request, when available:** approved websites or external data sources the agent can use for this mission.

Keep automatic channel selection unless you have a clear reason to limit the agent. Most accounts do not need to change channels during the first launch.

## Define clear intents

An intent is the customer need that should activate the agent.

Write intents in customer language, not internal feature language. Include a few realistic ways a customer would ask for the same thing.

Good intents are specific:

- "The customer wants to know if a product is covered by warranty."
- "The customer wants help choosing a gift for a child."
- "The customer is asking whether store pickup is available today."

Weak intents are too broad:

- "Support"
- "Question"
- "Products"
- "Help me"

If two custom agents have similar intents, customers may route to the wrong one. Split them by mission, product area, channel, language, or outcome only when the difference is useful and testable.

## Write the agent prompt

The prompt tells the agent how to do the job once it is activated.

Include:

- The agent's mission.
- The customer situation it should handle.
- The information it can use.
- The answers or actions it is allowed to provide.
- What it should ask when information is missing.
- What it must not promise, approve, modify, or decide.
- When it should hand off to a person or team.
- How it should explain the handoff to the customer.

Avoid prompts that ask the agent to solve every support and sales case. If one prompt needs too many exceptions, create a narrower agent or use a prebuilt playbook instead.

For prompt structure, use [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Add knowledge carefully

Uploaded documents and approved sites help the agent answer with business-specific context.

Use them for:

- Policies, FAQs, product education, size guides, service rules, warranty rules, and store information.
- Stable instructions the team already trusts.
- Details that are not already available through your connected store, catalog, order, or customer profile data.

Do not use stale files, conflicting policies, draft internal notes, or unsupported claims. If the source changes, update the document or approved website before expecting the agent to answer correctly.

Knowledge does not replace structured data. If the agent needs order status, catalog products, profile properties, consent, or tracking events, make sure those signals are connected and current.

## Configure handoff

Custom agents should know when to stop.

Configure escalation or assignment so the right teammate or team receives conversations that need a person.

Common handoff cases include:

- The customer asks for a person.
- The customer is angry, frustrated, or dissatisfied.
- The customer reports a defective, damaged, wrong, or missing product.
- The request is outside the agent's mission.
- The agent cannot verify the answer from available knowledge or data.
- The customer asks for a refund, cancellation, exception, account change, payment detail, or human sales action.
- No active playbook can resolve the request safely.

For the handoff model, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## How to test it

Test with realistic messages before enabling the agent broadly.

Use test customer profiles and channels that match your launch plan, then try:

- A message that should activate the custom agent.
- A message that sounds similar but should activate a different playbook.
- A message that should not activate any custom agent.
- An ambiguous message that should ask a clarifying question or hand off.
- A message that requires uploaded knowledge.
- A message where the uploaded knowledge is missing or unclear.
- A message that should hand off because the customer is upset, reports a defective product, or asks for a human decision.
- A message in each incoming channel you plan to use.
- A case where web search or an external request is needed, if that option is enabled.

Review whether the agent activates from the right intents, stays in scope, uses the right source, avoids guessing, formats the reply well for the channel, and hands off to the correct owner.

## What to review after launch

During the first days, review:

- Which customer messages activated the agent.
- Which messages should have gone to a different playbook.
- Whether intents are too broad, too narrow, or overlapping.
- Whether the prompt gave the agent enough boundaries.
- Whether uploaded knowledge answered the real questions customers asked.
- Whether handoffs were expected and went to the right teammate or team.
- Whether the agent answered unsupported questions or avoided useful answers it could have handled.
- Resolution rate, handoff rate, response speed, customer replies, opt-outs, failed messages, conversion, and attributed revenue when relevant.

Tune one thing at a time: intent wording, prompt, uploaded knowledge, approved websites, channel selection, tone, or handoff owner.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
