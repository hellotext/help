Use these practices with the [launch checklist]({% link _getting-started/launch-checklist.md %}) when you are preparing your first real playbook, route, or send.

The goal is to learn from a controlled launch before expanding the audience or enabling more automation. Define one action the customer can complete, a limited audience, and a person responsible for replies.

## Start with a small audience

Prepare a test audience separate from customers, using your own destinations or those of teammates who agreed to receive the test. Use the destination appropriate to the channel: a phone, email address, or browser, for example. Confirm permission and scope before a real send; naming a list “test” does not isolate its effects.

Before sending to customers, check in an authorized test:

- The channel, business, and sender are correct, and the customer will recognize the brand.
- The message is clear without extra context and variables resolve correctly, including when an optional value is missing.
- Final links open the right page and retain the appropriate tracking parameters.
- Opt-out instructions and the mechanism work on that channel. Writing STOP or BAJA does not configure unsubscribing by itself.
- Replies reach the Inbox or expected handoff and someone can handle them. If the channel does not support direct replies, offer another contact method.

A preview lets you review content. An accepted request or a message in preparation does not confirm delivery. If the test needs purchases, events, or an enabled flow, use a compatible isolated environment and review effects on charges, stock, and other messages; do not fabricate activity to obtain a report.

Keep reading: [Create a campaign]({% link _campaigns/creating-a-campaign.md %}).

## Send to customers with a clear relationship

For the first marketing send, choose a small audience whose relationship with the business makes the message useful and whose permission you can verify for the channel, destination, and communication type. A recent purchase or conversation does not establish that permission by itself.

Avoid cold, stale, or unverified lists. Review opt-outs, exclusions, and overlap with other flows. Available recipient counts and Subscribed or Unconfirmed labels do not replace evidence of consent either.

When importing a file, answer Yes to the consent question only if every record has confirmed permission; separate different cases. No leaves new profiles Unconfirmed. Existing deduplicated profiles retain their previous state and need their own review.

The demonstration below retains No selected; the import was not started.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional import with No selected in the marketing consent question.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1050.5px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-en-20260928-crop.png 2x" width="780" height="1200" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png 2x" style="width: auto; margin: 0 auto;" width="2065" height="705" loading="lazy" decoding="async" alt="Fictional import with No selected in the marketing consent question." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The demonstration import shows No and was not started. Review each profile’s permission and state before including it in the first send.</figcaption>
</figure>

For WhatsApp, also check the conversation conditions and the active approved template version when required. Consult the [WhatsApp Business Messaging Policy](https://whatsappbusiness.com/policy/) for permission, template, and opt-out requirements.

Keep reading: [Lists vs. segments]({% link _audience/lists-and-segments.md %}).

## Keep the message simple

Write the first message around one action. Avoid combining too many offers, links, questions, or explanations in the same send.

Good first sends usually answer:

- Why is the customer receiving this?
- What is useful about it?
- What should the customer do next?

In Settings → Templates, you can review a Message/SMS template body. The fictional draft below proposes one action: read return instructions. The variable, link, and opt-out mechanism still need verification in the final message of an authorized test; the draft does not establish delivery or WhatsApp approval.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Message/SMS return-follow-up draft with a variable, URL, and opt-out instruction.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 642px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/send-messages-with-api/editor-en-mobile.png 2x" width="668" height="718" />
        <img class="ht-editorial-visual__image" src="/images/developers/send-messages-with-api/editor-en.png" srcset="/images/developers/send-messages-with-api/editor-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Message/SMS return-follow-up draft with a variable, URL, and opt-out instruction." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved fictional draft: one return action, with personalization and a link to verify before sending.</figcaption>
</figure>

Read the final content on the selected channel. Check offers, dates, and links and remove instructions that compete with the main action.

Keep reading: [Message editor overview]({% link _numbers/message-editor-overview.md %}).

## Respect timing and frequency

Review quiet hours, channel expectations, and frequency before launching campaigns, playbooks, or routes. Confirm the business timezone and how the scheduled time translates to the audience's local time; do not assume automatic adjustment for each recipient.

If an automation waits several hours before sending a message, review the final send time, including when it crosses into the next day. For playbooks and routes, check the trigger, delay, audience, channel, and stopping rules before enabling them.

List the other campaigns and automations the same person may receive. Limits and rules vary by flow; a playbook delay or cap does not guarantee a global maximum. Define a scope your team can handle and review overlap before expanding.

Keep reading: [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %}).

## Name capture tools clearly

Use names that explain where each capture tool is used. For example, name a QR code after the store, event, packaging insert, or counter where customers will scan it: “QR · Counter · Downtown store” is easier to recognize than “New QR.”

Clear names help you find the tool and read its report. They do not establish which source created every profile, its permission, or a sale's attribution: an existing customer can interact with several captures. Retain capture context and check recorded signals before drawing conclusions.

Keep reading: [Capture tools overview]({% link _captures/capture-overview.md %}).

## Use customer profile data deliberately

Use forms, checkout opt-ins, and integrations to collect data useful for a specific decision. Keep field names clear and check the received value on the profile. An installed connection or a created property does not confirm that every profile has a value.

When building segments, use names that describe the intended audience and review conditions, inclusions, and exclusions. Avoid a name that promises an intention the rule cannot verify.

In the editor, open the braces control to consult Tags. The menu shows fields such as name, email, and business properties; Nivel de fidelidad is a fictional property in the example. Choose the tag for the data and verify a profile with a value and another without one. Optional values may be empty; order, coupon, or reply data depends on the flow's context and is not universally available.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Open Tags selector in a campaign editor with profile fields and Nivel de fidelidad.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 818px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/personalization-tags/selector-en-mobile.png 2x" width="1020" height="780" />
        <img class="ht-editorial-visual__image" src="/images/audience/personalization-tags/selector-en.png" srcset="/images/audience/personalization-tags/selector-en.png 2x" style="width: auto; margin: 0 auto;" width="1600" height="1360" loading="lazy" decoding="async" alt="Open Tags selector in a campaign editor with profile fields and Nivel de fidelidad." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Braces control and Tags menu in an unsent fictional draft. The small view focuses the same desktop menu; it does not show resolved values for a recipient.</figcaption>
</figure>

Keep reading:

- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})

## Watch the first responses

After the first launch, review replies, opt-outs, errors and messages without confirmed delivery, clicks, playbook decisions, handoffs, and attributed sales. Record the period, channel, audience, and timezone before changing one variable and comparing the result.

In Campaign reporting, choose a period from launch or the dates you want to analyze. The example cards show attributed revenue, average ROI, conversion, and revenue per message; they combine monetary amounts, a multiple, and a rate, so they cannot be added together. On mobile, use card navigation to view the others.

The demonstration uses First 14 days, April 19–May 2, 2026, with fictional values. It does not represent your first-launch results.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="First 14 days selector and attributed revenue, average ROI, conversion, and revenue per message cards.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png 2x" style="width: auto; margin: 0 auto;" width="2480" height="610" loading="lazy" decoding="async" alt="First 14 days selector and attributed revenue, average ROI, conversion, and revenue per message cards." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictional April 19–May 2, 2026 demonstration with First 14 days selected. It illustrates period selection and units; these are not your first-launch results.</figcaption>
</figure>

Distinguish total clicks from unique clicks per message, and dispatch from delivery. Engaged counts delivered messages seen, clicked, or replied to at least once, grouped by dispatch day in the business timezone; later signals can update that cohort. Attributed sales depend on the report's origin and windows and do not establish that every sale followed a click.

Assign replies to an owner and close the conversation when the work is finished. Closing changes state and may affect capacity, follow-ups, or surveys depending on configuration; do not close pending cases to improve a metric's appearance. If an audience, content, or capacity problem appears, pause the affected flow and also review its pending steps and other flows. Pausing does not withdraw messages already sent to the provider.

Keep reading:

- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
