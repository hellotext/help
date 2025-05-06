The Editor is the input you use when writing a message. It is present in 
various places amount the platform, such as the Campaigns, Journeys, and the Inbox.

It provides a set of powerful built-in features that allows you to enrich your messages with dynamic content, images, and links.

Tags are a set of reserved words that you can use to compose a message with dynamic content.
Dynamic content allows you to write messages that are unique for each profile. It can be used to inject the profile's name,
their age, birthday, or any other property that you have defined for your business.

### The Anatomy of a Tag

We mentioned that tags are reserved keywords in the editor. Tags are reserved words written between 
an opening and closing curly brace. For example, the tag `{full_name}` is a tag that will be replaced with the
full name of the profile. Common tags include `{name}`, `{birthday}`, `{first_name}`, `{last_name}`, `{phone}` that is 
provided by default. But, you're not limited to these set of tags, you can also target properties defined by your business as well.

By default, properties are removed from the output when the profile does not have the attribute. 
For example, if you are targeting a `{company}` property in your message and the profile does not have that property
the word `{company}` will be removed from the message being sent to the profile. If you don't want to have the property removed. You can 
use default values for a tag, read below for further information.

Tags can also have a default value, default values are useful when you want to have a fallback 
value in case the profile does not have the attribute you're targeting.
You can provide a default value for a tag by adding a pipe character `|` and the default value before closing the tag.
For example, the tag `{company|friend}` will be replaced with company property assigned to the profile, and if the
profile does not have the property, the default value of `friend` will be used.

A valid tag consists of the following 

- An opening brace `{`
- A reserved keyword offered by Hellotext or a property type, i.e `company`.
- A closing brace `}`
- Optional values can be provided by using a pipe `|` operator and the fallback value after it.

### Tags and properties

We mentioned that you can also target custom properties in your business in the tags.
You can target the properties by their kind, i.e `text`, `url`, `date`, etc. Or by their name, if the name is set.

A complete list of property kinds

- `age`
- `birthday`
- `company`
- `gender`
- `checkbox`
- `date`
- `text`
- `number`
- `url`

For the properties `age`, `birthday`, `company`, and `gender` you can either target by the kind of the property i.e `company`, or by 
the property's name when you have set a custom name for the property.

For the remaining properties, you can target by their kind and their custom name when present. The difference 
for these properties is that when you have multiple properties of the same kind, 
targeting with the kind becomes ambiguous. For example,
if your business has two `checkbox` properties named `has-logged-In` and `active-in-last-month`,
when targeting the property by it's kind `{checkbox}` we will automatically use the first text property with respect to the ordering defined in the audience page.

**TL;DR** use the kind only when there's a single property. Use the property's name when there are multiple properties with the same kind.

### Object tags 

Hellotext ships with the most common types of Objects that is suitable for most ecommerce sites. These include
`app`, `product`, `cart`, `order`, `coupon`, `order` and `refund` objects. In addition, you can also create your custom objects,
or modify the existing ones by adding extra properties that is specific to your business' needs. 

Similarly to profile tags, you can also target the properties of the objects in your tags. The general format of an object tag can be one of the following 

1. `{object_name.property_name}`
2. `{object_name.property_kind}`
3. `{object_name.property_id}`

For example, given an Appointment custom object, that consists of two properties, `Booked At` and `Room`, you can target the values via 

- `{appointment.Booked At}`
- `{appointment.Room}`

When Hellotext detects these tags, it will get the value associated from the object and replace the tag with the value found. 

### Naming Rules {#rules}

By default, Hellotext generates property names based on the property type. But, you are free to modify the name to something that makes sense to your business.
When naming properties, you should follow these rules:

- Properties cannot start with a number. For example, `1st-name` is not a valid property name.
- Properties cannot contain curly braces. For example, `{name}` is not a valid property name.
