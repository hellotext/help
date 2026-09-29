Hellotext can prepare CSV files for two different purposes: exporting the current state of customer profiles from **Audience**, and exporting the attributed sales shown in the **Revenue** report.

Use profile exports to move a defined audience into a BI, CRM, or retargeting workflow. Use the Revenue export when you need order-level attribution detail for analysis or reconciliation.

## Choose the right export

| Export | Best for | Scope |
| --- | --- | --- |
| **Customer profiles** | CRM updates, audience analysis, retargeting, and data review | All profiles, selected profiles, a list, or a segment |
| **Revenue report** | Attribution analysis, finance review, and reconciling attributed orders | Attributed sales within the selected report date range |

Both exports are point-in-time CSV files. They do not create an ongoing synchronization with another system.

## Export customer profiles

1. Go to **Audience**.
2. Open **All profiles**, a list, or a segment, depending on the audience you need.
3. To export only certain customers, select their checkboxes. You can select the current page or all customers in the current audience.
4. Open the more-options menu in the Audience search bar.
5. Select **Export to file** or **Export selected**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Option to export the open audience">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 760px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 409px)" srcset="/images/audience/exporting-data/audience-all-mobile-en.png" width="670" height="365" />
        <img class="ht-editorial-visual__image" src="/images/audience/exporting-data/audience-all-en.png" width="1520" height="270" loading="lazy" decoding="async" alt="Audience menu showing the Export to file option." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface with fictional demonstration data. The option is shown without starting an export.</figcaption>
</figure>

After selecting profiles, the same menu offers **Export selected**:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Option to export only the selected profiles">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 172px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/exporting-data/audience-selected-menu-en.png" width="345" height="220" loading="lazy" decoding="async" alt="Close-up of the Audience menu with the Export selected option." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Close-up of the real English interface with a fictional selection; no export was started.</figcaption>
</figure>

Hellotext prepares the file in the background and shows its progress in Audience. When it is ready, the download starts automatically and Hellotext also emails a time-limited link to download it. If the automatic download does not start, use the download button in the completed export notification.

Audience offers a cancel option while an export is shown as preparing. If processing has already started, that action may not stop the file in progress. If the export action is not available, ask an administrator to confirm your team role and permissions.

## Understand the profile CSV

The file contains one row per exported customer profile. It includes standard profile columns such as the profile ID, profile name, phone number, and email, plus the current business properties available for export. This can include custom properties, address, tags, and list membership. A Mercado Libre username is included when it is available.

The columns reflect the property definitions configured for the business, so a column can be blank for customers who do not have that value. The export contains one phone-number column and one email column; it is not a complete dump of every identifier attached to a profile.

The profile CSV represents current profile values and list membership. It does not include the customer's full activity or event history, message history, or every report metric.

## Use a list or segment to define the audience

Create or open the narrowest useful audience before exporting:

- Use a **list** for a maintained group whose membership is managed directly or through an import, integration, capture, or journey step.
- Use a **segment** when membership should be calculated from profile data, subscription status, or tracked activity.
- Select individual profiles when you need an exception or a small operational set.
- Use **All profiles** only when the destination genuinely needs the complete audience.

Review the audience count and a sample of its profiles before creating the export. Segment membership is queried while the export is prepared and may change after you review the count. Check the generated result: the CSV is a fixed snapshot once it has been prepared.

## Prepare the CSV for BI or CRM

Before importing the file into another system:

1. Keep **Profile ID** as the stable Hellotext reference.
2. Map phone, email, and unique custom identifiers to the corresponding destination fields.
3. Confirm date, number, money, checkbox, and tag formats before changing them.
4. Record the source audience and export date so the dataset can be reproduced or audited.
5. Decide how the destination should handle blank values and existing records before importing.

For recurring updates, event-level data, or an automated integration, use the [API reference]({% link _developers/api.md %}) instead of treating repeated CSV exports as a live sync.

## Prepare an audience for retargeting

Export the list or segment that represents the intended audience instead of exporting every profile and filtering it later.

Before uploading it to an advertising or messaging platform:

- Confirm that the audience criteria still match the campaign purpose.
- Verify the customer's subscription and consent status for the intended channel and destination.
- Use the identifiers required by the destination and avoid uploading unrelated properties.
- Follow the destination platform's audience, privacy, and data-retention policies.

Exporting a profile does not subscribe the customer, grant consent, or make the customer eligible for every type of communication.

## Export attributed revenue

1. Go to **Dashboard** and open the **Revenue** report.
2. Select the reporting date range you want to review.
3. Select the download icon beside the date-range controls.
4. Wait while Hellotext prepares the CSV. The download starts automatically when it is ready, and Hellotext also emails a time-limited link to retrieve it.

In the report, **Custom** identifies the selected date range:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Revenue report date-range controls">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 447px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/exporting-data/revenue-period-en.png" width="895" height="150" loading="lazy" decoding="async" alt="Revenue report date-range options with Custom selected." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English control with a demonstration date range.</figcaption>
</figure>

The download icon sits to the right of those controls, above the populated report:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Revenue report export icon">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 427px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/exporting-data/revenue-export-en.png" width="855" height="610" loading="lazy" decoding="async" alt="Download icon above a total revenue card with fictional data and a green comparison." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English report with fictional data; no export was started.</figcaption>
</figure>

The Revenue export is designed for reviewing attributed sales. Depending on the available evidence, it can include the order and customer, credited campaign, route, or playbook, source and channel, attributed amount, attribution reason, AI and human commercial evidence, and a link to the attribution event or relevant conversation context.

This export contains attributed sales for the chosen period. It is not a complete export of all store orders or all business revenue. See [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}) to understand the evidence and windows behind those rows.

## Handle exported files safely

CSV files can contain personal data and business-specific properties.

- Limit the export to the records needed, and before transferring the CSV, remove columns the recipient does not need from a controlled copy.
- Store the file in an approved location with limited access.
- Do not send exported customer data through an unsecured channel.
- Delete temporary copies when the analysis or transfer is complete.
- Follow your organization's retention policy and applicable privacy requirements.

An operational CSV export is not automatically a complete response to a customer's privacy or data-access request.

## Related guides

- [Understand customer profiles]({% link _audience/customer-profiles.md %})
- [Lists and segments]({% link _audience/lists-and-segments.md %})
- [Build lists]({% link _audience/lists.md %})
- [Build segments]({% link _audience/segments.md %})
- [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [API reference]({% link _developers/api.md %})
