Personalization tags insert customer data into a message when Hellotext sends it. They let one message greet each customer by name or include another value available for that customer and context.

These tags are variables used inside message content. They are different from profile tags, lists, or segments used to organize an audience.

## Where you can use them

The message editor appears in campaigns, journeys, playbooks, Inbox, and other parts of Hellotext. When that editor supports personalization, its toolbar includes an **Insert tags** button with a braces icon.

Open the selector to see the profile tags and custom properties offered by that editor. This is more reliable than typing them from memory because the options can depend on your business properties. Contextual tags for products, carts, or other objects depend on the workflow and do not necessarily appear in that selector.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Message editor tag selector">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/personalization-tags/selector-en-mobile.png" width="1020" height="780" />
        <img class="ht-editorial-visual__image" src="/images/audience/personalization-tags/selector-en.png" width="1600" height="1360" loading="lazy" decoding="async" alt="Message editor with the braces button and Tags selector open; it shows name, email, and a fictional custom property named Nivel de fidelidad." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface in an isolated account with fictional data; the draft was not sent. Custom property names retain the language configured by the business.</figcaption>
</figure>

## Insert a tag

1. Place the cursor where the personalized value should appear.
2. Select **Insert tags** in the message editor.
3. Choose the customer or property value you want to insert.
4. Preview or test the message with profiles that have and do not have that value.

Hellotext inserts the tag between braces. For example:

```text
Hi {name},
we picked something for you.
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

For profile tags or custom properties, add a fallback after a vertical bar so the message still reads naturally:

```text
Hi {name|there},
we picked something for you.
```

Hellotext uses the customer's first name when available and `there` when it is missing.

Choose a fallback that works with the complete sentence. A neutral word such as `{name|there}` or `{name|customer}` is usually safer than guessing a name, title, or attribute.

## Use customer profile properties

The tag selector can show custom properties that are available for your business. A property with a name such as `Loyalty tier` can be inserted as:

```text
{Loyalty tier|not assigned}
```

Place the tag in a sentence that also works with the fallback value. Use the property name shown by the selector. When several custom properties share the same type, naming them clearly avoids ambiguity and makes the correct tag easier to identify.

Property names cannot begin with a number or contain braces. If you rename a property used in existing message content, review those messages before sending again.

## Use contextual tags only where they are available

Some playbooks, journeys, and automations can provide data about a product, cart, order, form, refund, or another business object. Their tags use an object and property format, such as:

```text
{product.url}
```

Contextual tags only resolve when the message workflow has the corresponding object and value. A product tag that works inside a product-based playbook may not work in a campaign that has no selected product.

Use only contextual tags supported by that workflow and confirm that the object exists before sending. If you reuse message content elsewhere, test those values again: the profile-tag selector does not confirm that a contextual token will resolve there. Do not automatically apply the vertical-bar fallback to contextual tokens such as `{product.url}`.

## Preview and test before sending

Before launching a message with personalization:

- Test profiles with complete and incomplete data.
- Confirm every optional profile value has a natural fallback.
- Check spaces and punctuation around tags.
- Verify contextual tags have the product, cart, order, or other object they need.
- Review links after interpolation, especially checkout or product links.
- Send a small test before using a large audience.

If a tag remains visible in the preview or delivered message, check that its braces are complete. For a profile tag, check its name in the selector and the customer's data; for a contextual tag, confirm that the workflow supports the token and has the required object and value.

## Related guides

- [Understand customer profiles]({% link _audience/customer-profiles.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
