Segments are dynamic groups of customer profiles. Hellotext includes a profile while it matches the segment conditions and updates membership as profile data and tracked activity change.

Use a segment when you can describe an audience with a rule, such as customers who purchased recently, subscribers in a particular country, or profiles that belong to a selected list and match another condition.

If you need to preserve an explicitly selected cohort, use a list instead. Keep reading: [Lists vs. segments]({% link _audience/lists-and-segments.md %}).

## Before you create a segment

Define the question the segment should answer and confirm that Hellotext receives the data needed to answer it.

For example, before creating a segment for customers interested in a product category, check which product field your connected eCommerce platform uses. Depending on the integration, the useful value may be stored in a category, collection, tag, or custom property.

It also helps to identify a few customer profiles that should match and a few that should not. You can use them to review the result after saving.

## Create a segment

1. Go to **Audience**.
2. Select the **+** button near the bottom-right corner.
3. Select **New Segment**.
4. Replace the default title with a clear segment name.
5. Select **Choose a condition** and choose **Subscriber's Activity** or **Subscriber's Characteristics**.

Use a name that describes the rule rather than a temporary campaign. For example, `Purchased footwear in the last 30 days` is easier to understand later than `August audience`.

## Choose a condition type

### Subscriber's Activity

Use activity conditions for actions that occurred or did not occur. Depending on the data connected to the business, available activity can include:

* Subscription and short-link activity.
* Delivered or received messages.
* Product views, cart activity, purchases, and refunds.
* Page activity.
* Custom tracked actions.

Choose whether the activity **occurred** or **did not occur**. When the condition offers a period, define how far back Hellotext should evaluate the activity. Product and page conditions can expose additional filters so you can narrow the rule to the relevant products, categories, collections, tags, URLs, or other available fields.

### Subscriber's Characteristics

Use characteristic conditions for what is currently known about a customer profile. Available conditions can include:

* Standard and custom profile properties.
* List membership.
* Subscription status.
* Purchase propensity when available.
* Country, location, and device information.
* Connected messaging channel.

Choose whether the profile should meet or not meet the selected condition, then complete the value required by that property or filter.

## Combine conditions with AND and OR

The segment builder groups conditions in two ways:

* **OR** adds another alternative inside the same block. A profile can match either condition in that block.
* **AND** adds another block. A profile must also match that block to enter the segment.

For example, you can build an activity block for customers who purchased from the footwear category **or** purchased from the accessories category, then add an **and** block requiring their subscription status to be subscribed.

Read the complete rule before saving. A misplaced **AND** or **OR** can make the segment much broader or narrower than intended.

## Save and review the result

Select **Save changes** when the name and conditions are ready.

Hellotext calculates the profiles that match the rules. While that work is running, the segment can show that it is being updated. New events and profile changes can also trigger later membership updates, so results may take a short time to appear.

After saving:

* Review the total number of profiles.
* Open several matching profiles and confirm why they qualify.
* Check some profiles you expected to match but do not.
* Confirm that periods, inclusions, exclusions, and product fields mean what you intended.
* Review subscription eligibility separately before using the segment for messaging.

A segment organizes profiles; it does not subscribe customers or override an unsubscribe.

## Edit a segment

In **Audience**, find the segment in the **Segments** group and use its edit button. You can rename it, add or remove conditions, or change existing values.

After you save rule changes, Hellotext recalculates membership. Review the profile count again before using the updated segment in a campaign.

## Delete a segment

Open the segment editor and select the trash button. Deleting a segment removes the segment, not the customer profiles it contained.

If the segment is used by a draft campaign, Hellotext asks you to confirm because deleting it also removes that audience reference from the draft.

## If the result looks wrong

Check these common causes:

* The required property or activity is not reaching Hellotext.
* The selected period is too short or too broad.
* An **AND** block should be an **OR** alternative, or the reverse.
* A condition excludes profiles instead of including them.
* Product information is stored in another field for the connected integration.
* The segment is still being recalculated.

Test with known customer profiles before relying on a new or substantially edited segment.

## Related guides

* [Audience and segmentation overview]({% link _audience/audience-overview.md %})
* [Understand customer profiles]({% link _audience/customer-profiles.md %})
* [Lists vs. segments]({% link _audience/lists-and-segments.md %})
* [Create and manage lists]({% link _audience/lists.md %})
* [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
* [Tracking events]({% link _developers/tracking-events.md %})
