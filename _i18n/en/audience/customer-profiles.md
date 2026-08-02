A customer profile is the unified record Hellotext uses to understand one customer. It brings together identity, channel addresses, properties, activity, and conversation context as data arrives from your connected tools.

A profile is not necessarily a subscriber. Hellotext can know about a customer before that person is eligible to receive a promotional message.

## Open a customer profile

Go to **Audience** and select a profile. The profile opens beside the audience list so you can review its information without losing your place.

Use search when you know the customer's name, phone number, email address, or another searchable identifier.

## What a profile can contain

The available information depends on the channels and integrations connected to your business. A profile can include:

* **Identity:** name and the identifiers Hellotext uses to recognize the customer.
* **Channel addresses:** phone numbers, email addresses, WhatsApp identities, or identities from other connected channels.
* **Subscription and profile status:** whether the customer is subscribed, unsubscribed, or unconfirmed, and whether the profile has an additional restriction such as a block.
* **Properties:** standard or custom information such as birthday, location, company, tags, and preferences.
* **Lists and segments:** the fixed lists and dynamic segments that currently include the profile.
* **Activity:** tracked actions such as subscription changes, clicks, product activity, orders, and other events received by Hellotext.
* **Conversation context:** message activity and internal notes that help the Inbox team understand the customer.

Some profiles contain only a name or channel identity at first. They become more useful as Hellotext receives additional properties and activity.

## Properties and activity are different

**Properties** describe what is currently known about the customer. They can be used for segmentation and personalization and can usually be edited when the source allows it.

**Activity** is the chronological record of what happened. Events can come from commerce integrations, capture tools, tracked links, conversations, Hellotext.js, or the API.

For example, `birthday` can be a profile property, while a product view or confirmed order is recorded as activity. Both can help Hellotext decide which experience is relevant, but they represent different kinds of data.

## How profiles are created and updated

Hellotext can create or enrich a profile when data arrives from:

* A connected eCommerce platform or another integration.
* A capture playbook, such as Webchat, a popup, a form, a QR code, or a shareable link.
* A customer conversation on a connected channel.
* A customer profile import.
* Hellotext.js, the API, or a custom integration.
* A manual update by a team member.

When the same reliable identifier is available, Hellotext can use it to associate new information with an existing profile. Incomplete or conflicting identifiers can still produce possible duplicates that need review.

## Review and merge possible duplicates

A duplicate warning appears when Hellotext finds profiles with similar identity information. Review the suggested profiles before merging them; two people can share a name, phone number, or email in imported data.

Use the profile options to open the merge flow. Confirm which data belongs to the same customer before completing it so reporting, segmentation, and conversation context remain attached to the correct person.

## Use profiles across Hellotext

Customer profiles connect the main parts of Hellotext:

* **Campaigns** use lists and segments to choose an audience.
* **Playbooks** use properties and activity as signals for autonomous decisions and personalized experiences.
* **Journeys** can branch or take actions based on profile data and events.
* **Inbox** shows customer context to agents and teammates handling a conversation.
* **Reports and attribution** use identity and tracked activity to connect outcomes with the correct customer and source.

## Manage profile information carefully

From a profile, team members with the required permissions can edit properties, manage list membership, review subscription status, start or open a conversation, merge duplicates, block a profile, or delete it.

Keep these practices in mind:

* Do not mark a customer as subscribed unless you have the required consent.
* Correct identity data before creating another profile for the same person.
* Use properties for information that should describe the customer's current state.
* Use events for actions that occurred at a particular time.
* Review the source of synchronized data before overwriting it manually.
* Treat deletion as a final data-management action, not as a shortcut for fixing a duplicate.

## Related guides

* [Audience and segmentation overview]({% link _audience/audience-overview.md %})
* [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
* [Import customer profiles]({% link _audience/import-customer-profiles.md %})
* [Lists vs. segments]({% link _audience/lists-and-segments.md %})
* [Personalization tags]({% link _audience/personalization-tags.md %})
* [Tracking events]({% link _developers/tracking-events.md %})
