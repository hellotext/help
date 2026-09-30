Tracked links connect a click with the message that created it, the customer profile, a session, reporting, and later activity on your site.

Hellotext can create these links in campaign, journey, playbook, and Inbox messages. For the context to continue after the redirect, the destination site must preserve the session and track later activity correctly.

## What Hellotext does when the customer clicks

When you add a link with the editor tool, Hellotext generates a short URL such as `hello.link/XXXXXX` or uses the custom domain configured by the business.

When the customer clicks, Hellotext:

1. Tracks the `short_link.clicked` action for the customer profile and corresponding message.
2. Updates the link click count and available reports.
3. Preserves the campaign, broadcast, journey, step, or playbook context that created the message.
4. Redirects the customer to the original URL.
5. Adds a session and UTM parameters to the destination URL.

Hellotext filters previews it identifies as bots so they are not counted as customer clicks. Even so, a recorded click represents an interaction, not a purchase or guaranteed conversion.

Do not send `short_link.clicked` manually from your integration. Hellotext creates it when processing the link click.

## Parameters received by the destination site

The redirected URL can look like this:

```text
https://shop.example.com/products/everyday-sneakers?hello_session=SESSION_ID&utm_source=hellotext&utm_medium=sms&utm_campaign=CAMPAIGN_ID
```

The parameters have different purposes:

- `hello_session` preserves the session associated with the link and connects later activity.
- `utm_source` identifies the traffic source; its value is normally `hellotext`.
- `utm_medium` identifies the channel when available.
- `utm_campaign` identifies the campaign, journey, or playbook when applicable.

The current parameter is `hello_session`. Do not use or look for `hellotext_session`.

If the original URL already contains parameters, Hellotext preserves them and adds its own. Do not remove `hello_session` or the UTM parameters in an intermediate redirect.

## How the session continues on the site

Hellotext.js reads `hello_session` from the URL, retains the session in the browser, and includes it with later activity.

Initialize Hellotext.js before your router or storefront code removes URL parameters. In a single-page application, preserve the query string during the initial load.

You can inspect the session after the library initializes:

```javascript
if (Hellotext.isInitialized) {
  console.log(Hellotext.session)
}
```

Hellotext.js automatically tracks `page.viewed` with the current URL. If the page represents a product, also track `product.viewed` and explicitly include the product. The URL alone does not provide all catalog information.

See [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}) for the complete session and identity lifecycle.

## Context by message source

The same mechanism preserves different references depending on where the message was created:

- **Campaign:** the click is related to the campaign, broadcast, and sent message.
- **Journey:** the click is related to the journey, step, and executed message.
- **Playbook:** the click is related to the playbook and generated or sent message.
- **Inbox:** the click remains in customer and conversation activity even when there is no campaign or automation report.

Do not manually reuse a personalized message link for other customers or sends. Add the destination through the editor link tool and let Hellotext generate the correct context for each message.

## How later events are connected

A click is only the beginning of the session. To understand what happened next, the site or backend must track the relevant actions:

- Hellotext.js tracks navigation, product views, and cart changes.
- Your backend tracks trusted orders, payments, cancellations, shipments, and deliveries.
- When the customer becomes known, the session must be associated with the correct customer profile.

If checkout happens on another domain or application, send the `Hellotext.session` ID to your backend before losing the context. You can then track the order with the corresponding customer profile or session.

Do not send the same event from Hellotext.js and the backend. See [Tracking events]({% link _developers/tracking-events.md %}) and [External tracking]({% link _developers/external-tracking.md %}).

## Clicks, reporting, and attribution

Clicks can appear in customer profile activity and in campaign, journey, or playbook reports when that report is available.

An eligible click can provide active attribution evidence and normally opens a seven-day window from the click. An eligible delivery or another passive signal can apply within the default 24-hour window. These windows can be configured by account.

The click does not guarantee that a purchase will be attributed to that source. Hellotext also evaluates:

- Whether the customer and order are identified correctly.
- Whether the purchase occurs inside the applicable window.
- Whether the campaign, journey, playbook, or delivery is eligible.
- Whether another valid source has higher precedence.

See [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %}) for complete windows, precedence, and examples.

## Verify the implementation

Test with a recognizable customer profile and message:

1. Create a tracked link through the editor.
2. Send the test message and open the link as the customer would.
3. Confirm that the destination URL includes `hello_session` and the expected UTM parameters.
4. Verify that `Hellotext.session` matches the received session.
5. Confirm that the click appears in customer profile activity.
6. Review the campaign, journey, or playbook report when available.
7. Track a test product view, cart, or order and confirm that it preserves the correct customer and source.
8. Confirm that the same activity was not tracked twice.

## Troubleshoot common problems

- **The click appears, but later activity does not:** confirm that the site preserves `hello_session` until Hellotext.js initializes.
- **The session changes when the customer reaches the site:** review redirects, domains, cookies, and Hellotext.js initialization order.
- **The page view appears without a product:** track `product.viewed` with the corresponding product.
- **The click does not appear in the report:** verify that the link was created in the correct message and was not a preview detected as a bot.
- **The purchase is not attributed:** review identity, order, timestamp, window, and source precedence.

If signals are missing, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Custom domain for short links]({% link _integrations/custom-domain-for-short-links.md %})
