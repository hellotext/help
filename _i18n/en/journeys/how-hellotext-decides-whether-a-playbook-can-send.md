Use this guide when a playbook is enabled, but you expected a message and nothing was sent yet, the message was delayed, another channel was used, or the conversation was handed off.

The short version: **enabled** means the playbook is allowed to participate. It does not mean every signal, reply, or customer profile will produce a message.

Hellotext checks whether the playbook has a reason to act, whether the customer profile can be contacted, whether a channel can carry the message and which limits apply to that flow. The outcome may be to send, wait, skip or hand off. A proactive sales playbook, an agent replying to a customer and a journey do not necessarily follow the same checks.

The figures are independent fictional examples of definitions, data and controls. They do not show a processed signal, a send decision or a completed handoff.

## First, separate trigger from send

When a playbook does not send, start by separating two questions.

**Did the playbook trigger?**

This is about the reason to act. A playbook may not trigger if the signal is missing, the customer profile does not match the audience, the customer message does not match an intent, the route condition fails, or the playbook is not enabled for that mission.

**Did the playbook trigger but not send?**

This is about delivery readiness. A playbook may have a valid reason to act, but still wait or skip because the customer profile is not reachable, the channel is unavailable, the customer has opted out, a frequency limit was reached, the timing is not allowed, the customer already purchased, or the conversation should be handled by a person.

Also separate **recorded signal**, **playbook admission**, **candidate or proposal**, **created message** and **delivery**. A skip before creation may have no message with an error. Provider acceptance does not confirm that the customer received a message.

For missing activity or trigger problems, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## The decision map

The exact checks vary by playbook, but the decision usually moves through these questions.

### 1. Is the playbook enabled and available?

Check that the playbook is enabled and its workflow remains available. Enablement allows participation in the applicable admission process; audience, channel and activity requirements still apply.

Some playbooks can be enabled only once for the business. Others, such as [custom agents]({% link _journeys/custom-agent-playbook.md %}), may allow multiple versions. Availability can also depend on the account, integration, channel, or feature set.

Disabling changes its admission of new activity. It does not confirm that all existing conversations, journeys, proposals or jobs were canceled. Check each attempt’s last state and that playbook type’s rules before expecting an immediate stop.

### 2. Did the right signal, intent, or condition happen?

Active sales playbooks usually need a signal, such as an abandoned cart, product interest, recent purchase, browsing behavior, or another commerce event.

An **action definition** and an **occurrence** are separate records. The **Actions** catalog shows the fictional **appointment.booked / Appointment booked** definition with zero recorded events. It helps locate the action name and title; it does not establish a received commerce event or that a playbook uses it as a trigger.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional action definition in the catalog">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-en-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-en.png" srcset="/images/developers/custom-actions/catalog-en.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional action definition in the catalog" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing definition without occurrences; it does not establish a processed trigger.</figcaption>
</figure>

Reactive support playbooks usually need an incoming customer message that fits the playbook's purpose.

[Custom agents]({% link _journeys/custom-agent-playbook.md %}) may depend on configured intents. If intents overlap, the Supervisor may choose another agent or decide that no active playbook is the right owner.

Intents are interpreted in the context of the conversation and available playbooks; they are not exact keyword matching rules. A message can continue active assistance instead of starting a new agent.

In **Intents**, the fictional phrase **I want to ask about a return.** is in an unsaved draft and has not been added. **New intent** was not pressed. This figure identifies the configuration field; it is not an incoming message, a classified intent or a handed off request.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional phrase not added in the Intents panel">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-en-mobile.png 2x" width="764" height="544" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-en.png" srcset="/images/team/ai-handoff-to-inbox/intents-en.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional phrase not added in the Intents panel" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent unsaved draft without running classification.</figcaption>
</figure>

Journey routes depend on their trigger, conditions, waits, and branch logic. A route can start, wait, branch, assign, or end without sending another message if the next step does not apply.

### 3. Is the customer profile eligible to receive a message?

Before sending, Hellotext checks whether the customer profile can be contacted in the relevant channel.

Check identity, destination, permission and audience separately. Depending on the flow, a send can be blocked or skipped when:

- The customer opted out of the required proactive contact or the applicable permission is missing.
- The profile or destination is blocked for that channel.
- A reachable identity for phone, WhatsApp, Instagram, Webchat or another required channel is missing.
- The customer does not meet the audience or channel requirements.
- The flow needs an open conversation window and that window is unavailable.

A customer reply and proactive contact have different conditions. A contact detail or **Subscribed** state alone does not authorize every channel, destination or message type.

For the broader consent and contactability model, see [Who can I message?]({% link _audience/consent-and-subscriber-status.md %}).

The fictional **Camila Torres** profile is **Unconfirmed**, has an example email and no phone. It helps identify state and contact methods; it does not establish verification, consent or send eligibility. The narrow view retains a desktop focus of the same source.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="State and details of a fictional unconfirmed profile">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="State and details of a fictional unconfirmed profile" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Identity and contact are separate checks from permission and delivery.</figcaption>
</figure>

### 4. Is the channel ready for this message?

A customer may be reachable in one channel and not another.

Requirements depend on the technology and flow: an active channel where applicable, reachable identity and destination, applicable permission, a usable version or template and a compatible format. SMS uses an internal route; it does not require the same connected channel record as WhatsApp or Instagram. Email needs an active sender and Push a usable subscription and business channel, together with the applicable plan features.

For example, a rich WhatsApp message, a product recommendation, an SMS message, a Webchat reply, and an Instagram DM do not have the same requirements. Buttons, media, templates, reply windows, and live conversation windows can all affect what is possible.

When several channels are available, selection follows the flow’s policy and available conversation, timing and cost data. It does not guarantee the cheapest channel or automatic fallback. In proactive planning, a generated proposal is tied to its concrete route; losing that route does not allow moving the same content to any other channel. Without an eligible route, that attempt cannot send.

A Playground without a customer profile can display selected formats without checking real destinations. That preview does not confirm that a particular person can receive them.

### 5. Would this over-message the customer?

Proactive playbooks may apply playbook frequency, an aggregate contact limit and spacing between attempts. These checks cover different populations; they are not one counter for the whole business.

Hellotext may stop a proactive attempt when:

- The same playbook already has proposals or counted outbound activity for that profile within its window.
- Proactive playbooks included in the aggregate contact limit have consumed that budget.
- Another attempt relevant to spacing, such as a campaign or marketing message, occupies the planned time.
- The customer recently bought the product or product family the playbook was going to recover or recommend.

In proactive generation, pending proposals can count before delivery. Campaigns, journeys and reactive replies do not automatically spend the same aggregate playbook budget; they have their own admission or spacing checks. Some types are excluded from a particular limit without being exempt from other rules. Recent purchase is also checked against the product or family and playbook policy.

An active playbook can therefore skip or wait for a customer even when the signal exists. Check the population, window and stage counted by each limit before interpreting a figure as received messages.

### 6. Is it an allowed time to send?

In proactive planning, distinguish sending restrictions from contextual signals:

- Configured quiet or night hours and communication windows applicable to the destination country can block a time.
- The business timezone determines its local planning windows; destination restrictions may use another timezone.
- The working calendar provides context in this planning: being outside its hours does not alone block a candidate. Do not confuse it with the calendar used to calculate Inbox response targets.
- Interaction history provides contextual evidence. Current selection prioritizes the earliest eligible time inside evaluated windows; it does not promise to wait for a historical engagement peak.
- Spacing from other attempts and candidate expiry can make a time unavailable.

If no permitted, useful time remains, the attempt may be skipped or expire. When policy permits another time, it may wait and recheck its requirements. This does not set one universal schedule for every playbook, journey or reactive reply.

### 7. Can Hellotext build a valid send candidate?

Even after eligibility passes, the playbook still needs a message that can become a real send.

Proactive planning can compare routes and candidates before generating content. Temporarily missing capacity or comparison evidence can hold a candidate; that differs from losing every route or expiring. A composed proposal, a created message and a provider acknowledgment remain separate stages.

It may stop before sending if:

- There is no valid message variant for the available channel.
- The route or channel record disappeared before send time.
- Required product, cart, order, link, button, or template data is missing.
- The generated response fails a safety or relevance check.
- The AI agent cannot answer within scope.

Requirements may be checked again when scheduling, materializing or releasing a send. A later purchase, opt-out or channel change can change the result, depending on the playbook. Passing an earlier check does not guarantee delivery.

Consult settings, existing Playground results, the conversation and reports available for that flow. A generic preview or aggregate report does not by itself identify an individual attempt’s reason. Retain the last confirmed state before creating another test or retry.

### 8. Should the conversation be handed off instead?

Some playbooks should not send a final AI response. They should bring in a person or team.

Depending on the playbook’s enabled rules and tools, this can happen when:

- The support or sales agent cannot answer confidently.
- A rule says the case needs a person.
- The customer is angry.
- The customer reports a defective product.
- The Supervisor cannot find another active playbook that should own the request.
- A journey route reaches an assignment step.
- A custom agent's intent matches, but the agent reaches its limits.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

In Property Collector’s **Escalation** panel, the fictional example allows escalation to **Atención demo** without saving or activating the workflow. It identifies the control and target playbook; it does not show an assigned conversation, a team accepting the case or a human reply.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Unsaved fictional escalation control targeting Atención demo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Unsaved fictional escalation control targeting Atención demo" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent configuration; it does not establish assignment or completed assistance.</figcaption>
</figure>

Receipt, owner, pending team, capacity, open state and response are separate checks. An assignment may wait for an available person; the protocol and assistance mode determine whether AI pauses or continues. Assigning or closing does not guarantee a permanent stop to all AI activity or an immediate human reply.

## What to check when a playbook did not send

Use this checklist before changing the playbook.

Record the profile, playbook or journey, expected signal, channel, time and timezone. Review existing evidence you can access; do not repeat an operation whose result is still uncertain.

| Check | Where to look |
| --- | --- |
| Is the playbook enabled? | **Playbooks** list and playbook settings. |
| Did the signal or intent happen? | Customer profile activity, event history, route trigger, or Inbox conversation. |
| Is the customer profile reachable? | Profile contact methods, subscription state, and blocked status. |
| Is the channel active? | Channel settings and template, sender or subscription readiness, depending on the technology. |
| Does another attempt already exist? | Available proposals and messages, Inbox timeline, campaign activity, journey activity and playbook reports. |
| Did timing delay the send? | Quiet hours, destination windows, timezone, planned time and candidate expiry, when available. |
| Did the playbook hand off? | Owner, pending team, assistance mode and conversation notes, separate from the human reply. |
| Did reporting show a skip or low activity? | [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %}). |

## When to edit the playbook

Do not change the playbook until you know which part failed.

If saving, testing or sending had no clear response, reconcile the original attempt with its records first. A retry may produce another effect and does not by itself establish what happened before.

If the issue is missing data, fix the integration or tracking first.

If the issue is channel readiness, finish channel setup before changing the playbook.

If the issue is frequency, recent purchase, consent, or timing, the playbook may be working correctly. In that case, adjust limits only if the business strategy really changed.

If the issue is prompt, intents, knowledge, handoff, offer, or route logic, use [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Related guides

- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Who can I message?]({% link _audience/consent-and-subscriber-status.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
