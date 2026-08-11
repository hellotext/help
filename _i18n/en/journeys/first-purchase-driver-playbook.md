Use this guide when you have many new subscribers, sign-ups, or identified customer profiles who browse or opt in but have not placed their first order.

First-Purchase Driver is an active conversion playbook. It helps Hellotext turn early interest into a first purchase, especially soon after signup, before the customer becomes inactive or moves into a stronger cart signal.

It is not a welcome route, not a cart recovery flow, and not a general product-recommendation chat agent. It sits between audience growth and purchase recovery: after a customer becomes reachable, before they have bought for the first time.

## What First-Purchase Driver does

First-Purchase Driver helps convert reachable prospects into first-time buyers.

It can:

- React to a new signup, opt-in, or subscribed customer profile.
- Check whether the customer still has no purchase history.
- Use subscription source, product, catalog, browsing, purchase, channel, and consent context before a message is sent.
- Queue a first-purchase reminder after a short delay when the customer has not ordered yet.
- Use recently added products or product interest when that context is available.
- Use a discount only when that option is available and configured.
- Skip, wait, or stop when the customer buys, becomes ineligible, moves into cart recovery, or another playbook is a better owner.

The exact experience can vary by account, connected store, channel, available templates, and playbook rollout status.

## When to use it

Use First-Purchase Driver when the bottleneck is converting reachable prospects into first-time buyers.

It is a good fit when:

- Many visitors subscribe, register, start a chat, or join from a capture, but do not buy.
- Your store can tell Hellotext whether a customer has placed an order.
- Customer profiles have enough channel consent to receive follow-up.
- Product links, catalog data, and optional discount rules are ready.
- Your team wants a light conversion nudge, not a broad campaign to everyone.

First-Purchase Driver works well after captures and welcome moments. A capture or welcome flow gets the customer into Hellotext; First-Purchase Driver helps decide whether a first-order follow-up makes sense later.

It also complements [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}), [Cart Saver route]({% link _journeys/cart-saver-route.md %}), and [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}). Use the signal to decide the owner: signup without an order belongs to First-Purchase Driver, product browsing belongs to Browse Recovery, and cart or checkout abandonment belongs to cart recovery.

Do not use it for customers who already bought. For repeat purchase, use [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}), [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}), reactivation, or another post-purchase playbook when available.

## What it needs before launch

Before enabling First-Purchase Driver, confirm the setup it depends on.

Check that:

- New signups, opt-ins, imports, or capture sources create usable customer profiles.
- The profile clearly shows whether the customer is subscribed and reachable.
- Purchase and order history can identify customers with no completed order.
- Product and catalog data are available if messages should include products or links.
- New-arrival, browsing, stock, or discount data is current if the playbook should use it.
- The channel the playbook can use is connected and ready.
- Customers have consent and are eligible for the channel.
- Links, discounts, and message templates work in the selected channel.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review queued, sent, skipped, clicked, purchased, and attributed outcomes.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **First-Purchase Driver**.

The playbook handles first-purchase eligibility and follow-up timing automatically. Depending on your account rollout, review the cards it exposes for:

- **Discount strategy:** whether the playbook follows existing eCommerce offer rules, can create AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Channels:** where Hellotext can send or continue the conversation.
- **Tone or Playground feedback:** how generated follow-ups should learn what fits your business.
- **Escalation or assignment:** who should take over when a reply needs a person.

Keep automatic channel selection unless you have a clear reason to limit the playbook. First-Purchase Driver depends on whether the customer can actually be reached and whether the message format is allowed in the channel.

## How the trigger works

First-Purchase Driver starts from a new reachable profile that has not ordered yet.

The reference setup for this playbook uses a first-purchase reminder around 48 hours after signup when no order exists. Hellotext still checks the current customer state before sending. If the customer already purchased, lost eligibility, or moved into a stronger cart or checkout signal, the playbook can skip, wait, or let another playbook act.

Where available, a new-arrivals spotlight can give the playbook a fresh product reason to follow up with prospects who have not bought yet. That kind of block should use current catalog and purchase context so it does not keep nudging customers who already converted.

Before sending, Hellotext can also consider:

- Whether the signup or opt-in signal is recent enough.
- Whether the customer has any completed purchase.
- Whether product, discount, or catalog context is complete enough.
- Whether the customer added to cart or started checkout, where cart recovery should usually take over.
- Whether the profile can receive a message in an eligible channel.
- Whether another playbook is already a better fit for this moment.
- Whether consent, timing, frequency, or channel rules allow a send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with other conversion playbooks

Use the customer signal to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| New signup or subscriber has not placed an order | First-Purchase Driver |
| Viewed products but did not add to cart | Browse Recovery |
| Added products to cart or started checkout, then left | Cart Saver route or AI Cart Saver |
| Asked for advice, comparisons, sizes, alternatives, or recommendations | Smart Recommender |
| Already bought and should buy again | [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}), [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}), or reactivation playbook when available |

First-Purchase Driver, Browse Recovery, and AI Cart Saver can be active together when ownership is clear. First-Purchase Driver handles the first-order gap, Browse Recovery handles product-view intent, and cart recovery handles the stronger cart or checkout moment.

## Review messages in the Playground

First-Purchase Driver can generate personalized follow-ups from the customer, signup, product, purchase, and channel context. You usually do not need to write every message by hand.

Use the Playground to review sample messages before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, and level of detail that fits your business.

When reviewing examples, look for:

- Whether the message gives the customer a clear reason to place a first order.
- Whether the tone feels helpful instead of pushy.
- Whether product recommendations, new arrivals, links, or discounts are relevant.
- Whether any discount feels intentional and not stronger than needed.
- Whether the message avoids treating every new subscriber the same way.
- Whether replies can naturally continue in the channel or reach the Inbox when needed.

The more realistic the Playground examples are, the better the system can adapt messages to your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use test customer profiles that have channel consent, then:

- Create or identify a new subscribed profile with no orders.
- Confirm the signup, opt-in, or capture source appears on the customer profile.
- Confirm the profile has no completed purchase.
- Confirm the profile becomes eligible for First-Purchase Driver.
- Test a customer who signs up and then buys before the reminder, which should prevent the first-purchase follow-up.
- Test a customer who adds to cart or starts checkout, where cart recovery should usually take over.
- Test a customer who is not eligible for the channel.
- Review product links, discounts, message tone, and attribution.
- Send a realistic reply and confirm it reaches the right teammate or team if handoff is available.

If tracking is custom, also confirm that the signup, purchase, product, timestamp, and customer identifiers match what Hellotext expects.

## Why it may not send

First-Purchase Driver being enabled does not mean every new signup receives a message.

The playbook may wait, skip, stop, or let another playbook act when:

- The signup or opt-in is missing, delayed, or not tied to a usable customer profile.
- The customer already bought.
- The customer added to cart or started checkout.
- Product, catalog, discount, or link data is missing when required.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Frequency, timing, or quiet-hour rules prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- How many new profiles became eligible.
- Which signup or capture sources produced first purchases.
- Which messages were queued, sent, delayed, skipped, or blocked.
- Clicks, first orders, attributed revenue, opt-outs, replies, and failed messages.
- Whether discounts are helping or simply reducing margin.
- Whether First-Purchase Driver overlaps with Browse Recovery or cart recovery.
- Whether customers ask questions that should go to Smart Recommender or the Inbox.

Tune one thing at a time: audience, channel, message, discount strategy, product context, or handoff path.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
