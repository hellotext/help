# Plan usage and monthly charges

## Source and reader task

- Pair: `billing/understanding-plan-quotas.md`; public ES `/es/conociendo-los-consumos-del-plan`, EN `/understanding-plan-quotas`.
- Preserved originals: `originals/understanding-plan-quotas/{es,en,stub}.md`, copied from `origin/main` before editing. The title, description, slugs, related links, language pairing, and published state remain in the unchanged stub.
- Reader task: find the active plan and usage month, distinguish sales and message counts from billable amounts, compare the four amounts without adding them, and use payment history and the invoice for different reconciliation questions.
- Source checks: current Rails Billing view renders `actions.usage_summary`, plan header, quota period selector, `quotas/_summary`, and the history toggle. `Quota#billable_events` compares license, attribution, SMS, and message overage. The public Hellotext pricing page and the already reviewed Pricing model guide confirm the highest-only rule, with applicable taxes and separate services outside that comparison. Avoid fixed rates or plan prices in explanatory prose.

## Section-level visual decision

| Section | Reader question | Decision |
| --- | --- | --- |
| Open the usage summary | Which card shows the current plan and where is the selected month? | New localized plan and usage card figures, each with native desktop/mobile sources. The plan card shows a fictional Enterprise account with a $2,499 minimum; the usage card has zero transactions. Text and hidden captions explicitly identify these as demonstration data, not a representative outcome or current public price. |
| Interpret the comparison | Which rows are charges rather than underlying counts? | The usage card above shows sales versus fee and message counts versus cost. A second nearly identical screenshot would be redundant. Prose names the four candidates and explains that the plan amount is on the neighboring card. |
| Compare the correct period | Why can Billing and reports differ? | Date-model explanation with no new interface control. The period selector is already visible in the usage figure. |
| Balance and payment history | Where is the month selector and what does it show? | Reuse the approved localized desktop/mobile `history` images from Billing settings. No duplicate PNGs or financial records are created. |
| Older periods | Which previous month is available? | The demo business has only one active quota. A screenshot of a one-option open dropdown would not explain historical selection; prose says earlier periods appear when available. |

Spanish led the revision, followed by equivalent English. Exact UI labels are **Resumen de uso / Usage summary**, **Cambiar mi Plan / Change My Plan**, **Historial de Pagos / Payment history**, and **Seleccionar mes / Select month**. The earlier text incorrectly called the first control “Resumen de consumos” and described history as separate year and period selections. The quota selector comes from `QuotasController#index` and lists active or expired periods.

## Safe source capture

- Isolated Rails revision: `/private/tmp/hellotext-workload-fixed`, current Billing template and quota model, served on `127.0.0.1:3191` against database `hellotext_editorial_workload_20260928`.
- Preflighted clone: business 5, one active September 2026 Enterprise quota, owner `design-system@example.test`, zero messageable contacts and zero quota transactions. The displayed plan minimum is $2,499; attributed sales, SMS and other messages are zero. No invoice, payment, message, or synthetic financial transaction was created to make the screenshot look populated.
- The automatic headless Chrome profile is dedicated to a single loopback demo tab at CDP `127.0.0.1:9339`. `script/capture_isolated_chrome.mjs` checked the exact local URL, title, locale, fictional account, target text, viewport, zoom, DPR, page scroll, native PNG encoding and embedded Display P3 before and after each shot. Desktop sources use a 1024×900 CSS viewport; responsive sources use 390×844; all are genuine 2×. The fictional owner's locale was changed through guarded clone-only code to EN and restored to ES after capture.
- The development-only Bullet and profiler overlays were removed from the isolated page DOM before the final mobile sources. This did not change application content or saved data. Preliminary mobile sources with an overlay or neighboring card fragment were rejected and overwritten. Final sources were visually inspected, including borders, surrounding space, no cursor, no overlay and complete rows. Raw accepted sources and hashes are in `captures/understanding-plan-quotas/capture-provenance.json`; public assets are exact byte copies. No screenshot pixels were edited or resampled.
- The plan source at the narrower desktop viewport wraps its explanatory line but keeps the full card and control legible at the article width. The mobile usage source is separately captured to keep all rows readable. The screenshots show an intentionally empty usage month rather than inventing a sale or SMS. The prior general Billing guide omitted this card because it could not illustrate a populated billing example; this dedicated guide uses it to locate and explain the actual fields, with the empty state expressly disclosed.

## Verification and publication

- `yarn build` passed, including the production security-header check. Both complete guides were reviewed locally in the Help browser at desktop width and 390 CSS px mobile. Each locale rendered three static figures in order, with a full-width lavender stage, separate white frame, readable labels, intact links and no horizontal overflow or open-image control. The plan and usage images selected the correct localized desktop/mobile sources; the reused history image remained legible. All eight built PNGs in both Jekyll output trees matched the approved sources byte for byte and retained their Display P3 ICC profiles. The public `docs/` source is excluded from the build.
- The current Rails Spanish SMS count row contains the hard-coded English word `Messages` in `quotas/_summary.html.erb`; the source capture preserves the real UI instead of editing those pixels. The row label `SMS` and both count values remain clear. A later product-localization fix can correct the application separately; this documentation does not claim a fully Spanish string there.
- Local verification is complete for content commit `e480b412`. The verification record is the following commit. Public pages, served assets and deployment revision remain pending until the authorized Help PR merges; a local build is not a public publication.
