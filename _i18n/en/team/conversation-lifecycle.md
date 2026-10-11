Use the conversation lifecycle to understand whether a customer needs action now, who owns the next response, and whether the conversation is waiting, paused, or complete.

A conversation state describes where the conversation sits in the workflow. Signals such as **Needs attention** or **Mentioned** help teammates prioritize work, but they do not replace the underlying state.

## How a conversation enters the Inbox

A conversation can appear when:

- A customer sends a message through WhatsApp, SMS, Webchat, Instagram, Messenger, or another connected incoming channel.
- A customer replies to a message from a campaign, playbook, or route.
- A playbook or AI agent escalates the conversation to a teammate or team.
- A journey Assignment step runs an action to open the conversation. Assigning an owner from that step does not always open it.
- An automation opens or escalates a conversation to handle customer, order, or business activity.
- A closed or snoozed conversation receives activity that reopens it.

The timeline keeps customer messages, team replies, and recorded changes, such as assignments, notes, labels, and closes, together so the next person can understand what happened.

## Understand the main states

### Open

**Open** is the working set for conversations that are currently assigned or unassigned. It is an aggregate view, not a separate ownership state.

Use Open when you want to see the active conversations your team may need to handle.

### Unassigned

An unassigned conversation is open but does not yet have a specific teammate responsible for the next action.

It may be available for someone to claim, or it may be waiting for an eligible member of a team selected by a routing or escalation rule. When a target team is at capacity, Hellotext can keep the conversation unassigned while preserving that team as the intended destination.

Do not assume every unassigned conversation is available to every teammate. Check whether it came through a team handoff before taking ownership.

### Assigned

The **Assigned** filter contains conversations with an owner for the next action, who can be a teammate or an AI agent. Teammates can assign a conversation to themselves or reassign it when another person should continue.

When an Inbox reply is recorded, an unassigned conversation can be assigned to the teammate who replies. If it is waiting for a specific team, this automatic assignment requires membership of that team. Recording the reply does not confirm that the customer has received it.

Keep reading: [Assign conversations]({% link _team/assigning-conversations.md %}).

### Reminders

Use **Snooze** when the conversation does not need action now but should return later. Open **Actions** and choose **Snooze** to select **1 Hour**, **4 Hours**, **Until tomorrow**, or **Custom**.

<!-- inbox-actions:snooze-options:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="snooze-options" aria-label="Choose when to return to the conversation">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/snooze-options-en-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/snooze-options-en-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/snooze-options-en-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Open Snooze menu in an Inbox conversation, showing the available time options." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data. Options for snoozing a conversation before confirming the reminder.</figcaption>
</figure>
<!-- inbox-actions:snooze-options:end -->

To choose another time, select **Custom**, set the date and time, and confirm with **Snooze**.

<!-- conversation-lifecycle:custom-reminder:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="custom-reminder" aria-label="Choose a custom reminder">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 516px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/custom-reminder-en-mobile-540.png 4x" width="1992" height="1016" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/custom-reminder-en-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/custom-reminder-en-desktop.png 4x" width="1992" height="1032" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Snooze conversation dialog with date and time fields and the Snooze button." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data. A date and time have been selected; this reminder has not been saved.</figcaption>
</figure>
<!-- conversation-lifecycle:custom-reminder:end -->

Snoozed conversations appear under **Reminders** instead of the active Open list. When the scheduled reminder is processed, the conversation returns to its retained human assignee if that person still belongs to the business; otherwise, it returns unassigned. New customer activity can also bring it back before the reminder time.

<!-- inbox-actions:snoozed-result:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="snoozed-result" aria-label="Check the snoozed conversation">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/snoozed-result-en-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/snoozed-result-en-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/snoozed-result-en-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Snoozed Inbox conversation with Reopen and the snooze record visible." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data after snoozing a conversation.</figcaption>
</figure>
<!-- inbox-actions:snoozed-result:end -->

Snooze work that is genuinely waiting. Close work that is complete.

### Closed

Close a conversation when no further team action is required. Select **Complete** in the header when that control is shown. Closing removes it from the active working set and clears active attention, but it does not delete the conversation or its timeline.

<!-- inbox-actions:closed-result:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="closed-result" aria-label="Check the closed conversation">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/closed-result-en-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/closed-result-en-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/closed-result-en-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Closed Inbox conversation with Reopen and the closure record visible." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data after closing a conversation.</figcaption>
</figure>
<!-- inbox-actions:closed-result:end -->

Closed conversations remain available through the **Closed** filter. A teammate can reopen one manually. Customer replies or new activity can also reopen it and apply the business's current conversation ownership rules.

When you manually reopen a conversation, Hellotext keeps the human assignee still attached to it. If there is none, it returns unassigned. Check the assignee before continuing.

<!-- inbox-actions:reopened-result:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="reopened-result" aria-label="Check the reopened conversation">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/reopened-result-en-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/reopened-result-en-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/reopened-result-en-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Reopened Inbox conversation with its human assignee and active controls visible." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data after manually reopening a closed conversation.</figcaption>
</figure>
<!-- inbox-actions:reopened-result:end -->

## Attention and mention signals

### Needs attention

**Needs attention** is a prioritization signal, not a lifecycle state. It can apply to an assigned or unassigned conversation when the customer or workflow is waiting for action.

Use this filter to find work that should be reviewed before lower-priority open conversations. Closing the conversation clears active attention because the work is no longer considered actionable.

Response health indicators can add more context about how long the customer has been waiting. Keep reading: [Response times and response rules]({% link _team/understanding-response-times.md %}).

### Mentioned

The **Mentioned** filter shows conversations with mentions in internal notes. Use the teammate filter to choose whose mentions to review.

A mention draws attention to the conversation. It does not assign ownership by itself, so confirm who should send the next customer-facing reply.

<!-- conversation-lifecycle:mentioned-context:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="mentioned-context" aria-label="Recognize a mention without changing ownership">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 805px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/mentioned-context-en-mobile.png 4x" width="1560" height="2192" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/mentioned-context-en-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/mentioned-context-en-desktop.png 4x" width="3148" height="2704" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="An internal note with a mention in an Inbox conversation." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data prepared before capture. The note and mention already exist; the conversation owner is retained.</figcaption>
</figure>
<!-- conversation-lifecycle:mentioned-context:end -->

## Use notes and labels without changing ownership

Add an internal note when teammates need context that should not be sent to the customer. Notes can document a decision, summarize an offline action, or mention another teammate.

Select **Add private note** in the editor toolbar. Type `@` and choose the teammate you want to mention.

<!-- conversation-lifecycle:note-mention-draft:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="note-mention-draft" aria-label="Write an internal note with a mention">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 805px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/note-mention-draft-en-mobile.png 4x" width="1560" height="1248" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/note-mention-draft-en-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/note-mention-draft-en-desktop.png 4x" width="3148" height="1220" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Private-note draft with the teammate picker for adding a mention." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data. An internal-note draft and mention picker; the note has not been saved.</figcaption>
</figure>
<!-- conversation-lifecycle:note-mention-draft:end -->

Notes do not count as customer-facing replies and do not satisfy a response timer. Assign the conversation as well when the mentioned person should take ownership.

Use labels to organize conversations by a durable operational category, such as a product issue, sales opportunity, refund review, or follow-up type. Labels make it easier to filter related conversations without changing their state or owner.

Open **Actions** and select **Labels** to review the conversation’s labels.

<!-- conversation-lifecycle:conversation-labels:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="conversation-labels" aria-label="Review the conversation labels">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 483px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/conversation-labels-en-mobile.png 4x" width="1560" height="2008" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/conversation-labels-en-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/conversation-labels-en-desktop.png 4x" width="1860" height="1656" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="A conversation’s Labels menu with a selected label." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data. The label was applied before capture; no option in this menu was changed.</figcaption>
</figure>
<!-- conversation-lifecycle:conversation-labels:end -->

## Filter the Inbox deliberately

The Inbox provides filters for:

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
