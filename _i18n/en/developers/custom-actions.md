A custom action defines business-specific activity that Hellotext does not include among its built-in actions. For example, you can define `appointment.booked`, `loyalty.reward_redeemed`, or `physical_store.payment_completed`.

The action is the reusable definition. Every time that activity occurs, you track an **event** using the action's tracking name. Hellotext can use those events as signals in customer profiles, segments, journeys, reports, and other compatible features.

## Before creating an action

First review the built-in actions under **Settings > Actions**. Hellotext already includes common eCommerce, messaging, form, subscription, and conversation activity.

Use a custom action when you need to track something that happened at a specific time and there is no equivalent action. Use a customer profile property when the data describes a current state that can change, such as loyalty tier, preferred store, or renewal date.

Do not create another action to replace `order.placed`, `product.viewed`, or an equivalent built-in activity. Playbooks and reports may depend on the meaning and associated object of the original action.

## Create an action in Hellotext

You need a plan and permissions that support custom actions.

1. Open **Settings**.
2. Select **Actions**.
3. Open the **Custom** tab.
4. Click **Create new action**.
5. Complete **Readable name** and **Tracking name**.
6. Decide whether to mark it as a conversion or as important.
7. Review the details and click **Save changes**.

The **Readable name** is the label your team sees in Hellotext, such as “Appointment booked.” The **Tracking name** is the exact identifier your site, backend, and integrations must send, such as `appointment.booked`. Creating the definition does not record an appointment or event.

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

## Choose a stable tracking name

Use lowercase and separate the object from the activity with a period. For example:

- `appointment.booked`
- `membership.renewed`
- `quote.requested`
- `store_visit.completed`

Each tracking name must be unique within the business and cannot use the name of a built-in action.

Treat it as a technical contract. If you change `appointment.booked` to `appointment.scheduled`, update every site, backend, and integration still sending the previous name. Also review the segments and journeys that depend on the action before continuing to track it.

## Configure its effect

### Mark as a conversion

Use this option when an occurrence represents a result you want compatible reports to count as a conversion.

Marking the action does not automatically attribute revenue. For an amount to be evaluated as attributed revenue, the event must include a positive monetary amount, currency, an identifiable customer or session, and evidence that meets the attribution rules.

### Mark as important

Use this option when a new occurrence needs immediate attention. Hellotext moves the related conversation to the top of **Inbox** when it occurs; the conversion option controls measurement, not its Inbox priority.

Do not mark all activity as important. Reserve this option for events that genuinely require an operational response, such as an urgent request or a failure that a person must review.

The following fictional draft enables **Mark as conversion** and leaves **Mark as important** disabled. The names and both controls are configured separately; the screenshot does not show a saved action or recorded event.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="New action draft: Appointment booked, appointment.booked, conversion enabled and importance disabled.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/draft-en-mobile.png 2x" width="778" height="1800" />
        <img src="/images/developers/custom-actions/draft-en.png" srcset="/images/developers/custom-actions/draft-en.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1600" loading="lazy" decoding="async" alt="New action draft: Appointment booked, appointment.booked, conversion enabled and importance disabled." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real unsaved form. Names, conversion, and importance are independent controls; the draft does not record an occurrence.</figcaption>
</figure>

## Create actions through the API

You can manage custom actions with the [Actions API](https://www.hellotext.com/api#actions). Authenticate requests with a token created for the business and use the action endpoints to create, list, retrieve, update, or delete definitions.

Create a definition with `POST /v1/attribution/actions`, a private business token, and an active subscription that supports custom actions. Keep the returned `id` to retrieve or update that definition. Events use its `name`, not that ID.

| Field | Use |
| --- | --- |
| `name` | Required, unique tracking name, such as `appointment.booked`. |
| `title` | Optional readable name, such as “Appointment booked.” |
| `goal` | `true` to mark as a conversion; defaults to `false`. |
| `passive` | `false` to mark as important; its default, `true`, keeps the activity without moving the conversation up in Inbox. |

This example is fictional; load `HELLOTEXT_API_TOKEN` in your server environment:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/actions \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "appointment.booked",
    "title": "Appointment booked",
    "goal": true,
    "passive": true
  }'
```

Retrieve the same definition with `GET /v1/attribution/actions/:id`, update it with `PATCH`, and use `GET /v1/attribution/actions` to list actions. If creation returns a duplicate name or its result is uncertain, check existing definitions before creating it again.

Creating the definition does not track an event. You must then send each occurrence to the event endpoint using the exact action name.

## Track events from the browser

Install and initialize [Hellotext.js](https://github.com/hellotext/hellotext.js) before using the action.

```javascript
const response = await Hellotext.track('appointment.booked')

if (response.failed) {
  console.error(response.data)
}
```

A successful response with `status: received` means the request was accepted for processing. Check the event on the correct profile afterward; that response does not prove it has already been processed or attributed as a conversion.

You can include general event data:

```javascript
await Hellotext.track('appointment.booked', {
  amount: 45,
  currency: 'USD',
  tracked_at: 1786032000,
})
```

`amount` is the monetary value associated with that occurrence, not a count of appointments. Send its currency in ISO 4217 format and use `tracked_at` as a Unix timestamp in seconds for the original date. Omit the amount if the event does not represent revenue.

Hellotext.js includes the current URL and browser session. Once the customer has been identified, it also keeps that identity in subsequent calls. If the customer is still anonymous, the event remains associated with the session and can be connected to the customer when Hellotext receives a valid identification.

Do not send secrets, payment information, or unnecessary personal data in event parameters.

## Track events from your backend

Use the [tracking API](https://www.hellotext.com/api#tracking) when the activity occurs in a CRM, point of sale, mobile app, server process, or another system where the customer's browser does not participate.

1. Create an authorization token in Hellotext.
2. Confirm that the custom action already exists.
3. Identify the corresponding customer profile or session.
4. Send `POST /v1/attribution/events` with `action: "appointment.booked"`, the real `profile` or `session`, and the occurrence parameters.
5. Keep the response and any request identifier for troubleshooting. A `status: received` response confirms acceptance; verify processing and the profile afterward. Do not invent a session to attribute the event to a campaign.

To decide between a customer profile and session, read [External tracking]({% link _developers/external-tracking.md %}). Never expose the authorization token in code that runs in the browser.

## Associate an object when needed

When tracking a custom action through the API or Hellotext.js, the object is optional: omit `object`, `object_parameters`, and `object_type` when none applies. Add one when the occurrence should retain structured context.

For example, `appointment.booked` can point to an existing appointment or create a new instance while tracking the event. Follow [Objects]({% link _developers/objects.md %}) to design the structure and choose between an existing identifier and new object parameters.

If you send `object` for an existing instance or `object_parameters` to create one, also include `object_type`: the name or ID of the corresponding object definition. Do not confuse that type with the action tracking name.

Do not turn all context into an object. Use one when that entity needs its own identity, reusable properties, or more events throughout its lifecycle.

## Record one occurrence manually

For a one-time case:

1. Open the customer profile in **Audience**.
2. Open the **+** menu in the bottom-right corner and select **New Event**.
3. Choose the custom action and check the selected customer.
4. Complete the object, amount, and converted amount when applicable. Use **All properties...** to show the date and other fields, such as the URL.
5. Review the details before clicking **Save changes**.

The current manual form may show **Associated object** as required for a custom action and keep **Save changes** disabled while it is missing. Select an existing object that matches the occurrence. If you need to track an action without an object, use the API or Hellotext.js with the parameters above. Do not add an unrelated object just to enable the button.

The example shows “Appointment booked” selected for a fictional customer; there is no associated object or saved event yet.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="New Event for Demo Caso 1 with Appointment booked selected, required associated object unfilled, and Save changes disabled.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/manual-en-mobile.png 2x" width="778" height="1300" />
        <img src="/images/developers/custom-actions/manual-en.png" srcset="/images/developers/custom-actions/manual-en.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1300" loading="lazy" decoding="async" alt="New Event for Demo Caso 1 with Appointment booked selected, required associated object unfilled, and Save changes disabled." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real unsaved manual form for a fictional non-deliverable customer. There is no associated object or recorded event; Save changes remains disabled.</figcaption>
</figure>

Saving a valid event records one occurrence. It does not configure automatic tracking for future events.

## Use the action in Hellotext

After testing it, a custom action can be used to:

- start a journey when the event occurs;
- build segments from customer activity;
- show context in the customer profile;
- measure custom conversions; and
- help compatible playbooks interpret business signals.

Test first with a controlled customer profile. Confirm that the event appears in its activity before activating journeys, segments, or reports that depend on it.

## Avoid duplicate events

Define one primary source for each action. Do not track the same occurrence from Hellotext.js, your backend, and a connected integration at the same time.

Keep the source operation identifier in your system and track the event once, even if the same notification arrives concurrently. Repeating the same name, profile, object, and date does not guarantee deduplication. A timed-out request or uncertain result may have been accepted: check activity before retrying and reconcile the outcome in your integration.

## Edit or delete an action

Open the three-dot menu in the action row and select **Edit**. You can change its readable name, tracking name, and configuration. Changing the tracking name requires updating its sources and reviewing dependencies.

Treat deletion as a destructive operation. The **Delete** option warns about deleting associated events and that it cannot be undone. The API rejects deletion of an action with tracked events; do not assume it allows any definition to be removed. Before deleting the action, review journeys, segments, reports, and integrations, then stop every source that still sends the event.

## Troubleshoot issues

| Issue | What to check |
| --- | --- |
| The action does not appear | Plan, permissions, selected business, and the **Custom** tab. |
| The API says it cannot find the action | The action must exist and the tracking name must match exactly. |
| The response says `received`, but the event is missing | Later processing, profile or session, action name, and parameters; acceptance does not guarantee an already processed event. |
| The manual form cannot be saved | Customer, action, and required associated object; use the API or Hellotext.js for an action without an object. |
| The event appears on the wrong profile | Customer profile identifier, session, and identity implementation. |
| The event does not start a journey | Journey status, action selected as its trigger, and applicable filters. |
| It does not appear as a conversion | **Mark as conversion**, report period, and attribution rules. |
| It appears more than once | Duplicate sources, browser or backend retries, and manual events. |

For broader diagnosis, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Tracking events]({% link _developers/tracking-events.md %})
- [Tracking unidentified customers]({% link _developers/tracking-unidentified-customers.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Objects]({% link _developers/objects.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %})
