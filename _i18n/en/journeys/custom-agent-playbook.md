Use this guide when you need an AI agent for a specific business job that a prebuilt Hellotext playbook does not cover.

Custom Agent is a reactive AI playbook for a specific job. Intents help select an enabled playbook from the message context; the prompt guides its response, and configured components define the available knowledge, incoming channels, and handoff destinations.

It is not a journey route. You do not build a fixed sequence of waits, messages, conditions, and branches. You define what the agent owns, what should activate it, what knowledge it can use, and who should take over when the conversation needs a person.

## What Custom Agent does

Custom Agent helps you create one or more specialized AI agents.

It can:

- Participate in contextual selection when an enabled playbook has an intent relevant to the customer message.
- Follow a custom agent prompt for a specific mission.
- Use uploaded documents, approved websites, or other enabled knowledge sources.
- Respond in the incoming channels you allow.
- Use the tone you choose for the agent.
- Request handoff to the configured teammate or team when the customer needs human help, subject to available reception, assignment, and capacity.
- Work alongside other active playbooks, as long as each one has a clear job.

Custom Agent works best when each agent owns a narrow mission. A good custom agent is not "answer anything." It is closer to "answer warranty questions for this product line," "explain documented wholesale purchase requirements," "explain care instructions for a product line," or "handle store pickup questions."

## When to use it

Use Custom Agent when the work is conversational, reactive, and specific.

It is a good fit when:

- No prebuilt playbook matches the job closely enough.
- You need multiple agents that activate from different customer intentions.
- The agent needs custom instructions that are specific to your business.
- The answer depends on uploaded policies, product notes, sizing guidance, warranty rules, store information, or approved websites.
- The agent should answer from authorized information and request handoff when the customer asks for a person or the work is outside its scope.
- A journey route would be too rigid because the customer can ask the same thing in many ways.

## When not to use it

Do not use Custom Agent just because it is flexible.

Use a prebuilt playbook when the mission already exists. For example:

- Use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) for product discovery and recommendations.
- Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) for order and shipment status.
- Use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) for common support questions that can be answered from approved knowledge.
- Use [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) for guided return or exchange support when the prebuilt mission fits.
- Use [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) for guided cancellation support and approved save-the-sale paths when the prebuilt mission fits.
- Use [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) for abandoned cart recovery.
- Use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) for satisfaction feedback after resolved conversations.

Use a [journey route]({% link _journeys/getting-started-with-journeys.md %}) when the experience must follow explicit steps, waits, questions, conditions, assignments, and branches.

Use a campaign when the message should be sent once to a selected audience. Use a capture when the job is to collect subscribers or profile data.

## What it needs before launch

Before enabling a custom agent, confirm the setup it depends on.

Check that:

- The agent has one clear mission.
- The intents are specific enough that they do not overlap heavily with other active agents or playbooks.
- The prompt explains what the agent should do, what it should not do, and when it should hand off.
- Uploaded documents or approved sites are current and do not contradict each other.
- The selected incoming channels are connected and ready.
- The agent has a valid handoff destination, and the team understands its capacity, business hours, and handling protocol.
- Your team knows how to review conversations that were answered, unresolved, or handed off.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Custom Agent**. Availability depends on the playbook type, account features, your role, and configuration quota. A component available in another playbook may not be available here.

Opening a new playbook prepares a draft; it does not create or enable it on its own. Going back from a component retains local changes. The final save can create or clone the playbook and persist its configuration; enabling it can also submit those changes. Check what was saved and what is enabled before continuing.

Custom Agent exposes:

- **Intents:** customer needs that help select the agent by context, rather than exact keywords.
- **Agent prompt:** the agent's mission, instructions, boundaries, tone guidance, and escalation rules.
- **Upload documents:** policies, product notes, FAQs, size guides, warranty rules, operational instructions, or other approved context.
- **Incoming channels:** where the agent can respond when customers message you.
- **Escalation or assignment:** who should take over when the agent needs help.
- **Tone:** the voice used in replies.
- **Web search, when available:** approved domains for the search tool. An integration or external tool needs its own configuration and access; writing an HTTP request in the prompt does not add an external request tool.
- **[Follow-up]({% link _journeys/how-to-customize-a-playbook-safely.md %}#customize-follow-up):** the number of nudges, the wait, and the final action if the customer stops replying.

**Incoming channels** determines which incoming messages can participate. All incoming channels and manual selection are different options; choose according to your scope and actual connections. This control does not configure the outgoing channel, destination, consent, or a guarantee of response or delivery.

The figure shows the shared control in an independent fictitious Property Collector draft: **All incoming channels** is selected, with manual selection available. No channel was saved or connected.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="All incoming channels selected without connection or sending">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-en-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-en.png" srcset="/images/captures/property-collector/channels-en.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="All incoming channels selected without connection or sending" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with an independent fictitious state; no save or execution in this batch.</figcaption>
</figure>

**Tone** lets you choose one to three tones to guide the voice. It does not replace instructions or guarantee a particular response. The figure is another independent fictitious Collector draft: **Friendly**, **Playful**, and **Exclusive** are selected without saving; it is not a generated reply.

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

## Define clear intents

An intent describes a customer need. Classification uses conversation context and enabled playbooks; it is not a literal phrase search or a promise of exclusive selection. Enabling or disabling a playbook affects admission of new work, but does not prove that already queued work was canceled.

Write intents in customer language, not internal feature language. Include a few realistic ways a customer would ask for the same thing.

The fictitious **Intents** draft shows “I want to ask about a return.” in the field, without adding, saving, or classifying it. It does not show a received conversation or an activated playbook.

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

Good intents are specific:

- "The customer wants to know the documented warranty conditions for a product."
- "The customer asks how to care for a product according to its approved instructions."
- "The customer wants to know the documented requirements for collecting a purchase in store."

Weak intents are too broad:

- "Support"
- "Question"
- "Products"
- "Help me"

If two custom agents have similar intents, customers may route to the wrong one. Split them by mission, product area, channel, language, or outcome only when the difference is useful and testable.

## Write the agent prompt

The prompt tells the agent how to do the job when selected. Custom Agent requires nonempty saved instructions. The prompt does not add tools, permissions, integrations, consent, or authority to modify data on its own. It also does not enable product recommendations or live order tracking: those tasks belong to specialized playbooks.

The figure shows an empty **Prompt** in a fictitious Custom Agent draft. The gray text is a placeholder, not saved instructions or an agent response.

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

Include:

- The agent's mission.
- The customer situation it should handle.
- The information it can use.
- The answers or actions it is allowed to provide.
- What it should ask when information is missing.
- What it must not promise, approve, modify, or decide.
- When it should hand off to a person or team.
- How it should explain the handoff to the customer.

Avoid prompts that ask the agent to solve every support and sales case. If one prompt needs too many exceptions, create a narrower agent or use a prebuilt playbook instead.

For prompt structure, use [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Add knowledge carefully

Uploaded documents and approved sites can provide business context when their components and tools are available.

In **Upload documents**, choosing a file, saving the playbook, and having the file ready for retrieval are separate stages. Subsequent processing is asynchronous: a saved file does not prove the tool can already find its contents. Check readiness and the answer against its source, rather than relying on the filename.

The figure is an independent fictitious Custom Agent draft with an empty upload area. No file was chosen or uploaded.

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

**Web search** configures domains for the available search tool. A site is normalized to its hostname; this does not guarantee retrieval of an exact page, path, or port, the whole website, or always current information.

The figure shows an empty field with the native `https://www.example.com` placeholder. No site was added or search executed.

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

Use them for:

- Policies, FAQs, product education, size guides, service rules, warranty rules, and store information.
- Stable instructions the team already trusts.
- Details that are not already available through your connected store, catalog, order, or customer profile data.

Do not use stale files, conflicting policies, draft internal notes, or unsupported claims. If the source changes, update the document or approved website before expecting the agent to answer correctly.

Knowledge does not replace structured data. If the mission needs orders, a catalog, profile properties, consent, or tracking events, verify the integration and specific tool that exposes them. Not every agent type receives all properties or universal real-time inventory. Collecting a property requires the configured valid items and, where applicable, an enabled Property Collector; requesting it in the prompt does not expand that scope or grant consent.

## Configure handoff

Custom agents should know when to stop.

Configure a valid escalation or assignment destination and explain when to use it. Selecting a team, receiving the conversation, assigning an owner, and obtaining a reply are separate stages. Capacity, assignable people, business hours, and handling protocol can leave work pending; do not promise an immediate reply or that every handoff permanently pauses AI.

The figure shows the shared **Escalation** control in an independent fictitious Property Collector draft, with **Atención demo** as the destination team. It is not a playbook name, completed assignment, or reply; this draft was not saved or enabled.

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

Common handoff cases include:

- The customer explicitly asks for a person.
- The customer requests work outside the playbook's scope or not authorized by its instructions and tools.
- The customer asks to manage a defective, damaged, wrong, or missing product, or to perform a refund, cancellation, exception, account change, or human sales action that the agent cannot carry out.
- An in-scope request remains unresolved after at least two genuine tool attempts, the need is clearly beyond the available tools or verified information, and retrying, another available action, grounded context, or useful clarification cannot make progress.

Frustration, one failed search, or an isolated tool error is not enough for handoff. An informational policy question can be answered from authorized information; it is different from asking the agent to perform an operation. If a request is ambiguous and could be in scope, the agent should ask a clarifying question before deciding.

For the handoff model, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## How to test it

First review instructions, sources, intents, and destinations using written examples. If your account and playbook type offer Playground, treat it as a simulation: it can save a test conversation, apply draft changes to the simulation, and call AI providers. It does not use a real contact identity or prove consent, eligibility, channel sending, or delivery.

To check actual behavior, agree on an isolated test environment, fictitious profiles, and authorized channels you control. Separate content review from testing reception, classification, assignment, and delivery; enabling or sending has effects. Evaluate:

- A message that should activate the custom agent.
- A message that sounds similar but should activate a different playbook.
- A message that should not activate any custom agent.
- An ambiguous message that should prompt a clarifying question before deciding whether it is outside scope.
- A message that requires uploaded knowledge.
- A message where the uploaded knowledge is missing or unclear.
- An explicit request for a person or an out-of-scope operation; compare it with a complaint or policy question that the agent can handle without handoff.
- A message in each incoming channel you plan to use.
- A case needing web search or an integrated tool that is actually available, alongside a case where it cannot obtain a sufficient source.

Review whether the agent is selected from the right intents, stays in scope, uses the right source, avoids guessing, and formats the reply correctly. Verify the handoff destination, assigned owner, and reply separately. This guide’s figures are independent drafts; they do not prove any of those results. If saving, enabling, or running a test has an uncertain outcome, reconcile the state before repeating the action.

## What to review after launch

During the first days, review:

- Which customer messages activated the agent.
- Which messages should have gone to a different playbook.
- Whether intents are too broad, too narrow, or overlapping.
- Whether the prompt gave the agent enough boundaries.
- Whether uploaded knowledge answered the real questions customers asked.
- Whether handoffs were expected and went to the right teammate or team.
- Whether the agent answered unsupported questions or avoided useful answers it could have handled.
- Resolution, handoff, and response times using the available conversations and tools. Review opt-outs, failures, conversion, and attributed revenue only when relevant to the flow and report being consulted; these are not all guaranteed metrics in a dedicated Custom Agent report.

Compare the same period and population, retain denominators, and distinguish a resolved conversation from a delivered message or an attributed sale. Tune one thing at a time: intent wording, prompt, uploaded knowledge, approved websites, channel selection, tone, or handoff destination. Review the saved and enabled state after the change.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
