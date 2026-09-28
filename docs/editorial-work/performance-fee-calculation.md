# Performance fee calculation bilingual review

## Starting state and plan — 2026-09-28

- Article key: `billing/performance-fee-calculation.md`, still `pending` on Help `origin/main` at `4101442a70141185b3526a6b734ff1630a665bc8`. Work on `codex/performance-fee-calculation-guide`; preserve the published Spanish and English originals and shared stub under `originals/performance-fee-calculation/`. Both source body hashes matched `inventory.csv` before editing.
- Reader question: how attributed revenue and the plan rate produce a candidate amount, why that amount is compared with the plan minimum and messaging charges, and how to reconcile a recent figure. Preserve metadata, titles, slugs, links, locales and publication state.
- Verify the high-level comparison and country-dependent plan pricing against the current official Spanish/English pricing pages. Keep the current pricing links rather than copying a regional rate or making a new claim about threshold semantics.
- Spanish first: clarify that later order or attribution corrections can change recent report values, then tell readers to check date basis and timezone along with date range and currency when reconciling Billing with a report. Adapt the same meaning in English. These points are documented in the published Revenue report guide. Re-read each source immediately before saving.

## Section-level visual decision

| Section | Reader question and screenshot decision |
| --- | --- |
| Opening and calculation | How is the candidate amount computed and compared? The formula and US$4,000 × 4% = US$160 worked example are clearer than a screenshot of a single account's charge. |
| Included revenue | Which orders qualify? This is the attribution methodology and points to the detailed Sales attribution guide; one UI state cannot show source precedence or eligibility. |
| Rate and threshold | Which plan applies? Current rates and thresholds differ by market and agreement; the live pricing link is the source. The Settings → Billing breadcrumb and linked Billing guide cover the account-specific plan control. |
| Recent amounts and reconciliation | Why can two totals differ? Date bases, timezones and later order adjustments need an explanation comparing reports, not a static account screenshot that could hide those differences. The dedicated Revenue report guide has figures of its controls. |
| Related guides | Navigation links need no figure. |

Do not add decorative or account-specific captures to this conceptual calculation guide. Verify the entire rendered ES/EN pages at desktop and mobile widths, formula, links, headings, locale metadata and no overflow. Run the repository build and relevant checks. Record the verifier commit in `progress.csv`; report merge and actual production verification separately.

## Local verification — 2026-09-28

- Source evidence: current [Spanish pricing](https://www.hellotext.com/precios) and [English pricing](https://www.hellotext.com/pricing) pages support the plan-dependent rate and minimum comparison. The published [Revenue report guide](https://help.hellotext.com/revenue-report-guide) explains source-message versus purchase-date grouping and late corrections. The example remains US$4,000 × 4% = US$160. Threshold wording was preserved pending account-specific confirmation.
- Re-read both full article sources before saving; compared titles, slugs, links, locale metadata, publication status and section order with the saved originals. Changes are limited to the reconciliation and later-adjustment explanation in both languages.
- `yarn build` passed with the installed shared editorial bundle and generated both locales. At 1280 × 900 and 390 × 844 CSS px, reviewed each rendered page from the heading through related guides and footer in the local browser. Spanish and English showed the updated text, correct links and locale, readable paragraphs, no horizontal overflow (`scrollWidth - innerWidth = 0`), and no missing figures. No image was added for the section-specific reasons above.
- `git diff --check` passed. Local verifier commit: `767f6f33a54c95f77a56b60889d29fead5110858`.

## Publication verification — 2026-09-28

- [Help PR #176](https://github.com/hellotext/help/pull/176) merged with merge commit `774ed529191fdfe62b1e315423c761ae2010fcfb`, retaining both article and ledger commits as parents/ancestors. Build, Aikido Security, Netlify deploy preview and header checks passed; unrelated Netlify page/redirect checks were neutral. Codex review completed without findings, and there were no inline review comments.
- The main Build run `36386346099` passed for that exact merge SHA. Netlify's normal production deploy `6aba08393b22e30008c8e48d` reached `ready` for the same SHA at 2026-09-28 06:25:26 UTC. No manual deployment was used.
- The public [Spanish page](https://help.hellotext.com/es/calculo-tarifa-rendimiento) and [English page](https://help.hellotext.com/performance-fee-calculation) both returned HTTP 200 and contained their respective late-adjustment and date-basis explanations after publication. The complete pages were previously inspected locally at desktop and mobile widths. No PNG asset belongs to this conceptual guide.
