# Playbook reporting batch

## Source and current state

- Article key: `analytics-reporting-attribution/playbook-reporting.md`; public routes are `https://help.hellotext.com/es/reportes-de-misiones` and `https://help.hellotext.com/playbook-reporting`.
- The complete current Spanish and English bodies and shared stub were preserved byte for byte under `originals/playbook-reporting/` before editing. The translated SHA-256 values match `inventory.csv`: Spanish `41ecc18c868200b4ad089bca1d58c101411f3ed51252232176af89110295fad7`, English `4333b8b463a2e07fe0811e6c5496ffe0aaa2b04653b1a4a0f21180d72a5c2a8c`; stub `635cbdd1e1795f79f31689f6614d0914784f82535c3e40206fc31674e4f0b477`.
- `progress.csv` marked this pair `pending` before editing. This batch starts from `origin/main` merge commit `b2d50902224aa32f4d4926dd938f98a9412e78a9` on `codex/help-playbook-reporting`.
- The original published pair has nine H2 sections, seventeen Liquid article links in the same order per locale, and no figure. Preserve the published state, titles, slugs, redirect, language pairing, navigation group, and existing links.

## Reader task and article-specific plan

The reader chooses the report that answers a Playbook question, reconciles date bases and attribution, interprets revenue and performance without confusing source associations with AI handoffs, then investigates a weak result before changing a workflow.

1. Audit each date and metric statement against Rails and the already corrected Performance, Revenue, and Data completeness guides. Rewrite the Spanish date section with rules for each metric rather than a universal trigger date; keep the April example only where source-message grouping truly applies.
2. Separate Revenue's attributed source tables from Performance's interaction-start rates and count-based breakdowns. Explain that a manually recorded goal can count as conversion, while a human reply alone does not count as explicit AI escalation. Avoid treating the AI-versus-human source breakdown or revenue classification as a handoff measure.
3. Clarify the most useful troubleshooting rows and link the detailed Revenue and Performance guides near the relevant instructions. Keep the existing editorial path, all original links, headings, and metadata apart from a factual description correction if needed.
4. Adapt the verified Spanish result in English, checking terms and examples. Make narrow bilingual edits in closely related guides only if they otherwise directly contradict the corrected explanation; preserve their current bodies before any such edit.
5. A focused localized report screenshot would help only if a genuine safe native capture can be verified. At 09:33 UTC the Mac is locked, so the required Display P3 PNG cannot currently be captured. Do not substitute browser JPEG, fabricated data, or an unrelated screenshot. This report-selection guide can communicate the date and metric distinctions in text.
6. Re-read sources before saving, run the full Help build and security-header check, verify links and complete rendered ES/EN pages at desktop and mobile widths, and record the verifying content commit in `progress.csv`. Record PR merge and public verification separately.

## Source audit and implementation caveat

- Rails `master` at `6ea4ccbb208ad53f3c061691f3737b1e1902e259` was inspected; the deployed Rails revision is unconfirmed. Playbook-specific reports exist for a registry of supported types, not every agent or route. Their metrics can combine workflow-event timestamps, message delivery, engagement, product view/purchase dates, and attributed revenue grouped by a credited source message.
- Attribution preflight uses a selected Playbook source message's `state_updated_at` delivery hour for `source_message_bucket`; revenue capture retains that bucket. When no source-message bucket is available, capture can default to the attributed purchase event's hour; continuity attribution can preserve an earlier source-message bucket. The guide's April example is conditional on an eligible purchase credited to an identified delivered message. Do not claim that all mission revenue is delivery-dated.
- The Playbooks overview tracks sends and deliveries at their event times; some eligible sales use the source-message bucket. The Revenue report's Playbooks source table presents attributed orders, average attributed order value, and attributed revenue by purchase-date rollup, not conversion, delivery, or reach columns.
- The Performance report uses interaction-start cohorts for its headline rates. Its Playbook breakdown plots converted or escalated interaction counts, not per-Playbook rates. The visible conversion-time average excludes explicitly escalated interactions; its AI-versus-human breakdown reflects source/workflow or teammate association and is not a handoff flag. Team-managed revenue classification is a separate attribution decision.

## Local verification (2026-09-26)

- The complete Spanish guide was corrected first and adapted in English. The shared Spanish description now uses “rendimiento.” The nine original H2 headings and seventeen original links remain in order in each locale; two links to the detailed Revenue and Performance guides were added per locale, and every target exists. The independent editorial review found no remaining direct contradiction with the Performance, Revenue, Data completeness, or Sales attribution guides.
- The conditional April example reflects a credited source message's delivery date and the Revenue report's purchase date. Team-managed revenue classification is explained separately from an explicit AI escalation. No related guide needed a new edit for this batch.
- `PATH="/Users/pel/.rbenv/shims:$PATH" BUNDLE_PATH="/Users/pel/.codex/worktrees/dad4/hellotext-help/vendor/bundle" yarn build` passed, including `script/verify_security_headers.rb`. Both generated `.html` routes contain the corrected text and `lang` attributes. The complete accessibility snapshots rendered in the local browser at 1280px desktop and 390px mobile. Both article openings were visually checked in both sizes; the Spanish mobile troubleshooting table was also checked. The article and table fit within 390px with no horizontal overflow in either locale, and Chrome reported no application errors.
- No screenshot was added. The Mac remained locked and a native Display P3 capture was unavailable. This report-selection and comparison guide uses a dated example and links to the specific report guides instead of an unverified UI image.
- The verifying bilingual content commit is `389869f`. `progress.csv` records it as the local verification reference. A local build and preview are not publication.

## Current checkpoint

The bilingual article is locally verified, committed, and publicly verified. `progress.csv` records seven locally verified pairs, 146 pending pairs, and one redirect outside scope. Dashboard remains pending a safe native screenshot, so the next viable article can proceed independently.

## Public verification (2026-09-26)

Help [PR 92](https://github.com/hellotext/help/pull/92) merged the three individual commits with merge commit `ec1b877d07d99d9bf76fad191575cd64fd113726` at 09:47 UTC. Its Build, Aikido Security, Netlify preview, and header checks passed; the Codex review finished without findings. The [main Build run](https://github.com/hellotext/help/actions/runs/36233836767) passed after merge. At 09:48 UTC, Netlify served the [Spanish guide](https://help.hellotext.com/es/reportes-de-misiones) and [English guide](https://help.hellotext.com/playbook-reporting) with HTTP 200 and the corrected date example and team-managed revenue wording. The normal deployment served the changes; no manual deployment occurred. `progress.csv` continues to record local editorial verification separately from the public check.
