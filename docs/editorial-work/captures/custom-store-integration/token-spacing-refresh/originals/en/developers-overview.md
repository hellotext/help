Use the developer guides when you need to connect Hellotext with your own site, backend, CRM, commerce platform, or internal tools.

If you are connecting a custom store without a native integration, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}). It puts profiles, properties, products, historical orders, Hellotext.js, identity, and server-side tracking in the correct implementation order.

Most developer work in Hellotext falls into six areas:

- Integrating a custom store from end to end.
- Reading the API reference.
- Sending messages from your own system.
- Tracking customer activity.
- Defining business-specific actions and objects.
- Connecting unidentified sessions to customer profiles.

Before implementing, decide which part runs on your server and which part runs in the browser:

| Integration part | Data it uses |
| --- | --- |
| Server | Private business token to authenticate API requests. |
| Browser | Public Business ID to initialize Hellotext.js. |
| Synchronization | Hellotext IDs and your system references to identify each resource. |

## Custom store integration

The custom-store guide is the practical starting point for a team that does not yet know which data belongs in the API, which activity belongs in Hellotext.js, or how the two sides connect.

Start here: [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}).

## API reference

The API reference is the source of truth for available resources, attributes, parameters, and endpoints.

Open the [Hellotext API reference](https://www.hellotext.com/api). Check the resource, method, required fields, data types, errors, and pagination before implementing a recipe. Store the IDs returned by Hellotext alongside your own system references; a display name does not replace the ID an endpoint requires.

## API implementation recipes

Use the practical API guides when you need to move from the endpoint contract to a complete integration flow:

- [Send messages with the API]({% link _developers/send-messages-with-api.md %})
- [Create and send templates with the API]({% link _developers/templates-with-api.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Create and track coupons with the API]({% link _developers/coupons-with-api.md %})
- [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %})

## Authentication

Private API requests use bearer tokens specific to the business where they were created. First confirm that you are in the business you want to integrate.

Open **Settings**, select **Manage your authorization tokens**, then **Create new token** and name it for the integration. The example shows only an unsaved fictional name; it contains no credential and does not confirm that a token was created.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Create a new token with Token name Custom store · development, in an unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-en-mobile.png 2x" width="748" height="480" />
        <img src="/images/developers/custom-store-integration/token-en.png" srcset="/images/developers/custom-store-integration/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="524" loading="lazy" decoding="async" alt="Create a new token with Token name Custom store · development, in an unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real authorization form with an unsaved fictional name. No private token was created or exposed.</figcaption>
</figure>

After completing token creation in your own business, store the token in your server's private configuration and send it in the `Authorization` header:

```text
Authorization: Bearer YOUR_TOKEN
```

Never expose private tokens in browser code, public repositories, or client-side scripts. The **Business ID** used by Hellotext.js is public and has a different role: it does not authenticate private API requests. Distinguish that ID, the token name, and the secret token value.

## Send messages from your system

Use the Messages API when your own system needs to send an individual free-form or template message through a compatible channel. Check the channel connection, permissions, recipient consent, and any template or conversation-window rules that apply to that channel.

A `status: received` response confirms receipt of the request, not message delivery. Verify the result in Hellotext before assuming it was sent; do not repeat a send only because your system did not receive a response in time.

Start with [Send messages with the API]({% link _developers/send-messages-with-api.md %}). For SMS-specific length, encoding, costs, and limits, read [Send SMS with the API]({% link _developers/send-sms-with-api.md %}).

## Track customer activity

Use tracking when you want Hellotext to understand actions from your site, store, backend, or custom integration.

Track visitor navigation and interaction with Hellotext.js when the browser is the source. Track facts confirmed by your server, such as a payment, from your backend. Choose one source per occurrence to avoid duplicating the same event.

Tracked events can help you segment audiences, trigger playbooks or routes, attribute revenue, and give the inbox team more context. Each result depends on its data and configuration: receipt of a request does not prove that the event has been processed or that a sale has been attributed.

Keep reading: [Tracking events]({% link _developers/tracking-events.md %}). That guide contains an inherited description of automatic `page.viewed`. For a new installation using SDK **2.6.0**, follow the installation and browser-activity steps in the custom-store guide linked above: await initialization and explicitly track `page.viewed` once per navigation, without duplicating the first view.

## Model business-specific activity

Use custom actions to name activity that Hellotext does not include by default. The action defines the activity type; an event records a specific occurrence. For example, defining `appointment.booked` does not record an appointment.

In **Settings > Actions > Custom**, the readable name “Appointment booked” and the tracking name `appointment.booked` represent the same fictional definition. Events use the exact tracking name; endpoints that manage the definition use its ID. Creating custom actions requires a compatible plan and permissions.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional Appointment booked action with tracking name appointment.booked in the Actions Custom tab, beside Create new action.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 894px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/catalog-en-mobile.png 2x" width="764" height="346" />
        <img src="/images/developers/custom-actions/catalog-en.png" srcset="/images/developers/custom-actions/catalog-en.png 2x" style="width: auto; margin: 0 auto;" width="1752" height="838" loading="lazy" decoding="async" alt="Fictional Appointment booked action with tracking name appointment.booked in the Actions Custom tab, beside Create new action." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real action catalog with a fictional definition without events; the mobile focus shows its row and Create new action.</figcaption>
</figure>

Use a profile property when the data describes the customer's current state, such as their loyalty level. Use objects when the activity involves a reusable entity with its own properties and lifecycle, such as an appointment with a reference, date, and status.

Keep reading: [Custom actions]({% link _developers/custom-actions.md %}) and [Objects]({% link _developers/objects.md %}).

## Connect browser sessions to customer profiles

Hellotext.js can create a session for unidentified visitors. To connect earlier activity, use the actual browser session ID and the correct profile ID in the same business. Verify the customer's identity through your own system before attaching the session; do not assign a profile from an arbitrary ID supplied by the browser.

Identifying a profile and attaching a session does not grant consent to send messages. It also does not record a purchase or guarantee attribution on its own: those operations have their own requirements.

Keep reading: [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %}).

## Related guides

- [External tracking]({% link _developers/external-tracking.md %})
- [Track campaign, route, and playbook links]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
