# Campaign reporting batch

## Source and scope

- Article key: `analytics-reporting-attribution/campaign-reporting.md`.
- Spanish and English bodies and the shared stub were copied byte for byte to `originals/campaign-reporting/` before editing. The translated body hashes matched `inventory.csv` on 2026-09-26.
- Public routes: `https://help.hellotext.com/es/reportes-de-campaña` and `https://help.hellotext.com/campaign-reporting`. The inventory records the original published state; this batch is local only.
- Preserve titles, descriptions, slugs, existing links, language pairing, and publication state.

## Reader task and plan

The reader needs to choose the correct report period, interpret the summary and funnel, and investigate unexpected results. The current guide incorrectly assigns clicks and purchases to message delivery date throughout the campaign detail report, describes engagement as tracked clicks alone, and measures time to conversion from individual delivery. The current Rails report groups campaign metrics by each event's recorded time, groups engagement by message dispatch day, and measures time to conversion from campaign launch.

1. Correct the date examples and metric descriptions in Spanish, then adapt the English body.
2. Explain the funnel's engagement count and date grouping without implying a single cohort across all stages.
3. Correct the related date sentence in the completed analytics overview, which repeated the same error; retain its existing links and scope.
4. Check both articles in both languages in the built site on desktop and mobile. No screenshot is planned: the safe campaign fixture has not produced a verified native Display P3 capture at 2× or higher, and the prose can explain the date behavior directly. No message example is needed.

The source check also identified the same obsolete delivery-date claim in the pending Dashboard, data-completeness, and Revenue report guides. They remain pending full bilingual review in later batches; their exact locations are `_i18n/{es,en}/analytics-reporting-attribution/dashboard-guide.md:113`, `data-completeness-and-reporting-gaps.md:44,119,122,166`, and `revenue-report-guide.md:9-13,67` as of this batch.

## Verification and publication

- The report's date and metric descriptions were checked against the Rails source snapshot at commit `449d6ccc46`. `Campaign::Metric` buckets results by `tracked_at` (`app/models/campaign/metric.rb`); attributed purchases enter the campaign metric at the purchase event time (`app/models/attribution/revenue/capture.rb`); the campaign detail uses those event buckets (`app/models/report/calculator/campaign/base.rb`). The separate campaign index can use a source-message cohort and is not the page documented here. CTR and conversion use selected-range deliveries as denominators, so they can show zero in a range with later clicks or purchases but no deliveries (`app/models/campaign/reports/broadcast.rb`, `app/models/report/calculator/campaign/conversion_rate.rb`).
- `app/models/report/widget/campaign/delivery_funnel.rb` combines event-date metric counts with distinct engagement from `Message::DailyRollup`; that rollup uses the business-local dispatch day and includes seen, clicked, or replied messages. `app/models/report/widget/campaign/time_to_conversion.rb` filters attributed purchases by purchase date and measures elapsed time from campaign launch or its available fallback anchor.
- In message rows, the ROI numerator is selected-range revenue, while the estimated delivery cost is for the full message (`app/models/campaign/reports/broadcast.rb`). Segment memberships are snapshotted at purchase time and can overlap, so segment shares need not total 100% (`app/models/attribution/revenue/capture.rb`, `app/models/report/widget/revenue_by_segment.rb`).
- The Spanish body was corrected first and the English body adapted. Both preserve the 11 original article sections and 10 Liquid links, with no missing source targets. The shared stub was unchanged. The related overview correction preserves its 28 Liquid links per language, with no missing source targets.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed, including `script/verify_security_headers.rb`. The built Spanish and English campaign pages and analytics overviews were reviewed in the in-app browser at 1280px desktop and 390px mobile widths; none had horizontal overflow. The corrected paragraphs, funnel, later sections, related links, and page endings rendered in both languages. No new screenshot or message asset was needed.
- The plain local server does not emulate production's extensionless URLs. Source Liquid targets and built `.html` pages were checked instead of testing those links through the static preview.
- The public pages remain at their original publication state. The verifying local commit will be recorded in `progress.csv`; no push, merge, deployment, or public verification occurred.
