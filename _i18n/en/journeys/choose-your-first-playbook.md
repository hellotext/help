Your first playbook should prove one clear business outcome before you expand.

In Hellotext, a playbook can be an autonomous prebuilt mission, a reactive AI agent, a journey route with defined steps, or a capture. Capture playbooks are available under **Playbooks** > **Explore Playbooks** > **Capture**. This Help Center gives captures and campaigns dedicated sections because their setup and operating models are different. Start with the simplest option that can deliver the outcome and teach you something useful.

## Before you choose

Confirm the basics first:

- Your store, website, or data source is connected.
- The signals the playbook needs are available on customer profiles.
- The channel you want to use, such as WhatsApp or SMS, is connected and ready.
- For outbound messages, the audience has consent and channel eligibility; if the playbook depends on recent activity, that signal is available.
- If you expect replies or handoffs, someone on your team can review them.

If the signal is not available yet, set up tracking or integrations before choosing a playbook that depends on it.

Keep reading: [What are signals?]({% link _journeys/what-are-signals.md %}).

For cart recovery specifically, see [Cart Saver route]({% link _journeys/cart-saver-route.md %}), [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}), and [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

If you want to browse more options before choosing, use [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %}).

After you choose the first option to launch, follow [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

## Choose by first goal

- **Grow your reachable audience or website conversations** — **Start with:** A capture such as [Subscriber Booster]({% link _captures/subscriber-booster-playbook.md %}), [Webchat Widget]({% link _captures/webchat-widget-playbook.md %}), QR code, shareable link, form, or popup

  **Why:** You need customers to opt in or start a conversation before many playbooks, routes, or campaigns can perform well.

- **Complete missing customer profile data** — **Start with:** [Property Collector]({% link _captures/property-collector-playbook.md %})

  **Why:** Use it directly or as a prerequisite when another AI playbook needs selected profile properties before continuing.

- **Recover carts** — **Start with:** [Cart Saver route]({% link _journeys/cart-saver-route.md %}) or [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %})

  **Why:** Use a route for a configurable sequence and wait. Use the AI playbook to prepare an outbound reminder from cart, product, and profile context and check whether it can send. Arrange separate Inbox coverage if you invite replies.

- **Alert shoppers about products back in stock** — **Start with:** [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %})

  **Why:** Use this when a customer showed interest in a product that returned to stock and your product identifiers and availability signals are reliable.

- **Alert interested shoppers about a product price drop** — **Start with:** [Price-Drop Pouncer]({% link _journeys/price-drop-pouncer.md %})

  **Why:** Use this when catalog price changes are reliable and Hellotext can see recent product, cart, or recommendation interest.

- **Suggest matching products around what shoppers picked or viewed** — **Start with:** [Complete-the-Look]({% link _journeys/complete-the-look-playbook.md %})

  **Why:** Use this when your catalog has clear matching products, compatible accessories, looks, kits, or routines.

- **Convert new subscribers or window shoppers** — **Start with:** For new subscribers, check availability of [First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}); for product views, use [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}); for incoming product questions, use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}).

  **Why:** Choose by the actual signal: a subscription without a purchase, browsing without a cart, or an incoming question. Each option needs the product, profile, or purchase data it uses to decide.

- **Drive repeat purchases or relationship moments** — **Start with:** [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}), [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}), [Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}), [Anniversary Surprise]({% link _journeys/anniversary-surprise-playbook.md %}), or [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %})

  **Why:** These need enough purchase history, product data, or profile data to make the timing and recommendation useful.

- **Win back inactive customers** — **Start with:** [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}) or [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %})

  **Why:** Use Dormant Revival around 3 months of inactivity. Use Sunset Saver around 12 months inactive or not reactivated.

- **Collect product reviews after delivery** — **Start with:** [Review Builder]({% link _journeys/review-builder-playbook.md %})

  **Why:** Use this when delivered-order and product data are reliable and you want ratings, written reviews, and low-rating follow-up.

- **Measure loyalty after delivery** — **Start with:** [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %})

  **Why:** Use this when delivered-order signals are reliable and you want to collect a 1-10 recommendation score. The current Playbooks view has no dedicated NPS report; confirm how you will access the results before launch.

- **Answer frequent questions or reduce support load** — **Start with:** [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), or [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %})

  **Why:** Start here when your team spends time answering repeat questions and you have clear policies, order data, and handoff rules.

- **Measure satisfaction after resolved conversations** — **Start with:** [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %})

  **Why:** Use this when support, Inbox, AI, or playbook conversations can be resolved and your team is ready to handle negative feedback; escalation must be configured.

- **Send one planned announcement** — **Start with:** A campaign

  **Why:** Use a campaign when the message is time-bound and should go to a selected audience once.

- **Build a custom flow** — **Start with:** A journey route or [custom agent]({% link _journeys/custom-agent-playbook.md %})

  **Why:** Use this when no prebuilt mission fits, or when you need specific steps, conditions, actions, or business logic.
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

Use a **proactive AI playbook** when an event starts an outbound message and Hellotext must adapt its content to the context before checking whether it can send.

Use a **reactive agent** when Hellotext must handle incoming messages, answer questions with product or policy knowledge, suggest alternatives, or hand off to a person.

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

Then adjust one thing at a time among the controls that option actually exposes, such as audience, route trigger or wait, message, offer strategy, agent prompt, or handoff rule. For a deeper read, use [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %}).

## Related guides

- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Subscriber Booster playbook]({% link _captures/subscriber-booster-playbook.md %})
- [Property Collector playbook]({% link _captures/property-collector-playbook.md %})
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
- [Campaigns overview]({% link _campaigns/campaigns-overview.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
