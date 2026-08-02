Use this guide when a customer asks your business to access, correct, export, restrict, or delete personal data connected to their Hellotext profile.

This is operational product guidance, not legal advice. Applicable rights, exceptions, verification requirements, and response deadlines depend on your jurisdiction and relationship with the customer. Follow your organization's privacy process and consult its legal or privacy owner when needed.

## Understand who handles the request

For customer data your business sends to or collects through Hellotext, your business generally decides why and how that data is processed. Hellotext processes it to provide the service under your instructions.

This means your business should receive, verify, decide, and respond to requests from its customers. Hellotext can assist with data stored in the service, but it does not replace your business as the owner of the response. If a customer sends a request directly to Hellotext about data controlled by your business, Hellotext may refer it to your business for handling.

Review the [Hellotext Data Protection Agreement](https://www.hellotext.com/data-protection) and your own privacy policy before defining the process.

## Classify the request

Do not treat every privacy request as profile deletion. First identify what the customer is asking for:

| Request | Typical product action |
| --- | --- |
| **Access or portability** | Locate the correct profile and export the available profile data. Coordinate with Hellotext when the request covers data outside that CSV. |
| **Correction or update** | Edit the profile and correct the authoritative connected source. |
| **Objection or marketing opt-out** | Unsubscribe the customer and review the applicable channel destinations. |
| **Deletion or erasure** | Remove the profile from Hellotext, review connected systems, and coordinate any broader erasure or retention requirements. |
| **Restriction** | Escalate to your privacy owner to determine which processing must pause and how that instruction should be applied across systems. |

One request can include several of these rights. Record the original wording instead of reducing it to the first available button.

## Verify the requester before acting

Before showing, changing, or deleting personal data:

1. Record when the request arrived and which right the customer is exercising.
2. Verify the requester's identity using your organization's approved process.
3. Ask only for the additional information needed to locate and verify the customer.
4. Do not disclose whether a profile exists or expose profile data before verification is complete.
5. Record the applicable response deadline and the person responsible for the request.

Avoid asking the customer to send passwords, full payment details, or unnecessary identity documents. Store request records in an approved location with limited access.

## Find every relevant profile

Search **Audience** using the verified identifiers provided by the customer, such as phone number, email, or another unique property.

Before acting:

- Open the profile and compare its identifiers with the verified request.
- Review duplicate suggestions and search alternate phone numbers or emails supplied by the customer.
- Check whether separate profiles exist for different channels or connected stores.
- Record the Hellotext profile ID for each confirmed match.
- Identify the integration, import, capture, API, or manual process that created and updates the data.

Do not merge possible duplicates only to simplify the request. Confirm that they belong to the same person first.

## Handle an access or portability request

The profile export can be a useful starting point for the data currently available in Audience:

1. Select the confirmed customer profile in **Audience**.
2. Open the more-options menu in the search bar.
3. Select **Export selected**.
4. Protect the downloaded CSV and review it before delivering anything to the customer.

The profile CSV includes current profile identifiers and exportable business properties, but it is not a complete privacy-request package. It does not include the full event, message, conversation, order, attribution, or internal audit history.

Determine which categories of data and contextual information your applicable process requires. If the request covers data that is not available through the profile export, contact [privacy@hellotext.com](mailto:privacy@hellotext.com) with the business and profile IDs, request type, verified scope, and required completion date. Do not include unnecessary personal data in the email.

Send the response through your organization's approved secure channel. See [Exporting data]({% link _audience/exporting-data.md %}) for the CSV contents and operational export steps.

## Handle a correction request

Correct the data in Hellotext only after confirming the intended value.

- Edit names and profile properties from the customer profile.
- Add, update, or remove the applicable phone number, email, address, or custom property.
- Correct the source system when a store, CRM, import, API, or other integration is authoritative; otherwise it can overwrite the change or recreate the old value.
- Review segments, personalization, playbooks, and journeys that depend on the corrected property.
- Confirm that the corrected value now appears on the intended profile.

If an incorrect event, order, message, or integration-owned record cannot be corrected from the profile, coordinate the change with the system that created it and Hellotext when necessary.

## Handle an opt-out or objection

If the customer asks to stop receiving marketing, use the subscription action on the profile to mark them as **Unsubscribed**. Review the destinations and channels involved, especially when the profile has several phone numbers, emails, or channel identities.

Unsubscribing is different from deleting:

- **Unsubscribe** records the opt-out while preserving the profile and its history.
- **Block** is an operational control for stopping interactions with a destination or customer; it is not a substitute for recording a marketing opt-out or completing an erasure request.
- **Delete profile** removes the profile from active use and clears specific profile data, but broader privacy work may still be required.

Do not restore a subscription unless the customer provides a new valid opt-in. See [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}) for channel and destination considerations.

## Remove a customer profile

Profile deletion is limited to authorized roles such as owners, administrators, and managers.

1. Go to **Audience** and open the verified customer profile.
2. Open the options menu in the profile header.
3. Select **Delete**.
4. Review the consequences in the confirmation dialog and select **Remove**.

Removing the profile:

- removes its current properties;
- removes it from lists and segments;
- expires its identifiers for active use;
- marks the profile as deleted and unsubscribed; and
- removes it from the active Audience index.

Treat this action as irreversible from the regular interface. Export or record only the information your approved process requires before performing it.

## Profile removal is not the whole erasure process

The **Delete** action does not remove data from a connected store, CRM, advertising platform, previously downloaded CSV, or another system controlled by your business. A connected source can also send the customer back to Hellotext after removal.

Some message, transaction, attribution, security, billing, or audit records may require separate handling or lawful retention and are not represented by the active profile fields removed through the interface.

For a formal erasure request:

1. Complete the required action in each connected source and destination.
2. Stop or adjust integrations that would recreate data contrary to the approved request.
3. Review duplicate profiles and exported copies controlled by your business.
4. Ask your privacy or legal owner whether any data must be retained and how its processing should be restricted.
5. Contact [privacy@hellotext.com](mailto:privacy@hellotext.com) when Hellotext assistance is required for data outside the self-service profile action.

Do not promise that every record will be erased before confirming the applicable scope and retention requirements.

## Close and document the request

Before marking the request complete:

- Confirm that every verified profile and connected system in scope was addressed.
- Record the actions performed, systems checked, date completed, and person responsible.
- Document any data retained, the reason approved by your privacy owner, and any restrictions applied.
- Respond through the same verified process or another approved secure channel.
- Keep request evidence only for the period required by your organization's policy.

A security incident or suspected unauthorized access is a different workflow. Report it immediately through your organization's incident process and notify [privacy@hellotext.com](mailto:privacy@hellotext.com) when Hellotext data or services may be affected.

## Related guides

- [Understand customer profiles]({% link _audience/customer-profiles.md %})
- [Exporting data]({% link _audience/exporting-data.md %})
- [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Understand team roles]({% link _team/understanding-team-roles.md %})
- [Hellotext Privacy Policy](https://www.hellotext.com/privacy)
- [Hellotext Data Protection Agreement](https://www.hellotext.com/data-protection)
