Use **Audience → Delivery errors** to find customer profiles whose email address or phone number can't receive messages. A profile appears here when a campaign, journey, or playbook message failed and the provider reported that the destination itself is unusable. You can inspect the profile, export the affected details, and remove the failed value from the profile.

Other failures don't add profiles to this list. Temporary problems, such as a full mailbox or a provider outage, and account or setup problems, such as a paused template or a payment issue, stay in the campaign or playbook report. To investigate them, see [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Open delivery errors

1. Go to **Audience**.
2. Select **Delivery errors**.

You can also select **Review errors** when a campaign or playbook has delivery errors:

- in a campaign's **Partially sent** status tooltip.
- in the **Activity and results** header of a playbook report.

The list opens with that campaign or playbook selected as its source.

Each row is one profile. Repeated failures on the same email address or phone number are grouped, and the row shows the latest reason and its channel. The number of profiles can therefore differ from the failed-message count in a report.

## Search and filter the results

Search by name, or by the email address or phone number that failed. Phone numbers match on their digits, so spaces and symbols don't matter.

In the more-options menu beside the search field, combine:

- **Source:** campaigns, journeys, playbooks, or a specific one.
- **Error type:** **Number unreachable**, **Email bounced**, **Mailbox doesn't exist**, or **Email suppressed**.
- **Channel:** WhatsApp or Email.

Applied filters appear below the search field. Use a filter's close button to remove only that filter. Changing a filter clears the search. Scroll to see more results.

## Understand the reason

| Error type | What it means |
| --- | --- |
| **Number unreachable** | WhatsApp couldn't deliver to this number. The number may not use WhatsApp or can't receive WhatsApp messages. It may still work for SMS. |
| **Email bounced** | The recipient's mail server permanently rejected the email address. |
| **Mailbox doesn't exist** | The recipient's mail server reported that the email address doesn't exist. |
| **Email suppressed** | Email to this address is blocked because it bounced before or the recipient marked an email as spam. |

Before removing a value, check it for a typo or outdated information. The customer may have a newer email address or phone number elsewhere.

## Inspect the profile

Select a row to open the profile. Compare the affected value with the customer's other details and review **Activity** and **Notes**.

A warning appears beside each failed value, in place of its verified mark. Hover over or focus it to see the error reason. In this view, **Activity** also lists each failed message with its destination and reason. List filters don't limit the other details you can inspect in the profile.

## Export the error details

1. Apply the search and filters you need.
2. To export every result, leave the selection empty. To export a subset, select their checkboxes. To also include results that haven't loaded yet, select **Select all N customers**.
3. Open the more-options menu.
4. Select **Export to file** or **Export selected**, as appropriate.

The CSV has one row per profile and failed value: the profile ID and name, channel, contact detail, error type, provider code, latest failure, latest source, all sources, and the number of failures. To download customer properties, use the [profile export]({% link _audience/exporting-data.md %}).

## Remove one or several values

Removing a value removes that email address or phone number from the profile, not the whole profile. Other details and the message history remain. The profile stops using the value on every channel: removing a phone number removes it for both WhatsApp and SMS.

To remove one value:

1. Open the profile and find the failed value.
2. Select the warning beside it. It turns into a trash icon when you hover over or focus it.
3. Review the value in **Remove email address** or **Remove phone number**.
4. Select **Remove**, or **Cancel** to keep it.

When the profile has no errors left in the list you're viewing, you return to the list.

To remove several, select their profiles and choose **Remove from profile (N)**. Review the email and phone counts in **Remove contact details from profiles**, then confirm **Remove N**. A selection is removed right away. After **Select all N customers**, the removal runs in the background and a notification shows its progress.

Removal doesn't resend failed messages or change the customer's consent. If the value came from an import or integration, check whether its source needs correcting, since a later sync can add it back.

Owners, administrators, and managers can remove values. Agents can review the list but can't remove values or export.

## Related guides

- [Understand customer profiles]({% link _audience/customer-profiles.md %})
- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Exporting data]({% link _audience/exporting-data.md %})
- [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
