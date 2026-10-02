For a new request, use [hellotext.com/contact](https://www.hellotext.com/contact/). The current page publishes [info@hellotext.com](mailto:info@hellotext.com) and a WhatsApp link. If you use the form for a problem, choose **I need help**; the initial option is **I want a demo**. If you already have a thread with [support@hellotext.com](mailto:support@hellotext.com), reply in that same thread to preserve context.

A specific report makes it easier to identify the affected business, object, and time. You do not need to diagnose the technical cause before asking for help.

This guide’s figures are independent fictional examples for locating information. They do not show a submitted request, a real incident or its resolution.

## Before contacting Support

When possible:

1. Record the exact stage and last confirmed result. If reproduction is needed, start with a read-only step that does not change data or send messages.
2. Review the related guide in this section.
3. Confirm whether it affects one teammate, customer profile, message, or page, or whether it is broader.
4. Preserve any recent changes that may be related.
5. Avoid repeating actions that could send messages, create campaigns, charge, import, or modify data more than once.

If incorrect messages continue to send, use the stop or deactivation control applicable to the flow, when available and authorized; consult its guide and record when the state changed. Not every flow offers a manual pause. Stopping a flow does not reverse delivered messages or confirm that all pending work or work accepted by a provider was canceled. If you cannot stop it safely, include that situation in the request.

If a save, import or send action had no clear response, check its original result before repeating it. Do not run another test send to gather Support evidence.

## Basic information to include

Include:

- business name in Hellotext;
- exact URL of the affected page;
- approximate date and time with time zone;
- what you expected to happen;
- what happened instead;
- scope of the problem;
- short steps to reproduce it;
- a screenshot or short recording; and
- recent configuration, integration, permission, or code changes.

Add the **public business ID**, if you can view it, and the affected record’s link or identifier. You do not need to change the business or its settings to obtain context.

In **Settings > General**, this example shows **Enterprise** and **4ONLdN32**. Enterprise is the fictional business name; it does not establish the contracted plan, a connection or a business switch. The figure helps locate the name and public ID.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Name and public ID of a fictional business in General">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Name and public ID of a fictional business in General" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent business context; it does not establish plan, integration or resolution.</figcaption>
</figure>

Keep the conversation in the same email or request thread when adding evidence about the same problem. Open a separate request for a different problem.

## Information by problem type

| Problem | Useful information |
| --- | --- |
| **Message or channel** | Channel, sender, message ID or link, customer profile, delivery status, and reason. |
| **Campaign** | Campaign link, audience, schedule, and stage where it stopped. |
| **Playbook or journey** | Link, relevant version or configuration, expected signal, and customer profile used for testing. |
| **Inbox** | Conversation link, expected team or teammate, status, and assignment time. |
| **Integration** | Connected platform, store, or account, missing object, source-system identifier, and last known sync. |
| **Capture** | Type and name, URL or placement, device, browser, and stage where it stopped. |
| **Report or attribution** | Report, period, time zone, filters, order or conversion, and expected result. |
| **API or Hellotext.js** | Endpoint or event, time, request ID if available, response code and body without secrets, and the smallest relevant snippet. |
| **Billing** | Month, invoice, plan, or affected charge concept. Use identifiers, not complete payment details. |

You can partially mask a phone number or email when the complete identifier is not needed to find the case.

Separate object identity, its source-system reference and the expected signal. In **Settings > Objects > Orders**, the fictional **Order #1001** example shows source **custom_store**, reference **ORDER-1001**, **draft** state and total **USD 89.90**, with zero events. **Order ID** holds the reference; do not confuse it with the Hellotext public ID. **Deliver** is the order’s delivery mode, not evidence of delivery. Record the reference, source and object link when relevant; its existence does not establish sync or a processed event.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Reference and source of a fictional draft order">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-en-mobile.png 2x" width="778" height="914" />
        <img class="ht-editorial-visual__image" src="/images/developers/orders-with-api/details-en.png" srcset="/images/developers/orders-with-api/details-en.png 2x" width="1006" height="914" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Reference and source of a fictional draft order" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent order without events; Deliver indicates mode, not delivery.</figcaption>
</figure>

For a report, include the exact period, time zone, filters, unit and denominator of the metric you are comparing. Check the bases before comparing the selected audience with delivered messages or clicks with unique people.

This independent fictional historical report retains **First 14 days**, **April 19–May 2, 2026**, anchored to the campaign. Desktop shows attributed revenue **USD 1.9K**, ROI **5.4** as a multiple, conversion **6.3%** and revenue per message **USD 0.36**; the narrow view shows the first carousel card. These are not the current last fourteen days or the result of resolving an incident.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Period and metrics of a fictional historical report">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Period and metrics of a fictional historical report" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Campaign-anchored period; the narrow view shows the first carousel card.</figcaption>
</figure>

For API or Hellotext.js, retain the endpoint or event name, time, response and last confirmed state without running another operation. HTTP **200** with **received** does not guarantee processing or necessarily return an event or message ID. SDK initialization is asynchronous; each real page view requires explicitly recording **page.viewed**. Describe separately what was sent, what was acknowledged and what eventually appeared in Hellotext.

## Information not to send

Do not share:

- passwords;
- API tokens or application secrets;
- verification codes;
- cookies or authorization headers;
- complete card or bank account numbers; or
- full customer exports when one or two examples are enough.

If Support needs a sensitive file, first confirm what information is required and how to send it securely.

Share the minimum needed to find the case. A profile link or ID may avoid copying every property. Review screenshots, recordings and diagnostic files before attaching them; even a sanitized HAR can retain URLs, bodies or sensitive data. Confirm the secure channel with Support before sending a sensitive file.

The figure shows **Camila Torres**, a fictional **Unconfirmed** profile with an example email and no phone. The narrow view is a desktop focus, not a new mobile interface. It helps recognize identity, state and properties; it does not mean you should send every field or establish verification, consent or delivery.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identity and properties of a fictional unconfirmed profile">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-en-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-en.png" srcset="/images/audience/customer-profiles/profile-fields-en.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Identity and properties of a fictional unconfirmed profile" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent fictional profile; share only the context needed.</figcaption>
</figure>

## How to describe impact

Describe the observable impact without trying to assign a technical severity.

For example:

- how many businesses, teammates, or customers are affected;
- whether it blocks an operation or has a temporary workaround;
- whether it prevents receiving or sending messages;
- whether it could create duplicate messages, changes, or charges; and
- how long it has been happening.

Report any suspected unauthorized access, data exposure, or credential misuse immediately. Do not include the potentially exposed secrets in the message.

## What to expect next

Support may ask for another example, confirm permission to inspect an object, or ask you to reproduce the problem with technical evidence. Reply in the same thread to preserve context.

The public contact page does not define one universal response time. If your plan or agreement includes a specific support commitment, that commitment is the applicable reference. Do not use the SLAs configured for your Inbox conversations as the expected Hellotext Support response time: they are different metrics.

In **Settings > Response times**, this existing fictional policy shows **five minutes** for the initial response and **five minutes** for subsequent responses. The heading and fields are complete; the whole save footer is omitted and nothing was changed or saved. These targets apply to your business’s Inbox conversations and calendar, not Hellotext Support’s response time.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Inbox response targets of a fictional business">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-en-mobile.png 2x" width="824" height="804" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/default-en.png" srcset="/images/team/understanding-response-times/default-en.png 2x" width="972" height="764" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Inbox response targets of a fictional business" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing Inbox policy; it does not set a Support commitment.</figcaption>
</figure>

Keep the thread and confirm what additional evidence is needed. A Support reply, authorized access to a record and resolution are different stages; submitting the request does not guarantee recovery.

## Related guides

- [Troubleshooting and deliverability overview]({% link _troubleshooting-deliverability/troubleshooting-overview.md %})
- [Troubleshooting checklist]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Troubleshoot pages that do not load]({% link _troubleshooting-deliverability/troubleshoot-pages-that-do-not-load.md %})
- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
