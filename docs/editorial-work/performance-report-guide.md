# Performance report guide batch

## Source and current state

- Article key: `analytics-reporting-attribution/performance-report-guide.md`; public routes are `https://help.hellotext.com/es/guia-reporte-rendimiento` and `https://help.hellotext.com/performance-report-guide`.
- The complete Spanish and English bodies and shared stub were preserved byte for byte under `originals/performance-report-guide/` before editing. The body SHA-256 values match `inventory.csv`: Spanish `c1482eb75de95a886168ccc2aa0ab665a331d8fed87b0a27549a0687b5c17c97`, English `d6d09f6249c295478d3c40965430183cf8c6fa0b8e2f4441df31974e29e31d32`; stub `f8aec152627ce8ae96745faf5bf3ce034f7cf90af42d2ae7929be3e5683973f5`.
- Both routes are published and returned HTTP 200 on 2026-09-26. Preserve the titles, slugs, language pairing, links, navigation group, and publication state. The original bodies have eight section/subsection headings and ten Liquid links per locale; every linked source exists.
- `progress.csv` marks this pair `pending`. This batch starts from `origin/main` merge commit `b3bd889e11b967448609050bb83a69908c03f951` on `codex/help-performance-report-guide`.

## Reader task and article-specific plan

The reader selects a Performance metric and date range, interprets its headline, chart, breakdown and duration widgets, then checks source interactions before changing a Playbook or team workflow. The original guide equates interactions with unique conversations and registered conversions with completed purchases, treats breakdown counts as per-group rates or average durations, and describes both duration widgets as conversion-only. Those claims differ from Rails master `6ea4ccbb208ad53f3c061691f3737b1e1902e259`; the deployed Rails revision is not known.

1. Correct the complete Spanish guide first. Define Conversion rate as interactions with `converted_at` divided by all interactions started in the range; a manual goal can set conversion. Define Escalation rate as interactions with `escalated_at` divided by the same start-date cohort; a teammate's participation alone does not set it. Describe the visible Time to conversion headline as the average from start to conversion for converted interactions without explicit AI escalation. Avoid presenting it as a combined mean.
2. Explain that implemented breakdowns plot counts of converted or escalated interactions, rather than a rate or duration per category. The seeded reason, team and AI-agent escalation breakdowns have no Performance strategy; a blank result is not evidence of zero activity. AI-versus-human breakdown classification differs from the escalation split in the two duration widgets.
3. Correct the widget explanation: the AI-only and team-managed charts group bucketed interactions by time from start to termination, including closures without conversion. A late conversion does not recalculate a sealed duration bucket. Keep the useful dated example but apply it only to metrics for which it is true. Correct the Campaign comparison to event-date reporting and the awkward revenue wording.
4. Adapt the full verified Spanish result in English. Change metadata descriptions only if needed for factual accuracy. Keep every existing link, title, slug, language, and published state. Make only narrow bilingual corrections in linked guides where they would directly contradict the corrected Performance explanation; preserve their current bodies first and keep their separate editorial progress status.
5. A focused metric selector/chart or duration-widget screenshot would help if the real localized demo report can be captured natively. At 08:29 UTC the Mac was still locked, so no compliant Display P3 PNG could be made. Do not substitute a browser JPEG or invented chart. Recheck capture readiness before finalizing; a text-only factual correction can proceed if native capture remains unavailable.
6. Re-read current sources before each save, run the full Help build and security-header check, verify headings, links, metadata and rendered ES/EN pages at desktop and mobile widths, then record the verifying content commit in `progress.csv`. Record PR merge and public verification separately.

### Linked-guide consistency scope

The current Analytics overview describes the two duration widgets as conversion paths; Data completeness calls the Performance cohort a conversation-start cohort; Dashboard assigns all Campaign outcomes to delivery date; and Revenue gives the same incorrect Campaign date example. These are direct contradictions of the corrected Performance and Campaign detail explanations. The complete current Spanish and English bodies of those four guides were copied before editing to `originals/performance-report-guide/related/`. Their SHA-256 values are:

| Guide | Spanish | English |
| --- | --- | --- |
| Analytics overview | `50cce4aeb8d512d753d139dabf153571565d34653699d14e706d8a2c6c95550e` | `79ef71565e21869e775dfe9b16aedb1216bf345e83b4fe16819e2f4a817f194a` |
| Dashboard | `a3c8d66f37f6a4f911ec1d9383c56dc522ec483a11602be1486504164fb25424` | `82ee0a0be3ffb703c7e583f61ce0cf17c700027acd3c828616986d3cfd5d7ef5` |
| Data completeness | `30171311e610b5bc9b988748567733504a3f044da53a1f5d55760733a59bd3fb` | `8014a1920d79f8627e6d275b68c93b02b04431f5f7a1894ea3b91dbd3503f5ec` |
| Revenue report | `08f16700c282dec3408b81e75c5a9b70cff43f3a130114878926d5c60e3af56c` | `f07149dbe437b26b673d36a1f25b79e329bcf35a548d060b795c8fcaad47d9f1` |

Correct only those specific statements in both languages, preserving other sections, links, figures, metadata and publication state. Analytics overview and Data completeness already have `local_verified` progress rows; their verifying commit references will need updating. Dashboard and Revenue remain `pending` for their own full editorial reviews. Playbook reporting has additional old Performance claims but is the next pending full article after this one; leave it for that batch and record the dependency.

## Source audit and implementation caveat

- Rails `Report::Calculator::{ConversionRate,EscalationRate,TimeToConversionAvg}` and `Contact::Interaction` implement the headline population and fields. Conversion can be recorded manually, and an interaction can exist without a conversation. `TimeToConversionAvg` computes separate no-escalation and escalated means, but the report metric card and chart presenter use only its primary no-escalation value.
- `Report::Widget::{AIOnly,HumanDriven}` query interactions with a non-null duration bucket, not only converted interactions; `Contact::Interaction` seals that bucket at resolution, automation close or conversion. The report's Performance breakdown registry implements channel, Playbook, Campaign, AI-versus-human and teammate strategies; other seeded options can return empty. The implemented breakdowns plot counts for these metrics.
- `Report::DatePicker` supplies dates to the Time to conversion headline, whose range is not normalized to the selected end day's end, while chart buckets use explicit day boundaries. This may exclude much of the last day from the headline. Treat it as a Rails implementation issue and avoid promising identical card/chart cohorts without a product fix.
- The Campaign detailed report uses each event's date for deliveries, clicks and attributed purchases. A separate source-message cohort exists, but the guide must not present every Campaign outcome as assigned to its delivery date.

## Current checkpoint

The original snapshots and source audit are complete. No article body or metadata has been edited, no image captured, and no publication action taken. Resume with the Spanish rewrite and narrow related-guide consistency decisions, then adapt English and verify.
