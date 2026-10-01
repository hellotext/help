Teams organize the people who can receive conversations for an operational purpose such as Sales, Support, or Returns. Inbox capacity helps Hellotext distribute active work among the eligible members of the target team.

Roles remain separate: a role controls what a teammate can see and do, while team membership and capacity control conversation routing.

## Create a team

Create teams around real ownership boundaries. A team should describe who can take responsibility for a type of conversation, not only who reports to the same manager.

1. Open **Settings** and go to **Your Team**.
2. Open the **Teams** tab.
3. Select **New team**.
4. Enter a clear name such as Sales, Support, or Returns.
5. Add the teammates who can handle conversations for that team.
6. Set **Max concurrent conversations**.
7. Set **Active teammate handling hours per day**.
8. Save the team.

A teammate can belong to more than one team. Hellotext uses the team selected by the playbook, journey, or routing rule as the context for that assignment.

## Understand the two team capacity settings

### Max concurrent conversations

This is the maximum number of active conversations each eligible teammate can handle at the same time through automatic team routing.

Capacity is based on assigned conversations that still need the teammate's attention. It is not a count of every historical conversation or every conversation that appears in the Inbox.

### Active teammate handling hours per day

This is the time each teammate is expected to spend actively managing Inbox conversations, excluding breaks and meetings.

Hellotext uses this value for workload and capacity tracking. It is not a fixed daily cutoff that automatically blocks every new assignment after that number of hours.

Start with realistic values and adjust them after observing unassigned work, response health, and the team's actual workload.

## Choose how each teammate handles the Inbox

When inviting a teammate or editing an existing member, choose one of these Inbox capacity modes:

- **Does not handle Inbox messages:** prevents the person from receiving or replying to Inbox conversations and removes them from team routing.
- **Same as the team:** uses the capacity limits of the team targeted by the conversation.
- **Different from the team:** uses custom concurrent-conversation and daily-handling values for that person.

Use a custom capacity when someone's schedule or responsibilities differ consistently from the rest of the team. Exclude people who need access to Hellotext for management or reporting but should not receive Inbox work.

These settings apply to Inbox handling and workload tracking. They do not change the teammate's role.

## Understand automatic assignment to a team

A playbook escalation, a journey Assignment step, or another routing rule can select a team as the destination for a conversation.

When a conversation targets a team, Hellotext:

1. Looks for members of that team who are allowed to handle Inbox messages.
2. Considers availability, conversation capacity, and current active workload.
3. Assigns the conversation to an eligible teammate.

If all eligible members are at capacity, the conversation can remain **Unassigned** while preserving the team as its destination. When capacity becomes available, Hellotext can assign waiting conversations to an eligible member.

Waiting conversations keep their order for that team. An unassigned conversation with a target team should not be treated as unrestricted work for every teammate.

If a team has no eligible members, automatic routing cannot complete. Before enabling a playbook or route, confirm that the destination team has at least one member who handles Inbox messages and test the handoff.

Keep reading: [Assign conversations]({% link _team/assigning-conversations.md %}).

## Choose who handles reopened conversations

The **Options** tab under **Your Team** controls what happens when a conversation reopens. This setting applies to all conversations across the business.

- **Fastest response:** routes the conversation to the best available teammate at that moment.
- **Keep same teammate:** favors continuity with the previous assignee.
- **AI-first:** lets AI respond first and escalate when needed.
- **Unassigned queue:** leaves the conversation open for a teammate to pick up manually.

This business-wide ownership protocol is different from a team target. The protocol decides how reopened conversations enter the workflow; a playbook, journey, or routing rule decides which team should receive a specific handoff.

Keep reading: [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %}).

## Monitor and adjust capacity

Review capacity when you see:

- Conversations waiting unassigned for a target team.
- One team receiving significantly more active work than another.
- Response times getting worse even though teammates are available.
- Teammates whose schedules or responsibilities no longer match the team defaults.

Change capacity gradually and review the effect on the Inbox. A higher limit may reduce the waiting queue, but it can also give each teammate more simultaneous work than they can answer well.

Use response-time reporting to evaluate the result instead of treating capacity as a service-level promise.

Keep reading: [Response times and response rules]({% link _team/understanding-response-times.md %}).

## Change or remove a team safely

Before removing a teammate from a team or deleting the team:

1. Check playbooks, journeys, and routing rules that use it as a destination.
2. Choose a replacement team where necessary.
3. Review waiting and assigned conversations in the Inbox.
4. Confirm that the replacement team has eligible members and enough capacity.

Deleting a team clears that destination from conversations that were waiting for it. Review the Unassigned queue after the change so no customer work is left without a clear owner.

## Related guides

- [Team roles and permissions]({% link _team/understanding-team-roles.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Workload & capacity report guide]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
