Use this checklist after connecting a store, website, messaging channel, capture tool, or custom tracking source.

The goal is to confirm that Hellotext can see the right customer profile, receive the right signals, and use them safely before you launch playbooks, routes, campaigns, or reports that depend on that data.

## Run one end-to-end test

Start with one test customer or a small internal test group.

1. Create or identify a customer profile you can recognize.
2. Subscribe through the capture or channel you plan to use.
3. Trigger one real activity, such as a product view, cart update, order, form submission, reply, or custom event.
4. Open the customer profile in Hellotext.
5. Confirm the profile, channel, consent, event, product, order, and message history look right.
6. Send a test message if the channel is ready.
7. Click any tracked link and reply to the message.
8. Confirm the click, reply, and conversation context appear where your team expects them.

If this small test does not look right, fix the setup before enabling a broad playbook or campaign.

## Customer profiles

Check that Hellotext can identify the customer correctly.

Look for:

- Name, phone, email, or the identifier your integration sends.
- Subscription or consent status for the channel you plan to use.
- Profile properties that segments, personalization, or playbooks depend on.
- List or segment membership if the customer should enter a specific audience.
- Duplicate profiles that should be merged before launching.

If a customer appears more than once, review which identifier each source sends. Playbooks and reports are stronger when activity lands on the same customer profile.

## Commerce data

For commerce integrations, confirm that the data needed by your first playbook is present.

Check:

- Recent orders and order status.
- Cart or checkout activity if you plan to recover abandoned carts.
- Product names, images, prices, variants, stock, or catalog data if recommendations depend on them.
- Currency, totals, coupons, refunds, and shipping status if they affect reporting or follow-up.
- Marketplace or store source if you sell through more than one channel.

You do not need every possible commerce field before launch. You do need the fields that the first playbook, route, segment, or report will use.

## Events and signals

Confirm that the activity creates the signal you expect.

For each important signal, check:

- The action name is correct, such as `product.viewed`, `cart.abandoned`, `order.placed`, or a custom action.
- The event appears on the right customer profile.
- The timestamp matches when the activity happened.
- The event includes the product, order, cart, form, or custom properties the playbook needs.
- The signal is recent enough for your trigger, audience, or report.

If you use custom tracking, keep action names consistent. Small naming differences can create separate signals that do not match the trigger you intended.

Keep reading: [Tracking events]({% link _developers/tracking-events.md %}).

## Channels and consent

A signal can be available even when Hellotext should not send a message.

Before launch, confirm:

- The channel you plan to use is connected.
- The sender, WhatsApp account, or short code is available for the business.
- The customer is subscribed or eligible for that channel.
- The message type, template, or conversation rules fit the channel.
- Quiet hours, frequency limits, and opt-out expectations are clear.
- Replies will reach the Inbox or the teammate responsible for the conversation.

This is especially important when a playbook can choose the next step automatically.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Captures and follow-up

If your first launch depends on a capture, test the exact path a customer will use.

Check:

- The QR code, shareable link, form, popup, or checkout opt-in opens correctly.
- The customer is subscribed to the expected channel.
- Source, tags, fields, or coupon data are recorded if you need them later.
- The welcome message, route, or playbook assigned to the capture is the right one.
- The customer can reply and your team can see the conversation.

## Reporting and attribution

If you will measure the first launch, confirm the measurement path before sending broadly.

Check:

- Links are tracked when you expect them to be tracked.
- Clicks appear on the customer profile or report.
- Orders or conversions after a message can be connected back to the campaign, route, playbook, or conversation when attribution rules apply.
- Test activity is easy to recognize so your team does not confuse it with real performance.

Keep reading: [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %}).

## Before launching a playbook

Review the specific playbook, route, or campaign you are about to publish.

Confirm:

- The trigger signal exists.
- The audience contains the customers you expect.
- The channel is ready and eligible customers can receive messages.
- The message, prompt, offer, products, and links are correct.
- Stop conditions and handoff rules are clear.
- Reports or success metrics are defined.

Start with a small audience, review the first results, and expand after the data looks reliable.

## If something is missing

Common causes include:

- The wrong store, marketplace, Meta Business account, or Hellotext business is connected.
- API keys, tokens, plugin settings, or permissions are expired or incomplete.
- The storefront domain, checkout script, or tracking script is installed in the wrong place.
- The integration has not finished its first sync yet.
- The customer identifier sent by one source does not match the identifier sent by another source.
- The event action name or custom property does not match the trigger or segment rule.
- The customer is not subscribed or eligible for the channel you want to use.

Fix the missing data first, then repeat the same end-to-end test.

## Related guides

- [Setup overview]({% link _integrations/setup-overview.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Troubleshooting checklist]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
