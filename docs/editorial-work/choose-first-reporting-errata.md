# Playbook reporting feedback-report erratum

## Trigger and source

The automated review of Help PR #186 found a P2 contradiction: the corrected NPS guide says no dedicated NPS report exists, while the published Playbook reporting guide directs readers to one. The Playbook reporting pair is already `local_verified` and published; this is a targeted new factual correction, not a repeat of its complete editorial review.

Current Spanish, English and shared-stub originals were preserved before editing under `originals/choose-first-reporting-errata/`. SHA-256: Spanish `c9e730149f4349cd4a521df336c970a5967f14bc1c369637b78f8665c9478549`, English `c9a1571d9feca6d3309dd4a9bd98bb57104f77bba2cf00592a2d1b4585ba376d`, stub `8d17638a754ccf40affd927b031fbd050c86381acca3343eff3d8fc34041e522`. Preserve titles, slugs, language pairing, links, publication state and report comparison structure.

Rails revision `d348bd09825d62c2cf551757598ed04a4bca0ce6`: `Playbook::Report::IDENTIFIERS_BY_TYPE` includes neither Review Builder, NPS Pulse nor CSAT Pulse, and `PlaybooksController#set_playbook_report` rejects unregistered types. The Service Quality report does expose aggregate Customer Satisfaction. NPS stores score and bucket internally but sends no automatic detractor recovery. Consequently, the guide must not promise dedicated feedback-playbook outcome reports, a visible NPS response/bucket aggregate, or an automatic NPS recovery path.

## Section-specific correction and visual decision

- **Where to start:** Keep the existing three playbook links but distinguish their feedback purposes from dedicated reports. Link Service Quality for the aggregate CSAT panel.
- **Troubleshoot results:** Replace rows that imply unavailable review/NPS/CSAT reporting with checks for an expected prompt and the actual aggregate CSAT widget. State that low-score NPS follow-up is arranged separately. Keep missing-CSAT-prompt checks separate from low Customer Satisfaction: the latter is the positive share of received answers and calls for reviewing negative-answer conversations and service outcomes.
- **Other sections:** Preserve the verified date, revenue, performance, attribution and comparison explanations.

No screenshot is added: the correction is about which report exists, and a single screenshot of Service Quality would imply the other feedback types share its metrics. The existing Playbook reporting visual follow-up decision remains valid.

## Local verification and remaining limit

The complete current Spanish and English article bodies were reread with the focused changes above. `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed both languages and the security-header check. The six affected rendered preview routes, including this guide in ES/EN, returned HTTP 200 with correct headings, report limitation text, locale links and focused destinations. `git diff --check` passed.

New visual inspection at 1440×900 and 390×844 could not run: the in-app browser was unavailable and automatic approval review rejected browser-surface enumeration because it might inspect personal windows. An isolated local headless Chrome launch also exited 134 before creating a screenshot. No CSS, template or image changed; the reporting guide's previous desktop/mobile visual verification and section-level no-figure decision remain in its existing record. Do not claim new visual verification from this follow-up.

The source-backed correction and original snapshots are in commit `79f99433` (`Correct feedback report availability across guides`). Pending PR review, merge and public verification. Keep this already-reviewed article's `local_verified` status; record the focused erratum commit separately rather than claiming a new complete visual review.

A later automated review of PR #187 identified that the first low-CSAT troubleshooting row listed trigger and deduplication checks, which explain a missing prompt rather than a low positive-answer share. The bilingual table now has separate rows for a missing CSAT question and low Customer Satisfaction; the latter points to negative answers and the original conversations. Rebuild and inspect the rendered table before merge.
