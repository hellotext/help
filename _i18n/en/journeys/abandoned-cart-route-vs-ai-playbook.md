Abandoned cart recovery can be simple or dynamic.

In Hellotext, a basic abandoned cart follow-up can run as a route template with fixed steps. AI Cart Saver uses cart and customer context to prepare an outbound reminder and assess whether it can be sent.

Both are valid. Choose the simplest version that matches your goal, data, and team readiness.

## Use a route template when

Use [Cart Saver route]({% link _journeys/cart-saver-route.md %}) when you want a predictable step-by-step flow.

A route is usually the right first choice when:

- You want a fixed sequence and message you can define in advance.
- You want to configure the wait, purchase condition, and route steps.
- You already know which checkout link to use and whether to offer a coupon.
- You want to review every step before publishing.

For example, when `cart.abandoned` is recorded, the route can wait, check for a purchase, and send a reminder only if its conditions still hold. You can add more steps if needed.

## Use an AI cart saver playbook when

Use an AI playbook when the outbound reminder should adapt to the cart and customer.

An AI cart saver playbook is a better fit when:

- Cart contents, products, and customer details vary between cases.
- You want the reminder copy to use that context before it is sent.
- Eligibility, send timing, and available channels can vary by customer.
- You want to set the tone and, if applicable, the discount strategy.

For example, [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) can prepare a reminder using cart, product, and profile context; it can also skip or stop sending when the customer is ineligible or has made a relevant purchase. If you invite the customer to reply, configure separate Inbox coverage for that reply: this playbook does not answer questions or recommend alternatives by itself.

## What both need

Both options depend on reliable setup.

Before launching either one, confirm:

- The cart or checkout signal arrives and matches the chosen trigger. In the default setups, `cart.abandoned` is recorded after abandonment is detected; leaving a page alone is not enough.
- The signal is associated with the right customer profile.
- Product details and the checkout link used by the message are current.
- A channel is available and the customer has consent to receive the message.
- A purchase that meets the route's or playbook's conditions prevents an unnecessary reminder.
- Links and events work in a test; if you offer a coupon, also test that it applies.

Keep reading: [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## How to choose

Choose a **route template** if you mainly need control, speed, and a known sequence.

Choose an **AI cart saver playbook** if you mainly need to write and send a reminder using cart, customer, and available-channel context.

If this is your first cart recovery launch, start with the version your team can confidently test and measure. You can begin with a route, learn from the first results, and move to an AI playbook when signals and product data are reliable.

## Before publishing

Review the actual setup you are about to enable.

For either approach, confirm which profiles are eligible, which consent and frequency rules apply, whether a purchase stops sending under the chosen approach, and which metric you will review after launch.

If you choose the **route**, review the trigger, wait, purchase condition before the message, copy, link, and any coupon. Check the available channel for that message.

If you choose the **AI playbook**, review channel selection, tone, the discount strategy if you use one, and the conditions that allow or skip sending. If the message invites replies, verify that separate Inbox coverage is configured.

When AI Cart Saver is active, it receives `cart.abandoned` before the route; the route is used when that playbook is not active. Check which option should handle the event before enabling them.

## Related guides

- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
