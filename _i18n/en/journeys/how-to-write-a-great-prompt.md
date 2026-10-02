The prompt describes your AI agent's purpose, voice, and boundaries. It is one part of the configuration: the playbook's tools, knowledge, channels, and rules determine what the agent can actually do.

Writing a great prompt means giving clear instructions that fit that configuration. Describe whom the agent helps, which information it should use, and what to do when it cannot confirm an answer.

If you are writing the prompt for a custom agent, first define the agent's mission, intents, knowledge, channels, and handoff path in [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %}).

In this article:

- **[What agents can do by default](#what-agents-can-do-by-default)**
- **[The anatomy of a good prompt](#the-anatomy-of-a-good-prompt)**
  - **[Identity](#identity)**
  - **[Tone](#tone)**
  - **[Context](#context)**
  - **[Behavior and boundaries](#behavior-and-boundaries)**
- **[Enriching the prompt with knowledge and rules](#enriching-the-prompt-with-knowledge-and-rules)**
- **[A Model prompt example](#a-model-prompt-example)**
- **[Best practices](#best-practices)**
- **[How Hellotext uses your prompt](#how-hellotext-uses-your-prompt)**
- **[Final reflection](#final-reflection)**

## What agents can do by default

Capabilities depend on the playbook type, available features, and configuration. Writing “check inventory” or “save the size” does not connect a store, add a tool, or authorize an operation.

When product search is available to the agent, it can use the available data to recommend items. Check the integration and source information before promising stock, prices, or delivery; a prompt does not guarantee store inventory updated in real time.

Documents, web search, property collection, and handoff also require their controls and dependencies. We will review each below. System instructions and checks help define behavior, but they do not by themselves guarantee perfect answers, identical voice in every case, or regulatory compliance.

The example shows **Agent prompt** in a new fictitious Custom Agent. The field is empty: the gray text is a placeholder, not a saved prompt. The playbook was not enabled and the Playground was not run.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Empty prompt field in a fictitious draft">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Empty prompt field in a fictitious draft" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

If that component is available, write your instructions there. Access depends on the playbook type and account features. **Go back** returns to the editor cards; check the final playbook save afterward. Seeing text in the form does not confirm it was saved. If an action's result is uncertain, read the saved configuration again before repeating it.

## The anatomy of a good prompt

A strong prompt has four main parts: identity, tone, context, and behavior. This guide's examples use **Astra** and **Lumina Atelier**, a fictitious agent and brand. They do not describe a connected store, real data, or generated replies.

### Identity

Describe who the agent is and which task it performs. You may give it a name while making clear that it is the brand's digital assistant.

> You are **Astra**, the digital assistant of *Lumina Atelier*. You help people learn about the brand's garments and choose options based on their preferences. Answer clearly and recognize when you need confirmation from the team.

This opening defines a specific role. Avoid attributing system access or authority to accept orders, returns, or agreements that the agent does not have configured.

### Tone

Choose a voice consistent with your brand and describe observable behavior: length, vocabulary, sales pressure, and questions. For example:

> Astra uses clear, short sentences with a friendly, calm tone. She asks one question at a time. She does not exaggerate benefits or pressure anyone to buy. When information is missing, she explains it directly.

If the **Tone** card is available, align its selection with the prompt. It allows one to three tones. This independent Property Collector draft shows **Friendly**, **Playful**, and **Exclusive** selected without saving. It is a fictitious combination; it does not correspond to the Astra example or demonstrate a generated reply. Tone changes wording, not facts or permissions.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Three tones selected without saving">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-en-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-en.png" srcset="/images/captures/property-collector/tone-en.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Three tones selected without saving" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

### Context

Provide the brand facts needed for the task. Separate verified facts, policies that must be consulted, and style preferences. For the fictitious brand, for example:

> Lumina Atelier designs modular cotton and viscose garments. Its style is simple and comfortable. Use authorized product descriptions for materials and care; do not extend those characteristics to every item.

Keep that information current. A brand description in the prompt does not replace a specific product description, the current policy, or data returned by a tool.

### Behavior and boundaries

Define when to ask a question, acknowledge uncertainty, and request human involvement. Write boundaries you can review in a conversation:

> Use the customer's name if available and relevant. Ask one question at a time to understand the occasion or preference.
>
> If available tools return suitable products, recommend up to three options with a clear reason and the links they provide. Do not invent products or URLs.
>
> Do not assume stock, prices, delivery times, or return terms. If the available sources cannot confirm them, explain what still needs verification.
>
> If the inquiry needs the human team, use the configured handoff when available. If you cannot perform it, explain the limitation and the authorized next step. Do not promise that someone has received the case or will reply within an unconfirmed time.

Requesting a handoff in the prompt does not create a team or by itself change a conversation's owner. Configure and review that destination separately.

## Enriching the prompt with knowledge and rules

Connect instructions to sources and controls available for that playbook. A document or URL may help ground an answer, but does not guarantee that every fact will be found, current, or interpreted correctly.

If **Upload documents** is available, choose relevant, reviewed documents. Avoid conflicting versions and personal data or secrets the agent does not need. The figure retains the complete upload area and **Choose files to upload**, with no file selected or uploaded. Selecting, saving, and making a document available for retrieval are separate states; later processing may be asynchronous.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Knowledge upload area without selected files">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-en-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-en.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Knowledge upload area without selected files" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

If **Web search** is available, configure relevant sites and check answers that depend on them. The restriction uses domains: it does not guarantee retrieval of an exact path, port, or page, or turn the site into a store integration. This draft field is empty; **https://www.example.com** is the native placeholder. No site was added and no search was run.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Empty web search with native placeholder">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-en-mobile.png 2x" width="844" height="408" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/web_search-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-en.png 2x" width="1256" height="432" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Empty web search with native placeholder" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

To collect data, configure permitted properties and explain when they are useful. Instructions do not allow saving any arbitrary profile field. Another playbook's prerequisite collection keeps its own list and needs the configured, enabled Property Collector to run. Ask only for relevant data and respect that flow's decline options and attempt limits.

The independent Property Collector draft shows **Name** marked **Important** and **Email** optional. Nothing was saved or collected. That priority does not establish identity, messaging consent, or sending permission.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Important name and optional email without collection">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 666px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/style-refresh/fields-en-mobile.png 2x" width="764" height="722" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/style-refresh/fields-en.png" srcset="/images/captures/property-collector/style-refresh/fields-en.png 2x" width="1296" height="698" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Important name and optional email without collection" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

A compatible instruction might be: “When relevant to the inquiry, request city or size through the configured properties. Do not invent values or claim they were saved without confirming the result.” Before adding it, check that those properties and the collection tool are available in your flow.

For handoff, write the reason and configure the actual destination. In the independent example, **Escalation** shows the fictitious team **Atención demo** in an unsaved draft. It is a destination team, not a playbook or an assigned conversation. It does not demonstrate availability, capacity, a human reply, or a permanent AI pause.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictitious handoff team without assignment">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictitious handoff team without assignment" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

You can instruct: “If a return requires human review, use the configured destination and explain what needs confirmation.” Naming “Returns Desk” in the text does not create that team or replace the selector. Check the destination's protocol and capacity, and keep reading [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## A Model prompt example

This is illustrative text to adapt. **lumina.example.test** is a fictitious domain; the documents, catalog, properties, and team mentioned are not configured by writing the prompt.

> **Prompt Example – Lumina Atelier**
>
> You are **Astra**, the digital assistant of *Lumina Atelier*, a fictitious brand of modular, timeless garments.
>
> Your mission is to understand what each visitor needs and help clearly. Use short sentences, a friendly, calm tone, and one question at a time. Do not pressure anyone to buy or exaggerate benefits.
>
> When catalog tools are available, recommend options based on the data they return. Do not invent stock, prices, links, or delivery dates. If information is missing, explain what needs confirmation.
>
> Consult authorized documents and lumina.example.test only if configured and available for this playbook. Prioritize the current policy relevant to the inquiry. If sources conflict or do not answer the question, do not guess.
>
> Request name, city, or size only when useful to the task and included in the configured collection. Respect customer refusals and the flow's limits. Do not claim a value was saved without confirming its result, or interpret providing data as consent to receive messages.
>
> If a complex inquiry needs a person, use the available handoff to the team configured for that case. If you cannot do so, explain the authorized next step. Do not promise assignment, replies, discounts, or results that have not been confirmed.

The example defines voice, purpose, and boundaries without attributing unavailable capabilities. Before using it, replace the fictitious data and verify each dependency of your playbook.

## Best practices

Write specific instructions you can review. Avoid slogans, contradictory rules, and action lists that the agent cannot perform. Keep the previous version and change one part at a time.

Review cases with insufficient information, conflicting sources, declined data, and requests outside the scope. Check that the agent acknowledges its limits and that the chosen tone does not lead it to invent facts or commitments.

If you use the Playground in an authorized environment, remember that it runs a simulation and may consult tools or providers. It does not establish identity, consent, eligibility, or delivery to a real customer. This guide did not run a simulation, test, or send.

Check the save and review conversations you can access. Distinguish the visible draft from the saved configuration and what happened during a conversation. If a result is uncertain, reconcile the state before repeating. To edit a playbook in use, see [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## How Hellotext uses your prompt

Depending on the playbook type, Hellotext considers activity, context, and intents when deciding which flow may respond. Intents are not a word list that always triggers an agent; flow availability and eligibility also matter.

The figure shows **Intents** in a fictitious Custom Agent. **I want to ask about a return.** remains in the input without being added: **New intent**, Enter, and Save were not used. It is not a received message, a saved intent, or a completed classification.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Intent phrase without addition or classification">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-en-mobile.png 2x" width="764" height="544" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-en.png" srcset="/images/team/ai-handoff-to-inbox/intents-en.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Intent phrase without addition or classification" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

The agent combines instructions with context and tools enabled for that flow. A prompt does not bypass access checks, property configuration, channel readiness, or sending rules.

Generation, content checks, channel selection, and scheduling vary by flow. A content check does not guarantee accuracy or regulatory compliance either. Review actual replies and results; saving a prompt or producing a proposal does not confirm a delivered message.

## Final reflection

Think of the prompt as a specific brief: whom the agent helps, how it speaks, which sources it may use, and when it should acknowledge a limitation.

A few clear instructions that fit the configuration and are reviewed against real cases help maintain a consistent voice without promising capabilities or results the agent cannot confirm.
