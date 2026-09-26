# Service quality report guide batch

## Source and current state

- Article key: `analytics-reporting-attribution/service-quality-report-guide.md`; public routes are `https://help.hellotext.com/es/guia-reporte-calidad-servicio` and `https://help.hellotext.com/service-quality-report-guide`. Both returned HTTP 200 on 2026-09-26.
- The complete current Spanish and English bodies and shared stub were preserved byte for byte under `originals/service-quality-report-guide/` before editing. The body SHA-256 values match `inventory.csv`: Spanish `798a6bcd5ed78076e72eb37ff79488334cde6f7d39f3270bb327cccbddc07d4c`; English `816047216a38d178a5d15c4331be714c90e1db4de2fdc99c3c56c9683d1bfb2f`. The shared stub is `566e59dd7db5f663a97718ee75c89f75a96316573847300be60a466148ccff7f`.
- Each original body has 13 Markdown headings and nine Liquid article links; the seven related-guide links resolve. `progress.csv` marks this pair `pending`. The branch starts from `origin/main` merge commit `87525b6e838b29ee3f9b31ce572e02d17e28f7cd`. Preserve titles, slugs, language pairing, existing destinations, navigation placement and publication state.

## Reader task and article-specific plan

The reader selects a Service quality metric and period, interprets its trend, breakdown and response-time widgets, then checks representative conversations before changing a response policy, routing rule or team capacity.

1. Audit the complete Spanish guide against current Rails report calculators, widgets, section registry and locale labels. Resolve the preliminary source findings that **Resolved by team** is a percentage rather than a count, the opening uses an overly broad conversation-start date rule, and the current report may show a Customer Satisfaction widget. Verify exact source revision and user-facing terms before editing.
2. Distinguish the date basis of lifecycle headline metrics, SLA and survey/agent widgets as implemented. Explain denominators and what an unanswered or recent conversation means without promising that every report result stays assigned to its first day. Replace the vague “service-analysis window” sentence with a concrete, source-supported explanation.
3. Add one short diagnostic path after the metric or action section: select SLA compliance, compare one breakdown, use response-time distribution only as wait context (not an SLA rate), and inspect representative conversations. Expand FCR at its first mention and link the existing Workload & capacity guide where the text directs readers to the current queue.
4. Adapt the complete verified Spanish result in English. Preserve all existing links and add only the specific useful guide link. A focused localized screenshot of the real metric selector and breakdown would help readers orient themselves, but the Mac remained locked at 11:28 UTC. Do not substitute a browser JPEG, fabricated chart or unrelated report. Reassess native capture after the source correction; record an outstanding visual enhancement if text is otherwise complete.
5. Re-read both sources before saving. Run the Help build and security-header check, verify the full rendered ES/EN pages at desktop and mobile widths, and record the verifying content commit in `progress.csv`. Record PR merge and public verification separately.

## Checkpoint

The original bilingual article and stub are preserved, and the source audit is in progress. No article body has been edited, no capture has been made, and this pair remains `pending` until full bilingual review and verification.
