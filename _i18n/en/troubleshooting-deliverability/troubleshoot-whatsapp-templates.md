Use this guide when a campaign, route, playbook, or reply cannot send through WhatsApp because its template is under review, was rejected, lost quality, or is no longer available in Meta.

Templates make it possible to initiate WhatsApp messages outside the 24-hour customer service window. Hellotext prepares and synchronizes the content, but Meta controls each template's final approval, category, quality, and availability.

## First identify the state

Open the affected campaign, route, or template and review its WhatsApp state. You can also go to **Settings → Templates** to find it and inspect its change history.

The most important states are:

- **Meta review:** Meta has not decided on that version yet.
- **Active or approved:** the version can be used to send.
- **Rejected by Meta:** that version cannot be used until it is corrected and resubmitted.
- **Flagged by Meta:** quality has declined and the template risks being paused or disabled.
- **Paused by Meta:** the template cannot be used temporarily.
- **Disabled:** Meta no longer allows that template to be used.
- **Requires your attention:** an imported template contains parameters that Hellotext could not convert into customer properties.

Do not confuse the campaign state with the template state. A campaign can be scheduled while still waiting for approval of its WhatsApp content.

## The template is under review

Meta reviews new templates and some changes. Approval time can vary, so leave room for review before an important campaign.

While an edit is pending:

- if an approved version already exists, messages can continue using that active version;
- if the template is new and has no approved version, messages that require it must wait; and
- the new version becomes active automatically when Meta approves it.

Do not make repeated changes while Meta is reviewing the same version. Check the preview, category, links, buttons, and examples first, then group corrections before resubmitting.

## The template was rejected

Open the template and review the WhatsApp feedback. Correct the stated reason before saving it again for approval.

Check especially that:

- the message has a clear purpose and matches its category;
- the content cannot be interpreted as abusive, deceptive, or a scam;
- a utility template describes an expected interaction or update and does not hide a promotion;
- the text does not start or end with a personalization tag;
- properties and examples produce a complete, understandable sentence;
- links and buttons match what the message promises; and
- the business and reason for contact are recognizable to the customer.

An existing WhatsApp template cannot be renamed. If you need a different name or substantially different purpose, create a new template.

Saving the correction submits it to Meta again. Do not schedule the send until the new version appears as approved.

## Meta changed the category

Meta can reclassify a template when it determines that the content belongs to another category. This can change how the message is used and charged.

Review the notice in Hellotext. You can:

- edit the content so it clearly matches the intended category and resubmit it; or
- appeal the change in Meta when you believe the classification is incorrect.

The category of an approved template cannot be changed directly in Hellotext. When you need another category, you generally need to create a new template or follow Meta's appeal process.

## The template is flagged or lost quality

Meta evaluates signals such as blocks, reports, and read rates. A flagged template may remain available, but it risks being paused or disabled.

Before using it broadly again:

- confirm that the audience expects the message;
- reduce repetitive or irrelevant sends;
- make it clear who is writing and why;
- check that frequency and timing make sense; and
- use more specific segmentation when the content does not apply to everyone.

Changing a few words does not correct the wrong audience. Review content, consent, and the reason for sending together.

## The template is paused or disabled

A paused or disabled template should not be used for new sends.

- If it is **paused**, review quality and wait for the recovery indicated by Meta before reactivating it.
- If it is **disabled**, use another approved template or create a suitable new version.
- If a message already failed for this reason and Hellotext offers another eligible channel, you can choose it when content and consent are compatible.

Do not repeatedly retry the same template while it retains that state. Retrying does not change Meta's decision.

## The template was deleted or is missing in Meta

A template can exist in Hellotext but have been deleted or become unavailable in the connected WhatsApp account.

Confirm that:

- the business is still connected to the correct WhatsApp account;
- the number and WhatsApp Business account remain active;
- the template exists in Meta for that number, language, and name; and
- it was not deleted by another user or integration.

When Hellotext indicates that Meta no longer has the approved template, confirm whether it was deleted before resubmitting it. If the approved template was deleted, select another active template, create a new template with a different name, or wait 30 days before reusing the deleted name. Otherwise, save the changes to submit it for approval again.

## Imported parameters require attention

A template imported from WhatsApp can contain variables that Hellotext cannot automatically associate with customer properties.

Edit the template and replace each parameter with a compatible property or fixed content. Use the preview to confirm that every value produces an understandable result before saving.

Changes to how variables are completed inside Hellotext do not always require another Meta review when the approved template content does not change. The state shown in Hellotext indicates whether that version returned to review.

## A campaign is still waiting

If the campaign uses WhatsApp:

1. Open the campaign and confirm whether it is **Under review**, **WhatsApp review**, **Scheduled**, or rejected.
2. Open the associated template and review its state and feedback.
3. Correct the content only if it was rejected or requires attention.
4. Confirm that the scheduled date is still valid after approval.
5. Send a test when the template is active.

A WhatsApp test with new content can also wait until Meta approves the template. The test does not bypass review.

## What to include when asking for help

Include:

- affected business and WhatsApp number;
- template name and link;
- campaign, route, or playbook that is trying to use it;
- language and category;
- exact state and feedback from Meta;
- time of the latest change; and
- screenshot of the preview and notice.

Do not include tokens, passwords, or Meta payment information.

## Related guides

- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Who can you message?]({% link _audience/consent-and-subscriber-status.md %})
