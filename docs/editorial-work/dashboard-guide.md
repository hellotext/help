# Dashboard guide batch

## Source and current state

- Article key: `analytics-reporting-attribution/dashboard-guide.md`; Spanish and English published routes are `https://help.hellotext.com/es/guia-dashboard` and `https://help.hellotext.com/dashboard-guide`.
- `progress.csv` still records this pair as `pending`. The current translated bodies match the inventory's original SHA-256 values: Spanish `c22ca1802d0a4373c09b91e021b49eaed2dec97506a865cdc74f9854dbe63781`, English `b5aad25f2bdc33d0a11acb4c99d3f861219e6d173076ced09f28f046448b8a6d`.
- Before editing, the Spanish body, English body, and shared stub were copied byte for byte to `originals/dashboard-guide/`. Preserve titles, descriptions, slugs, existing links, both languages, and published state. The current bodies have the same 13 headings and 11 Liquid link targets per language, and no figures.
- The existing article branch `codex/help-editorial-dashboard-guide` was clean and fast-forwarded to `origin/main` at `a674158` after confirming Help PR 85 was merged and no Help PR remained open.

## Reader task and focused plan

The reader uses the Dashboard to notice a change, interpret its fixed 14-day overview and tracked actions, inspect scheduled or sent campaigns, and choose a detailed report. Correct any claims that differ from the current Rails implementation, starting with the campaign report's event-date grouping, the overview's zero-value behavior, the calendar's displayed range and interaction, and the complete set of report cards. Review the whole Spanish article first, then adapt the English article without changing its structure or existing link targets. Add direct guide links only where they help the reader move from the Dashboard to the named report or resolve a documented data gap.

Three potential figures answer distinct interface questions: (1) the 14-day KPI and benchmark cluster after the overview explanation; (2) the Actions table with safe demonstration event rows after the column explanation; and (3) the campaign calendar with synthetic scheduled and sent entries after its navigation instructions. A report-card crop is useful only if the actual Dashboard makes navigation unclear. Do not capture conditional account notices, private customer records, or a populated activity list. Use the real localized interface with a separate guarded synthetic fixture, crop each control or widget tightly, and save native Display P3 PNGs at 2× or higher for desktop and mobile. Every published figure must be static, unlinked, cursor-free by default, and readable inline.

## Evidence, dependencies, and verification still pending

- The Rails source audit is in progress. Preliminary source locations are `BusinessesController#show` for the Dashboard route, `Dashboard::OverviewsController` and `Dashboard::ActionsController` for the fixed business-timezone period, and `Calendar::CampaignDates` for the calendar. Do not treat the candidate corrections above as verified until the complete source review finishes.
- The isolated campaign-report capture database contains an April campaign but no representative current Dashboard metrics. A separate guarded synthetic Dashboard fixture is needed; no real account, contact, message, or campaign may be changed or sent.
- At 2026-09-26 06:18 UTC the Mac was locked, so native screenshot capture was unavailable. The user was asked to unlock it while text and source work continue. No Dashboard screenshot has been captured or published in this batch.
- Before changing sources, re-read both translated bodies and the stub. After changes, build both languages, verify the security headers and image bytes, inspect each complete page at desktop and 390px mobile widths, check article links and metadata, and record a verifying commit in `progress.csv`. PR, merge, Netlify deployment, and public checks remain pending until the complete bilingual article is verified.
