Use this checklist after completing the core setup and before customers receive your first live messages.

It applies to campaigns, playbooks, journeys, capture follow-ups, and AI agents that can send messages or hand conversations to your team. Review the specific flow you will activate: a connected channel or a preview does not confirm that the whole path is ready.

This is an operational checklist. It does not replace legal or compliance review for the countries and channels you use.

## 1. Confirm who can receive the message

Start with the audience before reviewing the message. For a marketing send, confirm that:

- You can identify recipients and verify permission for the channel, destination, and type of communication you will use.
- Opt-outs and exclusions are respected, including numbers or addresses that must no longer receive messages.
- Invalid, duplicate, test, and internal profiles are excluded from the customer audience.
- Imported profiles have a clear source, date, and evidence of consent.
- The channel matches what the customer agreed to receive.

The available recipient count and **Subscribed** status do not replace that evidence. An **Unconfirmed** profile does not demonstrate consent either; check the specific destination and opt-out before launch.

For a file import, answer **Yes** to the consent question only if every record has confirmed permission. Separate files when cases differ. **No** leaves new profiles **Unconfirmed**; it does not unsubscribe all existing profiles. Deduplicated profiles retain their previous status and need a separate review.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional import with No selected in the marketing consent question.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1050.5px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-en-20260928-crop.png 2x" width="780" height="1200" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png 2x" style="width: auto; margin: 0 auto;" width="2065" height="705" loading="lazy" decoding="async" alt="Fictional import with No selected in the marketing consent question." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The demonstration import shows No and was not started. Review permission and existing profile status separately before sending.</figcaption>
</figure>

If you are unsure whether a customer profile is eligible, exclude it from the first launch and review its source. Do not change its status to make it appear in the count.

## 2. Check the channel and sender

Make sure the channel can deliver the experience you are about to launch. A WhatsApp or SMS campaign needs its corresponding channel and sender. Email needs enabled access and an active, verified sender. Webchat and social conversations follow a different path: do not treat them as interchangeable campaign destinations.

Before sending, confirm that:

- The selected channel, sender, and business are correct.
- The customer will recognize the business identity.
- A required template is available for that channel and sender; the approved version that can be sent matches the content you intend to use.
- Replies reach the Inbox or expected handoff path when the channel supports replies. For a channel without a direct reply, such as Push, provide another way to contact your team.
- Your team knows where to see and answer conversations.

For WhatsApp, review the conversation conditions and applicable approvals. A local draft or a template's general status does not prove that its latest edit is ready to send. Consult the [WhatsApp Business Messaging Policy](https://whatsappbusiness.com/policy/) for permission, template use, and escalation to a person.

If a channel needs approvals or special sender setup, do not leave that review until the send.

## 3. Review timing and frequency

A good message can feel wrong if it arrives at the wrong time or too often.

Before launch, review:

- The business timezone and how the scheduled time translates to the audience's local time. Do not assume a schedule automatically adjusts for every recipient.
- The quiet hours and service hours that apply to the channel and flow.
- Journey waits or playbook delays, including those that move a message into the next day.
- Other campaigns, playbooks, and journeys the same person may receive.
- The limits and rules that actually apply to each flow. A wait or one playbook's limit does not guarantee a global cap across all sends.

Keep the first launch small and define an operational maximum for contacts and messages. Check overlap before activating another flow; a small audience can still receive repeated messages.

## 4. Review the message and brand voice

Read the message as if you were the customer receiving it. Confirm that:

- The brand and reason for the message are clear.
- There is one simple call to action and the tone matches your team.
- Opt-out instructions are present where required and the stated mechanism works on that channel. Writing **STOP** or **BAJA** in the body does not configure unsubscribe handling by itself.
- Variables have valid data or a verified fallback. Also review a profile without a name or another optional value.
- Links reach the correct destination, including tracking parameters; check the final link in the test, not only the editor's URL.
- Offers, prices, product names, dates, and policies are correct.

In **Settings → Templates**, the editor lets you review the body, variables, and links. The following example is an unsaved **Message/SMS** return-follow-up draft. It does not represent an approved WhatsApp template or a delivered message.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Message/SMS draft with a name, personalization variable, URL, and opt-out instruction.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 642px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/send-messages-with-api/editor-en-mobile.png 2x" width="668" height="718" />
        <img class="ht-editorial-visual__image" src="/images/developers/send-messages-with-api/editor-en.png" srcset="/images/developers/send-messages-with-api/editor-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Message/SMS draft with a name, personalization variable, URL, and opt-out instruction." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved fictional draft: review the content, then check final values, link, and opt-out handling in an authorized test.</figcaption>
</figure>

For AI agents or playbooks, also review brand instructions, allowed actions, handoff rules, and response boundaries. Check what happens when data is missing or the customer asks to speak to a person.

## 5. Test the full customer path

A preview checks content; delivery, replies, and attribution need verification of the real path.

Prepare an authorized test with your own or teammates' destinations that agreed to receive it, separate from the customer audience. Use the destination appropriate to the channel: a phone, email address, or browser, for example. A “test” name or label on a profile does not prevent sends or isolate their effects.

1. Select only those profiles and confirm channel, permissions, template, and owner.
2. Check the trigger and exclusions. If you will activate a real test, limit its scope before starting; an enabled flow can reach other profiles that meet its conditions.
3. Verify that the message reaches the intended destination and its final values are correct. An accepted request or a message being prepared does not confirm delivery.
4. Open every link and check the destination, variables, and tracking parameters.
5. Reply when the channel supports it; otherwise use the alternative contact offered by the message.
6. Confirm that the conversation reaches the expected Inbox, team, or owner and can be handled there.
7. Review the report's period, timezone, and metrics. Distinguish delivered messages, total clicks, unique clicks, and attribution; their values and arrival times need not match.

If you need a purchase, cart, or event, use an authorized test operation in an isolated environment supported by that integration. Check its effects on charges, stock, notifications, and automations. Marking a profile as internal does not make a production purchase safe. Do not invent activity to make a report match.

If part of the path cannot be verified, record what is missing and postpone launch of that part.

## 6. Assign live owners

Before launch, decide who is watching. Confirm:

- Who owns the Inbox during and after launch.
- Who handles replies and opt-out requests.
- Who has access and permission to pause the specific flow.
- Who handles setup, tracking, or channel issues.
- The response time the team can meet and who covers an unavailable owner.

For an AI playbook offering **Escalation**, review both the switch and the selected teammate or team. In Property Collector, for example, the control lets you choose a handoff target. Selecting a team does not demonstrate availability or that a conversation has already been assigned to it.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Property Collector escalation enabled in a draft with Atención demo selected.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="660" loading="lazy" decoding="async" alt="Property Collector escalation enabled in a draft with Atención demo selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real control in an unsaved Property Collector draft; Atención demo is a fictional team. Check availability and actual assignment before launch.</figcaption>
</figure>

Check the destination with an authorized test conversation and verify that the owner sees it. If nobody owns the first hour after launch, delay the launch.

## 7. Know when to pause

Decide pause conditions before customers start receiving messages. Pause and review if you see:

- The wrong audience receiving messages.
- A broken link, wrong offer, or wrong product.
- Unexpected opt-outs, complaints, or negative replies.
- A template, sender, or channel error.
- Too many messages with errors or without confirmed delivery.
- A support spike your team cannot handle.
- Reporting or tracking that does not match the expected flow.

The owner should stop the affected flow and also review schedules, waiting steps, and other flows that may keep sending. A pause does not recall messages already sent or handed to the provider, or demonstrate that all pending work is cancelled.

Record the time, flow, and affected destinations; fix the cause and recheck the audience and path before resuming. Pausing early reduces the reach of a preventable issue.

## Related guides

- [Launch checklist]({% link _getting-started/launch-checklist.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [Implementation paths]({% link _getting-started/implementation-paths.md %})
- [Measure success in your first 7 days]({% link _getting-started/measure-success-first-7-days.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Campaigns overview]({% link _campaigns/campaigns-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %})
