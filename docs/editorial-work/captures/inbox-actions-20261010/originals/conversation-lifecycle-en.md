Use the conversation lifecycle to understand whether a customer needs action now, who owns the next response, and whether the conversation is waiting, paused, or complete.

A conversation state describes where the conversation sits in the workflow. Signals such as **Needs attention** or **Mentioned** help teammates prioritize work, but they do not replace the underlying state.

## How a conversation enters the Inbox

A conversation can appear when:

- A customer sends a message through WhatsApp, SMS, Webchat, Instagram, Messenger, or another connected incoming channel.
- A customer replies to a message from a campaign, playbook, or route.
- A playbook or AI agent escalates the conversation to a teammate or team.
- A journey Assignment step opens or assigns the conversation.
- New customer, order, or business activity creates work that needs attention.
- A closed or snoozed conversation receives activity that reopens it.

The conversation timeline keeps customer messages, team replies, automation activity, assignments, notes, labels, closes, and reopens together so the next person can understand what happened.

## Understand the main states

### Open

**Open** is the working set for conversations that are currently assigned or unassigned. It is an aggregate view, not a separate ownership state.

Use Open when you want to see the active conversations your team may need to handle.

### Unassigned

An unassigned conversation is open but does not yet have a specific teammate responsible for the next action.

It may be available for someone to claim, or it may be waiting for an eligible member of a team selected by a routing or escalation rule. When a target team is at capacity, Hellotext can keep the conversation unassigned while preserving that team as the intended destination.

Do not assume every unassigned conversation is available to every teammate. Check whether it came through a team handoff before taking ownership.

### Assigned

An assigned conversation has a clear owner for the next action. Teammates can assign a conversation to themselves or reassign it when another person should continue.

Replying to an unassigned conversation normally assigns it to the teammate who sends the reply, as long as the conversation is available for that person to claim.

Keep reading: [Assign conversations]({% link _team/assigning-conversations.md %}).

### Reminders

Use **Snooze** when the conversation does not need action now but should return later. Hellotext offers common reminder times such as one hour, four hours, tomorrow, or a custom date and time.

Snoozed conversations appear under **Reminders** instead of the active Open list. When the reminder is due, the conversation returns to its previous owner when that assignment is still valid; otherwise, it returns unassigned. New customer activity can also bring it back before the reminder time.

Snooze work that is genuinely waiting. Close work that is complete.

### Closed

Close a conversation when no further team action is required. Closing removes it from the active working set and clears active attention, but it does not delete the conversation or its timeline.

Closed conversations remain available through the **Closed** filter. A teammate can reopen one manually. Customer replies or new activity can also reopen it and apply the business's current conversation ownership rules.

When a teammate manually reopens a conversation, Hellotext keeps the previous assignee when that teammate is still available to the business. Otherwise, the conversation returns unassigned.

## Attention and mention signals

### Needs attention

**Needs attention** is a prioritization signal, not a lifecycle state. It can apply to an assigned or unassigned conversation when the customer or workflow is waiting for action.

Use this filter to find work that should be reviewed before lower-priority open conversations. Closing the conversation clears active attention because the work is no longer considered actionable.

Response health indicators can add more context about how long the customer has been waiting. Keep reading: [Response times and response rules]({% link _team/understanding-response-times.md %}).

### Mentioned

The **Mentioned** filter helps teammates find conversations where they were mentioned in an internal note or another supported collaboration event.

A mention draws attention to the conversation. It does not assign ownership by itself, so confirm who should send the next customer-facing reply.

## Use notes and labels without changing ownership

Add an internal note when teammates need context that should not be sent to the customer. Notes can document a decision, summarize an offline action, or mention another teammate.

Notes do not count as customer-facing replies and do not satisfy a response timer. Assign the conversation as well when the mentioned person should take ownership.

Use labels to organize conversations by a durable operational category, such as a product issue, sales opportunity, refund review, or follow-up type. Labels make it easier to filter related conversations without changing their state or owner.

## Filter the Inbox deliberately

The Inbox provides state filters for:

- **Open**
- **Needs attention**
- **Assigned**
- **Unassigned**
- **Closed**
- **Reminders**
- **Mentioned**

You can narrow compatible views by teammate and label. The meaning of a filter stays separate from ownership: for example, a conversation can be both assigned and in need of attention.

For the exact meaning of each combination and how search behaves inside it, read [Filter and search conversations in Inbox]({% link _team/filter-and-search-inbox.md %}).

Use a simple daily order:

1. Review Needs attention.
2. Claim or route unassigned work.
3. Continue conversations assigned to you.
4. Check mentions that need context or a decision.
5. Close completed conversations.
6. Use reminders only for work that should return at a specific time.

## How automation affects the lifecycle

Playbooks, AI agents, and journeys can open, assign, close, or return conversations to the Inbox.

When automation hands off to a team:

- The target team may provide an eligible teammate immediately.
- If nobody in that team has capacity, the conversation can remain unassigned while waiting for that team.
- The handoff should include enough context for a person to continue without asking the customer to repeat the conversation.
- Closing a conversation indicates that the active work is complete, even when an AI agent handled part of it first.

Keep reading: [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Related guides

- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Filter and search conversations in Inbox]({% link _team/filter-and-search-inbox.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Teams and Inbox capacity]({% link _team/teams-and-inbox-capacity.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Team roles and permissions]({% link _team/understanding-team-roles.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
