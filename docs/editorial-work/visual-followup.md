# Visual follow-up after the first editorial batches

The 153 article pairs are tracked in `progress.csv`. As of Help `main` after PR #115, 14 pairs had passed a bilingual text/build/browser review, but only Campaign reporting and Segments had product screenshots in both languages. Tracked links uses its existing inline toolbar SVG, which is an icon rather than a screenshot. The other 11 pairs had no product image at that historical checkpoint.

At that first audit, four report guides identified a possible interface capture and deferred it when a compliant native PNG could not be taken. Their published text corrections and verifying commits remained valid:

| Guide | Reader question for the capture | Existing record |
| --- | --- | --- |
| Dashboard | Where to read the 14-day KPI cluster, Actions rows, and campaign calendar with safe demonstration data? | `dashboard-guide.md` |
| Demand insights | Where are the selected metric, period, and breakdown? | `demand-insights-guide.md` |
| Performance report | Which metric selector and duration widgets correspond to the explanation? | `performance-report-guide.md` |
| Playbook reporting | Which localized report selection or comparison benefits from one focused real capture? | `playbook-reporting.md` |

Recheck each proposed figure against the complete current guide before capturing. Use the isolated local application and synthetic, populated data where the interface can be reproduced faithfully. The work records specify the original source audits and insertion questions. Capture Spanish first, then English; verify native PNG, Display P3, at least 2× density, provenance, privacy, inline readability, and public assets. Do not recapture text already verified unless a current product change requires it. If a proposed image no longer helps the reader, record the concrete reason in that guide's work record before closing its visual follow-up.

Seven other verified pairs intentionally use prose, tables, or links for conceptual or decision tasks: Analytics overview, Data completeness and reporting gaps, Sales attribution, Workload and capacity, Audience overview, Consent and subscriber status, and Lists and segments. Their work records explain the respective choice. Tracked links uses the small toolbar icon and exact button labels. The shared editorial guide calls for images only when they answer a reader question, so these eight pairs remain `local_verified` without a screenshot quota.

Service quality remains `pending` after its published factual correction because its own work record calls for a native capture and complete final review. Message editor basics and Shopify checkout also remain `pending` after focused fixes; their broader visual reviews are separate from the four report follow-ups above. Campaign reporting has seven localized figures per language, and Segments has three; their capture provenance is documented in their article records.

## Reconciled visual queue — 2026-09-27

| Pair | Current status | Next action or decision |
| --- | --- | --- |
| Dashboard | `local_verified` | Five localized figures per language are merged and publicly verified. The later trend correction was also published; see `dashboard-guide.md`. No visual follow-up remains. |
| Playbook reporting | `local_verified` | No new figure: this cross-report comparison has no unique screen to capture. A generic card image would duplicate the Dashboard guide, and a type-specific mission report would misrepresent the other types. The dated example and links to the detailed report guides carry the explanation; see `playbook-reporting.md`. |
| Demand insights | `visual_pending` | Capture the selected metric, period and breakdown in the isolated local report, Spanish then English, after native capture preflight passes. |
| Performance report | `visual_pending` | Capture the metric selector and duration widgets with varied, safe synthetic durations, Spanish then English, after native capture preflight passes. |
| Service quality | `pending` | Capture localized SLA compliance selection/breakdown and the distinct response-time distribution widget, then complete the bilingual article review; see `service-quality-report-guide.md`. |

At 03:49 UTC the macOS session was locked, so the native ScreenCaptureKit preflight stopped before the helper listing, permission check or any capture. Do not retry this same lock state in each scheduled run. Resume the three remaining report capture tasks only after the session is unlocked; verify Screen Recording permission and run the helper `--list --title EXACT_TITLE` with a 15-second limit for the dedicated local window before opening a report for capture. The filtered mode does not enumerate other Chrome titles. No fixture, contact, campaign or message was changed in this audit.

At 06:05 UTC the session was still locked. The Service quality fixture audit nevertheless confirmed that the isolated local `hellotext` business already has populated SLA/team and five-bucket response-time data; no seeding is required. Use the historical period and safeguards in `service-quality-report-guide.md` after unlock. This preparation does not change its `pending` status or close the two `visual_pending` pairs.
