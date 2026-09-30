Objects give structure and identity to the entities involved in customer activity. A product viewed, an order placed, or an appointment booked becomes more useful when the event points to the specific product, order, or appointment involved.

Hellotext includes built-in object structures for common entities. You can create a custom structure when your business needs another kind of entity.

## Understand structure, instance, and event

These three concepts work together:

- An **object structure** defines the type of entity and its properties. For example, `appointment` with reference, room, and scheduled date.
- An **object instance** is one specific entity that follows that structure. For example, appointment `APT-1042` in room 3.
- An **event** records something that happened and can point to the instance. For example, `appointment.booked` for that appointment and customer.

Creating a structure or instance does not itself record a booking or subscribe a customer. `APT-1042` is your business reference: it is not the Hellotext ID of the structure, instance, or a property.

The structure is reusable. Instances retain context, while events build the history of what happened over time.

## Use the right data model

Use an object when the entity needs its own identity, properties, and potentially several events during its lifecycle.

Use a customer profile property when a value describes the customer's current state, such as preferred store or membership tier. Use an event without an object when recording the occurrence is enough and there is no separate entity to preserve.

For example:

| Need | Recommended model |
| --- | --- |
| Store the customer's preferred location | Customer profile property |
| Record that an appointment was booked | Event |
| Keep the appointment reference, room, date, and later status changes | Object associated with events |

## Reuse built-in objects

Hellotext already includes structures for:

- apps;
- carts;
- forms;
- locations;
- orders;
- products; and
- refunds.

Connected eCommerce platforms and Hellotext tracking use these structures to preserve their expected meaning. Add properties to a built-in object when you need more context, but do not create a custom replacement for a product, order, cart, or another equivalent built-in object.

Built-in names cannot be changed and their structures cannot be deleted.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Objects catalog with seven built-in structures, Appointments, and Create new object structure.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/catalog-en-mobile.png 2x" width="764" height="1876" />
        <img src="/images/developers/objects/catalog-en.png" srcset="/images/developers/objects/catalog-en.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="2180" loading="lazy" decoding="async" alt="Objects catalog with seven built-in structures, Appointments, and Create new object structure." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real catalog with built-in objects and one fictional Appointments structure. Creating a structure does not record an event.</figcaption>
</figure>

## Create a custom object structure

You need a compatible plan and permissions to create custom object structures.

1. Open **Settings**.
2. Select **Objects**.
3. Click **Create new object structure**.
4. Enter the display name, such as **Appointments**.
5. Enter a stable singular name, such as `appointment`.
6. Add the properties every instance can contain.
7. Save the structure.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="New Object draft with Name Appointments and Singular name appointment, before adding properties.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/draft-en-mobile.png 2x" width="778" height="1240" />
        <img src="/images/developers/objects/draft-en.png" srcset="/images/developers/objects/draft-en.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1240" loading="lazy" decoding="async" alt="New Object draft with Name Appointments and Singular name appointment, before adding properties." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">First step of the unsaved form: Appointments is the display name and appointment the technical identifier. Properties are added next.</figcaption>
</figure>

The display name identifies the object for your team. The singular name is the technical identifier used by the API and event tracking. Keep it stable and avoid creating another structure with the same meaning.

## Design the properties

Add only the fields that describe the object itself. Depending on the available property type, you can model text, numbers, dates, times, yes-or-no values, lists, money, URLs, payment methods, and sales channels.

For each property, decide whether it should be:

- **Required:** every instance must provide a value.
- **Unique:** the same value cannot belong to more than one instance of that object.
- **Optional:** an instance can exist without the value.

The **Unique** option appears only for supported kinds. Not every property kind supports uniqueness; check the saved configuration or the API response's `unique` value.

Use a unique property for a stable external identifier such as an appointment reference, membership number, or service ticket ID. Do not mark fields like status or category as unique.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Edit Object Appointments: reference has Unique and Required; its menu allows removing those rules.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/reference-en-mobile.png 2x" width="778" height="1900" />
        <img src="/images/developers/objects/reference-en.png" srcset="/images/developers/objects/reference-en.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1900" loading="lazy" decoding="async" alt="Edit Object Appointments: reference has Unique and Required; its menu allows removing those rules." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real menu for reference, a unique required text field. room is optional; technical property names are defined by the business.</figcaption>
</figure>

You can reorder properties. For custom objects, put the value that best identifies each instance first because Hellotext uses the first property as its main label in the object list.

## Inherit an event amount

In a money property's menu, select **Inherit this amount** and save the structure. The **Inherit** label identifies the chosen property; only one can be selected.

Manual activity recording can use that value when the event amount remains zero. Use it if the object's value represents that activity's amount, and check the resulting currency.

For a custom action sent through the API, send `amount` and `currency` explicitly: do not assume manual recording's inheritance will apply. Use major currency units, for example `89.90` with `USD`, and the actual occurrence amount when it differs from the object's value.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Money property fee with Inherit and the Inherit this amount menu, beside reference and room.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/money-en-mobile.png 2x" width="778" height="1900" />
        <img src="/images/developers/objects/money-en.png" srcset="/images/developers/objects/money-en.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1900" loading="lazy" decoding="async" alt="Money property fee with Inherit and the Inherit this amount menu, beside reference and room." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The fee menu offers Inherit this amount and the label identifies the selected property. Do not assume manual recording inheritance applies to API tracking.</figcaption>
</figure>

## Create and manage instances

An object structure must have at least one property before you can create instances from Hellotext.

1. Go to **Settings > Objects**.
2. Open the structure you want to manage.
3. Click **Create new** followed by the object name.
4. Complete every required property and the optional context you need.
5. Save the instance.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Unsaved Create Appointments draft with required reference APT-1043, Room 3, and fee 89.90 USD.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/instance-en-mobile.png 2x" width="778" height="1040" />
        <img src="/images/developers/objects/instance-en.png" srcset="/images/developers/objects/instance-en.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1040" loading="lazy" decoding="async" alt="Unsaved Create Appointments draft with required reference APT-1043, Room 3, and fee 89.90 USD." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictional draft of a new APT-1043 instance, separate from appointment APT-1042 in the example. It was not saved and no activity was recorded.</figcaption>
</figure>

From the same list, you can edit or delete an instance. Deleting it cannot be undone and can remove the context associated with its events, so confirm that integrations and tracking no longer depend on it.

## Create a structure through the API

Use the [Objects API](https://www.hellotext.com/api#objects) to list built-in and custom structures or to create and manage custom ones.

`GET /v1/objects` lists structures and `GET /v1/objects/OBJECT_STRUCTURE_ID` retrieves one. `POST /v1/objects` creates a custom structure; it does not create a particular appointment. The following body illustrates that creation, with a display title, singular name, and property definitions:

```json
{
  "title": "Appointments",
  "name": "appointment",
  "properties": [
    {
      "kind": "text",
      "name": "reference",
      "required": true,
      "unique": true
    },
    {
      "kind": "text",
      "name": "room",
      "required": false,
      "unique": false
    }
  ]
}
```

Authenticate from your server using a private token for the same business (`Authorization: Bearer YOUR_PRIVATE_TOKEN`) and an active subscription with compatible feature access and permissions. Do not put the token on a public page.

A valid creation returns HTTP `201` with the structure and properties; validation errors return `422`. Store the structure `id` and property IDs separately. Neither is an instance ID. Check the reference for full kinds and formats, and inspect the actual returned values, including `required`, `unique`, and `modifiable`.

`PATCH /v1/objects/OBJECT_STRUCTURE_ID` manages an existing structure's properties: retain their IDs when updating and retrieve the structure afterward. To rename it, use **Settings > Objects > Edit**; do not assume a successful `PATCH` renamed `title` or `name`.

## Associate an object while tracking

When tracking a custom action through the API, identify the structure with `object_type`. Use the singular name, such as `appointment`, or the structure ID.

The action, such as `appointment.booked` or `appointment.confirmed`, must already be defined. The profile ID must belong to the real customer in the same business; creating the object does not demonstrate messaging consent. If your integration uses a session, preserve its real identifier and correct association with that customer.

Then choose one of these approaches, without sending both in the same request:

- Send `object` with the ID of an existing instance.
- Send `object_parameters` to create a new instance with the event.

To create a new instance while tracking:

```json
{
  "action": "appointment.booked",
  "profile": "CUSTOMER_PROFILE_ID",
  "object_type": "appointment",
  "object_parameters": {
    "reference": "APT-1042",
    "room": "Room 3"
  }
}
```

To associate an existing instance instead:

```json
{
  "action": "appointment.confirmed",
  "profile": "CUSTOMER_PROFILE_ID",
  "object_type": "appointment",
  "object": "OBJECT_INSTANCE_ID"
}
```

The examples are JSON bodies for `POST /v1/attribution/events`; replace placeholder IDs with real ones. Use property names directly inside `object_parameters`, such as `reference`, or an `object_parameters.property_by_id` map keyed by property IDs. Do not pass the structure ID in `object`. Required and unique rules are validated when Hellotext creates the instance.

`object_parameters` attempts to create an instance: it does not automatically find or update one with the same reference. Tracking returns `received`; it does not return the instance ID or prove the event has finished processing. Instance validation or creation can happen before event processing completes.

Do not send `object_parameters` repeatedly for the same unique entity. To obtain its public ID, find the instance by its reference in **Settings > Objects > Appointments**, open the row menu and copy the **Edit** link. The instance ID is the segment between `/instances/` and `/edit`; it is not the structure ID or an internal numeric ID from a nested response. Store that mapping to your reference. `GET /v1/objects` returns structures, not appointment IDs.

Use `object` for subsequent occurrences. Reusing the object does not deduplicate events: reconcile activity before resending after a timeout or uncertain result.

## Update a structure carefully

Adding an optional property does not require existing instances to have a value. Adding a required property means new and edited instances need that value, so prepare the source data first.

Before enabling uniqueness, check existing duplicates; changing the rule does not clean historical data. Do not change the kind of a property with stored values without checking compatibility.

Changing a singular name or property name requires updating every integration and tracking request that sends it. Reordering properties changes their presentation, while changing or deleting them can affect data already stored.

Deleting a custom structure removes its associated instances and data and cannot be undone. Stop tracking it and review dependent actions, routes, segments, and integrations first.

## Troubleshoot objects

| Issue | What to check |
| --- | --- |
| You cannot create a structure | Plan, permissions, active subscription, and selected business. |
| You cannot create an instance | The structure must contain at least one property. |
| The API reports a duplicate value | A property marked as unique already uses that value. |
| A required property fails validation | Send a non-empty value in the format expected by its property kind. |
| The event cannot find the object type | Use the exact singular name or structure ID from **Settings > Objects**. |
| The event cannot find the instance | Confirm the instance ID belongs to that structure and business. |
| The amount does not match | Distinguish manual recording from API tracking; send an explicit amount and currency for an API custom action. |
| The object list is hard to scan | Move the most recognizable property to the first position. |

For missing activity after tracking, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Custom actions]({% link _developers/custom-actions.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
