# Performance and Service Quality capture fixtures

These records belong only to the isolated local Rails database `hellotext_editorial_capture_20260926`, development environment, business ID 5. The script gates that exact database and checks the existing Operations fixture, inactive channel, disabled workflows and playbooks, and non-deliverable contacts before any write. It uses direct inserts and column updates without callbacks. It neither sends nor schedules messages.

From the local Rails checkout at `/private/tmp/hellotext-editorial-screenshots-static`, dry-run first:

```sh
env DATABASE_URL=postgresql:///hellotext_editorial_capture_20260926 RAILS_ENV=development PATH=/Users/pel/.rbenv/shims:$PATH bin/rails runner /Users/pel/.codex/worktrees/dad4/hellotext-help/docs/editorial-work/fixtures/performance-service-quality-enrichment.rb
```

Apply only after the gate passes by adding `EDITORIAL_FIXTURE_APPLY=YES_ISOLATED_DEMO_ONLY` to that command. The first SLA selection uses the Operations source, September 1–24, fixture contact indexes 3/7/11/15 and the seed's `(Julian day + contact index) % 5 == 3` response slot. It asserts exactly 20 intended cycles before APPLY and accepts only their original 7-minute met state or the already adjusted 13-minute breached state. The 14 later daily adjustments use exact fixture contact indexes and dates, require eight Operations cycles per team per day, and validate each original or final timestamp/state pair. Database row IDs never determine eligibility. An unexpected cohort, status or response distribution rolls back the transaction. A second run adds no records or updates. Adapt the checkout paths when reproducing this in another local workspace.

## Verified state on 2026-09-27

- Added 96 non-messageable, unconfirmed demonstration contacts, one closed conversation and one resolved interaction per contact, plus 240 inert interaction events. Duration buckets derive from the actual start and end timestamps: 36 in 1–3 days, 28 in 4–7 days, 20 in 8–30 days, and 12 in 30+ days. Their dates are August 10–September 24; every end is historical.
- Adjusted the 20 deterministically selected Operations demo SLA cycles for the second demo team from a 7-minute met response to a 13-minute breached response. The response timestamp, elapsed seconds, deadline and breach state remain consistent. No new SLA obligations were fabricated.
- Adjusted 14 more existing Operations demo cycles: seven met responses became breached and seven breached responses became met. The script updates `responded_at`, elapsed seconds, state and breach timestamp together. The previously flat 12/16 daily SLA result now varies as 11, 12, 11, 11, 12, 13, 12, 11, 12, 13, 12, 12, 13 and 13 met responses from September 11–24. Each team has four observed daily rates, with 8 cycles per team/day. The period total remains 168/224 (75%), with 90/112 (80.4%) for the first team and 78/112 (69.6%) for the second.
- Rails `Report::Widget::HumanDriven` with custom August 10–September 24 shows 144 same-day, 18 in 1–3 days, 14 in 4–7 days, 10 in 8–30 days and 6 in 30+ days. The corresponding display values are 75%, 9%, 7%, 5% and 3%.
- Rails `Report::Widget::ServiceQuality::ResponseTimeDistribution` with custom September 11–24 now shows 26, 36, 32, 25 and 43 samples in its five ascending response ranges (16%, 22%, 20%, 15%, 27% as displayed).
- The source data were read from Rails presenters, not inferred from a rendered graphic. Review the actual localized report and recalculate counts after any later seed or date-range change. The account still contains one unrelated subscribed contact; the script never selects or changes it.

The selected periods and counts are screenshot provenance, not customer outcomes. Use a real native P3 capture of the localized UI and verify the article at desktop/mobile sizes before marking the visual work complete.
