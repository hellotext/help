Use **Audience → Delivery errors** to review email addresses and phone numbers associated with failed deliveries from campaigns and playbooks. You can inspect the customer's profile, export the affected details, and remove a specific value when you decide it should no longer be used.

A delivery error does not always mean the customer's contact detail is wrong. Review the reason before changing the profile.

## Open delivery errors

1. Go to **Audience**.
2. Select **Delivery errors**.

You can also open a campaign's **Partially delivered** status tooltip and select **Review errors**. The list opens with that campaign selected as its source.

Each row represents one exact contact value on one profile. Repeated failures for the same value are grouped. The row count can therefore differ from the failed-message count in a report. A profile with both an affected email address and phone number can appear in two rows.

If the message was never created or is still pending, see [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Search and filter the results

Search by name, email address, or phone number. In the more-options menu beside the search field, combine:

- **Source:** campaigns, playbooks, or a specific source.
- **Error type:** invalid contact details, temporary errors, or errors that need review.
- **Channel:** email or SMS.

Applied filters appear below the search field. Use a filter's close button to remove only that filter. Scroll to see more results. Changing the search or filters clears the selection.

## Understand the reason

| Error type | What to review |
| --- | --- |
| **Invalid contact details** | A destination reported as nonexistent or incorrect. Check the exact value for a typo or outdated information. |
| **Temporary errors** | A condition such as a full mailbox or an unavailable phone. The value may still be valid. |
| **Needs review** | A provider, sender, account, configuration, or unclear error. Investigate the reason before changing the customer's value. |

A provider rejection or configuration problem is not proof that the recipient is invalid. Removing their email address or phone number does not fix the sending account. For channel investigation, see [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Inspect the profile

Select the customer's name or contact value to open the profile. Compare the affected value with the customer's other details and review **Activity** and **Notes**.

The warning beside the value shows its error reason. Delivery failures in Activity include the destination and reason. List filters do not limit the other details you can inspect in the profile.

## Export the error details

1. Apply the search and filters you need.
2. To export every result, leave the selection empty. To export a subset, select its checkboxes.
3. Open the more-options menu.
4. Select **Export to file** or **Export selected**, as appropriate.

Select all includes matching results that have not yet appeared while scrolling. Review the count before exporting.

The CSV covers the contact details with errors that you are reviewing. To download customer properties, use the [profile export]({% link _audience/exporting-data.md %}).

## Remove one or several values

Removing a value removes that email address or phone number from the profile, not the whole profile. Other details and history remain. The removed value is no longer available for sending from that profile across channels: removing a phone number affects uses of that number beyond the failed SMS.

To remove one value:

1. Open the profile and find the exact value.
2. Select the removal control beside the failed value. The trash icon appears when you hover over or focus it.
3. Review the destination in **Remove email address** or **Remove phone number**.
4. Select **Remove**, or **Cancel** to keep it.

To remove several values, select their rows and choose **Remove from profile (N)**. Review the email and phone counts, then confirm **Remove N** or cancel without changing them.

Any category can be selected for removal; review whether it is appropriate, especially for temporary or configuration errors. Removal does not resend failed messages or change the customer's consent. If the value came from an import or integration, also check whether its source needs correcting.

## Related guides

- [Understand customer profiles]({% link _audience/customer-profiles.md %})
- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Exporting data]({% link _audience/exporting-data.md %})
- [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
