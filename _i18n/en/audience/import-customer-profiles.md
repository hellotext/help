Import customer profiles when you need to bring existing customer data into Hellotext before launching audiences, campaigns, playbooks, routes, or Inbox workflows.

Imported data can make Hellotext useful faster, but it also needs careful review. A file or integration can create profiles, update profile properties, organize customers into lists, and mark profiles as subscribed when you confirm they have consent.

This is product guidance for operating Hellotext. It does not replace legal or compliance review for the countries and channels you use.

## Choose the right import path

Use a **service import** when your customer data already lives in a supported commerce or service integration, such as Shopify, Wix, WooCommerce, VTEX, or Mercado Libre.

Use a **file import** when you have customer data in a spreadsheet, CRM export, or another source that can be saved as a CSV or TXT file.

If the data source is still connected and should keep updating, prefer an integration. If the import is a one-time cleanup or migration, a file can be enough.

## Prepare the file

For file imports:

- Use a CSV or TXT file.
- Keep one customer profile per row.
- Use the first row as clear column headers, such as `first_name`, `last_name`, `phone`, `email`, `birthday`, `city`, `loyalty_tier`, or `consent_source`.
- Include at least one reliable identifier when possible, such as phone number or email.
- Use consistent formats for dates, phone numbers, money, and boolean values.
- Remove test, internal, invalid, opted-out, or duplicate rows before importing when you can.
- Keep consent source, import source, or import date as profile properties if your team will need that context later.

If the file mixes customers who consented with customers whose consent is unknown, split the file before importing. It is safer to import uncertain profiles as unconfirmed than to mark the whole file as subscribed.

## Upload the file

From **Audience**, start a customer import and choose whether to import from a connected service or upload a file.

When uploading a file, Hellotext accepts CSV and TXT files. If the first row contains column names, keep the first-row-as-headers option enabled so the mapping step is easier.

If Hellotext cannot read the file, check for:

- Unsupported file type.
- Empty file.
- Missing headers.
- Encoding issues. Saving the file as UTF-8 usually helps.
- Formatting issues such as unmatched quotes.
- Tabs instead of a comma-separated or semicolon-separated file.
- Files larger than the upload limit.

## Map columns to profile properties

After uploading, review each column and choose which customer profile property it should update.

Map only the columns you want Hellotext to import. Unmapped columns are skipped.

Common mappings include:

- Full name, first name, or last name.
- Phone number.
- Email.
- Birthday or another date.
- Company, city, loyalty tier, preferred category, language, or any custom property you use for segmentation and personalization.
- Tags or labels if your account uses them as profile properties.

Each profile property can only be mapped once in the same import. If two columns point to the same property, choose the cleaner column or combine the data before importing.

For date, local phone number, or money columns, review the extra format, country, or currency prompt before continuing.

## Confirm consent

Hellotext asks whether the imported customers consented to marketing promotions.

Choose **subscribed** only when the imported profiles have clear consent for the channel you plan to use. If the file contains mixed or uncertain consent, import those profiles as unconfirmed or split the file into separate imports.

Before sending to imported profiles, confirm:

- Which channel the consent applies to.
- Where the consent came from.
- Whether opted-out profiles were excluded or mapped correctly.
- Whether the sender, WhatsApp account, or channel is ready.
- Whether the first send should go to a smaller test audience.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Organize imported profiles

At the end of the import, you can add imported customer profiles to one or more lists.

Use a list when you want a fixed group for review, QA, a first campaign, or a follow-up playbook. For example, create a list named `Shopify import - June 2026` or `VIP import review` so your team can find the profiles later.

You can also choose whether the import should update existing profile properties with the new data.

- Leave this off when the imported file may be incomplete or older than the data already in Hellotext.
- Turn it on when the imported file is the source of truth and should replace matching existing values.

## After the import starts

Imports run in the background. You do not need to keep the import page open.

When the import finishes, review:

- How many customer profiles were imported.
- Whether any rows had errors.
- Whether profiles landed in the expected lists.
- Whether phone numbers, email addresses, dates, and custom properties look right.
- Whether segments that depend on the imported properties updated as expected.
- Whether a few test profiles can be used safely in a campaign, playbook, or route.

Errors can happen when a value is invalid, missing, duplicated, or assigned to another customer profile. Fix the source file and reimport the corrected rows if needed.

## Use imported profiles safely

Before using imported profiles in a launch:

- Open a few imported profiles and confirm the data looks correct.
- Check that subscription status matches your consent decision.
- Build a small test list or segment before sending broadly.
- Test personalization tags against imported properties.
- Confirm the intended playbook, route, campaign, or Inbox workflow uses the imported data as expected.

If you are importing only to enrich profiles, do not send immediately. First verify that the imported data improves segmentation, personalization, routing, or reporting.

## Related guides

- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Lists vs. segments]({% link _audience/lists-and-segments.md %})
- [Create and manage lists]({% link _audience/lists.md %})
- [Build segments]({% link _audience/segments.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
