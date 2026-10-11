Use this guide when you want Hellotext to help customers discover, compare, and choose products in conversation.

Smart Recommender is a reactive AI sales playbook. It can participate when a message context matches product discovery, collections, prices, sizes, availability, comparisons, or recommendations and the agent is enabled and admitted. It uses catalog and product context, your instructions, uploaded knowledge, and the current conversation to decide what to recommend or when to hand off.

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

Search uses the catalog and capabilities available to the account. A saved price or product does not guarantee universal live inventory, availability in a specific store, or a purchase. Recommendations do not reserve products, create orders, process payments, or authorize discounts. Promotions need specific data and tools; writing an offer in the prompt does not create a coupon.

## When to use it

Use Smart Recommender when product discovery happens in conversation.

It is a good fit when:

- Customers ask what to buy, which product fits their need, or what alternatives exist.
- Your catalog has enough product names, descriptions, images, prices, variants, or stock data to support useful recommendations.
- Customers compare products, sizes, materials, colors, use cases, or styles.
- Your team wants AI to answer common shopping questions before handing off.
- You want product recommendations to happen from channels such as WhatsApp, Webchat, Instagram DM, or SMS when supported.

Do not use Smart Recommender as the only source of truth for order status, delivery incidents, complaints, refunds, cancellations, or final return and exchange decisions. Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) for order status, [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) for guided return or exchange help, [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) for cancellation requests, and the Inbox when a person needs to decide.

It can explain general store information or a return or exchange policy grounded in approved sources or instructions. That guidance does not approve or perform the operation. A specific physical destination for a return or exchange needs human validation; catalog data does not authorize that decision.

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

Also check access by type, plan, role, and quota, plus each integration’s scope and freshness. Profile data, identity, customer permission, and a usable destination are separate checks. A WhatsApp connection does not replace a valid window or template when required; SMS depends on sender, coverage, and limits.

**Agenda semanal**, reference **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER**, and **custom_store** source belong to a fictional draft product with no events or additional variants. The figure shows how to identify a record; it does not prove stock, a Meta catalog, a recommendation, permission, or a purchase.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identity of a fictional draft product">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/products-and-inventory-with-api/identity-en-mobile.png 2x" width="778" height="786" />
        <img class="ht-editorial-visual__image" src="/images/developers/products-and-inventory-with-api/identity-en.png" srcset="/images/developers/products-and-inventory-with-api/identity-en.png 2x" width="1006" height="786" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Identity of a fictional draft product" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Identity of a fictional draft product. Independent fictional state; no recommendation, reply, or delivery executed.</figcaption>
</figure>

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Smart Recommender**.

Smart Recommender includes:

- **Upload documents:** product notes, FAQs, policies, size guides, payment instructions, or other approved context.
- **Agent prompt:** what the recommender should do, how it should speak, what it can recommend, and when it should hand off.
- **Incoming channels:** where the playbook can respond to product questions.
- **Tone:** the voice used in replies.
- **Escalation:** whether a handoff can be requested and its destination team or teammate.
- **Web search:** approved websites the agent can use for the recommendation mission.
- **[Follow-up]({% link _journeys/how-to-customize-a-playbook-safely.md %}#customize-follow-up):** the number of nudges, the wait, and the final action if the customer stops replying.

Components and permissions may vary; also review **Audience** when available. Its filter limits admission and does not provide identity, consent, or a ready channel. The following figures show the same shared controls in independent fictional drafts; they do not show a saved or running Smart Recommender playbook.

In **Upload documents**, this Custom Agent draft has no selected or uploaded file. Saving may start processing: a selected file, saved file, provider acceptance, and ready index are different states. Use approved material and check availability before relying on it.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Upload documents without a selected file">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-en-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-en.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Upload documents without a selected file" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Upload documents without a selected file. Independent fictional state; no recommendation, reply, or delivery executed.</figcaption>
</figure>

**Incoming channels** shows **All incoming channels** and the manual alternative in an independent unsaved Property Collector draft. This choice defines where the agent can participate; it does not connect channels or prove an outgoing destination, compatible format, permission, or delivery.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Automatic or manual incoming channel selection">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-en-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-en.png" srcset="/images/captures/property-collector/channels-en.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Automatic or manual incoming channel selection" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Automatic or manual incoming channel selection. Independent fictional state; no recommendation, reply, or delivery executed.</figcaption>
</figure>

In **Tone**, **Friendly**, **Playful**, and **Exclusive** are selected without saving in another Collector draft. The control accepts one to three tones. It guides wording; it does not guarantee a reply or change tools, data, or permissions.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Three tones selected without saving">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-en-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-en.png" srcset="/images/captures/property-collector/tone-en.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Three tones selected without saving" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Three tones selected without saving. Independent fictional state; no recommendation, reply, or delivery executed.</figcaption>
</figure>

**Escalation** shows **Atención demo**, a destination team in an independent unsaved Property Collector draft. Its toggle and selector are the shared playbook controls; the figure does not represent a handed-off conversation or an assigned owner. Check the destination alongside membership, capacity, hours, and protocol. Requesting a handoff, assigning, and receiving a human reply are different stages; closing or snoozing does not reply to the customer. AI pausing depends on the applicable protocol.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Destination team in Escalation">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Destination team in Escalation" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Destination team in Escalation. Independent fictional state; no recommendation, reply, or delivery executed.</figcaption>
</figure>

**Web search** is empty in this Custom Agent draft. **https://www.example.com** is a placeholder; no site was added or searched. The tool uses saved allowed domains when available; that does not guarantee a path, exact page, fresh content, or commerce integration.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Empty Web search with placeholder">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-en-mobile.png 2x" width="844" height="408" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/web_search-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-en.png 2x" width="1256" height="432" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Empty Web search with placeholder" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Empty Web search with placeholder. Independent fictional state; no recommendation, reply, or delivery executed.</figcaption>
</figure>

Keep automatic channel selection unless you have a clear reason to limit the playbook. Some recommendation formats work better in rich channels, while others may need simpler links or text.

This playbook has an internal product-recommendation intent. You usually do not need to create manual intents for it. If you need several agents with different product missions or activation rules, use a [custom agent]({% link _journeys/custom-agent-playbook.md %}) and define those intents separately.

## Write a useful prompt

The prompt should give the recommender clear boundaries.

The empty **Prompt** in this Custom Agent draft shows the shared editor and a placeholder, without saved instructions. It helps identify the field; it does not show a Recommender reply or enable tools, a connection, permissions, or a catalog.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Empty Prompt without saved instructions">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Empty Prompt without saved instructions" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Empty Prompt without saved instructions. Independent fictional state; no recommendation, reply, or delivery executed.</figcaption>
</figure>

Include:

- What kind of customer the agent is helping.
- What products, collections, categories, or use cases matter most.
- How many products it should recommend at once.
- Which product preferences it can use with available data and tools; do not promise margin, best sellers, or stock without source support.
- Which claims require catalog or document grounding.
- When it should ask a clarifying question.
- When it should hand off instead of guessing.

Avoid instructions such as "recommend anything" or "always close the sale." They make the playbook harder to test and can push the agent outside the customer's real need.

For prompt structure, use [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).

The prompt supplements the agent’s contract and cannot expand operations or tools. Recommendations need search results; product and store facts need grounding. Do not invent URLs, prices, discounts, or availability. Clarification can help with ambiguity; an imperfect match does not require an automatic handoff.

If a configured property list and enabled Collector exist, important properties are pursued at a natural opening, normally one at a time after helping with the request. They may remain outstanding even when recommendations can continue. Optional properties can be declined; bounded resolution does not prove that a value was collected. Respect a refusal and distinguish profile data from consent.

## Why it may not answer or recommend

Smart Recommender being enabled does not mean every message will receive a product recommendation.

The playbook may not answer, may ask a clarifying question, or may hand off when:

- The customer message is not about product discovery or a new buying decision.
- Another active playbook is a better owner for the conversation.
- The customer needs order tracking, complaint resolution, or an actual refund, return, or exchange operation; grounded general guidance can remain in scope.
- The catalog has no good match for the request.
- Product data is missing, outdated, or not available in the selected channel.
- The channel cannot display the desired product card, link, or media format.
- Uploaded knowledge or approved sources do not support the answer.
- The customer needs a person to decide, approve, or resolve something.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

A greeting, frustration, or an empty search does not establish that a handoff is needed. Distinguish clarification or another search from an explicit human request or an operation outside scope. A configured destination does not guarantee an available person, capacity, immediate reply, or a universal permanent AI pause.

## How to test it

Test with realistic product questions before enabling the playbook broadly.

First inspect data and controls without generating messages. For an operational test, use an authorized isolated fictional environment, check its effects, and limit recipients. Prepare these scenarios:

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

An available Playground may persist a simulation, messages, events, and shown products; searches may record runs and call providers. It does not prove real identity, consent, eligibility, sending, or delivery. Saving and enabling are also mutations; disabling does not universally cancel queued work. If an outcome is uncertain, reconcile its state before repeating the action. The figures in this guide do not execute those scenarios.

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

Smart Recommender has a registered report, but each metric uses its own population, period, time zone, and denominator. Created, sent, and delivered messages, interaction, handoff, human reply, purchase, and attributed sale are separate checks. Attribution depends on source events and chronology; it does not turn every later purchase into this playbook’s result. Follow the reporting and attribution guides below to check the available measures.

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
