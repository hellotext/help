# Inbox screenshot feedback — local correction

This revision improves the two complete ES/EN guides delivered in PR 393.
It is prepared locally on `codex/inbox-visual-feedback`, based on Help
`616bc90f55f09b9ec92ee3ee35f58dd6694c6d10`. It has not been pushed, submitted
as a new PR, merged or deployed. Publication of this correction remains a
separate approval step; PR 393 is the previously authorized publication.

## Result

Sixteen new native 4× Display P3 PNGs explain four views in both languages and
responsive layouts. The eight earlier overview detail images are retained,
and all 20 original published image files remain byte-identical.

| View | Desktop native CSS size | Mobile native CSS size | Evidence |
| --- | --- | --- | --- |
| Full Inbox context | 1120 × 638 | 430 × 760 | Three desktop panels; separate real conversation list on mobile. |
| Enter a search | 484 × 64 | 414 × 72 | Actual keyboard entry of `Emma`, focus and native caret. No returned results are depicted. |
| Team dropdown | 599 × 320 | 414 × 320 | Selected Lucía/Sofía, Choose, and real queue rows behind the menu. |
| Labels chooser | 705 × 270 | 414 × 299 | Open Choose flyout with three custom labels; no label applied. |

The full context is the first overview figure, followed by the preserved
readable conversation detail and ownership control. The filter guide retains
three figures; search now immediately follows the typing instruction.
Static pictures use locale/layout sources, accurate alt text, hidden accessible
captions, the shared lavender stage and native-size caps. No shared styles,
navigation, metadata or product behavior changed.

## Provenance and limits

The actual app runtime uses source
`6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31`; its 4473 UI source hashes were
revalidated. Comparison against `7fdca3183697ba5099c9ce1d2f944d2c04a21917`
found no changes invalidating the captured Inbox or customer Activity view.
This is source-freshness evidence, not a claim that the runtime uses that newer
revision. See [independent source review](independent-source-review.json).
Editorial rules remain pinned to `d5319b02e1c6a85f3a6294f11763b9be8dd58a43`.

Only the isolated fictional database `hellotext_help_inbox_task8_20261007`
was used. Business 5 contains 55 messages; the whole database contains 60.
Received messages 60/61 have `user_id: 1`. Six fictional non-messageable
contacts/conversations were added solely to provide genuine queue context,
without adding messages or delivery endpoints. Fixture safety checks retained
zero messageable contacts, connected integrations/tokens/providers, enabled
playbooks and active workflows, with TestAdapter and mail delivery disabled.
The zero-provider observation is scoped to the fixture business. No outbound
messages, permission changes, settings changes or automation changes occurred.

Desktop customer Activity is reached by native pane scrolling. The native
non-messageable-contact and notification banners remain in the full overview.
Filter crops show the complete relevant lower menu sections; the development
only upper menu item is outside the captured geometry. No DOM, CSS, pixels,
source, environment or configuration was modified to conceal UI. Mobile
popovers naturally cover parts of the underlying customer names. The custom
label names are Spanish business data in both UI languages.

Elasticsearch is unavailable in the isolated environment. Search demonstrates
query entry only, so the guide remains `visual_pending` for an executed matching
result. This correction does not reduce the unresolved inventory: **45 pairs**
(37 `pending`, 7 `in_progress`, 1 `visual_pending`), plus 108 `local_verified`
and 1 `out_of_scope`. The ledger remains unchanged. A fresh read-only check
found main at the same baseline and zero open Help PRs.

## Validation and reproduction

- [Build log](build.log): Ruby 3.3.6 `yarn build`, both languages and security
  headers passed. The existing Browserslist data warning is non-blocking.
- [Build verification](build-verification.json): all 24 referenced source PNGs
  match both locale outputs (48 byte comparisons); all retain Display P3.
  Both editorial JavaScript modules match both outputs. Work records stay out
  of the generated site.
- [Responsive checks](page-review/summary.json): four pages at 1440, 580 and
  390 CSS px; correct locale/layout source, native-width cap, no overflow,
  static images and accessible hidden captions. At 580px the check is DOM only.
- Complete-page tiles and all three figure contexts at 1440/390 are retained
  under [page-review](page-review/). Spanish pixel reviews:
  [overview](overview-spanish-page-pixel-review.json) and
  [filters](filters-spanish-page-pixel-review.json). Independent English pixel
  reviews: [overview](independent-overview-pixel-review.json) and
  [filters](independent-filter-page-pixel-review.json).
- [Independent preservation audit](independent-static-preservation-review.json):
  headings, ordered links, previous prose except the requested overview
  introduction, collection stubs, original PNGs and inventory preserved.
- Sources, hashes, capture arguments and limits:
  [overview manifest](overview-sources/manifest.json),
  [overview reproduction](overview-sources/README.md),
  [filter manifest](filter-sources/manifest.json),
  [filter reproduction](filter-sources/CAPTURE-NOTES.md), and
  [independent filter source review](filter-sources/independent-filter-source-review.json).

The integration scripts copy verified compositor bytes without transformations.
`verify-feedback-build.py` checks the output; `review-feedback.py` reviews the
loopback Help server at port 4298 using the isolated review browser. Source
capture helpers use the separate loopback app/browser and require the private
runtime fixture; credentials, sessions, environment values, browser profiles
and database dumps are deliberately absent. Rejected candidates and superseded
copy proposals remain outside this worktree in the local task audit directory.

The original bodies, stubs and image hashes are preserved in
[originals](originals/) and [baseline.json](baseline.json). Existing draft,
assignment and unrelated dirty worktrees remain untouched by this correction.
