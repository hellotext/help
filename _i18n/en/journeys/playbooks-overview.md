Use playbooks and automations when Hellotext should read customer signals, decide what to do next, and act without someone on your team manually sending every message.

A playbook is a reusable configuration for a business mission. Depending on its type, it uses rules, defined steps, or AI to evaluate signals and propose the next action. Access, data, tools, integrations, customer permission, and the channel limit what it can do; being enabled does not guarantee a message or outcome.

If you are comparing playbooks with campaigns and the Inbox, start with [How Hellotext works]({% link _getting-started/how-hellotext-works.md %}).

A playbook can be an autonomous mission, a reactive AI agent, a journey route with defined steps, or a capture. Capture playbooks are available under **Playbooks** > **Explore playbooks** > **Capture**. Captures and campaigns have dedicated Help Center sections because their setup and operating models are different.

Signals can include carts, browsing activity, purchases, stock changes, birthdays, replies, customer profile properties, and channel eligibility.

Keep reading: [What are signals?]({% link _journeys/what-are-signals.md %}).

A signal, profile property, and saved object are different evidence. An order in Hellotext does not confirm delivery or authorize contacting the customer. Proactive playbook admission, contextual reactive-agent selection, and a journey trigger have their own rules; there is no universal AI sequence for every tool.

## Choose the right playbook type

If you are deciding where to start, use [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %}).

If you want to browse common options by business goal, use [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %}).

When you know which option you want to launch, use [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

Use a **prebuilt playbook** when the goal is common and the recommended mission already fits your business. Review its availability and prerequisites before adopting it; the template does not prove your data or channels are ready.

Use an **AI playbook or AI agent** when the experience needs to respond conversationally, use product or policy knowledge, recommend items, answer frequent questions, collect customer information, or decide when to escalate.

Scope varies by type. Instant Answers and Return & Exchange Helper provide grounded guidance; writing instructions does not give them order lookup, inventory, cancellation, or refund operations. An operation requires its specific tool, integration, access, and workflow rules. A prompt cannot create consent or sending permission.

The empty **Prompt** in this fictional **Custom Agent** draft shows where instructions go. The gray text is a placeholder; no instructions are saved and no AI response was run. Other types may expose different controls.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Empty Prompt in a Custom Agent draft">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Empty Prompt in a Custom Agent draft" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent form without saving or running AI.</figcaption>
</figure>

For new subscribers or sign-ups who have not bought yet, see [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %}). For shoppers waiting for an unavailable product, see [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %}). For shoppers who saw a product before it became cheaper, see [Price-Drop Pouncer playbook]({% link _journeys/price-drop-pouncer.md %}). For browse intent that did not become a cart, see [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %}). For product discovery specifically, see [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %}). For complements to products in an eligible confirmed order linked to the customer, see [Complete-the-Look playbook]({% link _journeys/complete-the-look-playbook.md %}). For add-ons after an eligible purchase, see [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %}). For repeat purchase on consumable products, see [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %}). For birthdays saved on the profile, see [Birthday Bash playbook]({% link _journeys/birthday-bash-playbook.md %}). For the first recorded purchase anniversary with valid signals and source entity, see [Anniversary Surprise playbook]({% link _journeys/anniversary-surprise-playbook.md %}). For customers who are starting to go quiet, see [Soft Reactivation playbook]({% link _journeys/soft-reactivation-playbook.md %}). For customers who meet that playbook’s inactivity criteria, see [Dormant Revival playbook]({% link _journeys/dormant-revival-playbook.md %}). For customers who are inactive or not reactivated and meet its criteria, see [Sunset Saver playbook]({% link _journeys/sunset-saver-playbook.md %}). For order-status questions, see [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %}). For post-delivery product reviews, see [Review Builder playbook]({% link _journeys/review-builder-playbook.md %}). For loyalty after delivery, see [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %}). For satisfaction after resolved conversations, see [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %}). For frequent support questions, see [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %}). For guided return or exchange support, see [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %}). For cancellation requests, see [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %}). For a custom reactive agent with your own intents, prompt, knowledge, channels, tone, and handoff, see [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %}).

Use a **journey route** when you need a multi-step customer flow with a trigger, messages, waits, conditions, branches, and handoffs. A basic abandoned-cart follow-up can be [Cart Saver route]({% link _journeys/cart-saver-route.md %}); an AI abandoned-cart playbook can make more dynamic decisions based on signals and customer context.

Each step has a purpose and order matters. **Assignment** shows five actions in an independent fictional new-journey form, without saving. Selecting an action is different from replying to the customer; this figure does not show a constructed route, confirmed trigger, or processed conversation.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actions in a journey Assignment step">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-en-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-en.png" srcset="/images/team/ai-handoff-to-inbox/assignment-en.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Actions in a journey Assignment step" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent component; no journey saved, published, or run.</figcaption>
</figure>

For that specific choice, see [Cart Saver route]({% link _journeys/cart-saver-route.md %}), [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %}), and [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

Use a **campaign** when you want a one-time send to a selected audience, and a **capture** when the goal is to collect subscribers, customer data, or website conversations. For an on-site conversation entry point, see [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %}).

This fictional catalog shows the **Popup** and **Form** cards in **Capture**; the narrow view focuses on the Form card from the same desktop interface. Recognizing a card does not prove the tool is saved, published, visible, or installed, or that it received a submission or consent. Checkout opt-ins belong to their integrations.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Popup and Form in the Capture catalog">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/desktop-form-en.png 2x" width="800" height="480" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/en/catalog-desktop-row.png" srcset="/images/captures/forms/en/catalog-desktop-row.png 2x" width="1632" height="480" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Popup and Form in the Capture catalog" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Desktop catalog and Form focus; no capture executed.</figcaption>
</figure>

## Before you enable a playbook

Confirm that the data and channels it depends on are ready.

Check the business, type, role, plan or quota, and available components. Verify each signal’s source and date, customer identity and destination, applicable permission, and channel readiness. A visible address, profile status, or incoming-channel list does not establish that whole path.

**Camila Torres** is a fictional **Unconfirmed** profile with an example email and no phone number. The figure separates saved fields from verified identity or permission to contact; its narrow view is a desktop focus. No message was sent or subscription changed.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fields of a fictional unconfirmed profile">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fields of a fictional unconfirmed profile" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent profile; visible data does not prove consent or delivery.</figcaption>
</figure>

For the full launch flow, use [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

When you need to change an existing setup, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

If a playbook is active but does not send when you expected, use [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}) before changing the setup.

When you need to diagnose one concrete example, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

For commerce playbooks, make sure your store integration is connected and recent activity appears on customer profiles as usable signals.

For WhatsApp playbooks, check the connection, destination, and permission. When the flow requires a template, verify its active version and approval; the conversation window and channel restrictions also matter.

For SMS playbooks, check the sender, destination coverage, permission, and applicable limits. The business country or a WhatsApp connection does not establish an available SMS route.

## What to check before publishing

- The trigger matches the customer action you want to react to.
- The signals the playbook depends on are available and current.
- Messages use the right channel and tone.
- Wait steps give customers enough time before the next follow-up.
- Conditions and branches send people down the right path.
- Coupons, links, tags, and product recommendations are working.
- Human handoff rules are clear when a conversation should leave the route or agent.
- Frequency, consent, and quiet-hour limits are clear so playbooks do not compete for the same customer in the same moment.

Apply this list to controls present in your type: an autonomous playbook may not have editable waits or branches. Frequency and competition rules have their own populations and exceptions; they do not promise a send at an exact time. Incoming-channel selection does not guarantee an outgoing channel or delivery.

In this independent fictional **Property Collector** draft, **Tone** has **Friendly**, **Playful**, and **Exclusive** selected without saving. Types offering this control allow one to three tones; they guide style without guaranteeing a reply or expanding scope.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Three selected tones in a draft">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-en-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-en.png" srcset="/images/captures/property-collector/tone-en.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Three selected tones in a draft" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved selection; no AI response.</figcaption>
</figure>

## Keep improving after launch

Handoff must distinguish a request, destination team, owner, assignable members, capacity, hours, protocol, and human reply. Closing or snoozing a conversation is not a reply. AI pauses according to the applicable protocol; do not assume a universal permanent pause.

This existing fictional Inbox policy shows **five minutes** for each response target, unchanged. These are attention targets subject to calendar and rules; they are not an execution, sending, or delivery SLA for every playbook. The figure does not show a received reply.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Existing response targets in Inbox">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-en-mobile.png 2x" width="824" height="804" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/default-en.png" srcset="/images/team/understanding-response-times/default-en.png 2x" width="972" height="764" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Existing response targets in Inbox" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent unchanged policy; no promise of reply or delivery.</figcaption>
</figure>

Start with a focused audience and review the first conversations before expanding. Look for replies, missed expectations, broken links, timing issues, and places where a human had to step in.

Use what you learn to adjust only the controls that playbook type exposes: prompts for agents; waits, branch conditions, or template copy for routes; and tone, offer strategy, or channels for autonomous sales playbooks. For revenue, conversion, and handoff metrics, use [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %}).

For a safer editing process, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

Distinguish local configuration, final saving, and enabling: saving can persist components, create a workflow, or initiate file processing. Selecting or saving a document does not prove its provider index is ready. Disabling does not universally cancel queued work. If an operation’s outcome is uncertain, reconcile its state before repeating it.

Use Playground only if available and you understand its effects: it may save a simulation, messages, or events and call a provider. A simulated response does not prove real identity, consent, eligibility, or delivery. This guide did not run tests.

Choose a report available for that type and define its population, period, and denominator. Not every playbook or journey has a dedicated report; resolution, handoff, send, delivery, return, and attributed sale are different outcomes. A screenshot or configuration change is not proof of performance.

## Related guides

- [What are signals?]({% link _journeys/what-are-signals.md %})
- [How Hellotext works: playbooks, campaigns, and Inbox]({% link _getting-started/how-hellotext-works.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
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
