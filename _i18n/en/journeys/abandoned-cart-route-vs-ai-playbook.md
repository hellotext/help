Abandoned cart recovery can be simple or dynamic.

In Hellotext, a basic abandoned cart follow-up can run as a route template with fixed steps. A more dynamic cart recovery experience can run as an AI playbook that uses signals, product context, and customer replies to decide what to do next.

Both are valid. Choose the simplest version that matches your goal, data, and team readiness.

## Use a route template when

Use a route when you want a predictable step-by-step flow.

A route is usually the right first choice when:

- You want one or two fixed reminders after a cart is abandoned.
- The timing should be the same for most customers.
- The message copy, coupon, channel, and stop conditions are already clear.
- You want to review every step before publishing.
- You do not need the follow-up to interpret replies or choose between several next actions.

For example, a simple route can wait after `cart.abandoned`, send a reminder, check whether the customer purchased, and stop or send one more follow-up.

## Use an AI cart saver playbook when

Use an AI playbook when cart recovery should adapt to the customer.

An AI cart saver playbook is a better fit when:

- The customer may reply with questions or objections.
- Product recommendations, alternatives, sizes, stock, or policy details matter.
- The best next step can change by customer, cart value, product, history, or reply.
- You want Hellotext to use more context before deciding the next message.
- A human should take over only when the conversation needs help.

For example, an AI playbook can use cart, product, profile, conversation, and purchase signals to decide whether to remind, recommend, answer, wait, stop, or hand off.

## What both need

Both options depend on reliable setup.

Before launching either one, confirm:

- Cart or checkout activity is tracked.
- The customer can be identified on the right customer profile.
- Product and order data are available if the message uses product details.
- The channel is connected and the customer is eligible to receive messages.
- A purchase or order signal can stop the follow-up.
- Links, coupons, and tracked events work in a test.

Keep reading: [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## How to choose

Choose a **route template** if you mainly need control, speed, and a known sequence.

Choose an **AI cart saver playbook** if you mainly need adaptation, conversational handling, and more context-aware decisions.

If this is your first cart recovery launch, start with the version your team can confidently test and measure. You can begin with a route, learn from the first results, and move to an AI playbook when the signal quality, product data, and handoff rules are ready.

## Before publishing

Review the actual setup you are about to enable.

Check:

- Which signal starts the flow.
- How long Hellotext waits before the first message.
- Which audience can enter.
- Which channel sends the message.
- Whether quiet hours, frequency limits, and consent rules apply.
- What stops the follow-up.
- When a person should take over.
- Which report or metric you will review after launch.

Do not enable several cart recovery flows for the same customers at the same time unless you are intentionally testing how they interact.

## Related guides

- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
