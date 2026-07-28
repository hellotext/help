Your first playbook should prove one clear business outcome before you expand.

In Hellotext, a playbook can be a prebuilt mission, an AI agent, a journey route, a campaign, or a capture depending on the job it performs. Start with the simplest option that can deliver the outcome and teach you something useful.

## Before you choose

Confirm the basics first:

- Your store, website, or data source is connected.
- The signals the playbook needs are available on customer profiles.
- The channel you want to use, such as WhatsApp or SMS, is connected and ready.
- The audience has clear consent and enough recent activity to make the launch meaningful.
- Someone on your team can review replies or handoffs.

If the signal is not available yet, set up tracking or integrations before choosing a playbook that depends on it.

Keep reading: [What are signals?]({% link _journeys/what-are-signals.md %}).

For cart recovery specifically, see [Cart Saver route]({% link _journeys/cart-saver-route.md %}), [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}), and [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

If you want to browse more options before choosing, use [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %}).

After you choose the first option to launch, follow [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

## Choose by first goal

| If your first goal is... | Start with... | Why |
| --- | --- | --- |
| Grow your reachable audience or website conversations | A capture such as [Webchat Widget]({% link _journeys/webchat-widget-playbook.md %}), QR code, shareable link, form, popup, or subscriber booster | You need customers to opt in or start a conversation before many playbooks, routes, or campaigns can perform well. |
| Recover carts | [Cart Saver route]({% link _journeys/cart-saver-route.md %}) or an AI cart saver playbook | Use a route when the follow-up should be predictable. Use an AI playbook when the experience should react to product context, customer intent, replies, or objections. |
| Alert shoppers about products back in stock | [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}) | Use this when customers asked to be notified about an unavailable product and your stock signals are reliable. |
| Alert interested shoppers about a product price drop | [Price-Drop Pouncer]({% link _journeys/price-drop-pouncer.md %}) | Use this when catalog price changes are reliable and Hellotext can see recent product, cart, or recommendation interest. |
| Suggest matching products around what shoppers picked or viewed | [Complete-the-Look]({% link _journeys/complete-the-look-playbook.md %}) | Use this when your catalog has clear matching products, compatible accessories, looks, kits, or routines. |
| Convert new subscribers or window shoppers | [First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}), [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}), or [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) | These playbooks work best when Hellotext can see product, browsing, subscription, and purchase signals. |
| Drive repeat purchases or relationship moments | [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}), [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}), [Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}), [Anniversary Surprise]({% link _journeys/anniversary-surprise-playbook.md %}), or [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) | These need enough purchase history, product data, or profile data to make the timing and recommendation useful. |
| Win back inactive customers | [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}) or [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) | Use Dormant Revival around 3 months of inactivity. Use Sunset Saver around 12 months inactive or not reactivated. |
| Collect product reviews after delivery | [Review Builder]({% link _journeys/review-builder-playbook.md %}) | Use this when delivered-order and product data are reliable and you want ratings, written reviews, low-rating follow-up, and exportable review records. |
| Measure loyalty after delivery | [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) | Use this when delivered-order signals are reliable and you want a relationship-level 0-10 recommendation signal. |
| Answer frequent questions or reduce support load | [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), or [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) | Start here when your team spends time answering repeat questions and you have clear policies, order data, and handoff rules. |
| Measure satisfaction after resolved conversations | [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) | Use this when support, Inbox, AI, or playbook conversations can be resolved and negative feedback should create follow-up. |
| Send one planned announcement | A campaign or broadcast | Use a campaign when the message is time-bound and should go to a selected audience once. |
| Build a custom flow | A journey route or [custom agent]({% link _journeys/custom-agent-playbook.md %}) | Use this when no prebuilt mission fits, or when you need specific steps, conditions, actions, or business logic. |

## Start small

Choose one first outcome, one channel, and one audience.

For a first launch, avoid enabling several revenue playbooks for the same audience at the same time. If multiple playbooks can act on the same customer for the same kind of moment, it becomes harder to understand what worked, what annoyed customers, and what should change.

Feedback playbooks are a little different because they listen for different moments. [Review Builder]({% link _journeys/review-builder-playbook.md %}), [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}), and [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) can run together when delivery signals, resolved-conversation signals, and follow-up ownership are clear.

Good first launches are usually narrow:

- Recover abandoned carts for a small eligible audience.
- Welcome new subscribers from one capture source.
- Answer one group of common questions with a clear human handoff.
- Send one campaign to a focused segment.
- Replenish or recommend products only when purchase and product data are reliable.

## Use the simplest tool that fits

Use a **campaign** when you already know the audience, message, and send time.

Use a **route** when the experience should follow known steps: trigger, wait, message, condition, branch, and handoff.

Use an **AI playbook or agent** when Hellotext needs to interpret replies, use product or policy knowledge, personalize recommendations, choose from several next steps, or decide when to escalate.

Use a **capture** when the main job is to collect subscribers, customer data, or website conversations before another playbook can run.

## Questions to answer before launch

- What business result should this first launch prove?
- Which signal starts it?
- Which audience can enter it?
- Which channel will it use?
- What should stop it?
- When should a person take over?
- How will you measure whether it worked?

If any answer is unclear, narrow the playbook before publishing.

When the answers are clear, move to [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}) to configure, test, and turn it on safely.

## After the first launch

Review the first results before adding more automation.

Look at replies, clicks, opt-outs, handoffs, failed messages, conversion, attributed revenue, and whether customers received the next step you expected.

Then adjust one thing at a time: audience, trigger, timing, message, offer, prompt, or handoff rule. For a deeper read, use [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %}).

## Related guides

- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Webchat Widget playbook]({% link _journeys/webchat-widget-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %})
- [Price-Drop Pouncer playbook]({% link _journeys/price-drop-pouncer.md %})
- [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Complete-the-Look playbook]({% link _journeys/complete-the-look-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
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
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Campaigns and broadcasts overview]({% link _campaigns/campaigns-overview.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
