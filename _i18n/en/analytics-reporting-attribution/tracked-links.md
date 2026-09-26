Use tracked links in your messages to measure clicks from campaigns, routes, playbooks, Inbox conversations, and other sends.

To insert one from the message editor:

1. In the toolbar, select **Insert short link** <img style="display: inline; width: 20px; height: 20px; vertical-align: middle;" src="/images/icons/link.svg" width="20" height="20" alt="">.
2. In **Create a shortlink**, enter the destination URL.
3. Select **Add short link**. The editor inserts the tracked link in the message.

By default, the link has the form `hello.link/XXXXXX`, where `XXXXXX` is a unique six-character code. If your business has a verified link domain, Hellotext uses that domain with the same kind of code.

When someone clicks, Hellotext redirects the customer to the destination URL and adds the `hello_session` parameter. This identifier connects the session with later actions that may provide attribution signals. See our <a class="active" href='https://github.com/hellotext/hellotext.js'>JavaScript library</a> for integrating event tracking.

An eligible click on a tracked link is active attribution evidence and normally opens a seven-day window from the click. Eligible delivery or other passive signals can apply within the default 24-hour window. A click alone does not guarantee that Hellotext attributes a later purchase: the customer, order, timing, and source precedence rules must also be met.

Read [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %}) for source precedence, attribution windows, and examples.

## Related guides

- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
