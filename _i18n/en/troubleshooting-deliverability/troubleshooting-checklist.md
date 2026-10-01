Use this checklist when something does not look right and you need to decide where to investigate first.

Before changing settings, write down the exact symptom, the affected business, the customer profile or audience, the channel, and the approximate time when the issue happened.

Add the record URL or reference, time zone and last stage you could confirm. Distinguish missing data, an action that never started, a message created without delivery and an unassigned reply: each needs different evidence.

If loading failed after sending, importing, saving or running an integration, check the original outcome first. A missing notice does not establish that the operation failed. If its outcome remains uncertain, contact Support before repeating it.

## 1. Confirm the setup and source data

If customer profiles, products, orders, or channel settings are missing or stale, start with setup.

Check whether the store or integration is connected, whether recent data is syncing, and whether the affected customer profile has the data you expected.

Compare the same business, identity or reference and source. An existing order or product does not establish receipt of its event; a profile with an email or phone does not establish verification or permission to message that destination.

The figure shows an independent fictional profile: **Camila Torres**, **Unconfirmed**, with an example email and no phone. Use it to locate fields and state, rather than as integration or consent evidence. The narrow view is a focus from the same desktop screen.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fields and Unconfirmed state of a fictional profile">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fields and Unconfirmed state of a fictional profile" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent profile; it does not establish verification, syncing or consent.</figcaption>
</figure>

Keep reading:

- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})

## 2. Check the channel and sender

If a message did not send or did not arrive, identify the channel first.

Check the sender, consent for that channel, account access, balance or plan limits, and any temporary SMS limits that may apply to new businesses.

Separate channel availability, reachability of that destination and its current permission. A general subscription state does not replace checking the channel, destination and communication type. For WhatsApp, a draft or common editor does not establish an active approved version; follow the template guide.

If a message exists, preserve its exact state and error. **Pending**, **dispatched**, **routed**, **delivered** and **error** are different stages; a request acknowledgment or routed state does not confirm delivery. If no message exists, investigate omission before creation as well. Daily SMS and monthly message limits use different bases; do not assume an available balance removes both.

This independent importer example retains **No** for updating customers as subscribed. The import has not started and its file is **Not selected**. It locates a consent decision, rather than showing new permission, an opt-out or a change to existing profiles. Do not start an import to investigate a send.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="No subscription option in an unstarted fictional import">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1050.5px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-en-20260928-crop.png 2x" width="780" height="1200" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png 2x" width="2065" height="705" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="No subscription option in an unstarted fictional import" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">File Not selected; the import did not run or change consent.</figcaption>
</figure>

Keep reading:

- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Troubleshoot WhatsApp templates]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %})
- [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %})

## 3. Review audience and message setup

If a campaign reached fewer people than expected, review the selected audience, segment rules, channel eligibility, timing, and message content.

For automations, confirm which playbook or route should have run and whether the customer matched the trigger conditions.

Compare audience size with the right stage: selected lists and segments can overlap, exclusions remove profiles and channel eligibility can reduce recipients. A count or preview does not establish how many messages were created or delivered. Check segment conditions and period; counts may be cached.

For an automation, a received event does not guarantee execution or sending. Check activation, trigger and filters, admission where applicable, steps, hours and conditions rechecked before sending. Preserve existing evidence at each stage; do not activate the playbook or generate an event or message to manufacture a test.

The **Message** editor, opened from SMS, shows a fictional **Return follow-up** draft with unresolved **{name}**, an example URL and **STOP** text. It was not saved or sent; it does not show effective recipients, final SMS parts or WhatsApp approval. Check available properties and your own message context before interpreting personalization.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional Message draft with unresolved personalization">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 642px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/send-messages-with-api/editor-en-mobile.png 2x" width="668" height="718" />
        <img class="ht-editorial-visual__image" src="/images/developers/send-messages-with-api/editor-en.png" srcset="/images/developers/send-messages-with-api/editor-en.png 2x" width="1248" height="708" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional Message draft with unresolved personalization" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent unsaved draft; it does not establish eligibility, approval or delivery.</figcaption>
</figure>

Keep reading:

- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Lists vs. segments]({% link _audience/lists-and-segments.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})

## 4. Check links, tracking, and attribution

If clicks, events, conversions, or attributed revenue look wrong, check whether the message used tracked links, whether events are reaching Hellotext, and whether attribution rules apply.

Remember that another commercial click, a human sales action, cancellations, or refunds can change attribution.

Compare the same period, time zone, population and unit. A click is not necessarily a unique person; campaign rates have their own denominators. Interaction signals can later update the delivered-message cohort by dispatch day. Do not compare that cohort with all events occurring during the same range.

If you use the SDK, loading its file does not confirm initialization: wait for asynchronous initialization and check that each real view explicitly records **page.viewed**. If the API returned HTTP **200** with **received**, retain the acknowledgment and subsequently check recording and processing; it is not proof of a visible event, attribution or delivery. Reconcile an uncertain response before retrying.

The figure is an independent historical fictional report with **First 14 days**, **April 19–May 2, 2026**, anchored to the campaign. Desktop shows four complete cards: attributed revenue in USD, ROI as a multiple, conversion as a percentage and revenue per message in USD; the narrow view shows the first carousel card. It does not represent current data or the outcome of resolving this issue.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Period and four metrics of a fictional historical campaign">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Period and four metrics of a fictional historical campaign" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent historical period; the narrow view shows the first card.</figcaption>
</figure>

Keep reading:

- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Tracking events]({% link _developers/tracking-events.md %})

## 5. Check inbox ownership and response workflow

If replies are not being handled by the expected person, review conversation assignment, team roles, ownership, and response-time settings.

Distinguish message receipt, conversation owner, team destination, teammate availability or capacity and an actual response. Waiting for capacity differs from having no assignable members. Being open, closed or unread also does not establish who should respond or that a target was met.

The figure shows an existing fictional policy with unchanged default **5-minute** targets for first and ongoing responses. The heading and both fields are complete; the save footer is omitted. It is independent of the other examples: it does not show an assigned conversation, queue or actual compliance.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Default response targets of an existing fictional policy">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-en-mobile.png 2x" width="824" height="804" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/default-en.png" srcset="/images/team/understanding-response-times/default-en.png 2x" width="972" height="764" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Default response targets of an existing fictional policy" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unchanged five-minute targets; they do not show assignment or compliance.</figcaption>
</figure>

Targets use the business calendar and time zone; they are not the channel window or a delivery guarantee. A human response and provider acknowledgment are different actions. Review existing permissions and settings without changing roles, hours or owners as a test.

Keep reading:

- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Assigning conversations]({% link _team/assigning-conversations.md %})
- [Understanding response times]({% link _team/understanding-response-times.md %})

## When you contact support

If a page does not load, preserve its URL, the time of the error, and the last action before reloading. Follow [Troubleshoot pages that do not load]({% link _troubleshooting-deliverability/troubleshoot-pages-that-do-not-load.md %}).

Include the business name, the affected customer profile, the channel, the campaign, playbook, conversation, or report link, the approximate time, what you expected, what happened instead, and any screenshots or recent setup changes. Review [Contact Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) before sending sensitive information.

Include the exact warning, date and time with time zone, checks performed and last confirmed result. Separate observations from assumptions. Share screenshots and logs through the channel agreed with Support, reviewing customer data and message content; exclude tokens, passwords and verification codes.
