Use this library to explore common Hellotext playbooks by mission.

A mission is the business job the playbook is meant to perform: grow your reachable audience, convert shoppers, recover carts, support customers, retain buyers, win back inactive customers, or build a custom flow.

Availability can vary by account, plan, connected channels, data sources, and rollout status. Use this guide as a decision map, then confirm the exact playbook options available in your Hellotext account.

Also check type, role, access, quota, and available tools. This library helps you choose; each linked guide retains its own requirements and controls. An enabled playbook, signal, or saved profile does not guarantee admission, a reply, contact permission, or delivery.

## Grow your reachable audience

Start here when you do not yet have enough customers subscribed or identified for the next playbook to perform well.

Common options include:

- **[Webchat Widget]({% link _captures/webchat-widget-playbook.md %}):** chat with visitors directly on your site.
- **[Subscriber Booster]({% link _captures/subscriber-booster-playbook.md %}):** use AI to introduce clear subscription consent and relevant incentives within Webchat or customer-initiated WhatsApp conversations.
- **[Property Collector]({% link _captures/property-collector-playbook.md %}):** collect missing customer profile properties directly or as a prerequisite for another playbook.
- **QR Code Subscriber:** prepare an SMS or WhatsApp entry point; scanning or opening the link does not subscribe someone by itself.
- **Website Popup:** capture visitors at the right moment.
- **Website Form:** collect leads and customer profile data.
- **Shareable Link:** let customers opt in from anywhere.

These capture tools usually depend on a connected channel, clear opt-in language, and source tracking. The customer profiles and signals they create can then feed the next playbook, route, campaign, or Inbox conversation.

In **Capture**, this fictional catalog shows **Popup** and **Form**. The narrow view focuses on Form from the same desktop interface. A card identifies the tool; it does not prove publication, installation, submitted data, or consent. Checkout opt-ins belong to their integrations.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Popup and Form in the Capture catalog">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/desktop-form-en.png 2x" width="800" height="480" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/en/catalog-desktop-row.png" srcset="/images/captures/forms/en/catalog-desktop-row.png 2x" width="1632" height="480" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Popup and Form in the Capture catalog" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent desktop catalog; no capture executed.</figcaption>
</figure>

In this fictional **QR** form, **SMS** is selected and **WhatsApp** disabled. This state does not connect a channel or subscribe a person: the customer must send the message with its reference and it must be processed according to the flow. Nothing was scanned or sent.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="SMS or WhatsApp type for a QR code">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 678px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/type-en-mobile.png 2x" width="740" height="1500" />
        <img class="ht-editorial-visual__image" src="/images/captures/qr-codes/type-en.png" srcset="/images/captures/qr-codes/type-en.png 2x" width="1320" height="1310" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="SMS or WhatsApp type for a QR code" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent unsaved draft; WhatsApp unavailable, nothing sent.</figcaption>
</figure>

Keep reading: [Capture tools overview]({% link _captures/capture-overview.md %}).

## Convert shoppers

Start here when customers show buying intent but do not complete a purchase.

Common options include:

- **[First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}):** turn new subscribers or sign-ups into first-time buyers.
- **[Cart Saver]({% link _journeys/cart-saver-route.md %}):** recover abandoned carts with a predictable route.
- **[AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}):** recover carts with conversational, context-aware follow-up.
- **[Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}):** re-engage customers who viewed products without buying.
- **[Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}):** propose products from available behavior and catalog context, within its tools and integration.
- **[Complete-the-Look]({% link _journeys/complete-the-look-playbook.md %}):** propose complements from an eligible confirmed order and its products.
- **[Price-Drop Pouncer]({% link _journeys/price-drop-pouncer.md %}):** notify interested shoppers automatically when a product price drops.
- **[Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}):** alert shoppers when an item is available again.

These playbooks usually depend on product, cart, checkout, catalog, stock, price, and purchase signals.

Check the source, product identity, signal date, and integration coverage. A saved price is not stock; having a product does not prove universal live availability or a ready checkout. Admission and send-time checks may discard a proposal when purchases, price, or availability change; each type applies its own rules.

**Agenda semanal**, reference **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER**, and **custom_store** source belong to a fictional draft product with no events or additional variants. This figure identifies catalog data; it does not show inventory, a recommendation run, a Meta catalog, or a purchase.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identity of a fictional draft product">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/products-and-inventory-with-api/identity-en-mobile.png 2x" width="778" height="786" />
        <img class="ht-editorial-visual__image" src="/images/developers/products-and-inventory-with-api/identity-en.png" srcset="/images/developers/products-and-inventory-with-api/identity-en.png 2x" width="1006" height="786" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Identity of a fictional draft product" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent product; no stock, recommendation run, or purchase.</figcaption>
</figure>

For cart recovery specifically, start with [Cart Saver route]({% link _journeys/cart-saver-route.md %}), [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}), or compare both options in [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## Retain and grow customer value

Start here when you already have purchase history and want customers to buy again, buy more, or stay engaged.

Common options include:

- **[Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}):** re-engage customers who meet the corresponding inactivity-stage criteria.
- **[Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}):** suggest related products after an eligible purchase.
- **[Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}):** remind customers to reorder when they may be running out.
- **[Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}):** prepare a birthday communication when the date and flow requirements exist; any incentive depends on configuration and capability.
- **[Anniversary Surprise]({% link _journeys/anniversary-surprise-playbook.md %}):** celebrate the anniversary of the first purchase backed by valid signals, under that playbook’s rules.

These playbooks usually depend on purchase history, product timing, loyalty or profile data, and clear rules for how often customers should hear from you.

Replenishment estimates a time from purchases and products; it does not measure how much the customer physically has left. A custom date does not replace a purchase-anniversary event. Check incentives, integration, currency, and specific limits: instructions cannot create a coupon, credit, or operational authorization.

## Win back inactive customers

Start here when customers have not purchased, visited, clicked, or replied for a longer period.

Common options include:

- **[Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}):** reactivate customers who meet their activity cycle’s Dormant-stage criteria.
- **[Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}):** propose re-engagement for customers meeting the churn-risk stage criteria; it does not promise an unsubscribe or universal suppression of future contact.

Win-back playbooks should be careful with frequency, tone, offer strength, and suppression rules. If customers do not respond, reduce pressure rather than continuing to send.

Stages use recorded activity and lifecycle transitions; they are not universal deadlines counted from any message. New activity can invalidate a reactivation proposal. Per-playbook and shared frequency limits have different populations and exceptions from campaigns, journeys, or reactive replies. Choosing an eligible channel does not guarantee the lowest cost, an exact time, or ROI. Check exclusion rules and customer permission separately.

## Use planned moments and campaigns

Start here when the message is tied to a launch, promotion, holiday, inventory moment, or one-time announcement.

These planned moments normally belong in Campaigns unless your account exposes a specific playbook for the job. Common workflows include seasonal promotions, product launches, inventory or clearance announcements, scheduled campaigns, and AI-personalized campaigns when that option is available in your account.

Use a campaign when the send should happen once to a selected audience. Use a playbook when the system should keep reacting to customer signals over time.

Keep reading: [Campaigns overview]({% link _campaigns/campaigns-overview.md %}).

## Improve support and customer experience

Start here when the goal is to answer questions, reduce repetitive support work, or improve the post-purchase experience.

Common options include:

- **[Order-Update Delight]({% link _journeys/order-update-playbook.md %}):** send order updates and answer order-status questions.
- **[Review Builder]({% link _journeys/review-builder-playbook.md %}):** collect product reviews after delivery.
- **[NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}):** measure loyalty after customers have received an order.
- **[CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}):** collect satisfaction after an eligible resolved conversation, under its interaction, channel, and frequency requirements.
- **[Instant Answers]({% link _journeys/instant-answers-playbook.md %}):** answer common questions with an AI support agent.
- **[Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}):** provide grounded policy and next-step guidance for returns or exchanges; it does not approve or perform the operation.
- **[Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}):** handle cancellation requests and retention options within policy, tools, and integration capability.

Review Builder, NPS Pulse, and CSAT Pulse can be active together when the underlying moments are different: product review after delivery, loyalty after a delivery experience, and satisfaction after a resolved conversation.

These playbooks usually depend on order data, policy content, uploaded documents, clear handoff rules, and Inbox ownership.

An order or supplied reference does not prove identity or authorized access. Tracking, cancellation, refund, or credit require specific tools and capabilities; a prompt, URL, or document cannot provide them. Surveys have their own sources, audience, and waits: resolution is different from delivery, and a request is different from a recorded response.

**Escalation** shows **Atención demo**, a destination team selected without saving in an independent fictional Property Collector draft. It is not a playbook or received assignment. Distinguish request, team, owner, membership, capacity, hours, protocol, and human reply; closing or snoozing does not reply to the customer, and AI pausing depends on the applicable protocol.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Destination team in Escalation">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Destination team in Escalation" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent unsaved draft; no assignment or human reply.</figcaption>
</figure>

Keep reading: [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Build a custom flow

Start here when none of the prebuilt missions fit your exact process.

Use **Journey Builder** when you need a controlled route with triggers, waits, messages, questions, conditions, assignments, and branches.

This fictional new **Assignment** form shows five complete actions. It is an independent unsaved component; it does not show a constructed route, confirmed trigger, or processed conversation. Step order and the selected action matter.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Five actions in the Assignment step">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-en-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-en.png" srcset="/images/team/ai-handoff-to-inbox/assignment-en.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Five actions in the Assignment step" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent component; no journey saved, published, or run.</figcaption>
</figure>

Use **[Custom Agent]({% link _journeys/custom-agent-playbook.md %})** when you need an AI agent for a specific job, with custom instructions, intents, uploaded knowledge, incoming channels, actions, and handoff rules.

The empty **Prompt** in this fictional Custom Agent draft contains a placeholder, not saved instructions. Writing instructions does not enable tools, connections, consent, or permissions. Available components vary by type; the figure does not show an AI response.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Empty Custom Agent Prompt">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Empty Custom Agent Prompt" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent draft without saved instructions or AI execution.</figcaption>
</figure>

Custom flows are powerful, but they need clear boundaries: what starts the flow, what the customer should experience, what data the flow needs, when it should stop, and when a teammate should take over.

Keep reading:

- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Custom journey]({% link _journeys/custom-journey.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})

## Choose the right mission

If you are unsure where to start, choose the mission that matches the first bottleneck.

| If the bottleneck is... | Start with... |
| --- | --- |
| Not enough reachable customers | [Subscriber Booster]({% link _captures/subscriber-booster-playbook.md %}), QR codes, website forms or popups, shareable links, or [Webchat Widget]({% link _captures/webchat-widget-playbook.md %}) |
| Customer profiles are missing useful properties | [Property Collector]({% link _captures/property-collector-playbook.md %}) |
| Customers abandon carts | [Cart Saver]({% link _journeys/cart-saver-route.md %}) or [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) |
| Shoppers are waiting for unavailable products | [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}) |
| Shoppers showed interest before a meaningful price drop | [Price-Drop Pouncer]({% link _journeys/price-drop-pouncer.md %}) |
| Shoppers need help choosing products or complements | [First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}), [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}), [Complete-the-Look]({% link _journeys/complete-the-look-playbook.md %}) (only with an eligible confirmed order), or [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) |
| Buyers do not return | [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}), [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}), [Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}), [Anniversary Surprise]({% link _journeys/anniversary-surprise-playbook.md %}), or [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) |
| Customers have gone cold | [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}) or [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) |
| You have a timed announcement | A campaign |
| Support work is repetitive | [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}), or [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) |
| You need product reviews | [Review Builder]({% link _journeys/review-builder-playbook.md %}) |
| You need loyalty feedback after delivery | [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) |
| Your process is unique | Journey Builder or [Custom Agent]({% link _journeys/custom-agent-playbook.md %}) |

Choose one mission and check its audience, data, and channels before expanding. Verify each stage with its own evidence: configuration, admission, created message, delivery, and reply or purchase are different outcomes. A first run does not prove every permission or handoff path.

## Before launching any playbook

Confirm:

- The required signals exist on customer profiles.
- The audience is eligible and has consent for the channel.
- The channel, sender, or WhatsApp account is ready.
- Product, cart, order, catalog, or policy data is available when needed.
- Messages, templates, links, discounts, and recommendations are tested.
- Handoff or assignment paths are clear.

**Camila Torres** is a fictional **Unconfirmed** profile with an example email and no phone. Saved fields do not establish verified identity, consent, a usable destination, or delivery. The narrow view is a desktop focus; no subscription changed and no message was sent.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional Unconfirmed profile">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional Unconfirmed profile" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent profile; data does not prove identity, permission, or delivery.</figcaption>
</figure>

Check WhatsApp, active template version and approval when required, window, and destination permission; for SMS, check sender, coverage, and applicable limits. A connection or business country does not establish readiness for every channel. Apply this list only to controls and tools present in the playbook.

Saving may persist components, create a workflow, or start file processing. A saved document does not confirm a ready index; enabling does not guarantee execution, and disabling does not universally cancel queued work. An available Playground may persist a simulation, messages, or events and call a provider; it does not prove real identity, consent, eligibility, or delivery. If an outcome is uncertain, reconcile its state before repeating the operation.

Choose a report available for that type and define its population, period, and denominator. Not every playbook or journey has a dedicated report or sales attribution. Resolution, handoff, send, delivery, return, survey response, and attributed sale are different outcomes.

Keep reading:

- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Subscriber Booster playbook]({% link _captures/subscriber-booster-playbook.md %})
- [Property Collector playbook]({% link _captures/property-collector-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %})
- [Price-Drop Pouncer playbook]({% link _journeys/price-drop-pouncer.md %})
- [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Complete-the-Look playbook]({% link _journeys/complete-the-look-playbook.md %})
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
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
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})

## Related guides

- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Subscriber Booster playbook]({% link _captures/subscriber-booster-playbook.md %})
- [Property Collector playbook]({% link _captures/property-collector-playbook.md %})
- [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %})
- [Price-Drop Pouncer playbook]({% link _journeys/price-drop-pouncer.md %})
- [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Complete-the-Look playbook]({% link _journeys/complete-the-look-playbook.md %})
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Birthday Bash playbook]({% link _journeys/birthday-bash-playbook.md %})
- [Anniversary Surprise playbook]({% link _journeys/anniversary-surprise-playbook.md %})
- [Soft Reactivation playbook]({% link _journeys/soft-reactivation-playbook.md %})
- [Dormant Revival playbook]({% link _journeys/dormant-revival-playbook.md %})
- [Sunset Saver playbook]({% link _journeys/sunset-saver-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [How Hellotext works]({% link _getting-started/how-hellotext-works.md %})
