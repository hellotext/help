Objects give structure and identity to the entities involved in customer activity. A product viewed, an order placed, or an appointment booked becomes more useful when the event points to the specific product, order, or appointment involved.

Hellotext includes built-in object structures for common entities. You can create a custom structure when your business needs another kind of entity.

## Understand structure, instance, and event

These three concepts work together:

- An **object structure** defines the type of entity and its properties. For example, `appointment` with reference, room, and scheduled date.
- An **object instance** is one specific entity that follows that structure. For example, appointment `APT-1042` in room 3.
- An **event** records something that happened and can point to the instance. For example, `appointment.booked` for that appointment and customer.

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

## Create a custom object structure

You need a compatible plan and permissions to create custom object structures.

1. Open **Settings**.
2. Select **Objects**.
3. Click **Create new object structure**.
4. Enter the display name, such as **Appointments**.
5. Enter a stable singular name, such as `appointment`.
6. Add the properties every instance can contain.
7. Save the structure.

The display name identifies the object for your team. The singular name is the technical identifier used by the API and event tracking. Keep it stable and avoid creating another structure with the same meaning.

## Design the properties

Add only the fields that describe the object itself. Depending on the available property type, you can model text, numbers, dates, times, yes-or-no values, lists, money, URLs, payment methods, and sales channels.

For each property, decide whether it should be:

- **Required:** every instance must provide a value.
- **Unique:** the same value cannot belong to more than one instance of that object.
- **Optional:** an instance can exist without the value.

Use a unique property for a stable external identifier such as an appointment reference, membership number, or service ticket ID. Do not mark fields like status or category as unique.

You can reorder properties. For custom objects, put the value that best identifies each instance first because Hellotext uses the first property as its main label in the object list.

## Inherit an event amount

When an object has money properties, you can choose one as the inherited amount. If an activity is tracked for that object without an explicit amount, Hellotext uses the value of that property as the event amount.

Only one money property can be selected for this behavior. Use it when the object's value consistently represents the amount of its events. Send an explicit event amount when the transaction amount can differ from the stored value.

## Create and manage instances

An object structure must have at least one property before you can create instances from Hellotext.

1. Go to **Settings > Objects**.
2. Open the structure you want to manage.
3. Click **Create new** followed by the object name.
4. Complete every required property and the optional context you need.
5. Save the instance.

From the same list, you can edit or delete an instance. Deleting it cannot be undone and can remove the context associated with its events, so confirm that integrations and tracking no longer depend on it.

## Create a structure through the API

Use the [Objects API](https://www.hellotext.com/api#objects) to list built-in and custom structures or to create and manage custom ones.

A new structure needs a display title, a singular name, and its property definitions. For example:

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

Authenticate with a token for the business. Use the IDs returned for the structure and properties when another API operation accepts them. Check the API reference for the supported property kinds and the complete request and response formats.

## Associate an object while tracking

When tracking a custom action through the API, identify the structure with `object_type`. Use the singular name, such as `appointment`, or the structure ID.

Then choose one of these approaches:

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

Use property names inside `object_parameters`, or `property_by_id` when your integration stores the property IDs. Required and unique rules are validated when Hellotext creates the instance.

Do not send `object_parameters` repeatedly for the same unique entity. Store or recover the existing instance ID and use `object` for later events in its lifecycle.

## Update a structure carefully

Adding an optional property does not require existing instances to have a value. Adding a required property means new and edited instances need that value, so prepare the source data first.

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
| The object list is hard to scan | Move the most recognizable property to the first position. |

For missing activity after tracking, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Custom actions]({% link _developers/custom-actions.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [External tracking]({% link _developers/external-tracking.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
