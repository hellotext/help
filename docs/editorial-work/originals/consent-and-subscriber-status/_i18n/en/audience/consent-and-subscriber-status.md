Use this guide before importing customer profiles or sending a campaign, playbook, or journey. It explains how subscription state and channel reachability work together in Hellotext.

This is product guidance for operating Hellotext. It does not replace legal or compliance review for the countries and channels you use.

## Three questions to check before sending

Hellotext evaluates more than one condition before it can contact a customer:

1. **What is the customer profile's subscription state?** Hellotext records whether the profile is subscribed, unconfirmed, or unsubscribed.
2. **Is there a usable destination?** A phone number, WhatsApp identity, or email can have its own opt-out or reachability condition.
3. **Can the selected channel deliver this message?** SMS and WhatsApp apply different destination, sender, template, and conversation rules.

A subscribed profile is not necessarily reachable through every channel. A reachable phone number is not, by itself, proof of marketing consent.

## Customer profiles, subscribers, and audiences

A **customer profile** is Hellotext's record for one customer. It can include identifiers, properties, events, purchases, conversations, and a subscription state.

A **subscriber** is a customer profile with a recorded subscription. This state does not guarantee that every identifier on the profile is valid or reachable.

An **audience** is the group selected for a campaign, playbook, journey, or report. Audience membership and list membership do not grant consent.

## Subscription states

Hellotext stores one of these subscription states on the customer profile:

| State | What it means | How to use it |
| --- | --- | --- |
| **Subscribed** | Hellotext has recorded a subscription for the profile. | Confirm that the intended destination and channel are reachable before sending. |
| **Unconfirmed** | Hellotext has no confirmed subscription for the profile. | Do not treat this state as evidence of marketing consent. Confirm the source or use a valid capture path. |
| **Unsubscribed** | Hellotext has recorded that the customer opted out. | Do not include the profile in marketing sends or restore the subscription without a new valid opt-in. |

These are different from profile or data conditions such as blocked, deleted, duplicated, invalid, or unreachable. Those conditions can also prevent contact, but they are not subscription states.

## Profile state and destination consent

The customer profile displays a general subscription state. When Hellotext records a subscription or opt-out, it also associates that decision with the identifiers currently used to contact the customer and records its origin.

At send time, Hellotext checks the destination for the selected channel. For example, it can reject a phone number that is opted out, invalid for SMS, or unavailable on WhatsApp even when the profile itself is subscribed.

This distinction explains why:

- A subscribed profile may still be unreachable on the selected channel.
- A profile with several identifiers may have only some usable destinations.
- An unconfirmed profile may exist in an audience without proving that it can receive marketing messages.
- A reply in an active conversation can follow different channel rules from a new outbound marketing message.

## Where subscription information comes from

Hellotext can record or update subscription information through:

- Capture playbooks such as website forms, popups, QR codes, and shareable links.
- Checkout or other opt-in actions synced by an integration.
- An integration that supplies the source platform's subscription state.
- A file import where you explicitly choose **Subscribed** or **Unconfirmed** for the imported group.
- A customer opt-in or opt-out action.
- A manual change by an authorized team member when the business has evidence for it.

For integrations, the source platform determines which states are available and how they map to Hellotext. For file imports, the selected state applies to the complete import, so split files when consent differs between rows.

## Reachability is not consent

A profile can be unreachable because its phone number is invalid, is a landline, cannot receive the selected channel, or has an identifier-level opt-out. Fixing reachability does not create consent.

Likewise, having a valid phone number or WhatsApp identity does not turn an unconfirmed profile into a subscriber. Keep consent evidence and destination quality as separate checks.

## Before sending

Before launching a campaign or enabling a playbook that can send outbound messages:

- Confirm how the audience was created and where its subscription information came from.
- Exclude unsubscribed, test, internal, invalid, and duplicated records as appropriate.
- Check that the sender and intended channel are connected.
- Test a small audience and verify successful delivery, replies, opt-outs, and reporting.
- Make sure the Inbox or expected team can receive replies.

Do not override an opt-out to increase an audience. If consent is unknown, use a capture or another valid opt-in path before treating the customer as subscribed.

## Related guides

- [Customer profiles]({% link _audience/customer-profiles.md %})
- [Import customer profiles]({% link _audience/import-customer-profiles.md %})
- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Lists vs. segments]({% link _audience/lists-and-segments.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
