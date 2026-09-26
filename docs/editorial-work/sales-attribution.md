# Sales attribution guide batch

## Source and current state

- Article key: `analytics-reporting-attribution/sales-attribution.md`; public routes are `https://help.hellotext.com/es/como-atribuimos-las-ventas` and `https://help.hellotext.com/how-we-attribute-sales`. Both returned HTTP 200 on 2026-09-26.
- The complete current Spanish and English bodies and shared stub were preserved byte for byte under `originals/sales-attribution/` before editing. The body SHA-256 values match `inventory.csv`: Spanish `8d9bcbd691990637f8470b146c732c90d1168553bdb899d4fbb34f68028a43fa`; English `6529afdac8392cfc55a3ddc1a7b8e8930484a0b60f9c2b1864c4ddd50196b8d8`. The shared stub is `ae2c19e8c024c64ba0f136f1a9293c9e528c00c8f3056fff67607c437fdbb4cf`.
- Each body has 26 Markdown headings and ten Liquid article links; all link targets exist. `progress.csv` marks the pair `pending`. This branch starts from `origin/main` merge commit `8b345faa5ebc10a1facf0e0645ce53e1f7386277`. Preserve the published titles, slugs, language pairing, navigation placement, and existing destinations.

## Reader task and article-specific plan

The reader needs to understand whether an individual sale qualifies, which source wins, how much revenue receives attribution, and where to inspect an uncertain decision.

1. Audit the complete Spanish article and its precise rule claims against Rails: source precedence; default windows; catalog engagement qualification; Webchat item and quantity limits; commercial-driver and human-checkout exceptions; order changes; and export evidence. Clarify that eligible delivery may qualify without a click, but delivery does not prove that the customer read the message.
2. Add a compact reader-facing decision sequence near the opening, with links into existing detailed sections if useful. Clearly distinguish the ten-minute catalog-engagement qualification from the seven-day and 24-hour attribution windows. Keep the partial Webchat amount example and the exceptional cases, while trimming duplicated explanations and examples that add no new decision information.
3. Correct the Webchat bundle quantity rule if the Rails audit confirms that separate exact-zero promotional rows may qualify at catalog value. Ask for only the customer identifier Support needs when investigating an order. Prefer clear Spanish terms while preserving named product and interface terms.
4. Adapt and fully check the verified Spanish result in English. This is a conceptual methodology guide; no product screenshot is required to explain its rules. Do not force a capture of customer orders or export rows while the Mac is locked. If a visual is useful, use accessible text or a small native Markdown table.
5. Re-read both sources before saving, run the full Help build and security-header check, verify links, headings, metadata and complete rendered ES/EN pages at desktop and mobile widths, then record the verifying content commit in `progress.csv`. PR merge and public verification are separate steps.

## Work checkpoint

- Independent read-only editorial and Rails audits identified the eligible-delivery wording and a Webchat bundle quantity exception. Remaining precise claims are still under source review before editing.
- No article body has been edited and this pair remains `pending` until complete bilingual verification.
