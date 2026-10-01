Use this guide when a Hellotext page is blank, remains in a loading state, shows incomplete information, responds slowly, or repeatedly shows the same error.

## Before reloading

First, preserve the information that will make the problem easier to investigate:

- copy the full URL;
- note the selected business and its public ID, if available;
- record the approximate date and time with time zone;
- take a screenshot of the visible message or state; and
- note the last action performed and the last stage whose result you could confirm.

If the error appeared while sending a campaign, importing data, changing billing, or performing another action that could create duplicate results, confirm its status before repeating it. Interrupted loading or a missing notice does not establish that the server rejected the operation. Preserve the original request and check its outcome; if it remains uncertain, get help before sending or saving again.

Under **Settings > General**, the header identifies the business. This fictional example is named **Enterprise** and has public ID **4ONLdN32**; the name does not identify its plan. It is an independent page that loads correctly, without clicking **Edit business** or switching businesses. It locates the context you should record, rather than showing an error or recovery. See [Set up your business]({% link _getting-started/setting-up-your-business.md %}) to locate these details.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Name and public ID of a fictional business under General">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Name and public ID of a fictional business under General" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent state that loads correctly; it does not show the problem or its resolution.</figcaption>
</figure>

## Define the scope

Check how broad the problem is:

1. Does one page fail, or do all Hellotext pages fail?
2. Does one business fail, or does it also happen after switching businesses?
3. Does it affect one teammate or several people?
4. Is the page blank, or does it load with data that does not match the filters?
5. Did it start after a role, integration, browser, or network change?

A page that loads without results is not always experiencing a technical failure. Check the period, time zone, filters, business, and permissions before treating it as an outage. Compare the same URL and object with a person who already has authorized access; do not change roles to test. Record which combination fails and which works, without assuming that comparison establishes the cause.

For reports, also preserve the complete date range and metric. This fictional historical example selects **First 14 days**, **19 April–2 May 2026**, anchored to the campaign. Desktop shows four complete cards: attributed revenue in USD, ROI as a multiple, conversion as a percentage and revenue per message in USD. The narrow view shows the first carousel card. This independent loaded state is neither current data nor a recovery result. See [How to analyze your campaigns]({% link _analytics-reporting-attribution/campaign-reporting.md %}) to interpret the metrics.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Period and four cards in a fictional historical report">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-en-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Period and four cards in a fictional historical report" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent report; its figures do not establish page recovery.</figcaption>
</figure>

If the header appears but a panel keeps loading, identify which panel: different parts can request data separately. An empty report, a pending section and a completely inaccessible page provide different evidence.

## Recover the page

Try these steps in order after preserving unsaved work. Check after each step and stop when the page works:

1. Reload once if it is a viewing page. If the browser asks to resubmit a form, cancel and confirm the original outcome first.
2. Open the same URL in a private window in the same browser. Sign in with the same authorized account and confirm the same business; a private window has different session and storage state.
3. Confirm that your connection can open other pages and that a VPN, proxy, or corporate filter is not blocking Hellotext.
4. Try another updated browser or network when your team policy allows it.
5. Sign out and back in only if the problem appears limited to your session and you have preserved your work. This does not delete business records, but changes the session; do not use it to repeat an uncertain operation.
6. Temporarily disable privacy or content-blocking extensions for the test when it is safe to do so.

Working in private mode or another browser helps narrow the issue, but does not establish that an extension or cache caused it. Extensions can have different private-mode permissions. Keep each comparison result and restore any extension you disable.

Clearing cache differs from deleting cookies or site storage. Clear site data only after preserving evidence and pending work: depending on selected options, it can sign you out, remove local preferences or drafts, and affect browser registrations. It does not delete information on Hellotext servers or cancel an operation already received. Review which categories to remove and avoid clearing all sites. [Chrome's storage documentation](https://developer.chrome.com/docs/devtools/application) explains browser categories.

## Check permissions and context

If general navigation works but one page does not:

- confirm that you are in the correct business;
- check whether your role and the business’s available features allow access to that setting or report;
- open the page from Hellotext navigation instead of an old bookmark;
- remove filters to see whether the view returns data; and
- check whether the linked object still exists and remains available to your business.

An access error, an empty data view, and a technical loading failure need different solutions. Preserve the exact warning and any redirect to sign-in, verification or a plan. Permissions are evaluated per tool; a role name is not a universal access matrix. Clearing browser data cannot grant permissions or restore a deleted object.

The figure below is the real role selector for **Lucía Méndez**, an existing fictional teammate, with **Agent** selected. It shows three complete options, without the save footer. It does not show your role, denied access or a change: proceeding with **Next** saves the role, so it should not be used to test access. See [Team roles and permissions]({% link _team/understanding-team-roles.md %}) and ask the business administrator to check your current access.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Three role options with Agent selected for a fictional teammate">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 631px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-team-roles/roles-en-mobile.png 2x" width="828" height="1094" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-team-roles/roles-en.png" srcset="/images/team/understanding-team-roles/roles-en.png 2x" width="1226" height="1006" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Three role options with Agent selected for a fictional teammate" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Independent unchanged selector; it does not show an access error.</figcaption>
</figure>

## Collect technical evidence

If you can use browser developer tools:

1. Open **Console** and **Network** before reproducing a viewing problem; do not send, import or save again to obtain evidence.
2. In Chrome, enable **Preserve log** to retain requests across navigation. Reload once only when it will not resubmit a form.
3. Preserve the first relevant error and time. In **Network**, distinguish document, data request and JavaScript file; record URL, method and status. A document with HTTP 200 does not establish that every panel is ready.

See [Chrome's Network reference](https://developer.chrome.com/docs/devtools/network/reference/). Do not use **Resend** or **Replay XHR** to investigate an uncertain operation.

| Evidence | What to check |
| --- | --- |
| Sign-in redirect or 401 | Account and session for the affected request. |
| 403 | Access to that tool and business; it can affect only one panel. |
| 404 | URL, business and object availability; it does not by itself establish deletion. |
| 5xx | Original request and time for Support; avoid repeating the operation. |
| Blocking, connection failure or no HTTP code | Browser message and affected resource; do not record it as a 500. |

[MDN's HTTP status reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status) helps interpret a response; the code alone does not identify its cause.

A HAR can contain URLs, identifiers and bodies with customer or message data. Even Chrome's sanitized export, which excludes sensitive cookie and authorization headers, needs review. Share it only when Support requests it and agrees on a secure channel; do not publish tokens, passwords or verification codes.

## When to contact Support

Contact Support when:

- the problem also happens in a private window and another browser or network;
- it affects multiple teammates or businesses;
- it blocks access to Inbox, channels, campaigns, playbooks, billing, or essential data;
- an action remains in an uncertain state and repeating it could create duplicates; or
- you see repeated server errors or failed requests that you cannot resolve.

Include the URL, business ID, affected account, browser and version, time with time zone, last action and comparison results. Separate observations from assumptions; a screenshot of another working page does not establish the cause. If an operation remains uncertain, state which result you could confirm before the error.

Use [Contact Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) to gather the information needed.

## Related guides

- [Troubleshooting checklist]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Troubleshoot a capture that does not appear or register customers]({% link _troubleshooting-deliverability/troubleshoot-a-capture.md %})
- [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
