Roles control what each teammate can see and do in Hellotext. Choose the role that matches the person's responsibilities and reserve sensitive business settings for the people who need them.

A role does not decide which conversations a person receives or how much Inbox work they can handle. Team membership and Inbox capacity control that separately.

## Compare the roles

### Agent

Agents focus on daily customer work.

- Manage Inbox conversations.
- View and update customer profiles while handling conversations.
- Work with the assignments and teams available to them.

Use this role for people who reply to customers but do not need to manage campaigns, playbooks, audiences, integrations, or business settings.

### Manager

Managers combine customer work with operational and marketing responsibilities.

- Do everything an Agent can do.
- Manage campaigns and reports.
- Manage captures, playbooks, journeys, and automations.
- Work with audiences and customer segmentation.
- Create teams and invite Agents.

Use this role for team leads, marketing operators, and people responsible for workflows. Managers do not receive sensitive Administrator or Owner controls.

### Administrator

Administrators manage most of the business configuration.

- Do everything a Manager can do.
- Manage channels, integrations, billing, and API credentials.
- Manage teams, Inbox capacity, and non-owner roles.
- Invite Agents, Managers, and Administrators.

Use this role for trusted operators who maintain the Hellotext account. Administrators cannot transfer ownership or delete the business.

### Owner

The Owner has the highest level of business access.

- Has full access to the business.
- Can transfer ownership to another teammate.
- Can delete the business.

A business has one Owner. **Owner** is not available as a role in the normal invitation flow; use the separate ownership transfer process when this responsibility needs to change.

Keep reading: [Transfer business ownership]({% link _integrations/transferring-ownership.md %}).

## Choose a role by responsibility

Use the least privileged role that still lets the person complete their work.

- Choose **Agent** for frontline Inbox work.
- Choose **Manager** for people who also operate campaigns, playbooks, journeys, captures, audiences, or teams.
- Choose **Administrator** for people who maintain channels, integrations, billing, credentials, roles, and capacity.
- Keep **Owner** for the person accountable for the business and its ownership.

The tools visible to a teammate can also depend on the business plan and connected products. A role grants permission to a product area, but it does not add a feature that is not available for the business.

## Invite a teammate

Owners, Administrators, and Managers can start an invitation. A Manager can invite Agents; an Owner or Administrator can also invite Managers and Administrators.

1. Open **Settings** and go to **Your Team**.
2. Select **Invite team member**.
3. Enter the person's email address.
4. Choose their role.
5. Add them to one or more teams when they should receive team-routed conversations.
6. Choose how they should handle Inbox conversations and, when needed, define custom capacity.
7. Send the invitation.

Team membership and capacity are part of the invitation because they affect Inbox operations, but they do not change the person's role.

## Change an existing role

An Owner can change another teammate's role. An Administrator can change the role of an Administrator, Manager, or Agent, but cannot change the Owner. Managers cannot change existing roles.

1. Open **Settings** and go to **Your Team**.
2. Find the teammate and open **Settings** for that member.
3. Choose the new role and save the change.

Changing a role does not automatically change team membership or Inbox capacity. Review all three when a person's responsibilities change.

## Understand roles, teams, and Inbox capacity

These settings solve different problems:

- **Role:** what a teammate can see and do.
- **Team:** which operational group can receive a routed conversation.
- **Inbox capacity:** whether a teammate handles Inbox work and how much active work automatic team routing can give them.

For example, two people can both be Managers but belong to different teams, or one can be excluded from Inbox handling while the other receives conversations using the team's capacity.

Keep reading: [Teams and Inbox capacity]({% link _team/teams-and-inbox-capacity.md %}).

## Remove access safely

Before removing someone from the business:

1. Review conversations assigned to that person.
2. Update playbooks, journeys, or routing rules that refer to them directly.
3. Confirm that the remaining teams have eligible members and enough capacity.
4. Remove the teammate, then review the Inbox for redistributed or unassigned work.

When access is removed, Hellotext redistributes active conversations among the remaining eligible business members. Closed or snoozed conversations assigned to that person become unassigned.

## Related guides

- [Teams and Inbox capacity]({% link _team/teams-and-inbox-capacity.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Conversation lifecycle in Inbox]({% link _team/conversation-lifecycle.md %})
- [Transfer business ownership]({% link _integrations/transferring-ownership.md %})
