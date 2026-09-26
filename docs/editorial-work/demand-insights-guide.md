# Demand insights guide batch

## Source and scope

- Article key: `analytics-reporting-attribution/demand-insights-guide.md`.
- The Spanish and English bodies and shared stub were preserved byte for byte under `originals/demand-insights-guide/` before editing. Their source SHA-256 values match `inventory.csv` on 2026-09-26: Spanish `8d38545bc1376ce9659061ca8d1947dc9027d95539167deec12b82b71ee1051b`, English `d68e63a098f28a634dd5e695b99239b30b180439b1cc3e0eef576957ff708a84`. The stub SHA-256 is `704592527c69f35e4d3c948db1f2b3b2e293ac66be872773c31d7b0951547b21`.
- Public routes: `https://help.hellotext.com/es/guia-insights-demanda` and `https://help.hellotext.com/demand-insights-guide`. Both are currently published. Preserve the titles, slugs, links, language pairing, and publication state.

## Reader task and article-specific plan

The reader opens Demand insights from Business Performance, chooses a period and metric, checks a trend or breakdown, and decides what source records to inspect before acting. The current article asserts that the report measures product-specific unavailable requests, request-start cohorts, recovery, lost product value, affected SKUs, and product-demand denominators. Rails master `6ea4ccbb208ad53f3c061691f3737b1e1902e259` instead implements generic interactions filtered by `ended_at`. Its numerator is an interaction resolved by AI or a person, or closed by automation, with no recorded conversion (`app/models/report/calculator/demand_insight/base.rb`). The GitHub deployment API provides no production Rails revision, so this is verified source behavior, not a claim about a known deployed SHA.

The four current calculations are interaction count; that count multiplied by an average positive tracked revenue amount (with a fixed fallback); distinct associated recommending Playbook IDs despite the **Affected SKUs** label; and interaction count divided by all ended interactions. The reason, product, store, region, intent, and commerce-context breakdown menus are seeded but have no strategy; Channel and AI-versus-human have strategy classes, yet some series use different cohorts or units. Evidence: `app/models/report/calculator/demand_insight/`, `app/models/report/calculator/demand_insight/breakdown/`, `db/seeds/reports.rb`, and `app/models/contact/interaction.rb` in the audited Rails revision. A product-demand, stock, SKU, or recovery claim would be unsupported.

1. Correct the complete Spanish explanation first, using only implemented metric populations and formulas. Replace the unsupported April request/recovery example with a small example tied to an interaction's end date and possible later conversion. Explain the **Affected SKUs** label limitation and remove action and troubleshooting advice that assumes stock, size, SKU, or product-price fields the report does not use. Treat empty breakdowns and noncomparable series explicitly.
2. Adapt the same verified explanation in English, preserving the article's useful navigation and all existing Liquid links. Correct only the factually inaccurate metadata descriptions; preserve both titles and slugs.
3. A focused, localized screenshot of the selected metric, period, and breakdown would help readers if a safe demonstration report can be captured natively. The Mac was locked during the 2026-09-26 07:26 UTC capture-readiness check, so no compliant native PNG is currently possible. Do not substitute a browser JPEG, a private report, or a recreated interface. Recheck capture readiness before finalizing the batch; if it remains unavailable, record the limitation and publish the verified text without an image.
4. Re-read both bodies immediately before saving, build the whole Help site, verify links and the metadata stub, review both complete rendered articles at desktop and mobile widths, and only then update `progress.csv`. Record local verification separately from PR merge and public checks.

## Current checkpoint

The original ES, EN, and stub snapshots exist. The Rails metric and breakdown audit is complete. No article body, asset, or publication state has been changed yet. Resume by revising the Spanish article, then adapting English.
