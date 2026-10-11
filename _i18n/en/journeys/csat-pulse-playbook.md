Use this guide when you want Hellotext to ask customers whether they were satisfied after a support, Inbox, AI, or playbook conversation is resolved.

CSAT Pulse is a post-interaction feedback playbook. It sends a lightweight satisfaction prompt after a conversation is closed, records the response for Customer Satisfaction in Service Quality, and can route negative feedback to a teammate when an escalation is configured.

It is not a product review request and it is not a brand-loyalty survey. Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) for product reviews after delivery, and use [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) when the goal is loyalty or likelihood to recommend.

## What CSAT Pulse does

CSAT Pulse helps you measure whether the customer was satisfied with a resolved interaction.

It can:

- Send a CSAT prompt after a conversation is resolved or closed.
- Use a simple thumbs-up or thumbs-down response by default.
- Record positive and negative satisfaction responses.
- Avoid new prompts for the same contact or conversation for 14 days after the last CSAT prompt.
- Respect channel, consent, and send-eligibility rules.
- Send a follow-up after a response and route negative feedback when an escalation is configured.
- Contribute answered responses to the AI Agents CSAT and Teammates CSAT percentages in Service Quality.

The goal is to learn whether the interaction worked and recover quickly when it did not.

## When to use it

Use CSAT Pulse when:

- Your team closes support or sales conversations in the Inbox.
- AI agents or playbooks resolve conversations and you want satisfaction feedback.
- You want to compare aggregate satisfaction for AI agents and teammates.
- You can arrange a teammate to follow up on negative feedback when escalation is configured.
- You have enough conversation volume to learn from the results.

It works best after an actual resolution event. If the customer never had a meaningful interaction, do not send a CSAT prompt.

## How it works with other feedback

CSAT Pulse does not replace the other feedback playbooks. You can have [Review Builder]({% link _journeys/review-builder-playbook.md %}) and [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) active alongside CSAT Pulse when each one has the right signal and follow-up owner.

Hellotext's decision engine treats them as different feedback moments. CSAT Pulse asks after a resolved conversation, Review Builder asks for product reviews after delivery, and NPS Pulse measures relationship loyalty after a delivery experience.

Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) when the goal is to collect a product rating and written review after delivery.

Use [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) when the goal is to measure loyalty or likelihood to recommend the brand.

Use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) or a [Custom Agent]({% link _journeys/custom-agent-playbook.md %}) when the customer still needs an answer, not a satisfaction survey.

Use the Inbox directly when the customer is actively upset, still waiting for help, or the conversation is not actually resolved.

## What it needs before launch

Before enabling CSAT Pulse, confirm:

- Your team has a clear way to mark conversations as resolved or closed.
- The conversation has a resolved interaction with a customer message received during that interaction.
- The channels where you want to ask for CSAT are connected and eligible.
- Customer profiles have consent for the channel.
- Your team knows who reviews and follows up on negative feedback.
- Your team knows where to review Customer Satisfaction in Service Quality and how to follow up in customer conversations.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Edit the CSAT message

Open **Playbooks**, click **Explore playbooks**, and choose **CSAT Pulse**.

Open **CSAT Message** to edit the question customers receive after the conversation is resolved.

The default CSAT message asks “Were you satisfied with the help?” and offers **👍 Yes** and **👎 No**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-csat-figure="question-controls" aria-label="CSAT message editor">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 658px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/csat-completion-20261011/question-controls-en-mobile.png 4x" width="1496" height="1548" />
        <img class="ht-editorial-visual__image" src="/images/editorial/csat-completion-20261011/question-controls-en-desktop.png" srcset="/images/editorial/csat-completion-20261011/question-controls-en-desktop.png 4x" width="2560" height="1500" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="CSAT Message shows the default question and the Yes and No response options in the editor." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with demonstration configuration: review the question and its two options before enabling CSAT Pulse.</figcaption>
</figure>

You can adapt the message to your tone. Keep it short and easy to answer.

Avoid asking multiple questions at once. CSAT works best when the first response is simple.

The preview shows the question and its two options. Review them before enabling the playbook.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-csat-figure="static-preview" aria-label="CSAT question preview">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 560px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/csat-completion-20261011/static-preview-en-mobile.png 4x" width="1528" height="784" />
        <img class="ht-editorial-visual__image" src="/images/editorial/csat-completion-20261011/static-preview-en-desktop.png" srcset="/images/editorial/csat-completion-20261011/static-preview-en-desktop.png 4x" width="2168" height="784" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Preview of Were you satisfied with the help? with Yes and No buttons." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Native preview of the demonstration configuration; it does not represent a sent message or a received response.</figcaption>
</figure>

## Choose when it should trigger

The trigger is **on resolved**: CSAT Pulse can send after a conversation is marked resolved or closed, when its audience, interaction, and channel conditions are met.

If the timing is based on delivered products instead of a resolved conversation, that is a [Review Builder]({% link _journeys/review-builder-playbook.md %}) moment.

## Understand eligibility

CSAT Pulse checks the resolved interaction, audience, and channel before preparing the prompt.

A prompt may be skipped when:

- The resolved interaction has no received customer message.
- A CSAT prompt was created for the same contact or conversation within the last 14 days, even if it was not delivered. After that interval, a newly resolved interaction can become eligible again.
- The customer falls outside the configured audience or is not eligible for the channel.
- The interaction channel is excluded from the manual channel selection, or cannot send the prompt compliantly.
- Consent, rate limits, or other send guardrails block the message.

If a CSAT prompt is skipped because of eligibility, do not treat that as a failed survey. It means Hellotext avoided asking at the wrong time.

## Handle positive and negative responses

When the customer responds positively, CSAT Pulse records the response and sends the configured positive reply. In **CSAT Message**, scroll to **Reply with when positive** to review that follow-up.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-csat-figure="positive-response" aria-label="Positive response follow-up">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 658px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/csat-completion-20261011/positive-response-en-mobile.png 4x" width="1496" height="852" />
        <img class="ht-editorial-visual__image" src="/images/editorial/csat-completion-20261011/positive-response-en-desktop.png" srcset="/images/editorial/csat-completion-20261011/positive-response-en-desktop.png 4x" width="2560" height="868" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Reply with when positive shows a thank-you message and a question about what could be improved." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real positive follow-up editor in the demonstration configuration.</figcaption>
</figure>

When the customer responds negatively, CSAT Pulse records the response and sends a follow-up. The response and any selected reason remain connected to the original conversation. If an escalation component is configured, it also assigns the conversation for teammate or team follow-up.

In **Reply with when negative**, review the follow-up and reason options.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-csat-figure="negative-reasons" aria-label="Negative follow-up and reasons">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 658px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/csat-completion-20261011/negative-reasons-en-mobile.png 4x" width="1496" height="1256" />
        <img class="ht-editorial-visual__image" src="/images/editorial/csat-completion-20261011/negative-reasons-en-desktop.png" srcset="/images/editorial/csat-completion-20261011/negative-reasons-en-desktop.png 4x" width="2560" height="1004" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Reply with when negative shows the follow-up and Not resolved, Wrong info, and Other reason options." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real negative follow-up editor and its three reasons in a demonstration configuration.</figcaption>
</figure>

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-csat-figure="escalation-configuration" aria-label="Escalation configuration">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 658px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/csat-completion-20261011/escalation-configuration-en-mobile.png 4x" width="1496" height="1088" />
        <img class="ht-editorial-visual__image" src="/images/editorial/csat-completion-20261011/escalation-configuration-en-desktop.png" srcset="/images/editorial/csat-completion-20261011/escalation-configuration-en-desktop.png 4x" width="2560" height="976" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Escalation panel with the component toggle on and an empty Select a teammate or team field." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface in a demonstration configuration: no teammate or team has been selected for escalation, and the playbook remains disabled.</figcaption>
</figure>

## Review Customer Satisfaction

In **Service Quality**, **Customer Satisfaction** shows two aggregate percentages for the selected period: **AI Agents CSAT** and **Teammates CSAT**. The teammate percentage combines conversations handled by a person from the beginning with conversations escalated from AI to a person. The period uses the date the customer answered.

Each percentage is positive responses divided by positive plus negative responses. When both periods have data, the panel compares the selected period with the previous period.

In this fictional example for September 11–24, 2026, the right card shows 81% CSAT for AI agents and 75% for teammates. The left card shows who completed the resolution; those percentages describe a different measure.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-csat-figure="report" aria-label="Customer Satisfaction in Service Quality">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1225px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/service-quality-report-guide/resolution-csat-en.png" srcset="/images/analytics-reporting-attribution/service-quality-report-guide/resolution-csat-en.png 2x" width="2414" height="940" loading="lazy" decoding="async" alt="Two report cards: Resolution path, with 59% resolved by AI and 41% by the team, and Customer Satisfaction, with 81% AI Agents CSAT and 75% Teammates CSAT. Both CSAT comparisons are green." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real Service Quality interface with fictional data for September 11–24, 2026: 81% AI agents CSAT and 75% teammates CSAT.</figcaption>
</figure>

There is no dedicated CSAT Pulse results report in **Playbooks**. The Service Quality panel does not show response rate, response counts, separate human-only and escalated percentages, or breakdowns by channel, agent, team, intent, or playbook. Review individual customer conversations for negative reasons and follow-up context. See [Service Quality report]({% link _analytics-reporting-attribution/service-quality-report-guide.md %}) for the report layout.

## How to test it

Test with realistic resolved conversations before enabling CSAT Pulse broadly.

Try:

- A conversation that is resolved and should receive CSAT.
- A resolved interaction with no received customer message, which should not receive CSAT.
- A positive response.
- A negative response with an escalation configured for follow-up.
- A channel that is outside its send window.
- A conversation resolved by AI only.
- A conversation resolved by a person.
- A conversation that was escalated from AI to a person.

Confirm that the prompt is sent only when expected, responses are recorded correctly, configured escalation reaches the right owner, and the Service Quality percentages reflect answered test cases in the selected period.

## What to review after launch

During the first days, review:

- AI Agents CSAT and Teammates CSAT in Service Quality for the selected period.
- Examples of prompts and answers in customer conversations, including negative reasons.
- Whether configured escalation brought negative feedback to the right teammate.
- Any signs in the conversations you review that prompts are being sent at the wrong moment.

Tune one thing at a time: message copy, resolution process, channel readiness, or negative-feedback ownership.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
