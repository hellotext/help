# Billing settings, payment methods, and invoices

## Source and reader task

- Pair: `billing/billing-settings-and-invoices.md`; published Spanish `/es/facturacion-metodos-pago-facturas` and English `/billing-settings-and-invoices`.
- The full original ES/EN bodies and unchanged stub are in `originals/billing-settings-and-invoices/`. Their SHA-256 values match `inventory.csv`: ES `b96f04d981fbdeb1f76cf4124e4a0103a8707394da5f4e9bcd5cff00305cadd0`, EN `7ebda8521a1cb522709e44ea4d8d862d4097cc81d0fe1d3bf71c2f8d21c052f8`; stub `9a20081ac765ea3471c1c450e4f67bedc9af01caa8bdfa31a8f759a8d43c16e8`.
- Reader task: identify the current plan and billing summary, find payment methods and legal details, inspect payment history, and locate an available invoice without changing payment or tax settings.

## Section-level plan and source checks

| Section | Exact UI check and editorial correction | Useful figure |
| --- | --- | --- |
| Plan and usage | `settings/billings/show` places the plan next to the quota summary when a quota exists. A period selector is rendered by the quota frame. The protected business showed an Enterprise plan, a September 2026 selector, zero usage rows and an unfinished gray progress bar. | Omit the plan/usage screenshot: the zero-only summary and gray bar would imply a representative example where none exists. The section and linked quota guide explain how to find and interpret the control. |
| Balance and payment history | The real **Historial de Pagos / Payment history** toggle exposes a single month-and-year dropdown, not a separate year control. Balance appears only for supported billing modes. | Open toggle and period selector with only fictitious aggregate data; no payment identifiers. |
| Payment methods | The empty-state CTA is **Agregar método de pago** in ES and **New payment method** in EN. The faded card list in the empty state is a built-in preview, not stored cards. Do not add, delete or mark a method. | Capture the empty-state CTA if the preview can be clearly distinguished from real cards. Otherwise focus on the heading and CTA. |
| Billing information and country | The headings are **Información de facturación / Billing information** and **Cambiar de País / Change Country**. Both actions open forms with save controls. Do not submit a change. | Focused open form or country tax notice, each only if it adds a distinct reader decision and can be captured without private legal data. |
| Invoices | The invoice chooser groups available months under years; it is one **Seleccionar mes / Select month** popover, not separate year and month controls. The isolated business has no invoice, so the actual UI shows a plain empty state and no selector. Both articles now explain this distinction. | Omit the empty-state screenshot: it repeats the adjacent sentence and cannot show how to open an available invoice. Creating a synthetic billing document solely for this figure would add financial state without improving the procedure. |
| Support checklist | Explains what to prepare without showing a new UI state. | No new figure; the preceding controls cover the task. |

The Spanish article is the lead. Preserve titles, slugs, metadata, links, language pairing and publication state. Do not quote prices from the country-dependent public pricing page. The local Rails source for this check is `/private/tmp/hellotext-workload-fixed`, which includes the current Billing view and locale labels.

## Safe capture environment and current state

On 2026-09-29, the local Rails server on `127.0.0.1:3191` and the isolated database `hellotext_editorial_workload_20260928` were read-only preflighted. Enterprise business 5 has a reserved `design-system@example.test` owner, 127 unconfirmed contacts, zero subscribed and zero messageable contacts. It has no stored payment methods or invoices. No fixture was seeded or billing action submitted. A dedicated headless Chrome profile at `/private/tmp/hellotext-billing-headless-9339`, bound only to loopback CDP port 9339, was signed in as that fictitious owner using a local mode-0600 fixture credential. The credential is not recorded in Git. The exact controlled page is `http://127.0.0.1:3191/hellotext/settings/billing` with title `Facturación - Hellotext`.

The automatic compositor captured sixteen approved 2× Display P3 PNGs without a macOS picker: four distinct controls per language, each with a focused responsive variant. The rejected plan-and-usage candidate cut the right card border and showed only zero usage and a gray progress bar; it was not retained. The empty payment-card silhouettes belong to the real app's `settings/payment_methods/_empty_preview` and are not actual saved cards. Every published copy is byte-for-byte identical to its retained native source; hashes and dimensions are in `captures/billing-settings-and-invoices/capture-provenance.json`.

During this batch the isolated-Chrome capture script exposed a real scroll-coordinate bug: CDP expects document coordinates while the CLI clip is viewport-relative. `script/capture_isolated_chrome.mjs` now adds the verified page scroll offset and supports an explicit scroll target after applying a responsive viewport. A blank first probe and mobile candidates with partial controls were rejected; the sixteen retained sources were recaptured and inspected. The fictional owner's locale was temporarily set to English with exact DB and privilege guards, then restored to Spanish. No billing form was saved, no payment method or invoice was created, and no message was sent.

## Local verification

The final production build passed after all responsive sources were inserted. Both complete local articles were reviewed at 1280×900 and 390×844 CSS px. At desktop, each of the four `picture` elements selected its locale-specific desktop source; the image rendered at 609 CSS px inside a 685 px lavender stage. At mobile, each selected the locale-specific mobile source, rendered at 316 CSS px inside a 358 px stage. All sixteen images loaded at their declared natural dimensions, section order, captions and links were checked, and neither language overflowed the viewport. Normal viewport screenshots confirmed the readable labels and intact stage at mobile and desktop. The build and browser review did not reveal a remaining visual debt for this pair.

Only the article, retained sources, assets, provenance, record and capture-script repair belong in the Help commit. The temporary Chrome profile, fixture credential and local `node_modules` changes are excluded. Public page and asset verification follows the Help merge.
