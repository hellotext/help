# Discount promotion controls — 2026-10-02

## Scope and state

Expand the Discount section of How to customize a playbook safely in English
and Spanish, on `codex/document-discount-promotion-controls` in the main Help checkout.
The user authorized a commit, push and pull request on 2026-10-02.
This change is prepared for review; a Help-site deployment has not been verified.
The Rails application and its running server remain untouched.

The current Discount Learn more action targets the existing customization guide:

- `/how-to-customize-a-playbook-safely#customize-discount-strategy`
- `/es/como-personalizar-una-mision#personaliza-la-estrategia-de-descuento`

Keep both anchors, the stub, title, routes, publication settings, unrelated
sections and existing figure markup. Update only the Discount section and its
row in the customization map. Add one relevant Smart Recommender link per locale.

## Originals and plan

Before editing, copy both complete locale bodies and the guide stub under
`originals/discount-promotion-controls/`, retaining their repository paths.
Spanish is the source draft; adapt the English version with actual English UI
labels. The focused expansion explains:

1. The five strategies and where percentage limits apply.
2. Manual opening from View store promotions, after the combined percentages.
3. Imported VTEX kinds, name search, filtering, Show more and retained choices.
4. Per-playbook switches, imported defaults and read-only source status.
5. State overrides that preserve dates, business-local weekdays and expiry.
6. Final saving and restoring all defaults, including filtered-out promotions.

The existing Subscriber Booster percentage figure remains in place and is
explicitly described as a percentage example, not a screenshot of the new
promotions panel. Preserve its fixed-rate distinction. No new images or message
examples are required for this text update: strategy comparisons use a table;
simple search, filter, close and save actions use exact labels and numbered steps;
default/schedule differences need explanation that a screenshot cannot establish.
A fresh view of the promotions panel could support a later visual update; no new
product screenshot is claimed here. All other sections retain their existing visual coverage.

## Source verification

Read the required Help AGENTS.md, initialized editorial submodule at
`d5319b02e1c6a85f3a6294f11763b9be8dd58a43`, shared skill/guide/workflow/screenshots,
Help integration, complete article pair and prior article work record.

Verified the current Rails checkout at
`1da551f76d7793e88de91f00a7c13b15aa22e81b` through:

- `app/views/playbooks/_learn_more.html.erb` and localized permalink anchors.
- Discount form/button partials and `playbook/discount_controller.js`.
- Promotions controller, panel, rows, kind popover and their English/Spanish labels.
- `Playbook::Component::Discount`, `Playbook::Saver::Discount`, `Playbook::Bundle`.
- `Playbook::BundlesController`: imported VTEX rows, expiry, combined search/kind
  filtering and cumulative pagination.
- `AI::OpenAI::Function::SearchBundles` and `Commerce::Bundle.scheduled_at`:
  explicit enabled values replace stored state; source date windows and local
  weekdays still restrict availability.
- `Vtex::Promotion#bundle_state`: regular discounts are disabled for the agent
  by default without changing the imported store status.

Do not describe promotion switches as changes to VTEX, editing dates/weekdays,
guaranteed checkout discounts, or global choices shared by other playbooks.

## Verification

- Preserved all 15 original H2 headings, both Discount anchors and all 10 figure
  blocks per locale. The guide stub is unchanged. All original Liquid links
  remain, with one new Smart Recommender link per locale; every destination exists.
- Changes are restricted to the Discount section and its customization-map row.
  Existing published screenshots remain byte-identical in the generated site.
- Production `yarn build` and the unmodified security-header verifier passed for
  both locales. Ruby 3.3.6 is pinned but not installed; compatible Ruby 3.3.12 is
  permitted by the README and satisfies the locked gems. Build used Node 20.4.0.
  No Ruby installation or dependency change was made.
- Existing cache/output files in the main checkout denied writes. Run the normal
  build from a byte-identical source copy at
  `/private/tmp/help-discount-guide-build-source`, sharing the existing
  `node_modules`, rather than altering those files. Build output and logs stay
  outside the repository. Editorial records and AGENTS.md are excluded.
- Checked English and Spanish rendering at 1440 and 390 CSS pixels, with device
  scale factor 2 and zoom 1. Page width equals viewport width in all four cases.
  The new strategy table fits both widths; the older customization map retains
  its existing internal horizontal scrolling on mobile. All article images load.
- Reviewed the strategy, promotions, schedule and saving sections in an isolated
  headless Chrome with exactly one local preview tab, dedicated profile
  `/private/tmp/hellotext-help-discount-guide-chrome-9467` and loopback debug port
  9467. No everyday browser tabs were inspected. Lazy images were loaded before
  positioning captures to avoid layout shifts.
- Private review PNGs in `/private/tmp/help-discount-guide/` are native 2x:
  2880x2000 for desktop and 780x2000 for mobile, with Chrome's genuine embedded
  Display P3 Gamut with sRGB Transfer profile. No upscaling or profile relabeling.
  They are browser-review evidence, not new published product screenshots.
- `git diff --check` passed. The Rails application and server were untouched.
  The articles match the verified build byte-for-byte. This branch is prepared
  for a pull request; no deployed revision or public-site verification is claimed.
