# Review Builder and CSAT Pulse linked reporting errata

The P2 review of Help PR #186 exposed linked feedback-guide claims that conflict with the current Rails reporting registry. Both `journeys/review-builder-playbook.md` and `journeys/csat-pulse-playbook.md` remain `pending` for their complete ES/EN interface and native visual reviews. This follow-up changes only unsupported reporting/export claims so readers are not sent to nonexistent merchant reports.

The complete current Spanish, English and shared-stub originals are under `originals/choose-first-feedback-errata/`. SHA-256:

| Article | Spanish | English | Shared stub |
| --- | --- | --- | --- |
| Review Builder | `acce812825291501fa40dce91da2ef2416c9d626f4962865f224cb9d4113f440` | `77798d4425d14a74729c569c4bb2c8f83b9da469a64a17bfe15a5485969c532d` | `a9105f803af6c4ba4f6a535d755defb3b299378f3893d5e29cafa77059ca519a` |
| CSAT Pulse | `b6dbbb814570423e6b5ae88006064c101421f81d15b205a0d5fe36e6c15c5e8b` | `f2fc65dff35c16e5904075223b8eacca29ecc1382779de899b562884d9c13916` | `0cd97701c229d50831a99b78d65feacc77429d4349da21625b9b495dac77e1cb` |

Rails revision `d348bd09825d62c2cf551757598ed04a4bca0ce6` excludes both playbook types from `Playbook::Report::IDENTIFIERS_BY_TYPE`. `Report::Export::KINDS` does not offer a review-results export. Service Quality's Customer Satisfaction widget shows aggregate positive share by AI-agent versus teammate resolution path; it is not a CSAT playbook-specific response-rate, channel, agent, intent or playbook report. Review Builder attempts are persisted, but a merchant-facing outcome report was not found. Preserve titles, slugs, links, language pairing, draft and publication state; do not mark either pair fully verified.

For visual coverage, both guides still need their own real interface captures of setup and message controls, plus any supported result view that actually exists. A fabricated report screenshot would mislead. The native capture helper remains blocked by automatic review because it enumerates all visible Chrome windows; do not retry without a verified safe change in scope.

## Local verification and remaining limit

The bilingual Review Builder and CSAT source corrections were checked against the Rails classes above and reread as complete articles. The Jekyll build and security-header check passed. All four rendered preview routes returned HTTP 200 with correct titles, headings, locale links, focused Service Quality/NPS links and the supported results-access limits. `git diff --check` passed. The shared stubs are unchanged.

New visual inspection at 1440×900 and 390×844 was blocked because the in-app browser was unavailable and automatic approval review rejected browser-surface enumeration that could expose personal windows. An isolated local headless Chrome launch exited 134 before it could provide a layout check. No CSS, template or image changed; do not claim visual completion of these two pairs. Their native interface captures remain outstanding and both progress rows stay `pending`.

The focused bilingual corrections and original snapshots are in commit `79f99433` (`Correct feedback report availability across guides`). Pending PR review, merge and public ES/EN verification. Record the actual publication separately.
