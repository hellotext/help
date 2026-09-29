Personalization tags insert customer data into a message when Hellotext sends it. They let one message greet each customer by name or include another value available for that customer and context.

These tags are variables used inside message content. They are different from profile tags, lists, or segments used to organize an audience.

## Where you can use them

The message editor appears in campaigns, journeys, playbooks, Inbox, and other parts of Hellotext. When that editor supports personalization, its toolbar includes an **Insert tags** button with a braces icon.

Open the selector to see the tags available in that specific editor. This is more reliable than typing a tag from memory because the options can depend on your business properties and the message context.

## Insert a tag

1. Place the cursor where the personalized value should appear.
2. Select **Insert tags** in the message editor.
3. Choose the customer or property value you want to insert.
4. Preview or test the message with profiles that have and do not have that value.

Hellotext inserts the tag between braces. For example:

```text
Hi {name}, we picked something for you.
```

When the message is prepared for a customer named Ana, Hellotext replaces `{name}` with `Ana`.

Common customer tags include:

- `{name}` for the first name.
- `{full_name}` for the full name.
- `{last_name}` for the last name.
- `{birthday}` for the birthday.
- `{phone}`, `{email}`, or `{address}` for the corresponding profile value.

The selector can also include compatible custom properties configured for your business.

## Add a fallback value

If the customer profile does not contain the requested value, Hellotext removes a valid tag from the delivered message. This can leave an awkward gap in the sentence.

Add a fallback after a vertical bar so the message still reads naturally:

```text
Hi {name|there}, we picked something for you.
```

Hellotext uses the customer's first name when available and `there` when it is missing.

Choose a fallback that works with the complete sentence. A neutral word such as `{name|there}` or `{name|customer}` is usually safer than guessing a name, title, or attribute.

## Use customer profile properties

The tag selector can show custom properties that are available for your business. A property with a name such as `Loyalty tier` can be inserted as:

```text
Your current level is {Loyalty tier|not assigned}.
```

Use the property name shown by the selector. When several custom properties share the same type, naming them clearly avoids ambiguity and makes the correct tag easier to identify.

Property names cannot begin with a number or contain braces. If you rename a property used in existing message content, review those messages before sending again.

## Use contextual tags only where they are available

Some playbooks, journeys, and automations can provide data about a product, cart, order, form, refund, or another business object. Their tags use an object and property format, such as:

```text
{product.url}
```

Contextual tags only resolve when the message workflow has the corresponding object and value. A product tag that works inside a product-based playbook may not work in a campaign that has no selected product.

Use the tags offered by the editor for that workflow. If you reuse message content somewhere else, check the selector and test the contextual values again.

## Preview and test before sending

Before launching a message with personalization:

- Test profiles with complete and incomplete data.
- Confirm every optional value has a natural fallback.
- Check spaces and punctuation around tags.
- Verify contextual tags have the product, cart, order, or other object they need.
- Review links after interpolation, especially checkout or product links.
- Send a small test before using a large audience.

If a tag remains visible in the preview or delivered message, check that it appears in that editor's selector, that its braces are complete, and that the required context is available.

## Related guides

- [Understand customer profiles]({% link _audience/customer-profiles.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
