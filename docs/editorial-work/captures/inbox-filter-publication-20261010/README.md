# Inbox expanded filters — local preparation

This folder prepares only the Team and Labels figures in the ES/EN filter
guides, based on Help `570208d5a3fe900811572be6014136e06aa33c3f`. All eight native
captures have been accepted and integrated, and the production build passed.
Final page-pixel review passed for the complete editorial content and all figures
at 1440/580/390px in ES/EN; see `local-qa.json` and `pixel-reviews/`. Search,
overview, article structure, routes, published assets and the pending executed
search result remain preserved.

## Files and gates

- `originals/` holds the two original article bodies and route stub, bound to
  the immutable Help base. `preservation-baseline.json` records overview,
  configuration, inventory and the 28 sources previously used by both guides.
- `revision-config.json` fixes exactly eight new sources and the two target
  figures. `allowed_pinned_guide_revision` accepts one full editorial SHA.
  Local QA uses the existing published baseline pin. Root may explicitly
  replace it only with a reviewed, authorized and published editorial merge.
  Publication of a pending canonical guide change remains a separate gate;
  do not point Help at an unpublished guide commit to bypass that gate.
  The guide checkout must match; an index still at the baseline pin is reported
  as staging pending, never silently called updated.
- `proposed-figure-copy.json` contains accessible copy reviewed against
  all eight responsive sources; raw acceptance binds its exact bytes.
- `source-review.template.json` and `raw-acceptance.template.json` are pending
  templates, not evidence. Root authors the corresponding completed records
  after checking genuine source provenance and saved pixels. Acceptance binds
  the eight PNG hashes, manifest, copy, config and source review.
- Native PNGs are imported once, byte-for-byte, under
  `images/editorial/inbox-filters-20261010/`, only after root accepts them.
  `manifest.json` contains exactly `team/labels × es/en × desktop/mobile`.
  Each record uses `file`, `id`, `locale`, `layout`, `clip`, `pixelSize`,
  `nativeDensity: 4`, `icc`, `sha256` and `transformations: "none"`. The
  reviewed provenance must separately retain real viewport, zoom, capture
  route, gamut, fictional state, completeness and runtime limitations.

## Offline helper sequence

From the Help root, set `FILTER_CAPTURE=docs/editorial-work/captures/inbox-filter-publication-20261010`.

1. `python3 "$FILTER_CAPTURE/integrate-candidates.py" --plan`
2. After exact raw acceptance and source import, run
   `python3 "$FILTER_CAPTURE/integrate-candidates.py" --manifest "$FILTER_CAPTURE/manifest.json" --acceptance "$FILTER_CAPTURE/raw-acceptance.json"`.
   This validates without writing. Root may then repeat with `--apply`.
3. Root performs the normal `yarn build` with the existing Ruby 3.3.6 setup.
   These helpers never run a build, install dependencies or start services.
4. `python3 "$FILTER_CAPTURE/verify-build.py"` validates an existing build
   without writing. Add `--write-record` to save its compact success receipt.
5. Root runs `review-local-pages.py` against its already owned Help server
   `http://127.0.0.1:4301` and browser on `9488`, following its `--help`.
   The helper does not launch a browser. Run its offline `--plan` first.

The integration helper can write only the two target article bodies and its
integration receipt. It changes exactly figure two and figure three. Search
and all bytes outside those figures are preserved. It never writes assets,
the gitlink, inventory, configuration or other article bodies. A dry run does
not authorize an apply step. Each step checks concurrent changes before use.

## Visual and build acceptance

Inspect all eight native PNGs and complete ES/EN pages at actual 1440, 580 and
390 CSS widths. At every width capture page tiles and all three figures,
including retained Search. Check native source selection, density, no logical
upscaling, full-width lavender stage, both insets, complete controls/options,
useful real Inbox context and legibility. No Impersonate, My unread, debug
overlay, load-test names or manufactured UI belongs in the new sources. Native
submenu overlap must be described honestly; opening a chooser is not evidence
of an applied filter or a new assignment. The entry-only Search limitation
remains unchanged.

Build verification checks accepted source/HTML equality, 12 currently referenced
filter PNGs in both build copies, all 28 preserved prior article images in both
copies, retained overview figures, JS bytes, excluded editorial evidence and
the inventory's `visual_pending` state. This is not a pixel review.

Page review scrolls natively to each clip and waits for the native layout to settle.
Every PNG captures the whole native 1000px-high viewport. Each record separates
the requested document region from the actual viewport clip, including native
clamping and overlap at the page end. The helper checks continuous page/figure
coverage through the browser-reported scrollable page extent; precise DOM box
bottoms remain separately recorded. Long figures use numbered
viewport parts; these can include surrounding prose. No stitched strip, silent
tail crop or offscreen capture is used.

Keep all page-review PNGs outside Help at
`/Users/pel/Documents/Codex/2026-10-06/task-8/audit/filter-publication-20261010/page-review`.
Only compact metadata, exact hashes and review findings belong in the consuming
repository. Do not include private app source bodies, sessions or private URLs.
No helper publishes, commits, pushes, posts comments, changes app data or touches
permissions, automations, runtime configuration or monitors.

## Accepted local result

`local-qa.json` binds the final six-view run and 80 inspected PNGs. Those PNGs
remain outside Help. Raw capture metadata records pixel review as pending at
capture time; the separate reviewer receipts resolve that gate. Two English
desktop tiles omit sticky-sidebar paint while preserving the full article; this
acceptance covers article content and figures, not sticky-navigation behavior.
The earlier offscreen/partial diagnostic runs were rejected and stay outside
the repository. Publication and public-byte verification are separate steps.

The metadata-only follow-up in `metadata-reverification.json` renames the
rendered-content checksum field after a secret scanner mistook its old name for
a credential. The verifier passed again with identical checksum values and
results. Existing browser/pixel receipts remain immutable and bind to the
original build record and verifier at commit
`a1d21c79214c088b992066231200287336524626`; the follow-up records both old and
current hashes. No article, image, styling, security setting or browser output
changed.
