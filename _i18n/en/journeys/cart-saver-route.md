Use this guide when you want a predictable abandoned-cart follow-up that your team can review step by step.

Cart Saver is a journey route template. It starts from abandoned-cart or checkout activity, waits, checks whether the customer purchased, and sends a fixed reminder when the route conditions still apply.

It is not an AI agent. It follows the route you publish.

## What Cart Saver does

Cart Saver helps recover abandoned carts with a simple, controlled sequence.

It can:

- Start when Hellotext receives an abandoned-cart or checkout signal.
- Wait before sending the first reminder.
- Check whether the customer already purchased before sending.
- Send a reminder with fixed copy, personalization, a checkout link, and an offer if you add one.
- Stop when the customer purchased, a condition does not match, or the route has no more steps to run.
- Let your team edit the timing, message, condition, channel, and any extra steps before publishing.

The exact template can vary by account and rollout, so review the route you are about to publish instead of assuming every business has the same steps.

## When to use it

Use Cart Saver when you want control and a known sequence.

It is a good fit when:

- You want one or two fixed reminders after a cart is abandoned.
- The timing should be the same for most customers.
- The message, checkout link, coupon, channel, and stop condition are already clear.
- You want to inspect every step before launch.
- You do not need AI to interpret replies, answer questions, recommend alternatives, or choose between several next actions.

If cart recovery should react to product context, customer replies, objections, recommendations, or handoff decisions, use [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}) instead.

If the customer only viewed products and never added anything to cart or checkout, use [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %}) instead.

## What it needs before launch

Before publishing the route, confirm the basics.

Check that:

- Your store or checkout integration is connected.
- Abandoned-cart or checkout activity appears on the right customer profiles.
- The route trigger matches the signal your store sends.
- The channel is connected and ready.
- Customers have consent and are eligible for the channel.
- Checkout links work in a test.
- Any coupon, discount, or offer works before the message goes live.
- A purchase or order signal can stop the follow-up after the customer buys.
- Reporting is ready so you can review entries, sends, clicks, purchases, and failures.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## How to configure it

Go to **Playbooks**, click **Explore playbooks**, and choose **Cart Saver**.

Review the generated route before publishing.

Pay special attention to:

- **Trigger:** the cart or checkout activity that starts the route.
- **Wait step:** how long Hellotext waits before the reminder.
- **Purchase condition:** how the route checks whether the customer already purchased.
- **Message:** copy, personalization, checkout link, coupon, sender, and channel.
- **Exit path:** what happens when the customer purchased or no longer matches the route.
- **Extra steps:** any second reminder, condition, assignment, or tag your team adds.

Keep the first version simple. It is easier to measure one clear reminder than to understand a long recovery route with several branches.

Do not add prompt or intent requirements to this route. Those belong to AI agents or custom agents, not a basic Cart Saver route.

## How it differs from AI Cart Saver

Cart Saver follows the route you publish.

AI Cart Saver makes more dynamic decisions.

Use Cart Saver when the path should be predictable: wait, check purchase, send a reminder, then stop or continue through steps you defined.

Use AI Cart Saver when Hellotext should use more context before deciding what to do next, such as product details, customer replies, objections, recommendations, channel readiness, or handoff.

For a full comparison, see [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## Why it may not send

Publishing the route does not guarantee every abandoned cart will receive a reminder.

The route may not send when:

- The abandoned-cart signal did not arrive.
- The activity is not connected to a usable customer profile.
- The route trigger does not match the event your store sends.
- The profile cannot be reached in the selected channel.
- The customer unsubscribed, opted out, or is not eligible.
- The route condition finds that the customer already purchased.
- The checkout link, coupon, or personalization is invalid.
- The channel, sender, WhatsApp template, or message format is not ready.
- Quiet hours, frequency limits, or another send rule delays or blocks the message.
- Another cart recovery flow is already handling the same audience.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## How to test it

Test the route with a small path before publishing it broadly.

Use a test customer profile that has channel consent, then:

- Create or abandon a cart with real products.
- Confirm the cart or checkout activity appears on the customer profile.
- Confirm the route trigger matches the activity.
- Shorten the wait temporarily in a test version if you need faster feedback.
- Confirm the purchase condition prevents the reminder after a test purchase.
- Confirm the checkout link opens the right cart.
- Confirm any coupon applies correctly.
- Send a reply and confirm it reaches the Inbox if your team should handle replies.
- Review sent, skipped, failed, and converted examples after launch.

If you edited timing, message copy, coupon, or conditions during testing, review those settings again before publishing.

## What to review after launch

During the first week, review:

- How many customer profiles entered the route.
- How many reminders sent, skipped, failed, or waited.
- Whether checkout links and coupons worked.
- Whether purchases happened before or after the reminder.
- Replies, opt-outs, and support questions.
- Clicks, attributed revenue, and conversion.
- Whether this route overlaps with AI Cart Saver or another cart recovery flow.

Tune one part at a time: wait time, message copy, offer, audience, channel, or stop condition.

## Related guides

- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
