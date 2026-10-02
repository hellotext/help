Use this guide when a playbook did not behave the way you expected.

Start with one customer profile, one playbook, and one moment in time. Broad problems are much easier to diagnose after you can explain one concrete example.

If you are trying to understand the overall decision model first, read [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Before you change anything

Collect the facts first:

- The playbook name and type.
- The customer profile you expected to enter or receive a message.
- The approximate time the signal, message, or route step happened.
- The signal, intent, audience, route trigger, or customer message you expected to start the playbook.
- The channel you expected Hellotext to use.
- What actually happened: nothing, a delay, another channel, a handoff, or a different playbook.
- Any recent changes to integrations, tracking, channel setup, prompts, intents, knowledge, offers, or handoff settings.

Do not edit the prompt, intents, route, or channels until you know which part of the path failed.

Distinguish a recorded signal, admission, queued work, a created message, sending, and delivery. An existing signal or conversation alone does not show that the playbook triggered. If an earlier action has an uncertain result, reconcile its state before repeating it; do not resend, retry, or generate another signal for diagnosis without authorization and control of the destination.

## 1. Identify the playbook type

Different playbooks fail in different places.

| Playbook type | What usually starts it | What to check first |
| --- | --- | --- |
| Active sales playbook | A commerce or behavior signal | Signal, audience, customer eligibility, frequency, timing, product data. |
| Reactive support playbook | An incoming customer message | Incoming channel, intent/scope, knowledge, handoff rules. |
| Custom agent | A configured intent or routing decision | Intents, incoming channels, overlap with other agents, escalation target. |
| Journey route | A trigger and route conditions | Trigger, wait steps, conditions, branches, assignments, stop/end state. |
| Campaign-style playbook | A selected audience and send setup | Audience, channel readiness, consent, schedule, message validity. |

If the wrong playbook type is being used, the symptom may look like a bug when it is really a mismatch between the mission and the setup.

Check the concrete type and its plan, feature, role, quota, data, and tool requirements. A prompt, file, or URL does not give a playbook order lookup, inventory, cancellation, refund, or an external connection. Proactive rules, reactive selection, and journeys do not share every control or limit.

## 2. Confirm the playbook is enabled

Open **Playbooks** and check the playbook status.

Check the saved playbook state and, where applicable, its workflow state separately. Disabling affects admission of new activity; it does not prove that all queued work, processing, or provider requests were canceled. Do not enable it as a test: confirm signals, channels, knowledge, and handoff first. Saving changes to an active journey does not automatically turn it into a draft.

Also confirm you are looking at the correct version. Some playbooks can exist only once for the business. [Custom agents]({% link _journeys/custom-agent-playbook.md %}) and custom playbooks may have multiple versions with similar names.

## 3. If the playbook did not trigger

Use this section when there is no evidence that the playbook started.

Check:

- The expected signal exists on the customer profile.
- The signal matches the source, business, profile or object, and period required by that type; check when the integration or capture was installed and when activity was recorded and processed.
- The signal name and properties match what the playbook expects.
- The customer profile matches the playbook audience.
- The playbook is active in the same business where the activity happened.
- The route trigger, condition, or branch matches the profile.
- The incoming customer message matches the intent or support scope.
- Contextual selection, an already queued journey, an AI pause, or another playbook’s priority does not explain the observation; review its concrete evidence.

If the signal is missing from the customer profile, stop here and use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

In **Actions**, compare the exact name with the expected signal. The fictional **appointment.booked / Appointment booked** definition is saved and has no occurrences; defining an action does not record an event or start a journey.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional appointment.booked definition in Actions">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-en-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-en.png" srcset="/images/developers/custom-actions/catalog-en.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional appointment.booked definition in Actions" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent definition with zero occurrences; not an event or triggered journey.</figcaption>
</figure>

For a Custom Agent, compare **Intents** with the request and its context. The fictional phrase **I want to ask about a return.** is in a draft without being added, saved, or classified. An intent is not an exact keyword rule or evidence that an active agent was selected.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Return phrase not added in Intents">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-en-mobile.png 2x" width="764" height="544" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-en.png" srcset="/images/team/ai-handoff-to-inbox/intents-en.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Return phrase not added in Intents" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent Custom draft; no classification or conversation executed.</figcaption>
</figure>

## 4. If the playbook triggered but did not send

Use this section after separating an existing signal from evidence of admission or execution. If no message was created, review the workflow decision; if one exists, identify its state and channel before attributing the problem to delivery.

Check:

- Permission exists for that destination, channel, and message type; Subscribed, reachable, and eligible are separate checks.
- The profile is not blocked.
- The profile has a reachable phone, WhatsApp, Instagram, Webchat, or required identity.
- The channel is connected, active, and available for that customer.
- The message format works in the selected channel.
- Type-specific frequency limits and, where it participates, proactive contact pressure allow the proposal; do not apply one universal limit to all workflows.
- The concrete type’s purchase checks allow continuation: they may use an exact product, a family, a confirmed order, or another population and window. Not every playbook excludes any recent purchase.
- The send was not blocked by quiet hours, night hours, or timing rules.
- The playbook could build a valid message, product, link, button, template, or route candidate.

If consent or contactability is unclear, use [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}).

This fictional **Camila Torres** profile shows **Unconfirmed**, an example email, and no phone. The fields locate what to check; they do not verify identity, consent, an integration, eligibility, sending, or delivery. The narrow view is a focus from the desktop capture.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Camila Torres Unconfirmed with fictional email and no phone">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Camila Torres Unconfirmed with fictional email and no phone" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent fictional profile; not proof of identity, consent, or delivery.</figcaption>
</figure>

## 5. If the playbook waited

A delay is not always a failure.

Some playbooks wait because:

- The route has a wait step.
- Quiet hours or night-hour settings apply.
- The business calendar or destination timezone changes the applicable window, depending on the workflow and channel rules.
- Type-specific planning retains a pending proposal, a wait for evidence or capacity, or a sending window; it does not promise the historically best time or an exact delivery time.
- A conversation window or reply window is not currently available.
- A previous message already created contact pressure.

Check the route steps, business timing settings, and customer timeline before changing the playbook.

In journeys, distinguish a scheduled wait, a condition waiting for a valid event, and a step that terminates instead of postponing. The Inbox response calendar controls attention; it is not a sending schedule or universal playbook SLA. A wait, a skip, and an expired candidate require different diagnoses.

## 6. If the playbook used another channel

Some playbooks can choose among available channels.

Check:

- Which outgoing channels are allowed in the playbook.
- Whether the expected channel is active.
- Whether the customer profile is reachable in the expected channel.
- Whether the message format, buttons, media, template, or conversation window can work in that channel.
- Whether the workflow used the incoming identity, a specific route, or its channel priority. This does not demonstrate lower cost, better return, or delivery.

For WhatsApp-specific behavior, use [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %}).

Distinguish incoming and outgoing channels. **Incoming channels** in Property Collector shows **All incoming channels** and the manual option in an independent fictional unsaved draft. It identifies the incoming filter; it does not show an outgoing selector, a connection, permission, or a delivered message.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Incoming channels options in Property Collector">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-en-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-en.png" srcset="/images/captures/property-collector/channels-en.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Incoming channels options in Property Collector" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent draft; not outgoing channels or a delivery.</figcaption>
</figure>

## 7. If the playbook handed off

A handoff can be the correct outcome.

Check whether:

- The playbook has an **Escalation** setting.
- A journey route reached an assignment step.
- An AI step’s unresolved path reached an explicit assignment; do not assume automatic handoff in every journey.
- A custom agent matched an intent but reached its limits.
- The customer requested a person, requested an operation beyond the available scope, or the situation needs the applicable handoff protocol. Frustration, a greeting, or one unsuccessful search alone does not prove automatic handoff.
- The Supervisor could not find another active playbook to handle the request.
- The target teammate or team is correct.

If the handoff was unexpected, review the agent prompt, knowledge, scope, intents, and escalation target. For details, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

**Escalation** shows **Atención demo**, a destination team, in this fictional unsaved Property Collector draft. A handoff request, team choice, assigned owner, and human reply are different states. Check membership, capacity, hours, and protocol; closing or snoozing does not reply, and an AI pause depends on the applicable protocol.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Atención demo as the destination team in Escalation">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Atención demo as the destination team in Escalation" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent form without saving, assigning, or replying.</figcaption>
</figure>

In a journey, **Assignment** offers five actions in this independent fictional new form without saving. Check which action execution reached and in what order; this figure does not show built topology, a confirmed trigger, or a handed-off conversation.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Five actions of a journey Assignment step">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-en-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-en.png" srcset="/images/team/ai-handoff-to-inbox/assignment-en.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Five actions of a journey Assignment step" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent new component; no topology, save, or execution.</figcaption>
</figure>

## 8. If the agent answered differently than expected

If the playbook sent or replied, but the content was wrong, this is usually not a trigger problem.

Check:

- The prompt says what the agent owns and what is out of scope.
- The knowledge documents are current and do not contradict each other.
- The type has access to the concrete data and tools for the request; customer-provided information does not verify identity, an order, or operational status in an integration.
- The tone and offer settings match the business goal.
- If a Playground is available, its authorized tests and limitations were reviewed. A simulation can save messages or events and call AI providers; it does not confirm identity, permission, eligibility, or real delivery.
- The expected answer belongs to this playbook, not another playbook or team.

For safer changes, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

In Custom Agent **Prompt**, check the saved instructions of the correct version. This fictional form is empty: the gray text is a placeholder, without saved instructions or a generated response. Writing an instruction does not add tools, integrations, or permission.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Empty Custom Agent Prompt">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-en.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Empty Custom Agent Prompt" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Native placeholder; no saved instructions or AI response.</figcaption>
</figure>

In **Knowledge**, distinguish choosing a document, saving it, and having it processed and available for retrieval. **Upload documents** is empty in this independent Custom draft: no file is chosen, uploaded, or ready. Do not treat saving as confirmation that the provider or search index finished.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Custom Knowledge without a chosen file">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-en-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-en.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-en.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Custom Knowledge without a chosen file" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Empty area; no file chosen, saved, uploaded, or retrieved.</figcaption>
</figure>

## 9. Review reporting and one real timeline

Use reports to understand patterns, but use a real customer profile to debug.

Review:

- The customer profile timeline.
- Inbox conversation history.
- The registered report for that type, if one exists, or the relevant performance and revenue views; not every playbook has a dedicated report.
- Campaign or journey activity that may have contacted the same profile.
- Channel delivery state.
- Recent integration or tracking activity.
- Handoff destination and owner.

If many customers show the same symptom, fix the shared cause: integration, tracking, channel readiness, audience, timing, frequency, prompt, or handoff settings.

Compare the same business, population, period, timezone, and denominator. Resolution, collection, handoff, sending, delivery, returns, and attributed sales are different outcomes; an aggregate report does not demonstrate what happened to one customer. Retain evidence of the original attempt and do not replace its diagnosis with a new execution.

## Quick symptom map

| Symptom | First place to look |
| --- | --- |
| No customer entered | Signal, audience, trigger, active status, or route condition. |
| Signal exists but no send | Consent, contactability, channel readiness, frequency, timing, or recent purchase. |
| Message sent later | Wait or condition, channel window, applicable timezone, and type-specific planning. |
| Another channel was used | Channel availability, customer reachability, message format, or channel priority. |
| Conversation went to Inbox | Escalation settings, assignment step, unresolved AI path, or Supervisor routing. |
| Agent replied incorrectly | Saved prompt, ready knowledge, scope/tools, authorized test evidence, or wrong playbook ownership. |
| Reports look low | Date range, attribution, event sync, channel delivery, or skipped/handed-off attempts. |

## Related guides

- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
