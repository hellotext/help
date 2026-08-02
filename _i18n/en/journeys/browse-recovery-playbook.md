Use this guide when you want Hellotext to follow up with customers who viewed products but left before adding anything to cart or buying.

Browse Recovery is an active sales playbook. It uses product-view and browsing signals to identify recent purchase intent, then lets Hellotext decide whether a helpful follow-up makes sense for that customer.

It is not a cart recovery route and it is not a product-recommendation chat agent. It sits earlier in the buying journey: after product interest, before an abandoned cart.

## What Browse Recovery does

Browse Recovery helps recover product interest that did not become a cart.

It can:

- React to product-view activity such as `product.viewed`.
- Notice repeated product interest within a recent window.
- Check whether the customer has already purchased or moved into a stronger cart or checkout signal.
- Use product, catalog, customer profile, channel, and consent context before a message is sent.
- Use stock context when available, including low-stock urgency or the number of items left.
- Send a reminder, product link, or helpful prompt when the playbook is eligible to act.
- Skip, wait, or stop when the signal is stale, the customer is not eligible, another playbook is a better owner, or the message no longer makes sense.

The exact experience can vary by account, connected store, channel, available templates, and playbook rollout status.

## When to use it

Use Browse Recovery when shoppers show interest but do not create a cart.

It is a good fit when:

- Customers often view product pages but leave before adding to cart.
- Product views are tracked on the right customer profiles.
- Your catalog and product links are reliable enough for follow-up.
- Your team wants to recover earlier intent, not only abandoned carts.
- You have a clear channel and consent path for customers who browse.

Browse Recovery works well with First-Purchase Driver and AI Cart Saver. They are not mutually exclusive: [First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}) covers new reachable customers who have not bought yet, Browse Recovery covers customers who only viewed products, while [Cart Saver route]({% link _journeys/cart-saver-route.md %}) or [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}) should usually take over once the customer adds products to cart or starts checkout.

Do not use it as a conversational recommender. If the customer asks what to buy, compares options, or needs product guidance in chat, use [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %}).

## What it needs before launch

Before enabling Browse Recovery, confirm the setup it depends on.

Check that:

- Your store, website, or custom tracking sends product-view activity.
- Product views are tied to usable customer profiles when customers can be identified.
- Product IDs, variants, names, images, and links match your catalog.
- Stock or inventory data is current if you want messages to mention low stock or exact item counts.
- Purchase, cart, and checkout activity can tell Hellotext when another playbook is a better fit.
- The channel the playbook can use is connected and ready.
- Customers have consent and are eligible for the channel.
- Product links, discounts, or message templates work in the selected channel.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review views, sends, clicks, purchases, skips, and opt-outs.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Browse Recovery**.

Browse Recovery exposes:

- **Channels:** where Hellotext can send or continue the browse recovery conversation.
- **Tone or Playground feedback:** how the generated follow-ups should learn what fits your business.
- **Discount strategy:** whether the playbook follows existing eCommerce offer rules, can create AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Escalation or assignment:** who should take over when a reply needs a person.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Browse Recovery depends on whether the customer can actually be reached and whether the message format is allowed in the channel.

Browse Recovery does not require you to configure a prompt, intents, or journey steps. Those controls belong to custom agents and journey routes.

## How the trigger works

Browse Recovery starts from browse intent, not from a manual list.

A strong signal is repeated product interest in a recent window. In the current scoring model, repeated product views within a day can refresh the customer's purchase-intent evaluation. That does not mean Hellotext always sends after a specific number of views.

Before sending, Hellotext can also consider:

- Whether the product-view signal is recent enough.
- Whether the customer already bought.
- Whether the customer added to cart or started checkout, where cart recovery should usually take over.
- Whether the profile can receive a message in an eligible channel.
- Whether product and catalog data are complete enough.
- Whether another playbook is already a better owner for this moment.
- Whether frequency, timing, consent, or channel rules allow a send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with AI Cart Saver and recommendations

Use the signal to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| New signup or subscriber has not placed an order | First-Purchase Driver |
| Viewed one or more products but did not add to cart | Browse Recovery |
| Added products to cart or started checkout, then left | Cart Saver route or AI Cart Saver |
| Asked for advice, comparisons, sizes, alternatives, or recommendations | Smart Recommender |
| Needs a custom AI job with manual intents and knowledge | Custom Agent |

Browse Recovery and AI Cart Saver can be active together when ownership is clear. Browse Recovery should handle the earlier browsing moment, and AI Cart Saver should handle the stronger cart or checkout moment. If you also use the Cart Saver route template, keep that route scoped to the cart moment too. That way the playbooks complement each other without sending duplicate follow-ups for the same intent.

## Review messages in the Playground

Browse Recovery can generate personalized follow-ups from the customer, product, browsing, and channel context. You usually do not need to write every message by hand.

Use the Playground to review sample messages before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, and level of detail that fits your business.

When reviewing examples, look for:

- Whether the message feels helpful for the viewed product or category.
- Whether the tone matches your brand.
- Whether the message is clear without sounding too pushy.
- Whether low-stock urgency feels appropriate and uses accurate item counts when stock is included.
- Whether product links, discounts, or calls to action make sense.
- Whether the wording avoids over-explaining tracking or making the customer feel watched.

The more realistic the Playground examples are, the easier it is to teach the system what "good" looks like for your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use a test customer profile that has channel consent, then:

- View a real product page more than once.
- Confirm the product-view activity appears on the customer profile.
- Confirm the viewed product maps to the correct catalog item and link.
- Test a low-stock product if the message should mention how many items are left.
- Test a customer who views a product and then buys, which should prevent browse recovery.
- Test a customer who views a product and then adds to cart, where cart recovery should usually take over.
- Test a customer who is not eligible for the channel.
- Review whether the message, product link, timing, and discount make sense.
- Send a realistic reply and confirm it reaches the right teammate or team if handoff is available.

If tracking is custom, also confirm that the event name, product identifier, timestamp, and customer identifier match what Hellotext expects.

## Why it may not send

Browse Recovery being enabled does not mean every product view produces a message.

The playbook may wait, skip, stop, or let another playbook act when:

- Product-view tracking is missing or delayed.
- The activity is not tied to a usable customer profile.
- The product or catalog record cannot be resolved.
- The customer already bought.
- The customer added to cart or started checkout.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Frequency, timing, or quiet-hour rules prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- How many customer profiles produced browse signals.
- Which products or categories were viewed before a send.
- Which messages were sent, delayed, skipped, or blocked.
- Whether product links and catalog context were correct.
- Clicks, purchases, attributed revenue, opt-outs, replies, and failed messages.
- Whether Browse Recovery is overlapping with cart recovery.
- Whether customers ask questions that should go to Smart Recommender or the Inbox.

Tune one thing at a time: channel, discount strategy, tone, Playground feedback, or handoff path.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
