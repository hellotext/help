# Back-in-Stock Pounce: current screenshots and recipient example

## Current state

The bilingual pair has passed local QA on Help main `c19beab1ff9cb8d132d672a6a14b857b2dc1e646`, preserving the published Campaign correction. It includes 26 current native PNGs, 13 per language, presented as seven useful figures per article plus the early editable WhatsApp recipient example. All source captures use fictitious isolated data and current app revision `ef8a200330bc7be2ac07ea1d1541ae870e4bbdc7`.

The final production build and security-header check passed in 9.64 seconds. Local HTTP checked 62 resources and 58 article links. Six native browser views at 1440, 580 and 390 CSS pixels passed independent visual review: 83 complete-page segments and 42 figure details. The two overview figures remain legible at the narrow width; both desktop and mobile WhatsApp previews show the actual product, message and inert action. No article, image or shared style was changed after those checks.

`final-review.json`, `evidence-index.json` and the `validation/` receipts record the completed checks. `local-verification-committed.json` identifies the actual verifying commit when the inventory is closed; the preceding verifying commit retains the main inventory unchanged. The pair reduces the unresolved inventory from 32 to 31 after local closure. Publication and public URL/image verification belong to the separate authorised publication step and are not claimed here.

## Preparation history

Prepared locally from Help `7cc05346c0234fc76ab94db0e914b47313d5edad` on branch `codex/back-in-stock-captures-20261026`. Editorial rules are pinned to `d0ee357e45d2d14ae605081fc8fe20763b1bb4ba`. The current app source reviewed is `ef8a200330bc7be2ac07ea1d1541ae870e4bbdc7`.

After Campaign was published, this worktree incorporated main `7eaa9c049c7f4dc939184b1d739a72f7ff9aa47a`. All 25 prepared files were preserved. The two native BIS catalog blocks were appended intact to the current catalogs, keeping the published Campaign examples and all prior entries. Original snapshots and earlier receipts retain their historical hashes; `base-reconciliation.json` records the reconciliation. Main now has 32 unfinished pairs.

The pair was **paused in progress** while the authorised Campaign correction took priority. The following paragraph preserves that earlier checkpoint. The preserved checkpoint is `audit/bis-help-integration-20261026/pause-checkpoint-20261027.json` outside the candidate. The ES/EN copy has been recovered and refined; original article snapshots and editable recipient examples are saved. Both WhatsApp examples were validated/exported by the current isolated runtime owner and inserted after the introduction. The copy-only production build and security-header check pass. Thirteen reviewed current ES interface PNGs are now integrated as seven figures: overview, audience, discounts, store promotions, tone, Playground and contact activity. English captures are still being prepared. No complete visual page review, merge, deployment or public article verification is claimed by this record.

Published routes remain:

- English: `/back-in-stock-pounce`
- Spanish: `/es/vuelta-a-stock`

Titles, translated slugs, navigation group, icon, description, stub and publication state are unchanged. Each article retains its nine headings and 29 Liquid links in order, with every target present locally.

## Preserved inputs and copy changes

`captures/back-in-stock-completion-20261026/originals/` preserves the main ES/EN bodies, stub and inventory. `historical/` preserves the two unpublished bodies recovered from the October 11 preparation. `preservation.json` records their hashes. The historical worktree, captured PNGs and original app archive were read only.

The recovered copy explains the four actual configuration cards, qualified preview behavior, inferred product interest and the absence of a dedicated report. Current source supports those corrections. Three further sentences in each locale clarify that a generic waiting-list or form label is not sufficient: the integration must record a supported interest signal for the exact product. The affected sections are What it does, How to test it, and Why it may not send.

Source evidence:

- `app/models/artifact/product/restock_fanout.rb`: inferred wishlisted interest, current direct wishlist state, exact-product cart and product-view signals; no generic-form eligibility guarantee.
- `db/seeds/playbooks.rb`: outgoing Channel, Audience, Discount and Tone, in that order.
- `app/models/playbook/report.rb`: no BackInStockPouncer entry.
- `app/models/cg/composer/profile/back_in_stock_pouncer.rb`: one product-page URL action, supported preview facts and no invented stock quantity.
- `app/models/playbook/preview.rb`: own completed preview drafts and their real attached products; a preview is not a send.

The independently prepared audit `audit/help-resume-20261026/next-pairs/source-comparison.json` compares 164 relevant files with the previous app source. Its accompanying plan documents changed shared rendering and callback dependencies. It is not a claim of current pixel parity.

## Early recipient example

Decision: **include one useful WhatsApp example per language** immediately after the introduction and before the first configuration content. It explains the intended recipient experience before the guide introduces controls. Use the existing `messages` renderer, not a raster image of authored text.

Editable definitions:

- `captures/back-in-stock-completion-20261026/recipient-example.es.json`
- `captures/back-in-stock-completion-20261026/recipient-example.en.json`

The supported version-1 custom schema uses a single image message containing the actual product photo, a complete illustrative restock alert, and one inert product action. The fictitious business is Luma. The text does not imply a requested alert, reserved stock, a generated message, delivery or a successful purchase. The existing editorial renderer represents action labels as spans, without hrefs or sending forms.

The same-origin Help photo URL was fetched successfully and matched the existing committed asset byte for byte: SHA-256 `e398217cf498057fd0b06a879c3ce95e27c48a73ab46fee428bb1e55fdd51076`. The photo was inspected; it shows the mauve Crocs Classic Clog. No image was generated or edited.

`recipient-example-contract.json` binds validator/export/render sources, the verified image, exact introduction anchors and adjacent illustrative prose. The current isolated runtime owner completed both native exports with PostgreSQL read-only. The exact generated includes (`custom-1d37399b8498476e` ES and `custom-f7a216b444d71195` EN) and their unmodified YAML entries are now inserted. All 14 existing catalog entries in each locale were preserved; all 47 files in each source bundle were checked against its native receipt. See `native-export-import.json`.

The global Help stylesheet was preserved. The native export differs in screenshot link/expand, table and Action Text wrapper rules; none changes the message rules used here. Importing that stylesheet would replace Help's existing static image-frame treatment. Both shared JS files match the export exactly. No common example, font, preview file or generated markup was altered.

## Screenshot plan

All screenshots must come from the current real application, using isolated fictitious data and the approved visual reference. Keep the playbook disabled. No provider account, integration change, impersonation, AI generation, stock Fanout, campaign, customer event or message delivery is needed for this batch.

| Article section | Reader question | Native scene | Acceptance detail |
| --- | --- | --- | --- |
| How to configure it | Is this the correct playbook, and where are its settings? | Own inactive header and four configuration cards | Prefer one useful desktop figure when all four cards and identity fit; do not describe a two-card mobile crop as the full configuration. |
| Outgoing channels | Where are automatic/manual outgoing controls? | Own Channel panel | Complete heading and choices; badge text is not evidence of connection or reachability. |
| Audience | Where can inclusion/exclusion be configured? | Own Audience panel and relevant dropdown | Keep choices visible; do not imply an audience count or saved change. |
| Discounts | How do combined and store-offer strategies differ? | Own Discount panel | Recapture mandatory: the current store-promotions action is a settings icon with a Configure store promotions tooltip, replacing the old text button. |
| Discounts | What other strategies are available? | Remaining native discount choices | Add only if the preceding figure cannot show these choices legibly; no coupon/provider operation. |
| Tone | Which control guides the message voice? | Own Tone panel | Show the native choice limit and readable labels without claiming a save. |
| Playground instruction | What should the reader review before enabling it? | Own product/message preview | Complete product image, body and product action, with context identifying an unsent locally prepared example. |
| How to test it | How do the exact product's recorded signals appear? | Native contact activity showing wishlist then restocked | Same fictitious contact/product and coherent recent timestamps; not proof of Fanout, matching, generation or delivery. |
| Custom tracking explanation | Does event detail add useful source information? | Native event detail, if needed | Include only if product/date/action details add information beyond the activity view. |

Introduction and comparison sections are conceptual; the early message example supplies their useful outcome visual. Troubleshooting conditions and post-launch tracking remain source-backed prose and links. No dedicated Back-in-Stock report exists, so do not substitute another playbook's charts.

The 24 historical PNGs already have byte and pixel review records. This preparation does not repeat those reviews or admit the files as current UI. Their generic mobile header, two-card crop and shared controls have documented limitations. Capture current own controls during the new session; preserve historical sources as references.

## Initial isolated fixture handoff

The following preserves the preparation contract before the runtime owner executed it. Its conditional budgets are not final measurements; current execution and closure receipts will supply the actual results.

The existing read-only snapshot contains only the global BackInStockPouncer template, no own instance, no product attachment and no Composer previews. Confirm this again against the post-Campaign clone before preparation; do not create a duplicate instance.

Prepare an own disabled instance with four native components, one correct-price product and actual local photo, four native ES preview slots followed by four new EN slots, and two manually prepared wishlist/restocked events for the same product/contact. Use recent coherent dates; the October 8/9 values in the previous plan are stale. Omit an additional Contact::Interest row because it adds no visible event.

The fixture contract and helper are prepared separately under `audit/help-resume-20261026/next-pairs/fixture/` for runtime-owner review and binding. The 368-line helper has Ruby 4.0.9 syntax validation and 45 source pins; no helper phase has been executed for this pair. It requires the real runtime guard, post-Campaign baseline, current dates and private Disk bindings. The current conditional expectation is 39 new rows through ES plus signals, 59 with the EN append and seven retained jobs, with none performed; these are assertions to verify, not measured results. The old fixed 41/61-row budgets are obsolete because Category and Collection classification were removed; do not restore old taxonomy behavior or suppress callbacks to force those counts.

## Initial validation checkpoint

Completed: main/pin reconciliation; original preservation; current source comparison; editable JSON syntax/size checks; existing public product-photo byte comparison and inspection; ordered article links and headings; `git diff --check`; copy-only `yarn build` with Ruby 3.3.6 and security-header verification (10.42 seconds). Both routes were built, docs/AGENTS were excluded, and the built editorial JS modules and product image retained their source bytes. See `preparation-build.json`. The independent copy and payload review found no issues against the recorded article and payload hashes (`copy-independent-review.json`). After importing the native examples, a second `yarn build` and security-header check passed in 10.15 seconds. Static built-HTML checks confirm one complete example per locale, early placement, the verified existing photo URL, an inert action span, no outgoing figure links/forms, and preserved headings/links. These checks do not establish browser layout or loading; see `message-integrated-build.json`. The independent four-line-per-locale integration review also passed (`integrated-copy-review.json`), preserving the other 14 catalog entries per language. Final screenshot integration and visual QA remain required.

Pending: bind measured fixture execution and closure; finish current ES/EN desktop/mobile capture selection and source admission; inspect complete rendered pages and inert actions; normal Help production build and security headers; final source/PR reconciliation; authorised publication and public URL/image checks. The inventory remains `in_progress` until those gates are met.

## Current figure selection

The current plan selects configuration overview, audience, discounts, store promotions, tone, one Playground preview and recorded contact activity, subject to source admission and final article readability. The Channels closeup is omitted because its native incoming-reply explanation conflicts with the outgoing purpose. Its original pixels remain diagnostic references; the overview retains its native badge without presenting that badge as proof of filtering. Four similar Playground samples are not an image quota. The early native WhatsApp example explains the recipient result; the selected application view should teach where to review it. Event detail is added only when it supplies useful information beyond activity.

The UI instruction addendum names the current audience placeholder and promotions settings tooltip, repeats the actual three-tone limit beside its figure, and distinguishes recorded events from delivery. It preserves all nine headings and 29 ordered links in each language. Current capture and final browser QA are still in progress.

## Main update after the Campaign correction

The isolated Help branch now starts at published merge `c19beab1ff9cb8d132d672a6a14b857b2dc1e646`. The 47 prepared files were backed up before the update; 44 retained identical bytes, including all 13 admitted Spanish captures. The only overlapping files were the two visual catalogs and the inventory. Each catalog preserves all current main entries followed by the exact native Back-in-Stock block. The inventory preserves the corrected Campaign verification reference and keeps Back-in-Stock in progress.

`base-reconciliation-campaign-whatsapp.json` records the merge, preserved stash and byte comparisons. `originals-after-campaign-whatsapp-update/progress.csv` is a separate snapshot of that main revision; older originals keep their historical meaning. The final QA uses this new baseline and the previously reviewed focus-scroll correction. English source admission and final bilingual rendering remain pending at this checkpoint.


## Final capture and local QA

The Spanish gate and English gate admitted exactly 13 sources each. The English activity desktop capture with a floating control was rejected, preserved outside the selected set, and replaced by an independently reviewed native recapture. `source-manifest.json`, `source-pixels-es.json`, `source-pixels-en.json`, `source-admission.json`, `source-register.json` and `integration-record.json` bind the selected bytes. No pixels were edited, no historical source was silently admitted, and no private sidecar or session state was copied into Help.

The independent final copy review binds both final article hashes. Each locale retains its nine headings and 29 ordered Liquid links. Seven figures explain the overview, audience dropdown, discount strategies, store promotions, tone choices, WhatsApp Playground and recorded product activity. The native “All incoming channels” badge remains unchanged and is not treated as evidence of outgoing availability, filtering or delivery. Store-promotion state and its playbook toggle remain distinct; recorded product events and previews do not prove a send.

The final browser receipts verify the existing product photo from its exact local bytes, selected responsive sources, complete frames and captions, article overflow, the native message example, inert actions and keyboard focus without unwanted scrolling. All 125 page/detail PNGs were reviewed individually. Geometry and HTTP checks passed without runtime or interception-action errors. The native 4× source captures and browser 2× QA captures retain their Display P3 profiles.

The runtime owner closed capture services and preserved the isolated fixture: five completed phases, 59 new fixture rows, nine retained jobs comprising two prior jobs and seven fixture jobs, zero workers, performed jobs or failed jobs. The playbook stayed disabled. Since the English fixture there were no row, sequence, schema or queue changes; native cache changes are documented separately. No provider calls, new English logins or deliveries occurred. `runtime-closure.json`, `capture-closure.json` and `capture-services-closed.json` preserve the actual measurements, replacing the earlier conditional budget as final evidence.

The separate Help HTTP server and QA Chrome were also closed after the six captures. `validation/help-process-closure.json` records that only those owned process groups were terminated and that both PIDs and the two listeners were absent. No unrelated runtime, protected worktree, configuration, permission or automation was changed.
