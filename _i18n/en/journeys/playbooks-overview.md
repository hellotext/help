Use playbooks and automations when Hellotext should read customer signals, decide what to do next, and act without someone on your team manually sending every message.

A playbook is a repeatable system trained for a business mission. It reads signals, decides what should happen for each customer, and acts through the right channel within the limits you set.

If you are comparing playbooks with campaigns and the Inbox, start with [How Hellotext works]({% link _getting-started/how-hellotext-works.md %}).

A playbook can be an autonomous mission, a reactive AI agent, or a journey route with defined steps. Some capture or campaign-like workflows can also appear in Playbooks; captures and campaigns have dedicated Help Center sections because their setup and operating models are different.

Signals can include carts, browsing activity, purchases, stock changes, birthdays, replies, customer profile properties, and channel eligibility.

Keep reading: [What are signals?]({% link _journeys/what-are-signals.md %}).

## Choose the right playbook type

If you are deciding where to start, use [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %}).

If you want to browse common options by business goal, use [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %}).

When you know which option you want to launch, use [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

Use a **prebuilt playbook** when the goal is common and the recommended mission already fits your business. This is usually the fastest way to launch.

Use an **AI playbook or AI agent** when the experience needs to respond conversationally, use product or policy knowledge, recommend items, answer frequent questions, collect customer information, or decide when to escalate.

For new subscribers or sign-ups who have not bought yet, see [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %}). For shoppers waiting for an unavailable product, see [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %}). For shoppers who saw a product before it became cheaper, see [Price-Drop Pouncer playbook]({% link _journeys/price-drop-pouncer.md %}). For browse intent that did not become a cart, see [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %}). For product discovery specifically, see [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %}). For matching products around what shoppers picked or viewed, see [Complete-the-Look playbook]({% link _journeys/complete-the-look-playbook.md %}). For add-ons after purchase or strong product interest, see [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %}). For repeat purchase on consumable products, see [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %}). For birthdays saved on the profile, see [Birthday Bash playbook]({% link _journeys/birthday-bash-playbook.md %}). For purchase or relationship anniversaries, see [Anniversary Surprise playbook]({% link _journeys/anniversary-surprise-playbook.md %}). For customers who are starting to go quiet, see [Soft Reactivation playbook]({% link _journeys/soft-reactivation-playbook.md %}). For customers around 3 months inactive, see [Dormant Revival playbook]({% link _journeys/dormant-revival-playbook.md %}). For customers around 12 months inactive or not reactivated, see [Sunset Saver playbook]({% link _journeys/sunset-saver-playbook.md %}). For order-status questions, see [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %}). For post-delivery product reviews, see [Review Builder playbook]({% link _journeys/review-builder-playbook.md %}). For loyalty after delivery, see [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %}). For satisfaction after resolved conversations, see [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %}). For frequent support questions, see [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %}). For guided return or exchange support, see [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %}). For cancellation requests, see [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %}). For a custom reactive agent with your own intents, prompt, knowledge, channels, tone, and handoff, see [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %}).

Use a **journey route** when you need a multi-step customer flow with a trigger, messages, waits, conditions, branches, and handoffs. A basic abandoned-cart follow-up can be [Cart Saver route]({% link _journeys/cart-saver-route.md %}); an AI abandoned-cart playbook can make more dynamic decisions based on signals and customer context.

For that specific choice, see [Cart Saver route]({% link _journeys/cart-saver-route.md %}), [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}), and [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

Use a **campaign** when you want a one-time send to a selected audience, and a **capture** when the goal is to collect subscribers, customer data, or website conversations. For an on-site conversation entry point, see [Webchat Widget playbook]({% link _journeys/webchat-widget-playbook.md %}).

## Before you enable a playbook

Confirm that the data and channels it depends on are ready.

For the full launch flow, use [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

When you need to change an existing setup, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

If a playbook is active but does not send when you expected, use [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}) before changing the setup.

When you need to diagnose one concrete example, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

For commerce playbooks, make sure your store integration is connected and recent activity appears on customer profiles as usable signals.

For WhatsApp playbooks, make sure WhatsApp is connected and approved before sending customers into the flow.

For SMS playbooks, make sure your account has an active sender or short code available.

## What to check before publishing

- The trigger matches the customer action you want to react to.
- The signals the playbook depends on are available and current.
- Messages use the right channel and tone.
- Wait steps give customers enough time before the next follow-up.
- Conditions and branches send people down the right path.
- Coupons, links, tags, and product recommendations are working.
- Human handoff rules are clear when a conversation should leave the route or agent.
- Frequency, consent, and quiet-hour limits are clear so playbooks do not compete for the same customer in the same moment.

## Keep improving after launch

Start with a focused audience and review the first conversations before expanding. Look for replies, missed expectations, broken links, timing issues, and places where a human had to step in.

Use what you learn to adjust only the controls that playbook type exposes: prompts for agents; waits, branch conditions, or template copy for routes; and tone, offer strategy, or channels for autonomous sales playbooks. For revenue, conversion, and handoff metrics, use [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %}).

For a safer editing process, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Related guides

- [What are signals?]({% link _journeys/what-are-signals.md %})
- [How Hellotext works: playbooks, campaigns, and Inbox]({% link _getting-started/how-hellotext-works.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Webchat Widget playbook]({% link _journeys/webchat-widget-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %})
- [Price-Drop Pouncer playbook]({% link _journeys/price-drop-pouncer.md %})
- [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Complete-the-Look playbook]({% link _journeys/complete-the-look-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Birthday Bash playbook]({% link _journeys/birthday-bash-playbook.md %})
- [Anniversary Surprise playbook]({% link _journeys/anniversary-surprise-playbook.md %})
- [Soft Reactivation playbook]({% link _journeys/soft-reactivation-playbook.md %})
- [Dormant Revival playbook]({% link _journeys/dormant-revival-playbook.md %})
- [Sunset Saver playbook]({% link _journeys/sunset-saver-playbook.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Custom journey]({% link _journeys/custom-journey.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Setup overview]({% link _integrations/setup-overview.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})
