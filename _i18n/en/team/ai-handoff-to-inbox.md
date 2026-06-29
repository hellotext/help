Use handoff when Hellotext should stop handling a conversation automatically and bring a teammate or team into the Inbox.

Handoff can happen from a playbook, a journey, an AI agent step, or a custom agent. The important part is to decide where ownership should move when automation cannot resolve the conversation safely.

## How handoff works

There are four common ways to route a conversation to a person or team.

### Playbook escalation

Sales, support, and custom playbooks can include an **Escalation** setting. Use it to choose who should step in when the agent needs help, such as a teammate or a team.

Use playbook escalation when the agent can answer most questions on its own, but should stop and assign the conversation when the customer needs human support.

### Journey assignment step

Journeys can use an **Assignment** step. This step can open a conversation, close it, assign it to a teammate or team, add a tag, or remove a tag.

Use an Assignment step when the handoff should happen at a specific point in a route, such as after a condition, after a customer answer, or after a branch that identifies a high-value or sensitive case.

### AI agent step in a journey

A journey can include an **AI agent** step. In that step, you can select a specific playbook or use **AI Routing**, which lets Hellotext choose the best active playbook for the conversation.

The AI agent step has solved and unresolved outcomes. If the AI cannot resolve the conversation, add an Assignment step on the unresolved path so the conversation goes to the right teammate or team.

### Custom playbooks and intents

Custom playbooks can define **Intents**. An intent is a phrase or need that activates an agent when detected in a customer message.

This lets you create multiple agents for different jobs. For example, one agent can handle product recommendations, another can answer support questions, and another can manage order-related requests. Each agent can resolve the conversation, route it to another playbook through Supervisor routing, or escalate it to the configured teammate or team.

## When Hellotext should escalate

Define escalation rules before you launch a playbook or journey.

Common escalation moments include:

- The customer asks to speak with a person.
- The customer is angry, frustrated, or dissatisfied.
- The customer reports a defective, damaged, wrong, or missing product.
- The request is outside the current playbook's purpose.
- The AI is uncertain or cannot verify the answer.
- The customer asks about refunds, exchanges, cancellations, payment, account access, or a special exception.
- The customer is ready to buy but needs a human sales action.
- Hellotext cannot find another active playbook that should handle the request.
- The same issue repeats and the conversation is not progressing.

If a wrong answer would create operational, legal, financial, or brand risk, escalate instead of continuing automatically.

## What to configure before launch

Before customers reach the workflow, check the handoff path that applies to your setup.

For playbooks:

- Choose the teammate or team in the Escalation setting.
- Confirm the agent prompt explains when it should escalate.
- Confirm the agent knows what to say before handing off.

For journeys:

- Add an Assignment step wherever the route should assign the conversation.
- Choose whether the step should open, close, assign, tag, or untag the conversation.
- If an AI agent step has an unresolved branch, connect that branch to an Assignment step.

For custom agents:

- Define the intents that should activate each agent.
- Choose the incoming channels where the agent should respond.
- Configure escalation for the person or team that should step in.
- Test what happens when no active playbook can resolve the request.

Keep reading: [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).

## What the Inbox should show

When a conversation reaches the Inbox, the teammate should understand what happened without rereading everything from the beginning.

A useful handoff should make these things clear:

- Why the conversation was handed off.
- Which playbook, intent, journey, or AI step handled it first.
- What the customer wants.
- What the agent already said or did.
- Which product, cart, order, policy, or customer profile detail matters.
- Whether the customer is waiting for support, sales help, or operational follow-up.
- Who owns the next reply.
- Whether the situation is urgent.

The more specific the context, the easier it is for the teammate to reply naturally.

## Test the handoff path

Before going live, test each handoff path you depend on.

Use a test customer profile and confirm that:

1. A playbook escalates to the expected teammate or team.
2. A journey Assignment step assigns, opens, closes, or tags the conversation correctly.
3. An AI agent step sends unresolved conversations to the right Assignment step.
4. Custom intents activate the expected agent.
5. AI Routing chooses an appropriate active playbook.
6. A request with no matching active playbook reaches the fallback owner.
7. The teammate has enough context to answer without asking the customer to repeat everything.

If the teammate has to guess why the conversation arrived, improve the escalation rule, prompt, intent, or assignment path before launch.

## What teammates should do after handoff

When a teammate takes over:

- Read the latest customer message and automation context.
- Check the customer profile, order, cart, or product information before replying.
- Avoid repeating questions the agent already asked.
- Be clear that a person is now helping.
- Assign or reassign the conversation if ownership is wrong.
- Close the conversation when no further action is needed.

If the teammate performs a commercial action, such as sending a coupon, product link, checkout link, or recommendation, that can affect attribution.

Keep reading: [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}).

## Review handoff quality

After launch, review handoffs regularly.

Look for:

- Conversations that were escalated too late.
- Conversations that were escalated too early.
- Intents that activate the wrong agent.
- AI Routing choosing the wrong playbook.
- Missing or unclear escalation owners.
- Customers repeating information.
- Unassigned conversations waiting too long.
- Similar questions that could become better prompts, uploaded documents, intents, or route branches.

Use what you learn to tune the prompt, intents, playbook rules, journey branches, team ownership, or response process.

## Related guides

- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [How Hellotext works]({% link _getting-started/how-hellotext-works.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
