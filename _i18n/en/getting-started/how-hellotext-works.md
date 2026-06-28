Hellotext works by connecting customer signals to the right action.

Sometimes the right action is a playbook that runs continuously. Sometimes it is a one-time campaign. Sometimes it is a conversation your team should handle in the Inbox.

This guide helps you choose the right tool before you build.

## The basic model

Most Hellotext workflows follow the same pattern:

1. A customer or business signal appears.
2. Hellotext checks audience, consent, channel eligibility, timing, and limits.
3. Hellotext chooses or runs the next action.
4. The customer receives a message, enters a flow, or reaches a teammate.
5. Reports connect replies, clicks, orders, and revenue back to the action.

The difference between playbooks, campaigns, and Inbox is who decides the next step and how repeatable the work should be.

## Use playbooks for repeatable missions

Use a **playbook** when Hellotext should keep watching signals and act toward a business goal.

Good playbook use cases include:

- Recovering abandoned carts.
- Driving first purchase or repeat purchase.
- Recommending products.
- Following up after purchase.
- Reactivating customers.
- Collecting reviews or feedback.
- Answering frequent questions with an AI agent.

A playbook can be a prebuilt mission, an AI agent, a route, a capture, or even a campaign-like workflow depending on the job it performs.

Use a **route** when the playbook should follow predictable steps: trigger, wait, message, condition, branch, and handoff.

Use an **AI playbook or agent** when the experience needs to interpret replies, use product or policy knowledge, make recommendations, or decide when a person should take over.

## Use campaigns for planned one-time sends

Use a **campaign** when you already know the audience, message, and send time.

Campaigns are best for:

- Announcements.
- Promotions.
- Product launches.
- Restocks.
- Event reminders.
- Seasonal or time-bound broadcasts.

Campaigns are useful when the same message should reach a selected audience once. If the message should react to each customer's behavior over time, use a playbook instead.

## Use the Inbox for conversations that need attention

Use the **Inbox** when a person needs to read, assign, reply, or close a conversation.

The Inbox is where your team handles:

- Customer replies.
- Support questions.
- Order follow-up.
- Sales conversations.
- AI or playbook handoffs.
- Conversations that need human judgment.

Playbooks and campaigns can both create replies that land in the Inbox. The Inbox is how your team stays connected to customers when automation should not continue on its own.

## How they work together

Playbooks, campaigns, and Inbox are not separate silos.

Examples:

- A capture tool subscribes a customer, then a welcome playbook starts.
- A cart signal starts a route, but a customer reply sends the conversation to the Inbox.
- A campaign announces a product launch, and replies become Inbox conversations.
- An AI agent answers a frequent question, then hands off when the customer asks for human help.
- A teammate replies in the Inbox, and tracked links or orders still appear in reporting.

The best setup usually combines all three: playbooks for repeatable missions, campaigns for planned moments, and Inbox for conversations that need people.

## Quick decision guide

| If you need to... | Use... |
| --- | --- |
| React to customer behavior automatically | Playbook |
| Build a predictable multi-step flow | Route |
| Let AI answer, recommend, or decide next steps | AI playbook or agent |
| Send one planned message to a selected audience | Campaign |
| Collect subscribers or customer data | Capture |
| Read and reply to customer conversations | Inbox |
| Measure what happened after messages or flows | Analytics and reporting |

## Questions before you build

- What customer signal or business moment starts this?
- Should it run once or continuously?
- Should every customer receive the same message?
- Does Hellotext need to decide the next step?
- Can the customer reply?
- When should a person take over?
- How will you measure whether it worked?

If you are unsure, start smaller. Choose one goal, one channel, one audience, and one workflow to test before expanding.

## Related guides

- [What is Hellotext?]({% link _getting-started/what-is-hellotext.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Campaigns and broadcasts overview]({% link _campaigns/campaigns-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
