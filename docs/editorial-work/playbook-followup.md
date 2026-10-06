# Playbook Follow-up component — 2026-10-06

## Scope and state

Add the Follow-up component to the English and Spanish customization guide,
following the existing sections for Discount, Tone, Knowledge and Escalation.
Add a configuration link in each locale of Smart Recommender, Custom Agent,
Instant Answers, Return & Exchange Helper, Order Cancellation Assistant and
Order-Update Delight. Preserve existing titles, routes and figures.

The Help checkout switched to `main`, pulled with `--ff-only` to
`c946993b2aebbe61e7da4a3daf65b639a0ec59d5`, then created
`codex/document-playbook-followup`. The initial task was local documentation
work. The user subsequently authorized pushing the branch and opening its pull
request alongside the application PR. No deployment or public verification is
claimed.

## Originals and plan

The original shared stub and complete customization guide translations are
preserved byte-for-byte under `originals/playbook-followup/`. The six related
guides can be compared with the same base revision; their only changes are
one component-list link per locale.

Spanish is the source draft; the English adaptation uses the current English
interface labels. The new section covers:

1. Agent-written reminders and the count menu, including None as zero nudges.
2. One wait in minutes or hours before each nudge and the final action.
3. AI Analysis, closure and handoff using Assignment, with related navigation.
4. The illustrative conversation preview and the final playbook save.
5. Customer replies, the retained conversation count and when saved edits apply.
6. Initial values for the six templates and the Automation Agent Wait notice.

The timing example and action comparisons use tables. No new screenshot or
customer-message mockup is added. Existing figure markup and assets remain
unchanged. A screenshot of the Follow-up controls could help readers recognize
the new card; capture and desktop/mobile browser review are deferred because
the user instructed this task to stop inspecting the browser. The text uses
the actual labels and works without a screenshot.

The progress register marks these seven article pairs `in_progress` for this
batch and retains their previous verifying revisions where present. This does
not change their public publication state or claim new browser verification.

## Source verification

Reviewed the initialized editorial submodule at
`d5319b02e1c6a85f3a6294f11763b9be8dd58a43`, shared skill, guide, workflow,
screenshot standard and Help integration. Read the complete customization
guide pair and the relevant configuration sections in all six related guides.

Checked the Rails `playbook-followups` implementation at
`ebce3a1498eac88cdb814a1d9523d7d480a93c6a`:

- `Playbook::Component::Followup`, its three configuration fields and snapshot.
- Follow-up card/form, English and Spanish labels, and conversation preview.
- `db/seeds/playbooks.rb` for the six template defaults.
- `AI::Conversation#schedule_followup` and its README for reply timing,
  retained counts and configuration changes.
- `Flux::Agent::Analyzer` for final actions and Automation branch advancement.

The initial documentation batch did not change Rails source, business
configuration or the running application.

## Verification

The production Jekyll build and `script/verify_security_headers.rb` passed using
Ruby 3.3.12 through rbenv and the existing Node 20.4.0 dependencies. The requested
Ruby 3.3.6 patch is not installed; the Help README permits the nearest installed
3.3.x patch. Dependency checks passed without changing dependency files.

Built an isolated copy at `/private/tmp/hellotext-help-followup-wlxp_2pt`, sharing
the existing `node_modules`, so validation did not alter the checkout's generated
site or cache. The build completed in 8.878 seconds. It emitted the existing
Browserslist database age notice; no dependency updates were made.

Checked both generated section anchors and all twelve localized component links.
All fourteen article sources matched the build copy, and all twenty-four built
copies of the customization guide's existing images matched their source bytes.
The original guide snapshots and existing figure markup remain unchanged.
Confirmed that `docs/` and `AGENTS.md` are excluded from both language builds.
`git diff --check` passed.

Browser review and the optional product screenshot remain deferred under the
user's instruction to stop inspecting the browser. The progress register stays
`in_progress` rather than claiming the workflow's browser verification. No public
checks, publication, push or pull request are claimed.

## Order Update defaults — 2026-10-06

At the user's request, changed Order Update's seeded Follow-up policy to one
nudge and a ten-minute interval. The final action remains closure. The Rails
change is recorded in `c1787f92582a77eb6d77ba3759d01215b5cabe20`; the English and
Spanish starting-value rows now match it. The guarded seed creation still
preserves any existing component's saved settings; no seed run or backfill was
performed.

Ruby syntax validation and RuboCop for `db/seeds/playbooks.rb` passed with zero
offenses. Rebuilt both Help locales in the same isolated copy; the production
build completed in 8.423 seconds and security-header verification passed.
Checked that the English and Spanish rows show one nudge, ten minutes and
closure in both generated files and the running local preview. No browser
inspection or screenshot capture was performed. `git diff --check` passed.

## Pull request preparation — 2026-10-06

The application's Followup form now renders the shared Learn more partial in
its SectionHeader description slot, matching the other component forms. Its
localized destinations are this guide's `customize-follow-up` anchor in English
and `personaliza-el-seguimiento` anchor in Spanish. The user requested PRs for
the application and this documentation branch; publication checks remain
separate from creating those PRs.

The application PR includes the user-supplied Spanish editor image, preserved
unchanged in the application repository with its provenance. No image is added
to the Help articles; their existing figures and assets remain unchanged.

Local verification confirms both application link destinations match the built
guide anchors and all twelve localized component links resolve. The article
sources still match the successful production build recorded above. Browser
inspection remains deferred under the user's instruction, and the progress
register retains its existing `in_progress` state.
