# Inbox overview — 2026-10-07

Status: `local_verified`. Both complete translations, all accepted figures, the production build and final independent review passed.

## Scope and source

This batch prepares the complete English and Spanish `team/inbox-overview`
pair. Help starts at `99b9bd63e6e984d8abc7fe84854dca4c5f7ddaf8`, the current
application source is `6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31`, and the shared
editorial rules are pinned to `d5319b02e1c6a85f3a6294f11763b9be8dd58a43`.
Titles, slugs, collection metadata, seven section headings and 21 links in each
translation remain intact. Original bodies and the collection stub are retained
in [the capture record](captures/inbox-overview/originals/).

Both complete article bodies were checked against the immutable current
application source. Independent text review approved the corrected pair with
zero outstanding findings. The retained
[article review](captures/inbox-overview/article-review.json) and
[independent review](captures/inbox-overview/independent-review.json) record the
source evidence and the text hashes before figure insertion.

The corrections qualify customer-reply reopening and assignment, explain that
capacity supports automatic distribution, and make editor availability depend
on channel and conversation context. The search paragraph instructs readers to
choose the desired state explicitly through Show filters before searching.
The ownership instruction applies when the native Assign to me control appears
in an open conversation, without promising the control for every conversation.

## Complete section coverage

| Section | Visual decision and reason |
| --- | --- |
| Introduction and setup links | Figure 1 shows the real Inbox context and a readable fictional incoming question plus internal note. The desktop crop includes the conversation list; mobile shows the conversation view. Related setup articles remain links. |
| Conversation lifecycle | Figure 1 supplies concrete conversation history; Figure 2 supplies the pre-assignment control. The conceptual prose does not claim to demonstrate creation, reopening or a completed assignment. |
| Finding work | The desktop workspace shows Search and Show filters in context. Detailed filter choices and executed results belong to the linked dedicated guide; this figure makes no search-result claim. |
| Ownership | Figure 2 shows Asignarme / Assign to me in an open unassigned conversation before the action. The copy is conditional on that control appearing. |
| Access, teams and capacity | Conceptual distinction and links to dedicated setup guides; no additional configuration procedure is introduced. |
| Response health | Describes the purpose of response rules and links to their guide, without presenting measured results or configuring a rule. |
| Administrative ownership | Navigation to the dedicated account-ownership guide, without a transfer procedure. |
| Message editor | Explains contextual availability and links to the editor guide. A disabled local composer would not clarify that conceptual introduction, so the workspace crop ends above it. |
| Channel and satisfaction links | Preserved navigation introduces no additional interface action. |

## Capture provenance and safety

Eight native 4× PNGs cover both locales and desktop/mobile layouts. They are
byte-identical to the compositor output, carry a genuine Display P3 profile,
and were individually inspected. There is no generated interface, retouched
text, enlargement, or DOM/view alteration. The
[manifest](captures/inbox-overview/manifest.json) records hashes, source crop
sizes, locale, viewport and the loopback capture route; the
[import checks](captures/inbox-overview/import-verification.json) preserve the
original manifest hash and document the path-reference and safety-scope clarifications.

| Figure | Desktop native CSS size | Mobile native CSS size | Source density |
| --- | --- | --- | --- |
| Workspace and history | 960 × 384 | 430 × 450 | 4× |
| Ownership control | 265 × 72 | 430 × 86 | 4× |

Each static figure uses the shared lavender stage, inset white frame, accessible
hidden caption and locale-specific alt text. Responsive `<picture>` sources
retain the 4× descriptor and natural-size cap; images are not links. The
ownership crop is intentionally small on desktop because it illustrates one
control, while the mobile crop includes the actual conversation header.

Only the owned fictional database was used. Two incoming Message records were
created with `deliver:false`, no user or provider endpoints, and one internal
Note. Actual Event models render their history. The fixture has 132
non-messageable contacts, zero connected integrations, authorization tokens,
provider connections on the checked fixture numbers, enabled playbooks, active workflows and workers. Jobs use
TestAdapter and mail delivery is disabled. The retained final safety files
record 55 total messages, exactly two new incoming messages and no send or
assignment action. No live-channel or delivery claim is made.

The credential-free helpers and their prerequisites are documented in
[reproduction.md](captures/inbox-overview/reproduction.md). No database dump,
runtime credentials, cookies, browser profile or private environment file is
included.

## Completed local validation

The production `yarn build` and security-header check passed. All eight images
match both built locale copies byte-for-byte (16 comparisons), retain genuine
Display P3 and native 4× density, and remain within their real CSS crop limits.
The generated site excludes editorial work records. The related filter guide's
12 images also pass, for 20 source PNGs and 40 built image comparisons in this
coherent two-pair batch.

Complete English and Spanish pages and both figures passed direct pixel review
at 1440px and 390px CSS widths. English received independent final review with
zero findings. Responsive DOM checks at 1440px, 580px and 390px confirmed correct
locale/layout sources, no overflow, native-size caps, accessible hidden captions,
and no image links. All seven headings and 21 links per locale were preserved.

The final records are
[English independent review](captures/inbox-overview/independent-final-pixel-review.json),
[Spanish review](captures/inbox-overview/final-spanish-pixel-review.json),
[responsive checks](captures/inbox-overview/page-review/summary.json), and
[build verification](captures/inbox-overview/build-verification.json).
The review scripts remain available beside those records.

The overview has no deferred useful visual. The companion detailed filter and
search guide retains `visual_pending` for executed-search evidence; that gap is
not closed by the overview's contextual screenshot. Completing this overview
reduces the baseline 46 unresolved pairs to 45. Local verification does not
claim deployment; publication and public URL/asset checks are recorded separately.
