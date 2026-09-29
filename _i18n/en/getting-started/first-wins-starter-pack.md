Use this starter pack when you want early value without turning on too many workflows at once.

The goal is to plan a few focused wins, launch the first one, learn from real customer behavior, and expand only after your data, channels, and team process are working.

Exact playbook availability can depend on your plan, account setup, country, channels, and data sources. Use the closest available playbook, route, capture, or campaign in your account.

## Plan 3 to 5 wins

Choose 3 to 5 wins as a shortlist of next steps, but launch one first. Do not turn on every playbook at the same time.

Plan a sequence that can cover the full customer path:

1. Grow the audience.
2. Recover lost intent.
3. Convert or recommend.
4. Reduce support load.
5. Collect feedback or send one focused campaign when you have a clear moment.

Moving one step at a time gives you cleaner signals and makes it easier to understand what worked before expanding.

## 1. Grow your reachable audience

Start here if you do not have enough subscribed customers yet.

Use one capture path first:

- QR code for stores, events, packaging, or printed material.
- Shareable link for social, ads, email, and landing pages.
- Website form or popup for visitors already on your site.
- [Webchat Widget]({% link _captures/webchat-widget-playbook.md %}) for visitors who want to ask questions from the site.
- Checkout opt-in when customers are already buying.

Expected win: more reachable customer profiles and cleaner consent for future playbooks and campaigns.

## 2. Recover abandoned carts

Start here if detected abandonment produces a `cart.abandoned` event linked to the right customer profile.

Use [Cart Saver route]({% link _journeys/cart-saver-route.md %}) when you want fixed reminders with a configurable wait and purchase condition. Use [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}) when you want Hellotext to prepare an outbound reminder from cart, product, and profile context and check whether it can send. If the message invites replies, arrange separate Inbox coverage.

Expected win: recover purchase intent that already exists instead of only trying to create new demand.

Keep reading: [Cart Saver route]({% link _journeys/cart-saver-route.md %}), [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}), and [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## 3. Convert new shoppers or recommend products

Start here when you have product, browsing, subscription, or purchase signals.

Useful options can include:

- Check availability of [First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}) for new subscribers who have not bought yet.
- [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) for customers who viewed products but did not add to cart.
- [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) for incoming product questions when catalog and inventory data are reliable.
- [Complete-the-Look]({% link _journeys/complete-the-look-playbook.md %}) for confirmed orders whose products have clear matching items.
- [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) or [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) when you have enough order history.
- [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) when existing customers are starting to go quiet but are not fully dormant.

Expected win: move customers from interest to purchase, repeat purchase, or higher-value orders.

## 4. Reduce support load

Start here if your team answers the same questions repeatedly.

Useful options can include:

- [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) for frequent questions.
- [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when customers often ask where their order is.
- [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) when your policy is clear enough to automate parts of the conversation.
- [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) when cancellation requests are frequent and your rules are clear.
- Inbox assignment and response rules when humans still need to own replies.

Expected win: faster answers, cleaner handoffs, and fewer repetitive tickets for your team.

## 5. Collect feedback or send one focused campaign

Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) when you receive reliable delivered-order events, have product data, and want to collect product ratings and written reviews.

Use [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) when you receive reliable delivered-order events and want to measure whether customers would recommend the brand after that experience.

If you also use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}), keep the feedback moments separate: Review Builder is for product reviews, NPS Pulse is for loyalty after a delivery experience, and CSAT Pulse is for satisfaction after resolved conversations.

Expected win: learn which products and experiences produce positive or negative feedback, then use those signals to plan improvements and human follow-up.

NPS Pulse does not automatically recover low scores or offer its own results report in Playbooks: confirm how you will review responses and arrange follow-up separately before launch. Service Quality shows aggregate CSAT satisfaction, not a CSAT Pulse-specific report.

If you have one clear audience, one message, and one planned send time, use a campaign instead.

If an unavailable product returns to stock for customers with eligible recorded interest in that product, use [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}) instead of a broad campaign.

If customers already showed interest in a product and the product became meaningfully cheaper for them, use [Price-Drop Pouncer]({% link _journeys/price-drop-pouncer.md %}) instead of a broad sale campaign.

Good first campaigns include:

- A product launch.
- A restock announcement.
- A seasonal promotion.
- A short sale.
- A message to a small high-intent segment.

Expected win: learn how your audience responds to the channel, message, offer, and timing before sending broader campaigns.

## What to avoid at first

Avoid:

- Turning on several revenue playbooks for the same audience at once.
- Launching before customer profiles, consent, and signals are verified.
- Sending broad campaigns before testing links, replies, and opt-out behavior.
- Using AI agents without clear handoff rules.
- Comparing results before enough customers have gone through the workflow.

## Review after 7 days

After the first week of the first launch, review the signals that workflow can already produce:

- Audience growth and opt-in sources.
- Cart recovery or conversion activity.
- Replies, handoffs, and support questions.
- Clicks, orders, and attributed revenue.
- Any failed messages, opt-outs, or unexpected behavior.

Do not necessarily expect Review Builder or NPS Pulse results in this first review: their questions are timed for 7 days or later after delivery, and responses may arrive later. Then decide what to tune, pause, or expand.

Keep reading: [Measure success in your first 7 days]({% link _getting-started/measure-success-first-7-days.md %}).

## Related guides

- [Launch checklist]({% link _getting-started/launch-checklist.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
- [Measure success in your first 7 days]({% link _getting-started/measure-success-first-7-days.md %})
- [How Hellotext works]({% link _getting-started/how-hellotext-works.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
