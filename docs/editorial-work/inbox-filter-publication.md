# Inbox expanded filters — 2026-10-10

Status: eight native sources accepted and integrated; production build and
rendered-page article/figure review passed. Ready for the authorized Help PR.
Publication and public-byte verification remain separate steps.

Replace only the Team and Labels figures in the existing Spanish and English
`team/filter-and-search-inbox` guide. The images show the native filter menu,
open chooser, all target choices, and real Inbox context with fictional data.
All bytes outside those two figures in each article remain unchanged.

The [capture record](captures/inbox-filter-publication-20261010/README.md)
contains immutable originals, source hashes, provenance, acceptance records,
and bounded reproduction helpers. Help base:
`570208d5a3fe900811572be6014136e06aa33c3f`. The published editorial pin remains
`d5319b02e1c6a85f3a6294f11763b9be8dd58a43`; this batch does not incorporate the
separate local canonical-guide proposal.

## Source and scope

Eight PNGs were captured natively at 4× in Display P3, with no resampling,
UI source edits, DOM overrides, or pixel edits. The isolated app used a genuine
production environment at `6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31`.
A scoped filter comparison against `dbbae13227696ac31ec9e2338a654e682920433e`
reviewed 218 paths: 207 identical and 11 shared differences. This establishes
compatibility of these controls and ordinary fictional names, not deployment
or whole-application parity.

Private production assets were built without minification after the native
minifier failed, then served byte-for-byte through a local static bridge after
the sandbox rejected sendfile. Those runtime files are outside Help. Browser
mutation requests and external egress were blocked. The local fixture journal
restored all 19 changed fields; all 538 original tables and timestamps matched
afterward. Job counters describe the journal runners, not all HTTP workers.
The owned app, proxy, browser and Redis capture services were stopped afterward.

On mobile, the Team chooser naturally overlaps the separate Labels section.
The Team heading, Choose control, two selected teammates, and all seven available
teammates remain complete. Labels has three complete choices. Open choosers do
not demonstrate an applied filter or a changed assignment.

## Preserved coverage

Search retains its complete figure, copy and four PNGs. A typed query does not
prove matching results, so the pair remains `visual_pending`. The inventory
still contains 154 pairs: 108 `local_verified`, 37 `pending`, 7 `in_progress`,
1 `visual_pending`, and 1 `out_of_scope`; 45 remain unresolved.

Both overview articles, all 28 prior article images, routes, other article
prose, headings, links, generated styles/scripts, and security configuration
remain unchanged. Existing drafts and unrelated worktrees are outside this
isolated publication worktree.

## Validation

- `yarn build` with Ruby 3.3.6 passed, including security-header checks.
- `build-verification.json` compares both full rendered articles, all 12
  referenced filter images in both build copies, and all 28 prior article
  images. The exported JavaScript bytes match and `docs/` stays excluded.
- All eight native sources passed pixel review; source acceptance binds their
  exact hashes and accessible copy.
- Complete-page ES/EN article and figure review at 1440/580/390px passed:
  six views and 80 inspected PNGs, bound by `local-qa.json` and reviewer receipts.
  Native viewport coverage reaches the footer; no source is enlarged.
- Two English desktop review tiles omit sticky-sidebar paint. Their article
  columns are complete and neighboring captures show navigation. The accepted
  scope is editorial content and figures, not full sticky-navigation behavior.

Review PNGs, rejected diagnostic runs, private runtime data, and deployment
receipts stay outside this repository. A successful local build is not a
publication receipt; deployment must be verified separately against the
reviewed commit and public image bytes.
