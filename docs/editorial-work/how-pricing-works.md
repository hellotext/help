# Pricing model bilingual editorial review

## Starting state and plan — 2026-09-28

- Article key: `billing/how-pricing-works.md`; published Spanish and English guides remain `pending` in Help `origin/main` at `fe30c9c1e7275c505b6c26aefacfbe590fa64612`. The article-specific branch is `codex/how-pricing-works-guide`.
- The complete original Spanish and English bodies and shared stub are preserved byte for byte under `originals/how-pricing-works/`. Both body hashes match `inventory.csv` before editing.
- Reader task: understand the highest-of-four monthly Hellotext charge, why attributed revenue affects one candidate amount, and where to inspect the account-specific bill. Keep the current title, slugs, metadata, links, locales and publication state.
- Compare the pricing rule with the current official Spanish and English pricing pages. Their regional plan and SMS amounts vary, so retain the article's link to current pricing instead of embedding today's regional figures.
- Make one precise bilingual correction: the Billing page shows a balance only when balance billing applies. Match the already-published Billing overview's wording, Spanish first, then English. Re-read both files just before the edit.

## Section-level visual decision

| Section | Reader question and screenshot decision |
| --- | --- |
| Pricing introduction | What rule sets the charge? The four-amount explanation and link to current plan pricing answer this; an account image would show one private bill rather than the general rule. |
| Four amounts | Which candidates are compared? The ordered list names all four. A screenshot cannot establish how future, regional or custom amounts are compared. |
| Worked example | Why is US$180 the winner? The US$100/180/45/20 arithmetic is explicit and legible in prose. A chart or Billing card would duplicate it with unrelated account values. |
| Separate charges | Which charges are outside the comparison? This is a policy boundary involving taxes, Meta and custom agreements; a single product screen cannot prove it. |
| Attributed revenue | Which sales feed the performance amount? The conceptual distinction and links to the dedicated calculation and attribution guides answer this; a screenshot of one account would not explain eligibility. |
| Where to review | Where is the account-specific amount? The Settings → Billing breadcrumb and links to the dedicated usage and Billing control guides take readers to the relevant interface instructions. A duplicate screenshot here would quickly become redundant. |
| Related guides | Navigation links need no figure. |

Do not add a decorative capture to this conceptual model guide. Verify the complete built ES/EN guides at desktop and mobile width, the worked example, links, index, metadata, and no overflow. Run the project build and relevant checks, record the verifier commit in `progress.csv`, and distinguish local review from public deployment.

## Local verification — 2026-09-28

- The current official [Spanish pricing page](https://www.hellotext.com/precios) and [English pricing page](https://www.hellotext.com/pricing) describe a plan, attribution, SMS and non-SMS message comparison and keep Meta's WhatsApp fees separate. Their region-specific prices and allowances are linked rather than copied into this guide. The existing US$100/180/45/20 example correctly selects US$180 as the highest amount rather than adding them to US$345.
- Re-read both source bodies immediately before saving. The only article edit qualifies the account balance as conditional in Spanish and English, consistent with the published Billing overview and the detailed Billing guide. The shared stub, titles, slugs, publication state and links are unchanged. No screenshot is useful for the section-specific reasons above.
- The production bilingual build passed with the repository's Ruby 3.3.6, previously installed gem bundle, `yarn build`, and `script/verify_security_headers.rb`. The generated site excludes `docs/`.
- Both complete articles were inspected in the local browser at 1280×900 and 390×844. Spanish and English headings, list, example, conditional balance wording, related links, reading index, footer and locale metadata rendered as intended. `document.documentElement.scrollWidth - innerWidth` was zero at both widths in both languages. The screenshot API's full-page stitch duplicated lower sections, but the DOM contained exactly one article, one feedback block and one footer; viewport-by-viewport inspection showed a single intact reading flow. No screenshot asset was created from that stitch.
- `git diff --check` passed. This is a locally verified content correction; commit, PR, merge, Netlify and public-page verification are recorded separately below when they occur.

## Public verification — 2026-09-28

- The article correction commit `84aa5346712fa2c92eff9e429a4e544f8cae72c7` and progress commit `a9145dda3b7968a8f5553afa9b711717b33bb71d` were included in [Help PR #174](https://github.com/hellotext/help/pull/174). Its Build, Aikido Security, Netlify header and deploy-preview checks passed; page and redirect checks completed neutrally under their workflow conditions. The automated code review completed without findings, no inline review comments remained, and both localized preview URLs returned HTTP 200.
- PR #174 merged at 05:56:21 UTC with merge commit `364c6fd0edecef27b74da47cbec5c5bc8aa604d0`, retaining both article commits as ancestors. The normal [main Build](https://github.com/hellotext/help/actions/runs/36384083719) passed for this exact SHA.
- Netlify's normal [production deploy](https://app.netlify.com/projects/legendary-lollipop-e2d131/deploys/6aba01872a4a140008802d15) reported `ready`, branch `main`, context `production`, and the exact merge SHA; it published at 05:56:49 UTC. No manual deployment ran.
- The public [Spanish guide](https://help.hellotext.com/es/explicacion-de-tarifas) and [English guide](https://help.hellotext.com/how-pricing-works) each returned HTTP 200 and contain their localized conditional-balance wording. The progress ledger on merged main records the article as `local_verified` with the correct verifier commit.
