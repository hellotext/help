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
- Verifying article commit: `3d2d8373db93daaa5e8e492327333d8b27565591`. `progress.csv` records this pair as `local_verified`; PR merge and public deployment remain separate checks.

## Public verification (2026-09-27)

- Help [PR #135](https://github.com/hellotext/help/pull/135) merged at 06:18:43 UTC with merge commit `6f925ca984c95e760f15f6e115654c410cc7b68e`, preserving the two local commits. GitHub Build, Aikido Security, Netlify deploy preview and header checks passed; Pages changed and Redirect rules were neutral because those rules did not change. The automated review completed without findings.
- The [main Build run](https://github.com/hellotext/help/actions/runs/36299719261) passed on the exact merge commit. Netlify's normal [production deploy](https://app.netlify.com/projects/legendary-lollipop-e2d131/deploys/6ab8b544531fbb000817ed79) reached `ready`, with `context=production`, `branch=main`, the same commit, and publication time 06:19:15 UTC. No manual deployment was run.
- The public [Spanish overview](https://help.hellotext.com/es/resumen-precios-facturacion-planes) and [English overview](https://help.hellotext.com/pricing-billing-plans-overview) both returned HTTP 200 with the locale-matched balance qualification, canonical and reciprocal language metadata, CSP and HSTS. This confirms the correction is served publicly in both languages. `progress.csv` continues to identify the local editorial verifier separately from this publication check.

## Narrow SMS calculation follow-up — 2026-09-28

The automated review of SMS pricing PR #193 identified two old overview summaries that still described the displayed SMS count as a plan allowance. The old opening also stated the highest-of-four comparison without its prepaid and fixed-plan scope. This is a focused linked correction, not a repeat of the full overview review above. Its immediately preceding complete bodies are preserved byte for byte in `originals/billing-overview-sms-erratum/` (SHA-256 Spanish `905d2ce71badb5b1a61c665aa7d57286f9b1b33cdb5c9a98b252e64fde894444`, English `8d96fba001655096b43ebcc5a124f28cb8e10f7789cf289fd81a4888d37e1def`).

The plan is to qualify the opening for the standard monthly comparison, point to current country-specific pricing and rounded SMS equivalents, and summarize the linked SMS guide as a per-part calculation and sender-choice guide. Preserve all headings, thirteen links per locale, title, routes and publication metadata. The existing section-by-section no-screenshot decision still applies: this hub routes readers to dedicated guides rather than showing a unique interface state. Rebuild and review both complete pages at desktop and mobile width, update the ledger verifier, then check the PR and public deployment.

Read-only follow-up also found old allowance wording in `billing/billing-troubleshooting.md` and `developers/send-sms-with-api.md`. Both are still pending their own article review; check that wording when those pairs are edited rather than expanding this overview correction into their separate instructions.

The narrow Spanish and English correction was rebuilt with `yarn build` and the security-header check. Both complete overview pages were reviewed at 1440×900 and 390×844: original section order, all thirteen Liquid article links per locale, titles, footer and conditional Billing balance remained intact. Each page now describes approximate SMS equivalents and billable parts, with no old allowance phrase or horizontal overflow. Mobile visual viewport scale was 1. `git diff --check` passed. The refreshed content commit is `89ea8bcb`.

The Billing overview fix and ledger verifier `45fb8412` joined [Help PR #193](https://github.com/hellotext/help/pull/193) in merge commit `9f9a5a498a0ac1d9db935927d8972f4d52034c26`. The reviewer thread was answered and resolved; repeated review finished without another finding. Build, Aikido and Netlify preview passed. The normal [main Build](https://github.com/hellotext/help/actions/runs/36448959605) and [Netlify production deploy](https://app.netlify.com/projects/legendary-lollipop-e2d131/deploys/6aba912b6571f10008cb160a) passed for that exact SHA, with no manual deployment. The public [Spanish](https://help.hellotext.com/es/resumen-precios-facturacion-planes) and [English](https://help.hellotext.com/pricing-billing-plans-overview) overview pages each returned HTTP 200 with the corrected SMS summaries.
