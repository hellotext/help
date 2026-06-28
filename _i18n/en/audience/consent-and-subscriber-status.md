Use this guide before you send a campaign, publish a playbook, start a route, or import customer profiles.

The goal is to understand whether Hellotext should contact a customer profile, through which channel, and why.

This is product guidance for operating Hellotext. It does not replace legal or compliance review for the countries and channels you use.

## The short version

A customer profile is usually ready to receive a message when:

- The profile has a reachable channel address, such as a phone number or WhatsApp identity.
- The profile is subscribed or otherwise eligible for the channel you plan to use.
- The profile has not opted out of that channel.
- The channel, sender, and message type are ready.
- Quiet hours, frequency limits, and other sending rules allow the message.

If any of those pieces is missing, do not assume the customer profile can receive the message.

## Customer profiles, subscribers, and audiences

A **customer profile** is the record Hellotext uses to understand one customer. It can include identifiers, channel addresses, profile properties, events, purchases, conversations, and subscription status.

A **subscriber** is a customer profile that has opted in to receive messages on a channel.

An **audience** is the group of customer profiles selected for a campaign, playbook, route, or report. An audience can contain profiles that are not eligible for every channel, so always check eligibility before sending.

## Consent is channel-specific

Treat consent as channel-specific.

For example, a customer profile may be subscribed for SMS but not WhatsApp, or may be able to receive a reply in an active conversation but not a new outbound message.

Before sending, ask:

- Which channel will this message use?
- How did this customer profile subscribe to that channel?
- Is the sender or account connected for that channel?
- Does the message type fit the channel rules?
- Can the customer reply, and where will that reply go?

## Common states to review

Exact labels can vary by channel and account setup, but these are the states to reason about before sending.

| State | What it means | What to do |
| --- | --- | --- |
| Subscribed or opted in | The profile can usually receive messages on that channel if other sending rules allow it. | Confirm the message, timing, frequency, and sender. |
| Opted out or unsubscribed | The customer asked not to receive messages on that channel. | Do not include the profile in sends for that channel. |
| Unknown or no consent | Hellotext has a profile or channel address, but no clear opt-in for that channel. | Use a capture or consent path before sending. |
| Invalid or unreachable | The channel address cannot be used reliably. | Fix the data or remove the profile from the launch audience. |
| Duplicate profile | More than one profile may represent the same customer. | Review identity and merge behavior before measuring or sending broadly. |

## Where consent can come from

Consent and subscription status can come from different places depending on your setup:

- QR codes.
- Shareable links.
- Website forms and popups.
- Checkout opt-ins.
- Channel-specific opt-in flows.
- Customer profile imports with consent fields.
- Commerce or custom integrations that sync subscription status.

Capture tools are usually the safest self-serve way to grow a reachable audience because they create a clear subscription path.

## Before importing customer profiles

Imports need extra care because imported data may not have the same context as a capture.

Before importing or sending to imported profiles, confirm:

- Where the customer profiles came from.
- Which channel each profile is eligible for.
- Which field maps to subscription or consent status.
- Whether opted-out profiles are excluded or mapped correctly.
- Whether duplicates should be merged before launch.
- Whether the first send should go to a smaller test segment.

If the consent source is unclear, keep those profiles out of the first send.

## Before sending

Before launching a campaign, playbook, route, or agent, check:

- The selected audience matches the goal.
- The audience has consent for the channel.
- Exclusions remove opted-out, invalid, duplicate, test, or internal profiles.
- The sender and channel are connected.
- The message includes opt-out or unsubscribe copy when needed.
- Replies will reach the Inbox or the expected owner.
- Quiet hours and frequency limits are clear.

For a first launch, start with a small audience and watch replies, opt-outs, failed messages, and reporting before expanding.

## If a customer profile cannot be messaged

If a customer profile is not eligible, use a safer path:

- Ask the customer to subscribe through a capture.
- Send from a channel where the customer is already eligible.
- Fix invalid or duplicated profile data.
- Wait until the customer starts a conversation if the channel allows replies only in certain windows.
- Exclude the profile from the send.

Do not override an opt-out just to make a campaign, playbook, or route larger.

## Related guides

- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Create and manage lists]({% link _audience/lists.md %})
- [Build segments]({% link _audience/segments.md %})
