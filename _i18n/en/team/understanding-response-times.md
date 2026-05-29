Response times help your team understand how quickly customers receive replies and which conversations need attention first.

Response rules define the targets Hellotext uses to decide whether a customer wait is on track, at risk, delayed, or overdue.

> Response rules are available on Pro and Enterprise plans.

## What response rules do

A response rule sets two targets:

- First response to new conversations: the maximum time to respond to the first customer message in a new conversation.
- Subsequent replies: the maximum time to respond after the customer sends a new message in a conversation that is already active.

Hellotext uses these targets to show response health in conversations, teams, teammates, and reports.

## How response timers work

When a customer sends a message that requires attention, Hellotext starts a response timer.

If the conversation has not received a team reply yet, the timer uses the First response to new conversations target. After your team has replied once, future customer messages use the Subsequent replies target.

If a customer sends multiple messages before your team replies, the timer does not restart. Those messages are treated as part of the same customer wait.

When your team sends a customer-facing reply, Hellotext records the response. If the reply happens before the deadline, the conversation stays within the expected response time. If the reply happens after the deadline, the response is still recorded, but the response target is considered missed.

Internal notes, drafts, campaigns, and system-only activity do not count as responses.

## Business hours

Response deadlines use your configured Business hours.

If a customer writes during open hours, the timer starts immediately. If a customer writes while your business is closed, the timer starts when the business opens again.

If a deadline crosses a closed period, the remaining time continues counting when the business opens again.

## Default policy and channel rules

Every business has a Default response policy. This policy applies when there is no more specific rule for the conversation's channel.

On Pro and Enterprise plans, you can create response rules for specific channels such as WhatsApp, SMS, Webchat, Instagram, or Messenger. When a channel-specific rule exists, Hellotext uses that rule for conversations on that channel. Otherwise, it uses the Default response policy.

Changes to a response rule apply to new response timers. Conversations that already have an active timer keep the deadline that was created when the timer started.

## What teammates see in conversations

In the conversation list, Hellotext may show response status pills to help teammates prioritize their work.

The possible response statuses are:

- Response at risk: the conversation is close to missing its response target.
- Response delayed: the response target has passed and the customer is still waiting.
- Response overdue: the wait has remained unresolved after missing the expected response time and needs urgent attention.

These indicators help teammates prioritize the conversations that need the fastest action.

## What supervisors see in teams and teammates

In team and teammate views, Hellotext shows response health indicators when the feature is available.

The possible response health statuses are:

- Response on track
- Response at risk
- Response delayed
- Response overdue

For teams, Hellotext considers conversations currently assigned to that team or pending assignment to that team. For teammates, Hellotext considers conversations assigned to each person.

These statuses do not create separate response rules for each team or teammate. Response rules are configured globally or by channel. Team and teammate views show how those rules are performing operationally.

## Reports

In reports, supervisors can review operational pressure by teammate or by team.

The Operational Pressure report shows information such as unanswered conversations, oldest wait, response risk, utilization, concurrency, and burn.

The response risk statuses are:

- Safe
- At risk
- Imminent

This helps supervisors detect when a team or teammate is accumulating conversations that could affect response times.

## How to configure response rules

1. Go to Settings.
2. Open Team.
3. Select Response times.
4. Open the Response rules tab.
5. Edit the Default response policy, or create a channel-specific response rule.
6. Set First response to new conversations.
7. Set Subsequent replies.
8. Save your changes.

To configure when time should count, use the Business hours tab in the same section.

## Plan requirements

Response rules require a Pro or Enterprise plan.

If your business is not on a supported plan, you can open the Response times page, but response rules are not active. You will see an upgrade button instead of the create button.

Without Pro or Enterprise, response health indicators are hidden from conversations, teams, and teammates.

## Best practices

Use the Default response policy as the normal company-wide expectation.

Create channel-specific rules when some channels need faster or slower response times. For example, you may want WhatsApp conversations answered faster than email-like channels.

Keep Business hours accurate so response times reflect when your team is actually available.

Review conversations, teams, teammates, and reports regularly to detect delays before they affect the customer experience.
