# Service Quality comparison data for local screenshots

This fixture is for the isolated development database `hellotext_editorial_capture_20260926`, business ID 5. It supports the bilingual Service Quality report screenshots at the custom **September 11–24, 2026** period. The report compares that range with **August 28–September 10, 2026**. It does not change the report renderer or force indicator colors.

The previous period originally yielded four unfavorable comparisons, despite the useful current-period team chart. The guarded script `service-quality-favorable-comparisons.rb` adds 20 historical **open** interactions to the existing Operations demonstration contacts and conversations, plus matching `interaction_started` source events. The contacts are unconfirmed and non-deliverable; the channel is inactive, the workflow and playbook are disabled, and the script does not create or send messages. It also changes six specifically identified, prior-period Operations SLA cycles from a 420-second met response to a 780-second breached response against their existing 600-second deadlines. Each adjusted cycle's response time, elapsed seconds, state and breach timestamp change together. All writes occur in one transaction via direct inserts or column updates without callbacks.

The script refuses a non-development environment, a different database or business, enabled delivery sources, unexpected source cohorts or changed target records. Each new event carries a unique editorial fixture key. A dry run reports the pending operations; a repeat after application reports zero pending operations.

Run from the local Rails checkout at `/private/tmp/hellotext-editorial-screenshots-static`:

```sh
env REPORT_WIDGET_SAMPLES=0 DATABASE_URL=postgresql:///hellotext_editorial_capture_20260926 RAILS_ENV=development PATH=/Users/pel/.rbenv/shims:$PATH bin/rails runner /Users/pel/.codex/worktrees/dad4/hellotext-help/docs/editorial-work/fixtures/service-quality-favorable-comparisons.rb
```

Apply only after the dry-run gate passes by adding `EDITORIAL_FIXTURE_APPLY=YES_ISOLATED_DEMO_ONLY` to the same command. On September 27, the first dry run found 20 interactions and six SLA adjustments; the apply inserted 20 interactions and 20 source events and adjusted six cycles. The second dry run found zero pending changes.

The exact `Report::DatePicker`, Service Quality calculators and `Report::Metric::Comparison` gave these values after application:

| KPI | Selected period | Previous period | Favorable change |
| --- | ---: | ---: | ---: |
| AI resolution rate | 43.5% | 40.6% | +7% |
| Resolved by team | 30.4% | 29.7% | +2% |
| SLA compliance | 75.0% | 73.7% | +2% |
| Unresolved rate | 26.2% | 29.7% | −12% (lower is better) |

All four comparisons returned `favorable=true` and `data=true`, so their native KPI indicator is green. The selected-period source counts remain 214 reportable interactions and 168 met of 224 terminal SLA cycles. Its team legend remains 80.4% for **Atención · Demo reportes** and 69.6% for **Ventas · Demo reportes**, with 14 plotted days. The five response-time buckets remain 16%, 22%, 20%, 15% and 27%. The favorable examples are fictitious and must not be presented as actual customer results. The running development server may retain an earlier metric payload in its five-minute in-memory cache; verify the visible four indicators after expiration or a local server restart before taking the native screenshot.
