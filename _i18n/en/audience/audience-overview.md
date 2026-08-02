**Audience** is the workspace where you can understand, organize, and manage the customer profiles known to Hellotext.

Use audience data to decide who should receive a campaign, which signals a playbook or journey should use, and what context your Inbox team needs before helping a customer.

## Customer profiles and subscribers

A customer profile is the unified record Hellotext builds for one customer. It can include identity, channel addresses, properties, purchase history, tracked events, lists, segments, and conversation context.

A subscriber is a customer profile that has opted in to receive promotional messages. Not every profile is a subscriber or can be reached through every channel.

Keep reading: [Understand customer profiles]({% link _audience/customer-profiles.md %}).

## Lists and segments

Use **lists** to maintain a fixed group of profiles. A profile stays in the list until it is added or removed manually, through an import, or by an integration.

Use **segments** when membership should update automatically according to profile properties or customer activity.

Keep reading: [Lists vs. segments]({% link _audience/lists-and-segments.md %}).

## Consent and subscriber status

Profile data and permission to send are different. Before sending a campaign or relying on an outbound playbook, understand whether the customer is subscribed, which channel is available, and whether other delivery rules allow the message.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Import customer profiles

Use imports when you need to bring existing customer data from a spreadsheet, CRM export, or another source into Hellotext.

Imports can create or update profiles, organize them into lists, and prepare data for segmentation, personalization, campaigns, playbooks, journeys, and Inbox workflows.

Keep reading: [Import customer profiles]({% link _audience/import-customer-profiles.md %}).

## Enrich profiles through conversation

Use [Property Collector]({% link _captures/property-collector-playbook.md %}) when AI should collect selected missing properties directly or before another playbook continues.

Use [Subscriber Booster]({% link _captures/subscriber-booster-playbook.md %}) when subscription consent and selected properties should be collected contextually within Webchat or a customer-initiated WhatsApp conversation.

## Use audience data across Hellotext

Audience data can help you:

* Target campaigns.
* Personalize messages with profile properties.
* Give playbooks and journeys the properties and signals they need.
* Understand purchase behavior and product interest.
* Give the Inbox team more context before replying.

## Before using an audience

Before launching a campaign or using an audience in an automation, check:

* The audience matches the intended experience.
* The profiles have the properties or activity required by the selection rules.
* Subscription status and available channels support the intended message.
* Exclusions are applied where needed.
* Personalization has a sensible result when a property is missing.

## Related guides

* [Understand customer profiles]({% link _audience/customer-profiles.md %})
* [Lists vs. segments]({% link _audience/lists-and-segments.md %})
* [Create and manage lists]({% link _audience/lists.md %})
* [Build segments]({% link _audience/segments.md %})
* [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
* [Import customer profiles]({% link _audience/import-customer-profiles.md %})
* [Personalization tags]({% link _audience/personalization-tags.md %})
* [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
* [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
