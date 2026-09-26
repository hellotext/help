# Visual follow-up after the first editorial batches

The 153 article pairs are tracked in `progress.csv`. As of Help `main` after PR #115, 14 pairs had passed a bilingual text/build/browser review, but only Campaign reporting and Segments had product screenshots in both languages. Tracked links uses its existing inline toolbar SVG, which is an icon rather than a screenshot. The other 11 pairs have no product image.

Four report guides explicitly identified a helpful interface capture and deferred it when a compliant native PNG could not be taken. Their published text corrections and verifying commits remain valid, while their full visual follow-up is `visual_pending`:

| Guide | Reader question for the capture | Existing record |
| --- | --- | --- |
| Dashboard | Where to read the 14-day KPI cluster, Actions rows, and campaign calendar with safe demonstration data? | `dashboard-guide.md` |
| Demand insights | Where are the selected metric, period, and breakdown? | `demand-insights-guide.md` |
| Performance report | Which metric selector and duration widgets correspond to the explanation? | `performance-report-guide.md` |
| Playbook reporting | Which localized report selection or comparison benefits from one focused real capture? | `playbook-reporting.md` |

Recheck each proposed figure against the complete current guide before capturing. Use the isolated local application and synthetic, populated data where the interface can be reproduced faithfully. The work records specify the original source audits and insertion questions. Capture Spanish first, then English; verify native PNG, Display P3, at least 2× density, provenance, privacy, inline readability, and public assets. Do not recapture text already verified unless a current product change requires it. If a proposed image no longer helps the reader, record the concrete reason in that guide's work record before closing its visual follow-up.

Seven other verified pairs intentionally use prose, tables, or links for conceptual or decision tasks: Analytics overview, Data completeness and reporting gaps, Sales attribution, Workload and capacity, Audience overview, Consent and subscriber status, and Lists and segments. Their work records explain the respective choice. Tracked links uses the small toolbar icon and exact button labels. The shared editorial guide calls for images only when they answer a reader question, so these eight pairs remain `local_verified` without a screenshot quota.

Service quality remains `pending` after its published factual correction because its own work record calls for a native capture and complete final review. Message editor basics and Shopify checkout also remain `pending` after focused fixes; their broader visual reviews are separate from the four report follow-ups above. Campaign reporting has seven localized figures per language, and Segments has three; their capture provenance is documented in their article records.
