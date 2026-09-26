# Data completeness and reporting gaps batch

## Source and scope

- Article key: `analytics-reporting-attribution/data-completeness-and-reporting-gaps.md`.
- Spanish and English bodies and the shared metadata stub were preserved byte for byte under `originals/data-completeness-and-reporting-gaps/` before editing. Both translated source hashes matched `inventory.csv` on 2026-09-26.
- Public routes: `https://help.hellotext.com/es/integridad-datos-diferencias-reportes` and `https://help.hellotext.com/data-completeness-and-reporting-gaps`.
- The original state is published in both languages. Preserve title, description, slugs, links, section structure, language pairing, and publication state.

## Reader task and plan

The reader traces a missing metric or reconciles two reports. The current guide incorrectly says that all campaign clicks and attributed purchases are assigned to the original delivery date. Rails records campaign click and revenue metrics at event time; the campaign funnel engagement view is a separate dispatch-cohort calculation. It also describes demand insights as grouped by the request's start with later recovery, although its calculator selects completed interactions by `ended_at` and has no recovery metric. A purported standalone channel-performance report is actually the Revenue report's channel section, grouped by purchase date. Playbook results mix event-time metrics and revenue grouped by the credited source message, not a universal playbook trigger date. Incorrect date guidance can cause a reader to investigate the wrong period.

1. Correct the Spanish explanation of period types, campaign table row, campaign eligibility checklist, and campaign-versus-revenue comparison. Add one concrete delivery/purchase date example. Distinguish event date from dispatch-cohort funnel results.
2. Correct the playbook, demand-insights, and revenue-by-channel table rows and comparisons. Qualify the Dashboard's historical-event checklist, and make the demand eligibility description reflect the actual required interaction state and optional breakdown context.
3. Adapt the same corrections in English after reviewing the complete Spanish result.
4. Preserve the existing diagnostic path and every related link. Do not add a screenshot: this article compares report definitions and individual private records; the task is clearer through a dated example and the linked interface-specific report guides. No customer-facing message example is relevant.
5. Build the whole site, verify link targets and generated routes, review the complete articles in both languages at desktop and mobile widths, then update `progress.csv` with the verifying commit. Publication, Netlify deployment, and public checks require separate verification after merge.

## Verification and publication

- Pending article edits and verification.
