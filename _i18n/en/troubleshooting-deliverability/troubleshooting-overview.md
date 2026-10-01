Use this section when something in Hellotext does not look right and you need to narrow down where to check first.

Record what you expected, what you observed, the business, record or URL, and date and time with time zone. Locate the last confirmed stage: data received, action started, message created, delivery, assignment or response. This guide’s figures are independent fictional examples; they do not represent an incident or its recovery.

Troubleshooting usually starts in one of these places:

- Setup and integrations.
- Channels and message delivery.
- Tracking, reporting, and attribution.
- Inbox operations and team workflows.
- Captures and website experiences.
- Page access and loading.

If you are not sure where the issue belongs, start with the [troubleshooting checklist]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %}).

## Setup and integrations

If customer profiles, products, orders, or channel settings are missing or stale, start by checking the integration and setup path.

First confirm the selected business and record identity or reference, together with its source. An existing product or order does not establish that its event was recorded; a profile with an email or phone does not establish verification or permission to contact it.

In **Settings > General**, this fictional example shows the name **Enterprise** and public ID **4ONLdN32**. The name does not establish the contracted plan, a connection or a business switch; the figure helps locate the context to record.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Name and public ID of a fictional business in General">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Name and public ID of a fictional business in General" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent identity example; it does not establish plan, integration or recovery.</figcaption>
</figure>

Keep reading: [Setup and integrations overview]({% link _integrations/setup-overview.md %}).

## Message sending and deliverability

If a message is not delivered, first check the channel used, sender configuration, consent, available balance or plan access, and any temporary sending limits.

Distinguish omission before message creation from an existing message that is pending, dispatched, routed, delivered or in error. Preserve the exact state and warning. Channel availability, permission for that destination and communication type, and delivery are separate checks. Available balance does not necessarily remove daily or monthly limits; fallback through another channel depends on the workflow and its eligibility.

Start here: [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

For SMS-specific limits on new prepaid businesses, keep reading: [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

If the issue is a WhatsApp template under review, rejected, flagged, or paused, use [Troubleshoot WhatsApp templates]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %}).

For channel setup context, keep reading: [Messaging channels overview]({% link _numbers/messaging-overview.md %}).

If a Push notification does not arrive, appears twice, or is missing an image or buttons, follow [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}).

For Push, compare the site origin, browser permission, local subscription and server registration separately. The origin field helps identify protocol, domain and port; a page path is not the origin.

The figure shows **https://shop.example.test** in the real form as an unsaved fictional example. **Continue** was not pressed: it does not show a created channel, permission, subscription, worker installation or delivered notification.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Unsaved fictional origin in the Push setup form">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 550px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/setup-push-notifications/origin-en-mobile.png 2x" width="764" height="332" />
        <img class="ht-editorial-visual__image" src="/images/integrations/setup-push-notifications/origin-en.png" srcset="/images/integrations/setup-push-notifications/origin-en.png 2x" width="1064" height="292" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Unsaved fictional origin in the Push setup form" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent origin field; no channel, subscription or result was saved or created.</figcaption>
</figure>

## Campaigns

If a campaign result looks lower than expected, review the selected audience, channel, message content, links, timing, and report metrics before comparing results.

Compare the same period, time zone, population and unit. The selected audience can contain overlapping lists or segments and exclusions; its size is not the number of messages created or delivered. Report rates have their own denominators and later signals can update the delivered-message cohort by dispatch day.

This independent historical fictional report retains **First 14 days**, **April 19–May 2, 2026**, anchored to the campaign. Desktop shows four complete cards: attributed revenue **USD 1.9K**, ROI **5.4** as a multiple, conversion **6.3%** and revenue per message **USD 0.36**. The narrow view shows the first carousel card. These are not the current last fourteen days or the outcome of resolving an issue.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Period and four metrics of a fictional historical campaign report">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Period and four metrics of a fictional historical campaign report" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Campaign-anchored period; the narrow view shows the first card.</figcaption>
</figure>

Keep reading: [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Tracking and attribution

If conversions, events, or attributed revenue do not match expectations, check whether tracking is installed, events are being sent, links are tracked, and attribution rules apply.

Separate an action definition from each recorded occurrence. Compare the tracking name, identity or session, reference, source and event time. Loading the SDK does not confirm initialization: initialization is asynchronous and each real view needs to record **page.viewed** explicitly. An HTTP **200** acknowledgment with **received** does not establish processing, attribution or delivery.

In **Settings > Actions > Custom**, the catalog shows the fictional **appointment.booked / Appointment booked** definition with zero events. Full and narrow views help identify the definition; they do not show an appointment occurring or a signal received. Attribution also requires checking the chronology and rules of the sources involved.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional appointment.booked definition in the custom action catalog">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-en-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-en.png" srcset="/images/developers/custom-actions/catalog-en.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional appointment.booked definition in the custom action catalog" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent definition with zero occurrences; not evidence of recording or attribution.</figcaption>
</figure>

Keep reading: [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %}).

If a signal, event, profile update, segment, playbook trigger, or report metric is missing, start with [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

If the issue is specific to one playbook, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Inbox and team workflows

If conversations are not being handled by the right person, or response performance looks off, check assignment, roles, ownership, and response-time configuration.

Distinguish receipt, conversation owner, team destination, availability or capacity and an actual response. Waiting for capacity differs from having no assignable people. Role, team membership and capacity are separate settings; access depends on the tool and plan.

This independent figure shows the existing selector for **Lucía Méndez**, a fictional teammate with **Agent** selected, unchanged. The heading and all three options are complete; the entire save footer is omitted. It is not your role, an invitation or an assignment result. **Next** saves the role and was not pressed.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Role options for a fictional teammate with Agent selected">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 631px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-team-roles/roles-en-mobile.png 2x" width="828" height="1094" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-team-roles/roles-en.png" srcset="/images/team/understanding-team-roles/roles-en.png 2x" width="1226" height="1006" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Role options for a fictional teammate with Agent selected" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing teammate unchanged; no invitation, assignment or denied access shown.</figcaption>
</figure>

Response targets use the business calendar and time zone. A human response and a provider acknowledgment are different; closing or snoozing also does not establish a response. Preserve conversation evidence and current settings before attributing a wait to a role.

Keep reading: [Inbox and conversations overview]({% link _team/inbox-overview.md %}).

## Captures and website experiences

If a popup, form, Webchat, QR code, link, or checkout opt-in does not appear or register the customer, first identify whether the problem is availability, installation, interaction, verification, the customer profile, or a later action.

The **Capture** catalog helps choose the tool to inspect. Saving a draft, publishing it, making it visible or enabled, installing it and receiving an interaction are different stages. Checkout opt-in depends on the commerce integration and is not a tool in this catalog.

The figure reuses an independent fictional desktop **Popup** and **Form** example. The narrow view focuses on **Form** in the same desktop catalog, rather than showing a new mobile interface. Seeing the card does not establish publication, installation, submission, verification or consent; receiving a profile also does not confirm the subsequent action.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Popup and Form in the example Capture catalog">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/desktop-form-en.png 2x" width="800" height="480" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/en/catalog-desktop-row.png" srcset="/images/captures/forms/en/catalog-desktop-row.png 2x" width="1632" height="480" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Popup and Form in the example Capture catalog" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Narrow focus on desktop Form; not evidence of publication or installation.</figcaption>
</figure>

Start here: [Troubleshoot a capture that does not appear or register customers]({% link _troubleshooting-deliverability/troubleshoot-a-capture.md %}).

## Page access and loading

If a page is blank, does not finish loading, or shows the same error, preserve the URL and time of the problem before reloading.

Add the business, exact warning and last confirmed step. If this happened after saving, importing or sending, reconcile the original outcome before repeating: a missing visible response does not establish that the operation failed. A loaded document also does not confirm that all panels or resources have finished. Review screenshots and logs to exclude passwords, tokens and codes before sharing them with Support.

Start here: [Troubleshoot pages that do not load]({% link _troubleshooting-deliverability/troubleshoot-pages-that-do-not-load.md %}).

If the problem continues, review [Contact Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).
