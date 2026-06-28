Use a journey when you want a step-by-step customer flow with a clear trigger, waits, messages, conditions, branches, and handoffs.

A journey is one type of playbook. Not every playbook is a journey.

Some playbooks are more autonomous: for example, a product recommender, post-purchase support, or a frequent-questions agent can read signals, understand intent, and decide what to do in the conversation. Those playbooks may use AI agents or decision logic instead of a fixed route.

## When to use a journey

Use a journey when the sequence should be predictable and you want to control the path.

Good journey use cases include:

- Welcoming a new subscriber.
- Running a simple abandoned cart route.
- Sending a post-purchase follow-up.
- Waiting a specific amount of time before a second message.
- Branching based on whether the customer clicked, replied, purchased, or matched a condition.
- Handing off to a person after a specific step.

An abandoned cart can exist in more than one form: a simple route template with fixed steps, or an AI playbook that decides more dynamically based on signals and customer context.

Keep reading: [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## When to use another playbook type

Use a more autonomous playbook or AI agent when the experience needs to decide in real time.

Examples include:

- Recommending products from a catalog.
- Answering frequent questions.
- Understanding a customer's message and choosing the next response.
- Deciding which offer, product, channel, or timing is best for each customer.
- Coordinating with other playbooks so customers are not overloaded.

Keep reading: [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %}).

## How journeys work

A journey starts when a customer matches a trigger. That trigger can come from a capture tool, your store integration, a campaign, a custom event, or a conversation.

After the trigger, Hellotext moves the customer through the route you defined. The journey can send a message, wait for a period of time, check a condition, branch, apply a coupon, or route the conversation to a person.

The important difference is that the route is designed by you. Hellotext follows the route and its conditions; it is not the same as an autonomous playbook deciding the full mission on its own.

## Start from a journey template

Use a journey template when you want to launch a proven step-by-step flow quickly.

To create one, go to the automation area in Hellotext, choose a journey template, review the trigger and steps, and adjust the copy, timing, channel, conditions, and handoff rules before publishing.

If no template fits what you need, create a [custom journey]({% link _journeys/custom-journey.md %}).

## Review before publishing

Before you publish, check that:

- The trigger matches the behavior you want to react to.
- The route steps happen in the order you expect.
- Wait times are reasonable for the customer.
- The channel is connected and ready.
- The audience and consent rules are correct.
- Messages sound like your brand.
- Links, coupons, and personalization tags work.
- Any handoff to a human team is clear.

Click **Save Changes** while you work. The journey remains inactive until you publish it.

When you are ready, click **Publish**. To stop it later, make it inactive.

## Next steps

If your flow needs an AI agent, review [how to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).
