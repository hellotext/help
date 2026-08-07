Use the developer guides when you need to connect Hellotext with your own site, backend, CRM, commerce platform, or internal tools.

If you are connecting a custom store without a native integration, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}). It puts profiles, properties, products, historical orders, Hellotext.js, identity, and server-side tracking in the correct implementation order.

Most developer work in Hellotext falls into six areas:

- Integrating a custom store from end to end.
- Reading the API reference.
- Sending messages from your own system.
- Tracking customer activity.
- Defining business-specific actions and objects.
- Connecting unidentified sessions to customer profiles.

## Custom store integration

The custom-store guide is the practical starting point for a team that does not yet know which data belongs in the API, which activity belongs in Hellotext.js, or how the two sides connect.

Start here: [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}).

## API reference

The API reference is the source of truth for available resources, attributes, parameters, and endpoints.

Open the [Hellotext API reference](https://www.hellotext.com/api).

## API implementation recipes

Use the practical API guides when you need to move from the endpoint contract to a complete integration flow:

- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Create and track coupons with the API]({% link _developers/coupons-with-api.md %})
- [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %})

## Authentication

API requests use bearer tokens.

Create an authorization token from your business settings, then send it in the `Authorization` header:

```text
Authorization: Bearer YOUR_TOKEN
```

Never expose private tokens in browser code, public repositories, or client-side scripts.

## Send SMS from your system

Use the messages API when your own system needs to send reminders, confirmations, or notifications by SMS.

Keep reading: [Send SMS with the API]({% link _developers/send-sms-with-api.md %}).

## Track customer activity

Use tracking when you want Hellotext to understand actions from your site, store, backend, or custom integration.

Tracked events can help you segment audiences, trigger playbooks or routes, attribute revenue, and give the inbox team more context.

Keep reading: [Tracking events]({% link _developers/tracking-events.md %}).

## Model business-specific activity

Use custom actions to name activity that Hellotext does not include by default. Use objects when that activity involves a reusable entity with its own properties and lifecycle.

Keep reading: [Custom actions]({% link _developers/custom-actions.md %}) and [Objects]({% link _developers/objects.md %}).

## Connect browser sessions to customer profiles

Hellotext.js can create a session for unidentified visitors. When the visitor becomes known, you can attach that session to a customer profile so earlier activity is preserved.

Keep reading: [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}).

## Related guides

- [External tracking]({% link _developers/external-tracking.md %})
- [Track campaign, route, and playbook links]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
