Use this guide when you want Hellotext to recover abandoned carts with adaptive, context-aware follow-up instead of a fixed route.

AI Cart Saver is an active sales playbook. It reacts when `cart.abandoned` is recorded, uses cart, product, customer profile, and purchase data for those products, and applies Hellotext's send checks before anything reaches the customer.

Unlike a route, you do not build every step manually. You configure the parts the playbook exposes, test the experience, enable it, and review the first activity.

## What AI Cart Saver does

AI Cart Saver helps recover purchase intent that already exists.

It can:

- React when a cart or checkout is detected as abandoned and `cart.abandoned` is recorded; leaving a page alone is not enough.
- Use cart products, checkout link, customer profile data, and purchase data for those products.
- Choose a send path based on customer reachability and channel readiness.
- Include product context, a checkout link, personalized wording, and a discount when the playbook is configured to use one.
- Wait, skip, or stop when the customer is not eligible, recently purchased, cannot be reached, or does not have a usable checkout link.
- Invite a customer to reply when support configuration permits it; prepare separate Inbox coverage for that reply.

The exact experience can vary by account, connected store, channel, available templates, and playbook rollout status.

## When to use it

Use AI Cart Saver when cart recovery should adapt to the customer.

It is a good fit when:

- Cart contents and customer details vary between cases.
- Product details and verified stock can change how the reminder is written.
- Cart value, product mix, profile, or relevant purchases should influence the outbound reminder.
- You want Hellotext to avoid sending when the message no longer makes sense.
- Your team can separately handle replies to messages that invite a response in Inbox.

If you only need one or two fixed reminders, use [Cart Saver route]({% link _journeys/cart-saver-route.md %}) instead. For the comparison, see [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

If the customer viewed products but never created a cart or checkout, use [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %}) instead.

## What it needs before launch

Before enabling AI Cart Saver, confirm the setup it depends on.

Check that:

- Your store or checkout integration is connected.
- The `cart.abandoned` event appears on the right customer profiles.
- Product, cart, checkout, and purchase data are current enough for the message to make sense.
- Checkout links work for test carts.
- The channel the playbook can use is connected and ready.
- WhatsApp templates are ready when WhatsApp is part of the send path.
- Customers have consent and are eligible for the channel.
- Purchases of the cart products appear in the product-level revenue data used by the send checks.
- If the message invites replies, a teammate or team has separately configured Inbox coverage for them.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **AI Cart Saver**.

For the outbound reminder, review these controls:

- **Channels:** where Hellotext can send the cart reminder.
- **Discount strategy:** whether the playbook follows existing eCommerce offer rules, can create AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Tone:** how the generated follow-up should sound.

If an assignment card appears, do not treat it as a guarantee that the playbook will handle replies. If you invite the customer to reply, separately configure how that reply reaches Inbox and who will handle it. This playbook writes an outbound reminder; it does not answer questions or recommend other products by itself.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Many cart recovery decisions depend on whether the customer can actually be reached in a channel and whether the message format is allowed there.

AI Cart Saver does not require you to configure a prompt, intents, or journey steps. Those controls belong to custom agents and journey routes.

## How it works with cart routes

When AI Cart Saver is active, it receives `cart.abandoned` before the route. The route receives that event as a fallback when the playbook is not active.

Use [Cart Saver route]({% link _journeys/cart-saver-route.md %}) when you want a predictable sequence: wait, check for purchase, send a fixed reminder if appropriate, and perhaps add another step.

Use AI Cart Saver when you want Hellotext to prepare and assess an outbound reminder using the cart, products, profile, relevant purchases, and channel readiness.

If you keep both available, do not assume they split the same events by audience: check which option handles `cart.abandoned` and which report you will review.

## Why it may not send

AI Cart Saver being enabled does not mean every abandoned cart produces a message.

The playbook may wait, skip, or stop sending when:

- The abandoned-cart signal did not arrive.
- The activity is not tied to a usable customer profile.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- The checkout link cannot be resolved.
- The customer made a relevant purchase or the cart recovery no longer applies.
- Frequency, timing, or quiet-hour rules prevent the send.
- The selected channel or message format is not ready.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). For diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## How to test it

Test with a small, realistic path before enabling it for normal traffic.

Use a test customer profile that has channel consent, then:

- Create or abandon a cart with real products.
- Confirm `cart.abandoned` appears on the customer profile.
- Confirm the checkout link opens the right cart.
- Preview or use the Playground if the playbook offers it.
- Test a customer who should be eligible and one who should not.
- Check what happens after the customer purchases.
- If the reminder invites replies, separately confirm that a reply reaches Inbox and someone can handle it.
- Review the first messages, skips, and reports.

Keep the first launch narrow until your team confirms that products, links, discounts, timing, and reply coverage behave as expected.

## What to review after launch

During the first days, review:

- How many customer profiles entered the playbook.
- Which messages were sent, delayed, or skipped.
- Whether checkout links and product context were correct.
- Whether discounts were used as intended.
- Whether replies to an invitation reached the separately configured Inbox coverage.
- Whether customers purchased before a follow-up was sent.
- Conversion, revenue, opt-outs, and failed messages.

Tune one thing at a time: discount strategy, tone, or channel selection.

## Related guides

- [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
