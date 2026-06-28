Use this checklist after your core setup is ready and before customers receive your first live messages.

It applies to campaigns, playbooks, routes, capture follow-ups, and AI agents that can send messages or hand conversations to your team.

This is an operational readiness checklist. It does not replace legal or compliance review for the countries and channels you use.

## 1. Confirm who can receive the message

Start with the audience before you review the message.

Confirm that:

- The audience is made from customer profiles you can identify.
- Each customer profile has consent for the channel you plan to use.
- Opted-out, invalid, duplicate, test, or internal customer profiles are excluded.
- Imported customer profiles have a clear source, import date, and consent mapping.
- The channel matches how the customer subscribed.

If you are not sure whether a customer profile is eligible, do not include it in the first launch.

## 2. Check the channel and sender

Make sure the channel can actually deliver the experience you are about to launch.

Before sending, confirm that:

- WhatsApp, SMS, webchat, or the channel you are using is connected.
- The sender or business identity looks correct to the customer.
- Required templates are imported, approved, and still match the message.
- Replies land in the Inbox or in the expected handoff path.
- Your team knows which channel the customer will see and reply through.

If a channel needs templates, approvals, or special sender setup, do not leave that review until the send moment.

## 3. Review timing and frequency

Good messages can still feel wrong if they arrive at the wrong time or too often.

Before launch, check:

- The send time is reasonable for the audience's local time.
- Quiet hours and business-hour expectations are clear.
- Route waits or playbook delays will not push messages into a bad time window.
- The same customer will not receive overlapping playbooks, routes, and campaigns.
- Frequency limits are configured or the launch audience is small enough to control manually.

For a first launch, keep the surface area small. One live workflow is easier to understand than several competing sends.

## 4. Review the message and brand voice

Read the message as if you were the customer receiving it.

Confirm that:

- The brand is clear.
- The reason for the message is obvious.
- The call to action is simple.
- The tone matches how your team wants to sound.
- Opt-out or unsubscribe copy is present when needed.
- Personalization variables have safe fallback values.
- Links open correctly and are trackable.
- Offers, prices, product names, dates, and policies are accurate.

For AI agents or AI playbooks, also review the prompt, allowed actions, escalation rules, and what the agent should not say.

## 5. Test the full customer path

Do not only preview the text.

Test the path with your own number and a few teammates:

1. Enter or select a test customer profile.
2. Trigger the playbook, route, campaign, capture, or agent.
3. Receive the message on the real channel.
4. Click every link.
5. Reply as a customer.
6. Confirm the conversation reaches the Inbox or the expected owner.
7. Check that reporting, clicks, and attribution are visible where expected.

If the test needs a real purchase, cart, or event, use a safe test order or a clearly marked internal customer profile.

## 6. Assign live owners

Before the launch, decide who is watching.

Confirm:

- Who owns the Inbox during and after launch.
- Who answers customer replies.
- Who can pause the campaign, route, playbook, or agent.
- Who handles setup, tracking, or channel issues.
- How fast the team should respond if customers reply.

If nobody owns the first hour after launch, delay the launch.

## 7. Know when to pause

Decide pause conditions before customers start receiving messages.

Pause and review if you see:

- The wrong audience receiving messages.
- A broken link, wrong offer, or wrong product.
- Unexpected opt-outs, complaints, or negative replies.
- A template, sender, or channel error.
- Too many failed messages.
- A support spike your team cannot handle.
- Reporting or tracking that does not match the expected flow.

Pausing early is better than letting a preventable issue reach more customers.

## Related guides

- [Launch checklist]({% link _getting-started/launch-checklist.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Campaigns and broadcasts overview]({% link _campaigns/campaigns-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %})
