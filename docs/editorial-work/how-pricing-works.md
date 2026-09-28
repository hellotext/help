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
