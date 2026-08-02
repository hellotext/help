Use this guide when you want Hellotext to recover abandoned carts with adaptive, context-aware follow-up instead of a fixed route.

AI Cart Saver is an active sales playbook. It reacts to abandoned-cart activity, reads cart, product, customer profile, conversation, and purchase context, and uses Hellotext's send checks before anything reaches the customer.

Unlike a route, you do not build every step manually. You configure the parts the playbook exposes, test the experience, enable it, and review the first activity.

## What AI Cart Saver does

AI Cart Saver helps recover purchase intent that already exists.

It can:

- React when a customer leaves a cart or checkout without completing the purchase.
- Use cart products, checkout link, product context, customer profile data, recent conversation, and purchase signals.
- Choose a send path based on customer reachability and channel readiness.
- Include product context, a checkout link, personalized wording, and a discount when the playbook is configured to use one.
- Wait, skip, or stop when the customer is not eligible, recently purchased, cannot be reached, or does not have a usable checkout link.
- Hand off to a teammate or team when the conversation needs a person.

The exact experience can vary by account, connected store, channel, available templates, and playbook rollout status.

## When to use it

Use AI Cart Saver when cart recovery should adapt to the customer.

It is a good fit when:

- Customers may reply with questions, doubts, or objections.
- Product details, alternatives, sizes, stock, or policies can change the next best step.
- The cart value, product mix, customer profile, or purchase history should influence the follow-up.
- You want Hellotext to avoid sending when the message no longer makes sense.
- Your team wants Inbox fallback for cases the playbook should not handle alone.

If you only need one or two fixed reminders, use [Cart Saver route]({% link _journeys/cart-saver-route.md %}) instead. For the comparison, see [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

If the customer viewed products but never created a cart or checkout, use [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %}) instead.

## What it needs before launch

Before enabling AI Cart Saver, confirm the setup it depends on.

Check that:

- Your store or checkout integration is connected.
- Abandoned cart or checkout activity appears on the right customer profiles.
- Product, cart, checkout, and purchase data are current enough for the message to make sense.
- Checkout links work for test carts.
- The channel the playbook can use is connected and ready.
- WhatsApp templates are ready when WhatsApp is part of the send path.
- Customers have consent and are eligible for the channel.
- A purchase or order signal can prevent follow-up after the customer buys.
- A teammate or team is ready for handoff from the Inbox.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **AI Cart Saver**.

AI Cart Saver exposes:

- **Channels:** where Hellotext can send or continue the cart recovery conversation.
- **Discount strategy:** whether the playbook follows existing eCommerce offer rules, can create AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Tone:** how the generated follow-up should sound.
- **Escalation or assignment:** who should take over when the conversation needs a person.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Many cart recovery decisions depend on whether the customer can actually be reached in a channel and whether the message format is allowed there.

AI Cart Saver does not require you to configure a prompt, intents, or journey steps. Those controls belong to custom agents and journey routes.

## How it works with cart routes

Do not run overlapping cart recovery flows for the same audience unless you are intentionally testing how they interact.

Use [Cart Saver route]({% link _journeys/cart-saver-route.md %}) when you want a predictable sequence: wait, send a fixed reminder, check for purchase, and maybe send one more follow-up.

Use AI Cart Saver when you want Hellotext to make a more contextual decision based on the cart, products, customer profile, replies, purchase state, and channel readiness.

If you keep both available, make the ownership clear: which customers should enter the route, which should be handled by the AI playbook, and which report you will review for each.

## Why it may not send

AI Cart Saver being enabled does not mean every abandoned cart produces a message.

The playbook may wait, skip, stop, or hand off when:

- The abandoned-cart signal did not arrive.
- The activity is not tied to a usable customer profile.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- The checkout link cannot be resolved.
- The customer already purchased or the cart recovery no longer applies.
- Frequency, timing, or quiet-hour rules prevent the send.
- The selected channel or message format is not ready.
- The conversation should go to a teammate or team.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). For diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## How to test it

Test with a small, realistic path before enabling it for normal traffic.

Use a test customer profile that has channel consent, then:

- Create or abandon a cart with real products.
- Confirm the cart or checkout activity appears on the customer profile.
- Confirm the checkout link opens the right cart.
- Preview or use the Playground if the playbook offers it.
- Test a customer who should be eligible and one who should not.
- Check what happens after the customer purchases.
- Send a realistic reply, question, or objection if the conversation path is available.
- Confirm handoff goes to the right teammate or team.
- Review the first messages, skips, replies, and reports.

Keep the first launch narrow until your team has reviewed real conversations and confirmed that products, links, discounts, timing, and handoffs behave as expected.

## What to review after launch

During the first days, review:

- How many customer profiles entered the playbook.
- Which messages were sent, delayed, skipped, or handed off.
- Whether checkout links and product context were correct.
- Whether discounts were used as intended.
- Whether replies reached the Inbox with enough context.
- Whether customers purchased before a follow-up was sent.
- Conversion, revenue, opt-outs, handoff rate, and failed messages.

Tune one thing at a time: discount strategy, tone, channel selection, or handoff target.

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
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
