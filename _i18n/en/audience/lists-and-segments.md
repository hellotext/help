Lists and segments both organize customer profiles into audiences. The difference is how a profile becomes a member and how that membership changes.

Use a **list** when membership should be explicit and stable. Use a **segment** when membership should follow conditions and update automatically as customer data changes.

## Quick comparison

| | List | Segment |
| --- | --- | --- |
| **Membership** | A profile is deliberately added or removed. | A profile is included while it matches the segment conditions. |
| **Updates** | Through a team action, import, integration, or journey step. | Automatically after relevant profile data or activity changes. |
| **Best for** | Cohorts whose membership has meaning on its own. | Audiences defined by who customers are or what they currently do. |
| **Examples** | An imported customer cohort, event attendees, a QA audience, or profiles selected for review. | Recent purchasers, customers interested in a product category, or subscribers in a particular location. |

## Use a list for explicit membership

A list is a fixed group of customer profiles. A profile stays in the list until its membership is changed by a person, import, integration, or journey step.

Lists are useful when the act of assigning a profile to the group matters. They are not limited to small audiences.

Choose a list when you need to:

* Keep an imported cohort together after the import finishes.
* Maintain a QA or internal test audience.
* Record participation in an event, program, store, or operational workflow.
* Review a deliberately selected group before using it elsewhere.
* Preserve membership even when a customer's properties or recent activity change.

For example, a list named `Imported VIP customers` remains a record of that cohort. A dynamic definition such as "customers who spent more than $500 in the last 90 days" belongs in a segment instead.

Keep reading: [Create and manage lists]({% link _audience/lists.md %}).

## Use a segment for rule-based membership

A segment is a dynamic group built from conditions. Hellotext evaluates profile properties, list membership, subscription information, and tracked activity supported by the segment builder, then updates membership as the underlying data changes.

Choose a segment when the question begins with "Who currently...?" For example:

* Customers who purchased during a particular period.
* Subscribers in a particular country or city.
* Customers who viewed or purchased products from selected categories.
* Customers who have not purchased during a recent period.
* Customers who match a combination of profile and activity conditions.

Segment results depend on the data Hellotext receives. If a product classification can live in different fields such as tags, categories, collections, or custom properties, select the fields that are reliable for your connected store instead of assuming every integration structures them the same way.

Membership updates automatically, but changes may take a short time to appear while Hellotext processes new data and recalculates the segment.

Keep reading: [Build segments]({% link _audience/segments.md %}).

## Combine lists and segments in an audience

When a campaign lets you select an audience, you can include lists and segments and use other lists or segments as exclusions.

For example, you could include a segment of recent purchasers and a list of event attendees, then exclude an internal test list. Review the resulting audience before sending, especially when several inclusions or exclusions overlap.

Use a list when you want to preserve a cohort. Use a segment when you want the group to keep following a rule.

## Membership does not grant consent

A profile can belong to a list or segment without being eligible for every message or channel. Lists and segments organize profiles; they do not subscribe customers or override an unsubscribe.

Before using an audience, confirm:

* The profiles are eligible for the channel you plan to use.
* Unsubscribed, invalid, blocked, internal, or test profiles are excluded where needed.
* The conditions rely on properties and activity that are present and trustworthy.
* The audience size and sample profiles match what you intended.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Related guides

* [Audience and segmentation overview]({% link _audience/audience-overview.md %})
* [Understand customer profiles]({% link _audience/customer-profiles.md %})
* [Create and manage lists]({% link _audience/lists.md %})
* [Build segments]({% link _audience/segments.md %})
* [Import customer profiles]({% link _audience/import-customer-profiles.md %})
* [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
