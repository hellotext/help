Use this guide when an event, profile update, segment change, playbook trigger, route step, or report metric does not appear where you expected.

Signals can come from a store, website, capture tool, messaging channel, API, Hellotext.js, customer profile, or Inbox conversation. The fastest way to fix a missing signal is to locate where the chain stopped.

## Before you start

Write down the exact symptom before changing settings.

Collect:

- The business where the issue happened.
- The customer profile, email, phone, external ID, or test user.
- The expected signal or event name.
- The affected segment, playbook, route, campaign, or report.
- The channel, store, integration, or tracking source.
- The approximate time the activity happened.
- What you expected to see and what appeared instead.

Start with existing activity and record its date, time and time zone. Separate **source**, **request received**, **event saved**, **profile attached**, **rule evaluated** and **result**. A network response does not prove every stage.

If you need to reproduce the flow, use your own details or an authorized internal profile. Reconcile any uncertain result with existing records first: repeating tracking, a submission or a send can create another interaction. Do not generate extra traffic solely to check a counter.

## 1. Check the customer profile first

Open the customer profile you expected to update.

Check whether:

- The profile exists.
- The email, phone, external ID, or integration identifier is correct.
- The event or profile property appears on the timeline or profile.
- The customer has the expected subscription or consent status.
- The profile belongs to the same business, store, channel, or marketplace you are testing.
- The customer appears more than once as duplicate profiles.

If activity exists on another profile, compare the identifiers each source sent before merging profiles. A Hellotext public ID, an integration's external reference and a browser session are different identifiers. The same reference can belong to different sources; retain its source when searching.

Hellotext.js can track activity for a still-anonymous session. Not finding it on the expected profile does not establish that the request never arrived. Check when the customer was identified and which session accompanied the event. A change of email, phone or browser does not by itself establish that two profiles should be merged.

Camila Torres is an independent fictional profile: **Unconfirmed**, with an example email and no phone. These fields help check identity and status; they do not prove marketing permission or an available SMS destination. Narrow screens show a focus of the same desktop panel.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identity and status of the fictional Camila Torres profile">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Identity and status of the fictional Camila Torres profile" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent example profile; it is not the result of this guide’s events or objects.</figcaption>
</figure>

## 2. If the profile is missing or stale

If the customer profile does not exist, or recent profile data is missing, start with the source system.

Check:

- The store or integration is connected to the right Hellotext business.
- API keys, tokens, plugin settings, and permissions are valid.
- The first sync has finished.
- The affected customer exists in the source system.
- The integration is allowed to sync the fields you expect.
- The customer's email, phone, or external ID is present in the source system.

If data comes from a capture, inspect the exact version of the QR code, shareable link, form, popup or checkout opt-in the customer used and find the existing submission. Receipt, identity verification, profile updates and consent can happen at different stages. Repeat a test only after clarifying an uncertain outcome.

Also distinguish a **commerce object** from an **event**. Finding a synced order or product does not establish that an action such as `order.placed` was recorded or attached to the expected customer. Compare the source system's reference, source, state and date with Hellotext.

This fictional order has reference **ORDER-1001**, source **custom_store** and total **USD 89.90**. It is an independent draft with zero events; **Deliver** is a delivery method, not a shipment confirmation. **Order ID** shows the external reference, distinct from the public ID used by the API. It does not belong to the Camila example or prove a synced or attributed purchase.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Reference, source and amount of a fictional draft order">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-en-mobile.png 2x" width="778" height="914" />
        <img class="ht-editorial-visual__image" src="/images/developers/orders-with-api/details-en.png" srcset="/images/developers/orders-with-api/details-en.png 2x" width="1006" height="914" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Reference, source and amount of a fictional draft order" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Example order without events; an object’s existence does not prove a purchase signal.</figcaption>
</figure>

Keep reading: [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## 3. If the event is missing

If the profile exists but the activity is not there, check the event source.

For integrations:

- Confirm the integration supports that event.
- Check when the event happened and which historical period or states that integration imports; connecting a store does not guarantee reconstructing all prior activity.
- Check whether the source uses a different event or status name.
- Inspect sync status and errors. A queue or background process has no completion time guaranteed by this guide.

For Hellotext.js or API tracking:

- Confirm the script or API call runs on the right site, checkout, backend, or app.
- Confirm the request is sent to the right business or environment.
- Keep action names consistent, such as `product.viewed`, `cart.abandoned`, or `order.placed`.
- Include the identifier Hellotext needs to attach the event to the customer profile.
- Include required product, cart, order, or custom properties when the playbook or report depends on them.
- Inspect the complete response and first-attempt records before retrying. HTTP 200 with `received` can acknowledge receipt for later processing without returning an ID or proving the event is already saved or attached.

With Hellotext.js, wait for asynchronous initialization to finish before tracking. The published SDK does not automatically record `page.viewed`: use an explicit call for each real view you want to measure, with its URL. Check that site navigation neither skips views nor records the same view twice. Loading the JavaScript file or having a session cookie does not establish that an event was recorded.

Use the **exact action name**, rather than its display title. Under **Settings > Actions > Custom**, this example defines `appointment.booked` with the title **Appointment booked**. The definition exists with zero events; it does not show a completed appointment. The narrow view focuses on that row and the creation button without creating another action.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Exact name appointment.booked and display title Appointment booked">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-en-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-en.png" srcset="/images/developers/custom-actions/catalog-en.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Exact name appointment.booked and display title Appointment booked" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Catalog of an existing fictional action; its definition does not record an occurrence.</figcaption>
</figure>

Check the requirements of the flow you are using. This independent **New Event** draft for **Demo Caso 1** selects **Appointment booked**, but leaves **Associated object** blank and **Save changes** disabled. It was not saved and no event was recorded. The manual form requires that object for this action; the API and SDK allow a custom action without an object. If you include one, its type, identifier or parameters must resolve to a valid object in the business.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional manual event without an associated object and with Save disabled">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 449px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/manual-en-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/manual-en.png" srcset="/images/developers/custom-actions/manual-en.png 2x" width="862" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional manual event without an associated object and with Save disabled" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved draft; it does not establish creation, processing or playbook execution.</figcaption>
</figure>

Also compare the activity timestamp. Tracking endpoints accept ISO 8601 dates or Unix seconds; sending milliseconds as seconds changes the expected date. Historical activity can fall outside a current condition or report. Do not change its date or recreate the event to make it fit a window.

Do not assume universal deduplication. Some retained order events are deduplicated by order and action; that does not cover every custom action, update or retry. After an uncertain response, search by identity, action, object and time first.

Keep reading: [Tracking events]({% link _developers/tracking-events.md %}).

## 4. If the event exists but nothing happens

A signal can exist without triggering a message, segment update, or report change.

Check the rule that should have used the signal.

For segments:

- The segment uses the same action, property, list, tag, channel, or consent rule.
- The event is recent enough for any time-based rule.
- The customer profile is eligible for the segment.
- Inclusion or exclusion, quantity and grouping conditions match what happened.
- Segment evaluation finished and membership is still valid; a visible count can use cached data and change at a different time.

Conditions within one rule are alternatives; the profile must pass every rule in the segment. Check negations and periods especially: elapsed time can change what needs evaluation. A membership list, count and segment-entry event are different evidence.

For playbooks or routes:

- The trigger uses the same signal name and properties.
- The playbook or route is active.
- The customer matches the audience and trigger conditions.
- The customer is subscribed or eligible for the channel.
- Frequency limits applicable to that tool, hours, stop conditions or work in progress did not block or delay the next step. Proactive playbook limits are not a universal rule for campaigns, journeys or reactive responses.
- The required product, cart, order, channel, or profile data is complete enough for the playbook to act.
- The fallback, unresolved, or assignment path is configured when automation cannot continue.

A received event and a started journey do not establish that each step is ready to send. Inspect journey activity, waits, pauses and step conditions. Proactive playbooks can recheck conditions at send time: a later purchase or lack of sellable products can change the result. Receiving a conversation, assigning it to a person or team, and sending a reply are also distinct stages.

For campaigns:

- The customer was in the effective audience at send time, after combining inclusions and applying exclusions. Membership in a segment today does not establish inclusion then.
- The channel and sender were available.
- The customer was eligible for that message type.
- The message was not skipped because of consent, limits, template, or channel rules.

Distinguish an omission before message creation from a pending, dispatched, delivered or errored message. An incoming event does not guarantee a message or its delivery. Not all activity is projected into an Inbox conversation either: that view depends on the action and business configuration.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

For a playbook-specific checklist, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## 5. If reports or attribution look wrong

If activity happened but reports do not show what you expected, first identify what each metric counts. Compare the same business, complete date range, time zone, channel, campaign or playbook, filters and currency. Purchase, dispatch and later-signal timestamps can belong to different days.

This fictional historical report selects **First 14 days**, **19 April–2 May 2026**. Desktop shows four complete cards: attributed revenue, average ROI, conversion and revenue per message; the narrow view shows the first carousel card. It is independent of the profiles, orders and drafts above; its figures do not establish that those signals were received.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Period and four metrics in a fictional campaign report">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Period and four metrics in a fictional campaign report" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent historical report; it is not the result of the preceding examples.</figcaption>
</figure>

In campaign reports, conversion compares attributed conversions with delivered messages; ROI divides revenue by billable delivery cost, and revenue per message uses delivered messages. Do not compare those percentages with visits or unique people. **Engagement** counts each delivered message seen, clicked or replied to once, by its dispatch day in the business time zone. Later signals can update that cohort; multiple clicks are not multiple people or multiple unique engagements.

Review:

- Whether the message used tracked links.
- Whether the customer clicked from the same profile that later purchased or converted.
- Whether the purchase, order, refund, cancellation, or conversion was synced.
- Whether attribution rules apply to that channel and timing.
- Whether another commercial source existed and which evidence and timestamps attribution uses to decide between it and Hellotext; the arrival order of two requests is insufficient.
- Whether test activity is filtered, delayed, or easy to confuse with real traffic.
- Whether you are comparing the same date range, channel, campaign, playbook, or audience.

A saved purchase can exist without Hellotext attribution. Compare identity, click or delivery evidence, session/delivery windows and actual purchase time. Reports and their projections can update in the background or use cached data; reloading does not guarantee an immediate update. Preserve original records before concluding an event is missing or submitting it again.

Keep reading:

- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})

## Common symptoms

| Symptom | Where to check first |
| --- | --- |
| Customer profile is missing | Store, integration, capture, import, or API identity |
| Customer activity is on the wrong profile | Email, phone, external ID, duplicate profiles, or source identity |
| Event never appears | Integration sync, Hellotext.js, API request, action name, or environment |
| Event appears but segment does not update | Segment rules, time window, property names, or refresh timing |
| Playbook did not start | Trigger, audience, channel eligibility, consent, stop conditions, or active state |
| Report metrics look low | Tracked links, date range, attribution rules, channel, audience, or synced orders |
| WhatsApp/SMS message did not send | Channel setup, sender, consent, template, limits, or delivery state |

## When to contact support

If the issue still is not clear, include:

- One affected customer profile.
- The exact event or signal you expected.
- The affected segment, playbook, route, campaign, or report.
- The activity date, time and time zone, and request time if different.
- The last verified stage and first missing stage, with its status or response code.
- The source system, integration, API request, or capture path involved.
- Screenshots or links showing what you expected and what appeared instead.
- Any recent changes to integrations, tracking scripts, templates, audience rules, or playbook settings.

Include the exact action name, reference and public ID where relevant, and errors from the original request. Review headers, bodies, URLs and screenshots before sharing: remove tokens, passwords, verification codes and real payment details. A concrete example helps separate setup, identity, tracking, eligibility, measurement and attribution.

## Related guides

- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Troubleshooting checklist]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
