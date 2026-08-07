Use this guide when a Hellotext page is blank, remains in a loading state, shows incomplete information, responds slowly, or repeatedly shows the same error.

## Before reloading

First, preserve the information that will make the problem easier to investigate:

- copy the full URL;
- note the selected business;
- record the approximate date and time with time zone;
- take a screenshot of the visible message or state; and
- note the last action performed.

If the error appeared while sending a campaign, importing data, changing billing, or performing another action that could create duplicate results, confirm its status before repeating it.

## Define the scope

Check how broad the problem is:

1. Does one page fail, or do all Hellotext pages fail?
2. Does one business fail, or does it also happen after switching businesses?
3. Does it affect one teammate or several people?
4. Is the page blank, or does it load with data that does not match the filters?
5. Did it start after a role, integration, browser, or network change?

A page that loads without results is not always experiencing a technical failure. Check the period, time zone, filters, business, and permissions before treating it as an outage.

## Recover the page

Try these steps in order and check again after each one:

1. Reload the page once.
2. Open the same URL in a private window in the same browser.
3. Confirm that your connection can open other pages and that a VPN, proxy, or corporate filter is not blocking Hellotext.
4. Try another updated browser or network when your team policy allows it.
5. Sign out and back in if the problem appears limited to your session.
6. Temporarily disable privacy or content-blocking extensions for the test when it is safe to do so.

Clear site data only after preserving evidence and any unsaved work. This signs you out and removes local browser preferences, but it does not delete information stored in your Hellotext business.

## Check permissions and context

If general navigation works but one page does not:

- confirm that you are in the correct business;
- check whether your role can access that setting or report;
- open the page from Hellotext navigation instead of an old bookmark;
- remove filters to see whether the view returns data; and
- check whether the linked object still exists and remains available to your business.

An access error, an empty data view, and a technical loading failure need different solutions. Preserve the exact warning text.

## Collect technical evidence

If you can use browser developer tools:

1. Open **Console** and **Network** before reproducing the problem.
2. Reload the page and repeat the action once.
3. Preserve the text of the first relevant error.
4. In **Network**, identify failed requests and note the URL, method, status, and time.

A HAR file can contain customer identifiers, message content, cookies, or authorization headers. Do not share it unless Support requests it and you have confirmed a secure way to send it.

## When to contact Support

Contact Support when:

- the problem also happens in a private window and another browser or network;
- it affects multiple teammates or businesses;
- it blocks access to Inbox, channels, campaigns, playbooks, billing, or essential data;
- an action remains in an uncertain state and repeating it could create duplicates; or
- you see repeated server errors or failed requests that you cannot resolve.

Use [Contact Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) to gather the information needed.

## Related guides

- [Troubleshooting checklist]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Troubleshoot a capture that does not appear or register customers]({% link _troubleshooting-deliverability/troubleshoot-a-capture.md %})
- [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
