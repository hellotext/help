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
| Subscription status comes from the connected source when supported. | You choose whether the imported profiles are subscribed or unconfirmed. |
| It can continue syncing data after the initial import. | It imports a snapshot of the file. |
| Some integrations can also import order history. | A file import does not import order history. |

## Start an import

1. Go to **Audience**.
2. Open the add menu and choose **Import Customers**.
3. Choose a connected service or upload a file.

If you choose a service, Hellotext takes you through that integration's setup. Depending on the integration, you may be asked whether to import customers and which lists should receive them. Mapping and consent may be handled automatically from the source.

If you choose a file, continue with the steps below.

## Prepare and upload a file

Before uploading:

- Use a CSV or TXT file with one customer per row.
- Include at least one reliable identifier, such as a phone number or email.
- Use the first row for clear column names.
- Keep dates, phone numbers, currency, and other values in a consistent format.
- Remove test, internal, invalid, or duplicate rows when possible.
- Separate profiles with confirmed marketing consent from profiles whose consent is unknown.

Drag the file into the upload area or choose it from your computer. Leave the header option enabled when the first row contains column names. Hellotext detects the file separator before continuing.

## Map columns to profile properties

Hellotext shows each file column so you can choose which customer profile property it should update.

- Map only the columns you want to import. Unmapped columns are skipped.
- Use an existing property or create a custom property when needed.
- Map each profile property only once in the same import.
- For phone numbers, dates, or money, review the country, date format, or currency setting that appears.

If two columns represent the same property, choose the cleaner one or combine them in the source file before importing.

## Choose the subscription state

For a file import, Hellotext asks whether the customers have consented to marketing promotions.

- Choose **Subscribed** only when every profile in that import has confirmed consent.
- Choose **Unconfirmed** when Hellotext does not have reliable evidence of consent.

If the file contains both groups, split it into separate imports. Do not mark the entire file as subscribed based only on the presence of a phone number or email address.

This choice is specific to file imports. A connected integration can supply subscription status from its own source instead.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Choose lists and existing-data behavior

Before starting the import, you can add the imported profiles to one or more lists. This is useful for reviewing the result or creating a fixed audience based on the import source.

You can also choose whether the file should overwrite existing profile property values:

- Leave overwriting off when the file may be incomplete or older than the data already in Hellotext.
- Turn it on when the file is the source of truth and its mapped values should replace existing ones.

The overwrite option applies to matching customer profiles as well as newly imported rows, so review it carefully.

## Review the result

Imports run in the background. You can leave the import page while Hellotext deduplicates and processes the rows.

When it finishes, review:

- How many profiles were imported and how many rows had errors.
- Whether the profiles were added to the expected lists.
- Whether identifiers, dates, currency, and custom properties look correct.
- Whether the subscription state matches the import decision or connected source.
- Whether segments based on the imported properties update as expected.

Open a few profiles before using the imported audience. If rows failed, correct the source data and import only the corrected records again.

## Related guides

- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Lists vs. segments]({% link _audience/lists-and-segments.md %})
- [Create and manage lists]({% link _audience/lists.md %})
- [Build segments]({% link _audience/segments.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
