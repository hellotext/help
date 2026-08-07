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
5. Enter the readable name and tracking name.
6. Decide whether to mark it as a conversion or as important.
7. Save the action.

The **readable name** is the label your team sees in Hellotext. The **tracking name** is the exact identifier your site, backend, and integrations must send.

## Choose a stable tracking name

Use lowercase and separate the object from the activity with a period. For example:

- `appointment.booked`
- `membership.renewed`
- `quote.requested`
- `store_visit.completed`

Each tracking name must be unique within the business and cannot use the name of a built-in action.

Treat it as a technical contract. If you change `appointment.booked` to `appointment.scheduled`, you must also update every site, backend, integration, segment, or journey that uses the previous name.

## Configure its effect

### Mark as a conversion

Use this option when an occurrence represents a result you want compatible reports to count as a conversion.

Marking the action does not automatically attribute revenue. For an amount to be evaluated as attributed revenue, the event must include a positive monetary amount, currency, an identifiable customer or session, and evidence that meets the attribution rules.

### Mark as important

Use this option when a new occurrence needs immediate attention. Hellotext can prioritize the related conversation in Inbox when it occurs.

Do not mark all activity as important. Reserve this option for events that genuinely require an operational response, such as an urgent request or a failure that a person must review.

## Create actions through the API

You can manage custom actions with the [Actions API](https://www.hellotext.com/api#actions). Authenticate requests with a token created for the business and use the action endpoints to create, list, retrieve, update, or delete definitions.

Creating an action requires at least a tracking name. You can also send a readable title and the conversion or importance configuration. If the plan does not support custom actions, the API rejects the request.

Creating the definition does not track an event. You must then send each occurrence to the event endpoint using the exact action name.

## Track events from the browser

Install and initialize [Hellotext.js](https://github.com/hellotext/hellotext.js) before using the action.

```javascript
const response = await Hellotext.track('appointment.booked')

if (response.failed) {
  console.error(response.data)
}
```

You can include general event data:

```javascript
await Hellotext.track('appointment.booked', {
  amount: 45,
  currency: 'USD',
  tracked_at: 1786032000,
})
```

Hellotext.js includes the current URL and browser session. Once the customer has been identified, it also keeps that identity in subsequent calls. If the customer is still anonymous, the event remains associated with the session and can be connected to the customer when Hellotext receives a valid identification.

Do not send secrets, payment information, or unnecessary personal data in event parameters.

## Track events from your backend

Use the [tracking API](https://www.hellotext.com/api#tracking) when the activity occurs in a CRM, point of sale, mobile app, server process, or another system where the customer's browser does not participate.

1. Create an authorization token in Hellotext.
2. Confirm that the custom action already exists.
3. Identify the corresponding customer profile or session.
4. Send the exact action name and event parameters.
5. Keep the response and any request identifier for troubleshooting.

To decide between a customer profile and session, read [External tracking]({% link _developers/external-tracking.md %}). Never expose the authorization token in code that runs in the browser.

## Associate an object when needed

A custom action does not need an object to be tracked. You can add one when the occurrence should keep structured context.

For example, `appointment.booked` can point to an existing appointment or create a new instance while tracking the event. Follow [Objects]({% link _developers/objects.md %}) to design the structure and choose between an existing identifier and new object parameters.

Do not turn all context into an object. Use one when that entity needs its own identity, reusable properties, or more events throughout its lifecycle.

## Record one occurrence manually

For a one-time case:

1. Open the customer profile in **Audience**.
2. Select **New Event**.
3. Choose the custom action.
4. Enter the date, amount, URL, or object when applicable.
5. Save the event.

This records one occurrence. It does not configure automatic tracking for future events.

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

Keep the source operation identifier in your system and track the event once. If a request has an uncertain result, check whether the event already appears before retrying it.

## Edit or delete an action

You can change its readable name, tracking name, and configuration. Changing the tracking name requires updating every source and dependency.

Treat deletion as a destructive operation. Hellotext warns that it can affect associated events and cannot be undone; the API may also reject deletion when tracked events already exist. Before deleting the action, review journeys, segments, reports, and integrations, then stop every source that still sends the event.

## Troubleshoot issues

| Issue | What to check |
| --- | --- |
| The action does not appear | Plan, permissions, selected business, and the **Custom** tab. |
| The API says it cannot find the action | The action must exist and the tracking name must match exactly. |
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
