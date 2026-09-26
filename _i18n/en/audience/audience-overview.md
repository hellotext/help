**Audience** is the workspace where you can understand, organize, and manage the customer profiles known to Hellotext.

Use audience data to decide who should receive a campaign, which signals a playbook or journey should use, and what context your Inbox team needs before helping a customer.

## Customer profiles and subscribers

A customer profile is the unified record Hellotext builds for one customer. It can include identity, channel addresses, properties, purchase history, tracked events, lists, segments, and conversation context.

A subscriber is a customer profile with a recorded promotional subscription. Not every profile is subscribed, and a recorded subscription does not mean the customer is reachable through every channel.

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

Use [Subscriber Booster]({% link _captures/subscriber-booster-playbook.md %}) when you want to request a subscription and collect configured properties that are still missing in Webchat or inbound conversations on enabled channels, such as WhatsApp, Instagram, Messenger, or SMS. Availability depends on the business's configuration.

## Use audience data across Hellotext

If you imported event attendees and want to preserve that group, use a **list**: membership changes when someone adds or removes profiles. If you want to find people who purchased in the last 30 days, use a **segment** based on purchases: membership updates as recorded activity changes.

Both groups can provide context to campaigns, playbooks, journeys, and Inbox. Membership in a list or segment does not create consent or guarantee a usable messaging destination.

## Before using an audience

Before launching a campaign or using an audience in an automation, check:

* Audience size is close to what you expect, and a few representative profiles meet the criteria.
* The properties or activities used by the rules are present and reliable.
* You know the source of the subscription and have confirmed that the status, destination, and channel support the intended message.
* Exclusions remove internal, test, or unintended profiles where appropriate.
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
