# Shared Inbox and Team inbox — release documentation

## Publication state

Prepared on 2026-11-10 as a draft PR for the feature tracked in
[hellotext/hellotext#4712](https://github.com/hellotext/hellotext/issues/4712).
Do not merge or publish this guide until the feature is deployed and its
released behavior has been checked against both translations. Merging Help's
main branch triggers publication. Auto-merge must remain disabled.

The guide follows the implementation in the Hellotext Rails repository:

- [#7019](https://github.com/hellotext/hellotext/pull/7019) (merged): access
  checks on every conversation and the team that owns a conversation.
- [#7023](https://github.com/hellotext/hellotext/pull/7023) (merged): the
  General queue, team supervisors, the supervisor step of the invitation and
  assigning a conversation to a team from the Inbox.
- [#7026](https://github.com/hellotext/hellotext/pull/7026) (merged): what each
  person can see on a Team inbox.
- [#7027](https://github.com/hellotext/hellotext/pull/7027) (merged): live
  Inbox updates that follow the same rules.
- [#7028](https://github.com/hellotext/hellotext/pull/7028) (open): the Inbox
  visibility setting in Team → Options and its confirmation. The interface
  labels quoted in the guide come from this PR and can still change in review.
  Its Learn more link points to this guide's two routes, so the routes must
  not change without changing that PR.

## Article inventory

This is a new guide; there is no earlier published article to preserve.

| Locale | Source body | Planned route | State |
| --- | --- | --- | --- |
| English | `_i18n/en/team/shared-inbox-and-team-inbox.md` | `/shared-inbox-and-team-inbox` | Draft; not published |
| Spanish | `_i18n/es/team/shared-inbox-and-team-inbox.md` | `/es/bandeja-compartida-y-bandeja-por-equipo` | Draft; not published |

The shared stub is `_team/shared-inbox-and-team-inbox.md`, listed in the Team
topic after Teams and Inbox capacity. No existing guide links to it yet.

## Reader task and scope

Understand the two ways a business can show conversations to its team, what an
agent, a team supervisor and a manager each see, what the General queue is, and
decide which way fits. Then prepare the teams, switch, and name supervisors.

The copy is written for people who run a team, not for people who configure
software: it explains each way of working with an everyday picture, compares
them in two tables, and gives three examples before any setting is named. It
leaves out workload capacity, routing order and other details already covered
by Teams and Inbox capacity.

## Visual decisions

The guide has no screenshots yet. Four would help the reader recognize the
interface, and all are pending until the setting is released, because they must
be captured from the real application under the shared screenshot standard:

- The **Inbox visibility** card with both options, after "Turn on the Team
  inbox", in each language.
- The **Switch to Team inbox?** confirmation, after the same steps.
- The **What should this member manage in their teams?** step of the
  invitation, in "Choose your supervisors".
- The **Supervisors** field of a team, in the same section.

The comparison sections, the examples and the questions stay in prose and
tables: they explain rules, not screens.

The guide describes no flow that sends customer messages, so it needs no
recipient example.

## Verification

- Local Jekyll serve renders both routes and lists the guide in the Team topic
  in English and Spanish.
- `yarn build` has not been run for this draft.
- Not published; no public URL to verify.
