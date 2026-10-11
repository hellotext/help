# Assign conversations: completion preparation

Status: preparation only. The active ES/EN articles, their eight published PNGs,
the shared renderer, and the inventory are unchanged. The pair remains
`in_progress`; the current inventory has 38 unresolved pairs.

This preparation uses Help main `3e05601d63bc834182f71cd0d09747631bf2d2e2`.
The complete articles retain eight section headings and nine links per language.
Originals and hashes are in [baseline.json](baseline.json). The source review
binds 51 files at application revision `8e27a524a1a1354385c7d2fd22de8e568c2112cb`;
none intersects the preserved 16-file delta to
`afacda5636225888e44666da2e6d76fdd6a1425f`. This is scoped source currency, not a
claim that the production deployment was observed.

## Smallest useful visual batch

| Article section | Evidence or proposed native view | Why this covers the reader's decision |
| --- | --- | --- |
| What can be assigned | Existing human chooser plus proposed AI chooser | Separates a person or listed AI agent from a team routing destination. |
| Assign to me | `claim-before`, then `claim-after` | Shows the exact header control and the resulting native assignee avatar after one real local claim. |
| Assign or reassign a teammate | Preserve `assignment-menu` and `assignment-result` | The published pair already shows choosing another person and the resulting owner/history. Inline readability still needs the current full-page review. |
| Assign an AI agent | `ai-chooser`, with its group and agent submenu open | Shows where the associated agent appears. No target is selected; the image does not claim an AI transfer, reply, or provider connection. |
| Teams and capacity | Source-backed explanation and existing canonical link | This is conceptual context, not instructions for configuring a team. No team configuration or capacity mutation is needed to illustrate this guide. |
| Assign multiple conversations | `bulk-chooser`, showing two checked fictional rows, selection count, and open Assign menu | Shows which conversations will be affected and where to choose a person. Do not click a destination or submit a batch. |
| What assignment does not change | Source-backed prose | These distinctions are not additional click paths. A screenshot cannot prove absence of a sent reply, attention clearing, or notification delivery. |
| Related guides | Preserve all links | Detailed routing, capacity, notifications, and lifecycle remain in their own guides. |

Four new concepts need ES/EN desktop and mobile sources: 16 proposed PNGs.
The eight existing PNGs remain preserved, for 24 source files if all candidates
pass. Six responsive figures per language are expected; this is a coverage plan,
not a quota or a claim that new captures already exist.

Desktop captures should keep the relevant header/menu and enough real Inbox
context, without shrinking essential names or controls below useful inline size.
Use native 4× Display P3 PNGs, preferably a focused logical width around 576–800
pixels for a desktop detail and the actual mobile viewport. Do not alter pixels,
hide controls, replace initials with portraits, or synthesize a composer/channel.
The assignment topic does not require a functioning outgoing composer.

The historical desktop captures have a 1600-pixel logical width. If their labels
are too small in the article column, prefer the preserved mobile source at its
native cap on both layouts when it fully explains the step. Otherwise recapture
only the affected native view. Keep all eight original bytes regardless.

## Minimal genuine fixture and one native action

Use a new isolated clone of the closed 541-table fictional snapshot with SHA-256
`0a93b9b77ef09c535e3ff0d7a90ba246edc1288506066c17f3e7267d5eda3bd5`.
The original snapshot and all earlier runtimes remain closed and unchanged.

The snapshot already contains six marked fictional conversations and contacts.
Reuse them; no contact, incoming message, identity, channel, integration, or
account needs to be created. All six contacts are nonmessageable. For the claim,
choose the existing conversation that has no ownership interval, SLA cycle,
attention, AI conversation, or pending-team assignment. Prepare its initial
unassigned state through the genuine model's `update_columns`; identify this as
fixture preparation rather than a user action.

The existing disabled Custom playbook has an existing fictional AI agent, but
its `playbook_agents` join is missing. Complete exactly one `Playbook::Agent`
association and one `Conversation::Agent` association in the new clone. Both
models have no creation callbacks. This makes `Playbook#agent` resolve correctly
and makes the native chooser render its real group. Do not enable the playbook,
change its workflow/provider/settings, or select it. The direct `ai_agents`
foreign key alone is not equivalent to the association used by the getter.

Only three tables may change during fixture preparation: the one conversation
(`state`, `old_state`, `assigned_user_id`, `state_changed_at`), `playbook_agents`
(one inserted association), and `conversation_agents` (one inserted association).
Compare all 541 tables, including existing rows and exact inserted foreign keys.

Capture both languages and layouts of the unassigned BEFORE state first. Restore
the fictional user's locale to Spanish, intercept one click on the real
**Asignarme** form, and pause the native POST for the reviewed one-use gate.
The controller receives `to_type=User`, no `to_id`, the visible state filter,
and the native CSRF body. Never replace this with a helper-generated assignment.
The private resolved contract must bind the actual route, request, session, and
prepared database hashes before forwarding once.

After the POST and all native synchronous callbacks finish, verify the exact
table delta before accepting the result. Capture AFTER in Spanish and English
without repeating the claim. Restore Spanish and compare the final state.
Opening the AI and bulk choosers remains GET-only; selecting their destinations,
sending a reply, or performing a queue is outside this batch.

## Callback and effect contract

| Native effect | Allowed observation |
| --- | --- |
| Conversation ownership | Only the chosen conversation becomes `assigned` to the current fictional user. `old_state` follows the native controller/model sequence. Existing attention, SLA, message and Inbox cursor fields remain unchanged. |
| Ownership history | One new manual `workload_user_intervals` row, with no previous owner and the same timestamp as the assignment track event. |
| Assignment history | One `track_events` row for `conversation.assigned`, with the current user as performer and target, and one timeline-only `events` row. The track event has no contact/session/automation context. |
| Production counter | One `dashboard_metrics` grain for that action, business, currency and exact UTC hour increments once with zero amount. This synchronous callback is not stopped by a test queue adapter. |
| Indexing | One `Elasticsearch::IndexJob` is retained. No worker or synchronous indexing runs. |
| Dashboard backfill | The native method is called, but the fresh timestamp does not meet its historical-date threshold; no backfill job is expected. |
| Notifications, AI and routing | No notification row for a self-claim; no AI rows to pause; no old human owner to release/refill; an anonymous track event does not dispatch a Journey. Verify these absences across the complete snapshot. |
| UI broadcasts | Native rendering may broadcast through the isolated transport and update local cache. External egress is denied independently. No application callback is edited or bypassed. |

The preparation helper and pure postcondition validator are held in the new
capture runtime's private directory. Their syntax and offline adversarial
comparison checks are recorded separately. They have not been executed against
a database. Runtime, request gate, session, locale journal and shutdown checks
belong to their respective owners and require the complete package review.

## Proposed copy and remaining gates

[proposed-copy.json](proposed-copy.json) contains exact bilingual replacements;
the complete proposals are [Spanish](proposals/es.md) and [English](proposals/en.md).
They clarify that changing a closed/snoozed conversation to another teammate
returns it to active work, that the AI group is based on associated agents, and
that bulk assignment runs in the background. The accurate introductory statement
that assignment does not close or snooze a conversation is preserved.

Captions will describe only visible controls or the verified local human result.
The AI and bulk captions must not imply a completed transfer or batch. Automatic
claim by reply and notification delivery stay source-backed and unexecuted;
their absence from this batch does not justify inventing an image.

No article integration occurs before native pixels are accepted. Completion
still requires the one-shot claim proof, accepted ES/EN images, production Help
build/security/byte checks, and complete article review at 1440/580/390 CSS
pixels. Preserve the shared CSS, titles, stubs, links and historical assets.
No inventory closure or publication is recorded by this preparation.
