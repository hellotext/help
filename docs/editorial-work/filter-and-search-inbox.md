# Filter and search Inbox — 2026-10-07

## Feedback revision — 2026-10-07

Status: local correction validated; no new publication. Twelve replacement
native 4× Display P3 sources show an actual `Emma` query with its focused caret,
Team controls over real fictional queue rows, and the open Labels Choose flyout
with three available labels. No label is applied in the chooser captures.
Desktop and mobile crops use actual responsive UI; no image enlargement or
interface manipulation was used. All original image files remain unchanged.

The [capture and validation record](captures/inbox-feedback-20261007/README.md)
contains exact sources, scoped fixture checks, build and complete-page ES/EN
pixel reviews. All three figures passed checks at 1440/580/390px. Together with
the overview, 24 referenced PNGs match both locale outputs (48 comparisons).
All 15 headings, six ordered links and prior prose remain intact per locale.

The pair remains `visual_pending`: the isolated Elasticsearch service is
unavailable, so the typed query proves input only, not returned results. The
inventory still contains 45 unresolved pairs. This correction starts at the
published PR 393 merge `616bc90f` and remains local pending separate approval.
The following sections preserve the previous batch's validation history and
are not evidence of a new publication.

Status: `visual_pending`. Bilingual text, accepted control figures, build and complete-page browser checks passed. A useful executed-search result remains deferred.

## Scope and baseline

This batch covers the English and Spanish `team/filter-and-search-inbox` guide.
Help starts at `99b9bd63e6e984d8abc7fe84854dca4c5f7ddaf8`; the application source
is `6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31`. The pinned shared editorial rules
are `d5319b02e1c6a85f3a6294f11763b9be8dd58a43`.

The initial live check found no open Help pull requests. PRs 389–391 are merged
and excluded from new work. The baseline ledger contained 39 pending and seven
in-progress pairs, or 46 unresolved pairs, plus 107 locally verified pairs and
one out-of-scope item. The seven in-progress entries include the Follow-up
documentation introduced by PR 388; its existing text is not a new article to
duplicate.

The previous screenshot checkout and its 28 visual-draft references were read
without modification. Those references represent 19 distinct article pairs,
including one already verified pair. Controls-only playbook drafts still lack
the central outcome evidence documented in their work records. Their image
counts are not treated as completion evidence.

Original guide bodies and the inventory baseline are retained in
[`captures/inbox-filter-search/`](captures/inbox-filter-search/).

## Reader task and factual corrections

The guide explains how to find a conversation inside a chosen work queue.
Each significant section was checked against the current source and both
translations were reviewed. The source-level findings are recorded in
[`article-review.json`](captures/inbox-filter-search/article-review.json).

- **Open** with selected teammates contains assigned work for those people.
  Clearing all names also includes unassigned conversations.
- **Needs attention** has a fixed own-assigned plus unassigned scope for an
  Agent. Owners, administrators and managers can narrow their team view.
- Keeping only your name returns to personal work; removing every name widens
  the applicable view.
- Reminders lists snoozed conversations. Awakened conversations move back to
  assigned or unassigned work.
- The instructions name the actual Search, Show filters, Team, Labels and
  Choose controls, with their Spanish labels.
- Apply the desired state before searching, even if that state is already
  displayed. The initial page can display default selections which have not
  yet been included in the search request. Re-enter the query after changing
  filters so the search uses the new scope.

Titles, routes, collection metadata, headings and related-guide links remain
unchanged. This batch makes no application change.

## Visual coverage

| Section | Reader question and decision |
| --- | --- |
| Search | Show the actual search field above a coherent fictional queue before typing. The mobile navigation preserves visible selections but clears URL parameters, so the image makes no future search-scope claim. This is a control-location screenshot, not evidence of a completed search. |
| State choices | Name all seven production choices and explain their meaning in prose. The development app contains an additional development-only unread choice; no screenshot of that menu is presented as production UI. The Show filters trigger supplies the entry point in the other captures. No DOM or pixels are altered to remove a choice. |
| Open and Needs attention | Explain the assignment and role distinctions explicitly; a static image cannot demonstrate all viewer roles. |
| Teammate | Show the Team section with two selected fictional teammates, remove buttons and the Choose trigger. |
| Labels | Show the Labels section with a selected fictional saved label, remove button and the Choose trigger. |
| Combining filters | Refer to the three complementary controls above; a second copy of each view would repeat the same task. |
| Daily routine and missing results | Preserve the operational checklist. These sections interpret the controls already illustrated and require no new interface action. |
| Related guides | Preserve navigation without an extra screenshot. |

## Capture and verification

The isolated runtime has no Elasticsearch service. Search requests cannot complete
in that environment, so no successful search result is pictured or claimed as
runtime-tested. Search capabilities and filter request behavior were reviewed
against the current implementation. No provider, customer or production service
was connected to fill that gap.

The 12 source PNGs are native 4× Display P3 captures of the unmodified current
interface. Source hashes, CSS crop sizes, viewport, locale and safety checks are
retained with the capture manifest. All 12 PNGs were inspected directly.

The production Jekyll build and security-header check passed. Both locale build
copies match every source image byte-for-byte (24 comparisons); both editorial
JavaScript files also match in each locale (four comparisons). Editorial work
records remain excluded from the generated site.

Complete English and Spanish pages and all three figures passed pixel review
at 1440px and 390px CSS widths. DOM checks at 1440px, 580px and 390px found no
overflow, image links, native-size cap violations or visible captions. English
text and pixels also passed independent review. A review-helper viewport reset
was detected and fixed; rejected evidence was regenerated with a per-capture
viewport assertion and lazy-image decoding.

The row remains `visual_pending` until a real matching-result screenshot can
be captured and checked with isolated Elasticsearch. This batch does not count
the pair as finished. Publication and public asset checks, if performed, are
recorded separately from these local results.
