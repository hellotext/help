Use the developer guides when you need to connect Hellotext with your own site, backend, CRM, commerce platform, or internal tools.

Most developer work in Hellotext falls into four areas:

- Reading the API reference.
- Sending messages from your own system.
- Tracking customer activity.
- Connecting unidentified sessions to customer profiles.

## API reference

The API reference is the source of truth for available resources, attributes, parameters, and endpoints.

Open the [Hellotext API reference](https://www.hellotext.com/api).

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

## Connect browser sessions to customer profiles

Hellotext.js can create a session for unidentified visitors. When the visitor becomes known, you can attach that session to a customer profile so earlier activity is preserved.

Keep reading: [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}).

## Related guides

- [External tracking]({% link _developers/external-tracking.md %})
- [Track campaign, route, and playbook links]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
