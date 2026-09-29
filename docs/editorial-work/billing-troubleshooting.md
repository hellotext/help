# Troubleshoot billing questions

## Source and reader task

- Pair: `billing/billing-troubleshooting.md`; published routes `/es/solucionar-dudas-facturacion` and `/billing-troubleshooting`.
- Original bodies and unchanged stub: `originals/billing-troubleshooting/`. Inventory hashes: ES `adc19c3405913cacf337f821c9b39a84d2365b077b13d5d79c979619079a8bb5`, EN `2e4532c4ff0927e35e011b457a39c5e32e415245c67f6e551f142a9b7f9f06d6`.
- Task: compare the same billing month, isolate the charge or unavailable control, and prepare a useful support request without disclosing payment credentials.

## Section-level visual and factual audit

| Section | Source-backed correction | Figure decision |
| --- | --- | --- |
| Entry and higher amount | The current pricing model compares four Hellotext amounts only for the standard monthly agreement; prepaid and fixed arrangements differ. The published “up to X SMS” count is an approximate price equivalent, not a deducted allowance. Taxes and direct Meta fees sit outside the Hellotext comparison. | The protected demo's usage summary contains zero-only values and an unfinished gray bar. A screenshot would not help diagnose a high bill and could imply these are representative charges; omit it. Link the dedicated pricing and SMS explanations. |
| Attribution mismatch | Date ranges, currency and each report's date basis must align; the linked attribution and data-integrity guides describe the calculation. | A single report screenshot would not explain a difference between two reports; their verified report guides already provide panel images. Omit a redundant figure. |
| Invoice unavailable | The current Rails `settings/billings/partials/_invoices.html.erb` renders one **Seleccionar mes / Select month** popover with months grouped by year only when viewable invoices exist. Otherwise it renders an empty state. | The isolated account has no invoices. An empty-state screenshot would repeat the sentence and cannot illustrate an available invoice; omit it. |
| Payment method failed | Current ES empty-state control is **Agregar método de pago**; EN is **New payment method**. The faded cards in the isolated account are a preview, not saved methods or a failed payment. | Reuse the approved bilingual desktop/mobile native payment-method figures from the published Billing settings guide to locate the add control. Captions explicitly state that the images do not show a failure. No new card or failed transaction is fabricated. |
| Plan change | Current Rails `quotas/_quota.html.erb` shows a notice for a scheduled downgrade or cancellation; the notice is conditional. An upgrade may take effect after payment succeeds. | The demo has no scheduled change or payment failure. Showing a normal plan card as a failed change would be misleading; omit. |
| Country and tax | Current Rails `settings/billing_informations/_show.html.erb` exposes **Información de facturación / Billing information** and **Cambiar de País / Change Country**, with a future-tax notice in the form. | Reuse the approved bilingual desktop/mobile native country-selector figures from the published Billing settings guide. They identify the distinct control and notice without saving legal or tax data. |
| Support checklist | This is a list of information to gather, without a new interface state. | No figure. |

The two reused figure pairs retain their original Display P3 pixels and their provenance at `captures/billing-settings-and-invoices/capture-provenance.json`; the published files are under `images/billing/billing-settings-and-invoices/`. This article does not duplicate their source PNGs. The original capture used the isolated business 5 and fictional `design-system@example.test` owner. No billing state, card, invoice or message was changed for this troubleshooting guide.

## Local verification

The final production `yarn build` and security-header verification passed. The complete ES and EN articles were reviewed in the local browser at 1280×900 and 390×844 CSS px, including all headings, troubleshooting steps, links, accessible figure names, and the visible explanation that the example cards are a preview rather than a failed transaction. Both desktop and mobile layouts had no horizontal overflow. Each article displayed two static figures without links or open controls; their lavender stages stayed inside the Help column. At mobile, each image rendered at 316 CSS px within a 358 px stage; at desktop, the stage stayed below 810 CSS px. The bilingual desktop and responsive mobile image sources loaded at their expected natural dimensions. All eight reused PNGs in the local production build matched their already published source assets byte for byte.

The underlying interface labels and conditional invoice/plan states were checked against the Rails Billing views in `/private/tmp/hellotext-workload-fixed`. The current public Hellotext [pricing page](https://www.hellotext.com/pricing/us) and the already verified Pricing, SMS and Meta-fee Help guides support the distinction between the four-way comparison, estimated SMS equivalent and charges collected separately by Meta. No live price or tax amount was copied into this guide.

Record the content commit in `progress.csv` and publish by the normal Help PR process. Public page verification follows the merge; do not claim a production Netlify deploy ID without its SHA evidence.
