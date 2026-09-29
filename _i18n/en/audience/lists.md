Lists are fixed groups of customer profiles. Use them when membership should be assigned deliberately and remain stable until a person or connected process changes it.

A list does not evaluate conditions. If membership should change automatically according to profile properties or customer activity, use a segment instead. Keep reading: [Lists vs. segments]({% link _audience/lists-and-segments.md %}).

## Create a list

1. Go to **Audience**.
2. Select the **+** button near the bottom-right corner.
3. Select **New List**.
4. Enter a unique, descriptive name.
5. Select **Save changes**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Menu for creating a list in Audience">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 322px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/lists/audience-menu-en.png" width="620" height="255" loading="lazy" decoding="async" alt="Menu opened with the Audience plus button, with the New List option visible." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface in a demonstration account; the image shows the menu before a list is created.</figcaption>
</figure>

Name the list for what membership represents. For example, `Store event attendees` or `Imported loyalty members` is more useful than `New list` or a campaign date that will lose context later.

## Add one customer profile

From **Audience**, open the customer profile you want to update and find the **Lists** property.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="List picker on a demonstration profile">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 263px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/lists/profile-list-picker-en.png" width="502" height="555" loading="lazy" decoding="async" alt="Lists property with Clientes de ejemplo typed in the search field and an existing list in the results; no option has been selected yet." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Picker from the real English interface with fictional data; searching does not change profile membership.</figcaption>
</figure>

Search for and select the list. Hellotext adds the profile and shows the list as a value on the profile. To remove the profile later, select the remove button beside that list value.

Adding a profile to a list does not change the customer's subscription status.

## Add or remove multiple profiles

Use a bulk update when the same membership change should apply to several profiles:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Multiple selection and the Lists property">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 295px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/lists/bulk-lists-en.png" width="570" height="747" loading="lazy" decoding="async" alt="Multiple selection pane for two fictional profiles with the Lists property available; no update has been applied." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Pane from the real English interface with fictional data; selecting profiles has not changed their lists.</figcaption>
</figure>

1. In **Audience**, open a list if you want to limit the selection to its profiles.
2. Select at least two profiles. The **Multiple selection** pane opens automatically.
3. In that pane, find the **Lists** property.
4. Choose the lists to add profiles to and the lists to remove them from.
5. Review the changes and select **Apply to … customers** to confirm them.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Confirmation before a bulk list update">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 633px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/lists/bulk-confirmation-en.png" width="1230" height="820" loading="lazy" decoding="async" alt="Pending confirmation to add the example list Clientes de ejemplo · Importación to two fictional customers, with Apply to 2 customers and Cancel buttons." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Example of one list addition in the real interface; the update has not been applied.</figcaption>
</figure>

Large updates run in the background and show their progress. Wait for the update to finish before checking the final profile count or using the list as an audience.

## Add profiles through an import

When importing customer profiles, you can add the imported profiles to one or more existing lists or create a list for that import.

This is useful when you need to preserve the imported cohort for review, QA, or later use. For example, a list named `CRM migration - review` lets the team inspect those profiles without trying to recreate the original import through dynamic conditions.

An import can create list membership and update profile data, but list membership does not confirm consent. Review the subscription choice separately during the import.

Keep reading: [Import customer profiles]({% link _audience/import-customer-profiles.md %}).

## Add profiles from a journey

A journey can add a customer profile to a list through a step that updates the **Lists** property.

Use this when reaching a point in the journey should record stable membership, such as completing an onboarding path, registering interest, or entering an operational follow-up group.

The list records that the journey added the profile. It does not continue evaluating the journey conditions after that point like a segment would.

## Understand integration-managed lists

An integration can create and update list membership from an external source. These lists are still explicit groups; Hellotext is synchronizing the membership instead of calculating it from segment rules.

Some source-managed lists, such as lists synchronized from Shopify, cannot be renamed in Hellotext. Their source icon helps distinguish them from lists created manually. Use the source system when that membership or name is controlled there.

## Use lists in audiences and segments

Lists can be used to:

* Include or exclude a fixed group when selecting a campaign audience.
* Preserve an imported or operational cohort.
* Build a segment condition based on list membership and combine it with profile or activity rules.
* Give the team a stable group to search, review, export, or update.

Review overlapping inclusions and exclusions before sending. If a profile is included by one audience source and excluded by another, the exclusion removes it from the campaign audience.

## Rename a list

In **Audience**, find the list in the **Lists** group and use its edit button. Enter a unique name and select **Save changes**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Name of a demonstration list">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 452px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/lists/list-editor-name-en.png" width="880" height="275" loading="lazy" decoding="async" alt="Editor for the fictional list Clientes de ejemplo · Importación with its name field visible; no change has been saved." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Name field in the fictional list editor; opening it does not change the list.</figcaption>
</figure>

Renaming the list does not remove its profiles. A list controlled by an integration may not allow its name to be edited.

## Delete a list

Open the list editor and select the trash button. Deleting a list removes the group and its membership records; it does not delete the customer profiles that belonged to it.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="List editor actions">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 461px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/lists/list-editor-actions-en.png" width="901" height="214" loading="lazy" decoding="async" alt="List editor footer with Save changes, Cancel, and trash controls visible; the list has not been saved or deleted." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The trash button opens the confirmation shown below; this fictional list was not deleted.</figcaption>
</figure>

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Confirmation before deleting a list">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 495px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/lists/delete-confirmation-en.png" width="955" height="445" loading="lazy" decoding="async" alt="List deletion warning explaining that contacts will not be removed, with Delete and Cancel buttons; the list has not been deleted." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Confirmation in the real English interface; deletion was not carried out.</figcaption>
</figure>

Before deleting, review campaigns, segments, journeys, or operating processes that depend on that list. If a draft campaign uses it, Hellotext asks you to confirm because deleting the list also removes that audience reference from the draft.

## Membership does not grant consent

A customer profile can belong to a list while being unsubscribed, unconfirmed, or blocked, or while having an invalid or unreachable address for the channel you plan to use.

Before messaging a list, check channel eligibility and apply the required exclusions. Never use list membership as evidence that the customer opted in.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Related guides

* [Audience and segmentation overview]({% link _audience/audience-overview.md %})
* [Understand customer profiles]({% link _audience/customer-profiles.md %})
* [Lists vs. segments]({% link _audience/lists-and-segments.md %})
* [Build segments]({% link _audience/segments.md %})
* [Import customer profiles]({% link _audience/import-customer-profiles.md %})
* [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
