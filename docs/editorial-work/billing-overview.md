# Billing overview editorial batch

## Source and scope

- Article key: `billing/billing-overview.md`; public routes are `https://help.hellotext.com/es/resumen-precios-facturacion-planes` and `https://help.hellotext.com/pricing-billing-plans-overview`.
- The complete original Spanish and English bodies and shared stub are preserved under `originals/billing-overview/`. Their SHA-256 values match `inventory.csv`: Spanish `bd101998278dc96914ca7b43e752880ecf77d7112159fb3b545cca54f2e5cd4e`, English `993de26beaf56e9835f6a2bbabac1993203f6bd9d2b4229ad71b405f980b53cc`; the stub is `646f1bd1fd235719dc861167f6d370498a59cb56a50fd2aedd17733f6d627f68`.
- Preserve both published titles, slugs, descriptions, navigation placement, language pairing, and the thirteen Liquid article links per locale.

## Reader task and plan

The reader needs to understand the four-way billing comparison and choose the right detailed guide for attributed revenue, messaging costs, invoices, or plan changes.

1. Compare the complete Spanish overview with the current public Hellotext pricing page and its detailed Help guides. The four-way highest-only rule, attributed revenue, and separately paid Meta fees are supported by the current public pages at `https://www.hellotext.com/precios` and `https://www.hellotext.com/pricing` (checked 2026-09-27). Those pages can resolve to country-specific variants, so keep plan amounts out of this overview.
2. Qualify the balance in the Billing navigation sentence. The detailed Billing guide says it appears when balance billing applies; the old overview implied that every business has a balance. Apply the same narrow correction in English after Spanish.
3. Keep this overview text-led. A Billing screenshot would repeat the task-specific `billing-settings-and-invoices.md` guide without helping the reader select a topic. The overview already names **Configuración → Facturación / Settings → Billing** and links to the guide for those controls.
4. Re-read both translated bodies before saving; verify all links, headings, metadata and complete rendered pages at desktop and mobile widths. Run the production build and security-header check. Record a local verifying commit only after those checks, and record merge and public deployment separately.

## Local verification (2026-09-27)

- The Spanish article was checked first, then the English adaptation. Only the balance phrase changed in each body. The original six Markdown headings and thirteen Liquid links per locale remain in order; all linked stubs exist. The shared stub, published titles, descriptions, slugs, language pairing and navigation placement are unchanged.
- The current public pricing pages confirm the highest-of-four model, attributed-revenue basis, country-specific plan details and directly paid Meta fees. The separate detailed Billing guide explicitly limits the balance display to businesses using balance billing. The **Configuración → Facturación / Settings → Billing** terms agree with that guide and the Rails locale labels.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed, including `script/verify_security_headers.rb`. Both generated HTML routes contain the corrected localized phrase, the expected language and canonical metadata, and the complete related-guide ending. `docs/` is absent from `_site`.
- The complete rendered Spanish and English articles were reviewed in the in-app browser at the default 1280px desktop layout and a temporary 390 × 844px mobile viewport. The article, side navigation and reading index are visible on desktop; the mobile header, opening and ending remain readable without horizontal overflow. The viewport override was reset after review. No screenshot was added for the conceptual overview because the linked Billing settings guide covers that interface task.
- No database fixture, contact, campaign or message was changed. This verifies a local build, not a production publication. The three report capture tasks remain pending while the macOS session is locked.
