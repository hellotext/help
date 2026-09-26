# Sales attribution guide batch

## Source and current state

- Article key: `analytics-reporting-attribution/sales-attribution.md`; public routes are `https://help.hellotext.com/es/como-atribuimos-las-ventas` and `https://help.hellotext.com/how-we-attribute-sales`. Both returned HTTP 200 on 2026-09-26.
- The complete current Spanish and English bodies and shared stub were preserved byte for byte under `originals/sales-attribution/` before editing. The body SHA-256 values match `inventory.csv`: Spanish `8d9bcbd691990637f8470b146c732c90d1168553bdb899d4fbb34f68028a43fa`; English `6529afdac8392cfc55a3ddc1a7b8e8930484a0b60f9c2b1864c4ddd50196b8d8`. The shared stub is `ae2c19e8c024c64ba0f136f1a9293c9e528c00c8f3056fff67607c437fdbb4cf`.
- Before editing, each body had 26 Markdown headings and ten Liquid article links; all link targets existed. `progress.csv` marked the pair `pending`. The article branch started from `origin/main` merge commit `8b345faa5ebc10a1facf0e0645ce53e1f7386277`. The published titles, slugs, language pairing, navigation placement, and existing destinations were preserved.

## Reader task and article-specific plan

The reader needs to understand whether an individual sale qualifies, which source wins, how much revenue receives attribution, and where to inspect an uncertain decision.

1. Audit the complete Spanish article and its precise rule claims against Rails: source precedence; default windows; catalog engagement qualification; Webchat item and quantity limits; commercial-driver and human-checkout exceptions; order changes; and export evidence. Clarify that eligible delivery may qualify without a click, but delivery does not prove that the customer read the message.
2. Add a compact reader-facing decision sequence near the opening, with links into existing detailed sections if useful. Clearly distinguish the ten-minute catalog-engagement qualification from the seven-day and 24-hour attribution windows. Keep the partial Webchat amount example and the exceptional cases, while trimming duplicated explanations and examples that add no new decision information.
3. Correct the Webchat bundle quantity rule if the Rails audit confirms that separate exact-zero promotional rows may qualify at catalog value. Ask for only the customer identifier Support needs when investigating an order. Prefer clear Spanish terms while preserving named product and interface terms.
4. Adapt and fully check the verified Spanish result in English. This is a conceptual methodology guide; no product screenshot is required to explain its rules. Do not force a capture of customer orders or export rows while the Mac is locked. If a visual is useful, use accessible text or a small native Markdown table.
5. Re-read both sources before saving, run the full Help build and security-header check, verify links, headings, metadata and complete rendered ES/EN pages at desktop and mobile widths, then record the verifying content commit in `progress.csv`. PR merge and public verification are separate steps.

## Source audit

- Rails `master` at `6ea4ccbb208ad53f3c061691f3737b1e1902e259` was inspected read-only. The deployed Rails revision was not independently established. The passive Campaign and proactive Playbook resolvers require an eligible delivered message for the same contact inside the window, without a read receipt or a separate visibility predicate. `app/models/attribution/engine/preflight/{campaign,playbook}_resolver.rb` and `app/models/message.rb` establish that distinction.
- `app/models/attribution/engine/preflight/bundle_suggestion_resolver.rb` caps paid units by the supported cart addition but counts separate exact-zero promotional rows for the same product at catalog value. `app/models/attribution/engine/continuity.rb` requires a teammate- or operator-created replacement to carry a proven prior attribution with a capped amount. `app/models/attribution/revenue/capture.rb` requires a custom monetary action to be a goal before attribution, even though `app/models/track/revenue/capture.rb` can include a positive non-goal custom action in total merchant revenue.
- The remaining precise rules on source chronology, windows, catalog engagement, commercial action, cancellation and export were checked against the current Rails source; the audit found no further material mismatch. An independent bilingual editorial review and a post-edit source review checked the revised text.

## Local verification (2026-09-26)

- Corrected the complete Spanish guide first and adapted it in English. The article now explains eligible delivery without implying that the recipient read the message, distinguishes the ten-minute catalog engagement condition from the seven-day purchase window, covers the Webchat zero-value item exception, names the replacement-order condition, and distinguishes custom monetary goals from non-goals. A short review sequence helps readers apply the rules; three repetitive examples were removed per locale. Spanish prose uses “enlace” where it is not an existing guide title.
- The published titles, slugs, language pairing, navigation placement, metadata and all ten Liquid destinations per locale are unchanged. Both complete bodies have 23 Markdown headings and all linked source files exist. The shared stub is byte-identical to its original snapshot.
- `PATH="/Users/pel/.rbenv/shims:$PATH" BUNDLE_PATH="/Users/pel/.codex/worktrees/dad4/hellotext-help/vendor/bundle" yarn build` passed, including `script/verify_security_headers.rb`. Both `.html` routes rendered with the correct `lang` attribute, all revised passages and their complete article endings; `docs/` was absent from `_site`.
- The local pages were checked in the in-app browser at 1280px desktop and 390px mobile. Their opening screens were visually reviewed in both languages. At mobile width the article text renders at 16 CSS pixels inside a 358px article; neither locale has horizontal overflow (`scrollWidth = innerWidth = 390`). The complete rendered article and its final related-guide links were inspected in both locales.
- No screenshot was added. This article explains a conceptual methodology and its partial-revenue example in accessible text. A product capture of customer orders or export rows would add privacy risk without clarifying the rules, and the Mac was locked for native Display P3 capture.
- The verifying bilingual content commit is `fece70b`. This is a locally verified article, not a public publication of these changes.

## Current checkpoint

The bilingual article is locally verified, integrated, and publicly verified. `progress.csv` records eight locally verified pairs, 145 pending pairs, and one redirect outside scope; it intentionally uses local editorial status rather than a publication flag. Revenue and Dashboard remain pending their complete reviews and safe native screenshots.

## Public verification (2026-09-26)

- Help [PR 94](https://github.com/hellotext/help/pull/94) merged the three individual commits with merge commit `019bee5ee51dc75ad8fb6a0bcdac1865bd4980cd` at 10:47 UTC. Build, Aikido Security, Netlify preview and header checks passed. The Netlify preview returned HTTP 200 in both languages and contained the revised delivery, zero-value and custom-goal statements.
- The Codex review raised a P2 comment claiming `fece70b` was unreachable. GitHub's [remote comparison](https://github.com/hellotext/help/compare/fece70b920d2caed26c0e881cbf5d9a19665b517...b835a6ccc9bb26448d07f7696fd07b730b12ef5d) confirms that it is the direct parent of the reviewed PR head. The evidence was posted in the review thread, which was resolved without a code change; mergeability was rechecked afterward.
- The [main Build run](https://github.com/hellotext/help/actions/runs/36236824578) passed for the merge commit. At 10:48 UTC, Netlify served the [Spanish guide](https://help.hellotext.com/es/como-atribuimos-las-ventas) and [English guide](https://help.hellotext.com/how-we-attribute-sales) with HTTP 200 and the corrected localized text. No manual deployment occurred.
