Use this guide to choose the setup path that matches how your business sells and where your customer data lives.

Most teams should connect their commerce platform first, then connect messaging channels, add capture tools, verify data and signals, and only then launch playbooks, routes, campaigns, or agents.

If you use more than one platform, start with the platform that has the most reliable customer, product, cart, and order activity.

## Recommended order

For most implementations, follow this order:

1. Connect the commerce platform or data source.
2. Connect the messaging channel you will use first.
3. Add a capture or checkout opt-in path.
4. Verify customer profiles, consent, events, products, carts, orders, and reporting.
5. Choose one first playbook, route, or campaign.
6. Review the go-live checklist before customers receive messages.

This order keeps setup problems from turning into sending, reporting, or attribution problems later.

## Shopify path

Use this path when Shopify is your main store.

Start here:

- [Connect Shopify]({% link _integrations/connect-shopify.md %})
- [Set up Shopify checkout opt-in]({% link _captures/shopify-checkout.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})

After the connection is working, use Shopify activity as signals for cart recovery, browse recovery, first purchase, replenishment, segmentation, campaign targeting, and attribution.

## Wix path

Use this path when Wix is your main store or website.

Start here:

- [Connect Wix]({% link _integrations/connect-wix.md %})
- [Set up Wix checkout opt-in]({% link _captures/wix-checkout.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})

After the connection is working, confirm that customer profiles, orders, carts, and subscription status appear correctly before launching playbooks or campaigns.

## WooCommerce path

Use this path when WooCommerce is your main store.

Start here:

- [Connect WooCommerce]({% link _integrations/connect-woo.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})

WooCommerce setup depends on the Hellotext plugin and the correct business identifier and access token. Verify the plugin before you troubleshoot playbooks or reporting.

## VTEX path

Use this path when VTEX is your commerce platform.

Start here:

- [Connect VTEX]({% link _integrations/connect-vtex.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})

After connecting, confirm that the events your first playbook needs are present on the correct customer profiles.

## Mercado Libre path

Use this path when Mercado Libre is an important sales or conversation channel for your business.

Start here:

- [Connect Mercado Libre]({% link _integrations/connect-mercado-libre.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})

Mercado Libre may be part of a broader setup. If you also have a primary store, connect that store too so Hellotext can understand more customer and order context.

## WhatsApp commerce path

Use this path when WhatsApp is a primary channel for conversations, product discovery, or commerce.

Start here:

- [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})

If your WhatsApp experience depends on product recommendations or order context, connect the commerce platform before or alongside WhatsApp.

## Custom or API path

Use this path when your data source is custom, your checkout is not covered by a standard integration, or your team needs to send events directly.

Start here:

- [Developers and API overview]({% link _developers/developers-overview.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %})
- [External tracking]({% link _developers/external-tracking.md %})

For custom implementations, define the first business outcome before you implement every event. Cart recovery, browse recovery, first purchase, support handoff, and attribution each need different data.

## What to do after setup

After you complete your path:

- Run one end-to-end test with a customer profile you can recognize.
- Confirm the customer profile has the right channel and consent status.
- Trigger the event or signal your first workflow needs.
- Confirm the signal appears on the right customer profile.
- Test one message, click, reply, handoff, and report.
- Launch one first win before expanding.

Keep reading:

- [Launch checklist]({% link _getting-started/launch-checklist.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
