# Playbook reporting batch

## Source and current state

- Article key: `analytics-reporting-attribution/playbook-reporting.md`; public routes are `https://help.hellotext.com/es/reportes-de-misiones` and `https://help.hellotext.com/playbook-reporting`.
- The complete current Spanish and English bodies and shared stub were preserved byte for byte under `originals/playbook-reporting/` before editing. The translated SHA-256 values match `inventory.csv`: Spanish `41ecc18c868200b4ad089bca1d58c101411f3ed51252232176af89110295fad7`, English `4333b8b463a2e07fe0811e6c5496ffe0aaa2b04653b1a4a0f21180d72a5c2a8c`; stub `635cbdd1e1795f79f31689f6614d0914784f82535c3e40206fc31674e4f0b477`.
- `progress.csv` marks this pair `pending`. This batch starts from `origin/main` merge commit `b2d50902224aa32f4d4926dd938f98a9412e78a9` on `codex/help-playbook-reporting`.
- The original published pair has nine H2 sections, seventeen Liquid article links in the same order per locale, and no figure. Preserve the published state, titles, slugs, redirect, language pairing, navigation group, and existing links.

## Reader task and article-specific plan

The reader chooses the report that answers a Playbook question, reconciles date bases and attribution, interprets revenue and performance without confusing source associations with AI handoffs, then investigates a weak result before changing a workflow.

1. Audit each date and metric statement against Rails and the already corrected Performance, Revenue, and Data completeness guides. Rewrite the Spanish date section with rules for each metric rather than a universal trigger date; keep the April example only where source-message grouping truly applies.
2. Separate Revenue's attributed source tables from Performance's interaction-start rates and count-based breakdowns. Explain that a manually recorded goal can count as conversion, while a human reply alone does not count as explicit AI escalation. Avoid treating the AI-versus-human source breakdown or revenue classification as a handoff measure.
3. Clarify the most useful troubleshooting rows and link the detailed Revenue and Performance guides near the relevant instructions. Keep the existing editorial path, all original links, headings, and metadata apart from a factual description correction if needed.
4. Adapt the verified Spanish result in English, checking terms and examples. Make narrow bilingual edits in closely related guides only if they otherwise directly contradict the corrected explanation; preserve their current bodies before any such edit.
5. A focused localized report screenshot would help only if a genuine safe native capture can be verified. At 09:33 UTC the Mac is locked, so the required Display P3 PNG cannot currently be captured. Do not substitute browser JPEG, fabricated data, or an unrelated screenshot. This report-selection guide can communicate the date and metric distinctions in text.
6. Re-read sources before saving, run the full Help build and security-header check, verify links and complete rendered ES/EN pages at desktop and mobile widths, and record the verifying content commit in `progress.csv`. Record PR merge and public verification separately.

## Current checkpoint

Original sources are preserved; the Rails source audit and article edits remain pending. No image was captured, no article body or metadata changed, and no publication action taken in this batch.
