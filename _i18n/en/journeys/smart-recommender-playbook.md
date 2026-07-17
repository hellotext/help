Use this guide when you want Hellotext to help customers discover, compare, and choose products in conversation.

Smart Recommender is a reactive AI sales playbook. It responds when a customer asks about products, collections, prices, sizes, availability, comparisons, or recommendations. It uses catalog and product context, your instructions, uploaded knowledge, and the current conversation to decide what to recommend or when to hand off.

It is not a journey route. You do not build a fixed sequence of waits and messages. You configure the agent, test realistic customer requests, enable it, and review the first conversations.

## What Smart Recommender does

Smart Recommender helps customers make a buying decision.

It can:

- Understand product discovery questions such as "Which one should I buy?", "Do you have this in black?", or "What is similar to this?"
- Search your catalog using product names, categories, attributes, customer needs, or images when image search is available.
- Recommend products with product cards or product links when the channel supports them.
- Answer product questions from catalog data and approved knowledge.
- Use uploaded documents or approved websites for policies, payment guidance, size guidance, or product notes.
- Ask a clarifying question when the request is too broad or the catalog does not have a clear match.
- Hand off to a teammate or team when the customer needs a person.

The playbook should stay grounded in the information available to Hellotext. If product, price, size, stock, policy, or catalog data is missing or outdated, the recommendation experience will be weaker.

## When to use it

Use Smart Recommender when product discovery happens in conversation.

It is a good fit when:

- Customers ask what to buy, which product fits their need, or what alternatives exist.
- Your catalog has enough product names, descriptions, images, prices, variants, or stock data to support useful recommendations.
- Customers compare products, sizes, materials, colors, use cases, or styles.
- Your team wants AI to answer common shopping questions before handing off.
- You want product recommendations to happen from channels such as WhatsApp, Webchat, Instagram DM, or SMS when supported.

Do not use Smart Recommender as the only source of truth for order status, delivery incidents, complaints, refunds, cancellations, or final return and exchange decisions. Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) for order status, [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) for guided return or exchange help, [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) for cancellation requests, and the Inbox when a person needs to decide.

If the customer did not ask a question and only showed browsing intent by viewing products, use [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %}) instead.

## What it needs before launch

Before enabling Smart Recommender, confirm the setup it depends on.

Check that:

- Your product catalog or commerce integration is connected.
- Product names, descriptions, images, prices, variants, categories, and stock are current enough for recommendations.
- The channels where customers ask product questions are connected and ready.
- Customers have consent and are eligible for the channels you plan to use.
- Product cards, links, images, or rich messages work in the selected channels.
- Store policies, size guides, payment instructions, shipping information, and product notes are uploaded or available in approved sources.
- Your prompt explains the agent's mission, tone, recommendation boundaries, and when to hand off.
- A teammate or team is ready to take over when the agent cannot help.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Smart Recommender**.

The available cards can vary, but you may be able to review:

- **Upload documents:** product notes, FAQs, policies, size guides, payment instructions, or other approved context.
- **Agent prompt:** what the recommender should do, how it should speak, what it can recommend, and when it should hand off.
- **Incoming channels:** where the playbook can respond to product questions.
- **Tone:** the voice used in replies.
- **Escalation or assignment:** who should take over when a person is needed.
- **Web search:** approved websites the agent can use when that option is available.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Some recommendation formats work better in rich channels, while others may need simpler links or text.

This playbook has an internal product-recommendation intent. You usually do not need to create manual intents for it. If you need several agents with different product missions or activation rules, use a [custom agent]({% link _journeys/custom-agent-playbook.md %}) and define those intents separately.

## Write a useful prompt

The prompt should give the recommender clear boundaries.

Include:

- What kind of customer the agent is helping.
- What products, collections, categories, or use cases matter most.
- How many products it should recommend at once.
- Whether it should prioritize fit, price, stock, margin, new arrivals, best sellers, or customer preference.
- Which claims require catalog or document grounding.
- When it should ask a clarifying question.
- When it should hand off instead of guessing.

Avoid instructions such as "recommend anything" or "always close the sale." They make the playbook harder to test and can push the agent outside the customer's real need.

For prompt structure, use [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Why it may not answer or recommend

Smart Recommender being enabled does not mean every message will receive a product recommendation.

The playbook may not answer, may ask a clarifying question, or may hand off when:

- The customer message is not about product discovery or a new buying decision.
- Another active playbook is a better owner for the conversation.
- The customer is asking about an existing order, delivery issue, complaint, refund, return, or exchange.
- The catalog has no good match for the request.
- Product data is missing, outdated, or not available in the selected channel.
- The channel cannot display the desired product card, link, or media format.
- Uploaded knowledge or approved sources do not support the answer.
- The customer needs a person to decide, approve, or resolve something.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How to test it

Test with realistic product questions before enabling the playbook broadly.

Use test customer profiles and channels that match your launch plan, then try:

- A broad request: "I need a gift" or "What do you recommend?"
- A specific request: product name, category, color, size, budget, or use case.
- A comparison: "Which is better for running?" or "What is the difference between these?"
- A stock or size question.
- An image-based request if your account supports product search by image.
- A request that should produce product cards or links.
- A request that should ask a clarifying question.
- A message about order status, delivery, complaint, return, or exchange that should hand off or route elsewhere.
- A request where no catalog item is a good match.

Review whether the agent recommends the right products, explains why, stays grounded, avoids unsupported claims, and sends the conversation to the right teammate or team when needed.

## What to review after launch

During the first days, review:

- Which customer messages activated the playbook.
- Which products were recommended.
- Whether recommendations matched the customer's stated need.
- Whether product cards, links, images, and prices were correct.
- Whether the agent asked useful clarifying questions.
- Whether handoffs went to the right teammate or team.
- Clicks, product engagement, conversion, revenue, opt-outs, and failed messages.
- Cases where the agent answered support questions that should have gone elsewhere.

Tune one thing at a time: prompt, knowledge documents, channel selection, handoff target, or catalog data quality.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
