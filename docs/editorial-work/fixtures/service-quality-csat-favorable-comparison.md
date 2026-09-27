# Service Quality CSAT comparison for local screenshots

This fixture changes only nine synthetic CSAT outcomes in the isolated development database `hellotext_editorial_capture_20260926`, business ID 5. It supports the Service Quality report at the custom **September 11–24, 2026** period, compared with **August 28–September 10, 2026**. The source is the existing `design_system_reports_operations_` demonstration cohort in Rails. All affected attempts were already recorded without prompt, answer, or delivery messages. The fixture creates no contacts, messages, or sends and does not change the selected period or report code.

The real `Report::Widget::ServiceQuality::CustomerSatisfaction` groups positive and negative `Playbook::CSAT::Attempt` answers by `answered_at` and resolution path. Its teammate group combines `human_from_beginning` and `escalated_to_human`. The selected period has **42 positive / 14 negative = 75%**. The preceding period had **50 / 6 = 89.3%**, yielding a red −16% comparison. Nine prior-period positive outcomes changed to negative: seven escalated and two human-from-beginning. The preceding period is now **41 / 15 = 73.2%**, yielding a green **+2%** comparison. This is the minimum number of existing answers that must change to make the aggregate teammate comparison favorable. Both underlying teammate paths now have selected-period rates at least as high as their preceding rates.

The script checks the Rails environment, exact database and demonstration business, disabled delivery sources, custom date picker, source playbook, non-deliverable contacts, source interaction and attempt relationships, both period cohorts, and current widget values. It refuses unexpected records. It is idempotent and applies its direct column updates in a transaction without callbacks.

Run from the local Rails checkout at `/private/tmp/hellotext-editorial-screenshots-static`:

```sh
env REPORT_WIDGET_SAMPLES=0 DATABASE_URL=postgresql:///hellotext_editorial_capture_20260926 RAILS_ENV=development PATH=/Users/pel/.rbenv/shims:$PATH bin/rails runner /Users/pel/.codex/worktrees/dad4/hellotext-help/docs/editorial-work/fixtures/service-quality-csat-favorable-comparison.rb
```

Apply only after the dry-run gate passes by adding `EDITORIAL_FIXTURE_APPLY=YES_ISOLATED_DEMO_ONLY` to the same command. On September 27, the first dry run found nine answers to adjust; the apply changed nine; the second dry run found zero pending changes.

The actual `Report#widgets` presenter for the custom period returned:

| Widget result | Selected period | Previous period | Indicator |
| --- | ---: | ---: | --- |
| AI Agents CSAT | 81% | 71.4% | +13%, favorable |
| Teammates CSAT | 75% | 73.2% | +2%, favorable |
| Resolution path | 93 AI, 65 team | — | 59% AI, 41% team |

The CSAT current-period counts, AI comparison, and Resolution path remained as before. The running development server may keep an earlier widget payload in its five-minute in-memory cache; verify the visible indicators after expiration or a local server restart before a native screenshot.

The two widgets are paired in the report layout. A focused native screenshot showing **Resolution path** and **Customer Satisfaction** together would support the adjacent article sections, provided both complete cards and their labels remain readable at Help's maximum 810 CSS-pixel article width. Use one localized capture per language and place it after the Customer satisfaction explanation; the preceding Resolution path text can introduce the left card. If the paired view makes the values too small, capture the two cards separately near their respective paragraphs. Keep the figure's accessible context explicit that the values are fictitious demonstration data, not customer results.
