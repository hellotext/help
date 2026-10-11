# Customize preparation

This package prepares the existing bilingual guide for a separate local visual
completion. The active articles, inventory row, stub, shared work record and all
40 original PNGs remain unchanged. No application runtime or capture was started
by this preparation.

`preserved-inputs.json` binds base `046e27c78f8431ad46f87a8e31048907b2d34d56`,
the complete ES/EN bodies, their 25 headings (16 H2) and 29 Liquid links each,
the shared stub, the exact inventory row and the existing shared work record.
The original bodies and 20 figure blocks are retained under `originals/`.
The future independent work record is
`docs/editorial-work/customize-safely-completion.md`; do not edit the shared
`playbook-followup.md` to close this pair.

## Retained sources

`retained-source-register.json` contains 40 preserved sources, byte equal to the
base and the accepted historical source review. The preparation rechecked PNG
dimensions, chunk CRCs and each embedded ICC hash. It did not repeat the source
pixel review or claim current rendered-page approval.

The 38 planned selected sources cover ten concepts. Their stable figure IDs are
`prompt`, `tone`, `intents`, `knowledge`, `web-search`, `properties`, `channels`,
`discount-percent`, `escalation` and `route-assignment`. Integration will add
`data-customize-figure` to their existing markup without changing global CSS.

The two full discount desktop sources predate the store-promotions control and
are historical references only. Preserve them; do not select them in this guide.
The percentage crops named `discount-mobile-es.png` and
`discount-mobile-en.png` are actual **desktop detail** captures. Their planned
Help roles are both desktop and mobile, capped at 245 CSS pixels for ES and
330 CSS pixels for EN, plus the existing 18-pixel frame inset. Do not relabel
them as mobile captures. The valid current alt text and caption describe only
the percentage selector.

ICC metadata is recorded per source. All 40 verified originals currently share
the same embedded profile hash (`6e72ac49…5dffb`), reported as Display P3 Gamut
with sRGB Transfer. Their actual capture density is 2×; do not describe them as
new 4× captures.

## Pending new scenes

The capture owner's provisional concepts are `followup-controls`,
`followup-actions`, `followup-sequence`, `store-promotions-entry`,
`store-promotions`, `promotion-filter` and `agent-wait-notice`, localized for
ES/EN and desktop/mobile. These names do
not certify a fixed image count or existing files. Final geometry may require
additional native views; no placeholder or unaccepted asset is referenced in
the articles.

Before integration, freeze the exact figure plan and the source matrix. Bind
the approved copy corrections and insertion anchors to the preserved bodies.
Require a real source manifest, an explicit root admission and separate actual
pixel-review records for ES and EN. Each admitted image must match its file,
locale, semantic ID, capture layout, dimensions, native density, embedded
profile and SHA-256. Copy PNG bytes unchanged. Keep runtime state evidence
curated: no sessions, cookies, tokens, environment files, private model source,
database rows or raw request payloads belong in this package.

The final source register will include all 40 historical sources plus only
admitted new sources, with per-source `selected`, `help_viewports`,
`pixel_review`, `transformations` and a hash-bound `pixel_review_record`.
New assets will use `images/editorial/customize-safely-completion-20261011/`.
The final accepted-source manifest and integration record do not exist yet.

## Integration helper

`integrate-accepted-sources.py --plan` validates the preserved inputs, proposed
copy replacements and insertion anchors without changing Help. The normal
validation mode and `--apply` both reject the current pending inputs.

After source review, freeze `new-figure-plan.json` and the exact matrix in
`integration-inputs.json`, bind the reviewed helper hash, and mark the copy and
figure plan ready for source admission. The number of new paired figures is
derived from that final plan, not from a fixed concept count. If native
geometry needs a different arrangement, review that plan before admission.

Root admission must have `status: passed`, the manifest and integration-input
hashes, the exact accepted `records`, and separate `pixel_reviews.es` and
`pixel_reviews.en` file/hash bindings. Each locale review must have `status:
passed`, its matching `locale`, and exact `records` with ID, locale, layout,
filename, SHA-256 and passed status. Admission also binds the scoped source
currency and both capture/runtime closure records; root-curated copies must
already be present in this folder. Raw sidecars are not imported.

Run read-only validation first, using `--raw-dir`, `--manifest` and
`--acceptance`. Only after it passes, repeat those arguments with `--apply`.
The helper copies accepted PNG bytes and pixel receipts, adds stable IDs to
the ten old figures, changes only the approved percentage-source selection,
applies the bound copy plan and inserts accepted figures. A repeated apply
verifies the integration record and returns without changes. It never writes
the inventory, commits, starts a runtime or publishes.

## Remaining gates

1. Complete and approve the exact new scenes and the minimal bilingual copy
   correction for the promotions panel's desktop/mobile presentation.
2. Validate admission without writing, then integrate only the accepted matrix.
3. Run the normal Help build, security checks, source/export byte comparisons
   and docs exclusion checks.
4. Review both complete pages at 1440, 580 and 390 CSS pixels, including readable
   native details, static figures, stage borders/insets and no overflow.
5. Preserve the inventory as `in_progress` until real verification and the
   separate commit/closure procedure authorized by the parent.

The public routes remain `/how-to-customize-a-playbook-safely.html` and
`/es/como-personalizar-una-mision.html`. No publication has occurred in this
preparation.
