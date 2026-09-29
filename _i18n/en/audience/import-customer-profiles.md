Import customer profiles when you need to bring existing customer data into Hellotext before using it in audiences, campaigns, playbooks, journeys, or Inbox workflows.

An import can create customer profiles, update their properties, and add them to lists. The exact steps depend on whether the data comes from an integration or a file.

This is product guidance for operating Hellotext. It does not replace legal or compliance review for the countries and channels you use.

## Choose an integration or a file

Use an **integration** when your customer data already lives in a supported eCommerce or service platform and should continue syncing with Hellotext.

Use a **file** for a one-time migration, cleanup, or CRM export saved as CSV or TXT.

These paths work differently:

| Integration | File |
| --- | --- |
| The integration defines how source fields map to Hellotext. | You map each file column to a customer profile property. |
| Subscription status comes from the connected source when supported. | You choose the subscription state for new profiles; existing profiles keep theirs. |
| It can continue syncing data after the initial import. | It imports a snapshot of the file. |
| Some integrations can also import order history. | A file import does not import order history. |

## Start an import

1. Go to **Audience**.
2. Open the add menu and choose **Import Customers**.
3. Choose **Connect a service** or **Choose a file to upload**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Import Customers in the Audience add menu">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 240px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-audience-add-en-20260928-crop.png" width="480" height="630" loading="lazy" decoding="async" alt="Audience add menu with Import Customers between New Event and New Segment." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface with the menu open and no customer information in view.</figcaption>
</figure>

The next screen shows both paths:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Two options for importing customers">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame ht-import-responsive-frame">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-chooser-file-en-20260928-crop.png 945w" sizes="390px" width="945" height="970" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-chooser-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-chooser-en-20260928-crop.png 2080w" sizes="760px" style="width: 100%; max-width: 100%; margin: 0 auto;" width="2080" height="1300" loading="lazy" decoding="async" alt="Customer import screen: the upload card shows Choose a file to upload; the wide view also shows Connect a service." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface with both import paths. Narrow screens show a closer crop of the upload card.</figcaption>
</figure>

If you choose **Connect a service**, Hellotext takes you through that integration's setup. Depending on the integration, you may be asked whether to import customers and which lists should receive them. Mapping and consent may be handled automatically from the source.

If you choose a file, continue with the steps below.

## Prepare and upload a file

Before uploading:

- Use a CSV or TXT file with one customer per row.
- Include at least one reliable identifier, such as a phone number or email.
- Use the first row for clear column names.
- Keep dates, phone numbers, currency, and other values in a consistent format.
- Remove test, internal, invalid, or duplicate rows when possible.
- Separate profiles with confirmed marketing consent from profiles whose consent is unknown.

Drag the file into the upload area or choose it from your computer. Always prepare the first row with column names: the importer uses it as the header and does not import it as a profile. Hellotext detects the file separator before continuing.

When the file name appears, select **Continue to import** to move to column mapping.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Example file selected before mapping">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 477px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-selected-file-en-20260928-crop.png" width="955" height="1100" loading="lazy" decoding="async" alt="Demonstration file of 260 B selected, with the first-row header box checked and the Continue to import button visible." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface with a fictional CSV selected; import processing has not started.</figcaption>
</figure>

## Map columns to profile properties

Hellotext shows each file column so you can choose which customer profile property it should update.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="File columns mapped to profile properties">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame ht-import-responsive-frame">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-mapping-mobile-en-20260928-crop.png 780w" sizes="390px" width="780" height="1390" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-mapping-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-mapping-en-20260928-crop.png 2060w" sizes="760px" style="width: 100%; max-width: 100%; margin: 0 auto;" width="2060" height="1000" loading="lazy" decoding="async" alt="Mapping screen with email assigned to Email and first_name assigned to First Name; both columns are selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface with fictional demonstration data and two visible mappings.</figcaption>
</figure>

- Map only the columns you want to import. Unmapped columns are skipped.
- Before starting the import, create any [custom properties]({% link _audience/custom-properties-and-events.md %}) you need in Audience; during mapping, select existing properties.
- Map each profile property only once in the same import.
- For phone numbers, dates, or money, review the country, date format, or currency setting that appears.

For example, when mapping a column to **Birthday**, check the file's date format:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Format choices for the Birthday property">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 425px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-date-format-en-20260928-crop.png" width="850" height="1175" loading="lazy" decoding="async" alt="Property menu open at Birthday with a date format submenu; YYYY-MM-DD is highlighted." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Close-up of the real English interface for a date field in the fictional CSV.</figcaption>
</figure>

If two columns represent the same property, choose the cleaner one or combine them in the source file before importing.

After reviewing the mappings, select **Save & Continue** to move to the consent question.

## Choose the subscription state

For a file import, Hellotext asks whether the customers have consented to marketing promotions.

- Answer **Yes** only if every record in the file has confirmed consent.
- Answer **No** if you do not have reliable evidence of consent for every record.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Marketing consent question in a file import">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame ht-import-responsive-frame">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-en-20260928-crop.png 780w" sizes="390px" width="780" height="1200" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png 2065w" sizes="760px" style="width: 100%; max-width: 100%; margin: 0 auto;" width="2065" height="705" loading="lazy" decoding="async" alt="Consent question with Yes and No options; No is selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface in a demonstration import; No is selected and processing has not started.</figcaption>
</figure>

The choice sets the subscription state of newly created profiles. If a row matches an existing profile, the import keeps that profile's current subscription state; review it separately before using the audience. If the file contains records with and without confirmed consent, split it into separate imports. Do not answer **Yes** based only on the presence of a phone number or email address.

This choice is specific to file imports. A connected integration can supply subscription status from its own source instead.

After choosing an answer, select **Save & Continue** to organize the profiles into lists.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Choose lists and existing-data behavior

Before starting the import, you can add the imported profiles to one or more lists. This is useful for reviewing the result or creating a fixed audience based on the import source.

You can also choose whether mapped file values should overwrite the properties of existing profiles:

- Leave overwriting off when the file may be incomplete or older than the data already in Hellotext.
- Turn it on when the file is the source of truth and its mapped values should replace existing ones.

Review this option carefully: it does not itself change existing profiles' subscription state.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Destination list and property overwrite option">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame ht-import-responsive-frame">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-lists-mobile-en-20260928-crop.png 780w" sizes="390px" width="780" height="850" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-lists-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-lists-en-20260928-crop.png 1520w" sizes="760px" style="width: 100%; max-width: 100%; margin: 0 auto;" width="1520" height="640" loading="lazy" decoding="async" alt="Organize your customers screen with a demonstration list selected and the update existing properties checkbox unchecked." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real English interface with a fictional list; overwriting is off and the import has not started.</figcaption>
</figure>

After reviewing the lists and overwrite choice, select **Save & Start import**. This starts processing the profiles in the background.

## Review the result

Imports run in the background. You can leave the import page while Hellotext deduplicates and processes the rows.

When it finishes, review:

- How many profiles were imported and how many have partial or invalid property values.
- Whether the profiles were added to the expected lists.
- Whether identifiers, dates, currency, and custom properties look correct.
- Whether new profiles have the subscription state chosen for the file or supplied by the integration, and existing profiles kept theirs.
- Whether segments based on the imported properties update as expected.

Open a few profiles before using the imported audience. If some profiles have errors, correct the source values and reimport only the affected records.

## Related guides

- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Lists vs. segments]({% link _audience/lists-and-segments.md %})
- [Create and manage lists]({% link _audience/lists.md %})
- [Build segments]({% link _audience/segments.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
