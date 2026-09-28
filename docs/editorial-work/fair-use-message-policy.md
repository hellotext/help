# Fair-use message policy bilingual review

## Starting state and scope — 2026-09-28

- Article key: `billing/fair-use-message-policy.md`. Help `origin/main` records the English and Spanish published pair as `pending` for editorial review. This branch starts from `4c30c96dcecbe2566c14b6f5035ed8d520d193e7` on `codex/fair-use-message-policy`.
- The complete source bodies and shared stub are preserved byte for byte in `originals/fair-use-message-policy/`. Their English and Spanish SHA-256 values match the inventory: `2a3b66b11c501c8c462d47ed7c2f4cce2521b8ffcf6c4bfc0b421eb55a1cadec` and `37db20bd096dfcfa39f49567cbfe55a2453f657cf434f46ed31eceb1bc6f07e4`.
- Preserve title, descriptions, slugs, links, languages, navigation and published state. Review Spanish first and compare English against its labels and examples. A local check or commit is not publication.

## Reader question and visual decision

The reader needs to understand when Hellotext charges for eligible non-SMS messages, how that amount compares with the plan floor, performance fee and SMS costs, and which charges remain separate. This is a calculation and policy explanation, not an instruction to find a control. Verify the rate and comparison against the current official [Spanish pricing page](https://www.hellotext.com/precios) and [English pricing page](https://www.hellotext.com/pricing), then check the linked Help pricing guide and the worked example's arithmetic.

| Section | Screenshot decision |
| --- | --- |
| Covered channels | Defines the scope of the policy. An account screenshot would show only that account's channels and would not establish eligibility. |
| Variable amount | The US$2 per 1,000 rule is arithmetic; its source is the public pricing page. A UI image would add account-specific consumption without explaining the rule. |
| When charged and worked example | The four amounts and the winning US$100 are readable in the existing list. A Billing screenshot would duplicate the task-specific Billing guide and could show unrelated or private account values. |
| Separate charges | Distinguishes Hellotext's comparison from Meta fees, taxes and custom agreements; one product screenshot cannot establish those boundaries. |
| Related guides | Navigation links need no figure. |

Retain the original article if the factual and readability checks find no correction. Do not invent a screenshot or alter prices merely to create an editorial diff. Verify the complete ES/EN built pages at desktop and mobile widths, links, formula, metadata and publication state. Record public deployment separately if this review is integrated.

## Local verification

- The current official Spanish and English pricing pages still state US$2 per 1,000 eligible non-SMS messages when that amount exceeds the plan, attribution and SMS amounts, with Meta's WhatsApp fees paid separately. The linked Help pricing guide states the same highest-of-four rule. The article's example correctly computes 50,000 ÷ 1,000 × US$2 = US$100, which is greater than US$74, US$30 and US$0. No factual or wording correction was warranted in either translation.
- `yarn build` passed on 2026-09-28, including both production Jekyll languages and `script/verify_security_headers.rb`. The complete built articles were inspected in the local browser at 1280×900 and 390×844 in Spanish and English: headings, example, related links, reading index and footer remained legible without horizontal clipping. The build preserved the shared stub's titles, descriptions, slugs, locales and publication status.
- No screenshot was added for the section-specific reasons above. No article source, generated renderer, stylesheet or public asset changed. This review closes an editorial decision; it is not a new production article revision.
- The verifier commit is `2f5b9a1952e8b7d53a7b41eb2b8b118d293d3603`; the ledger records `local_verified`. At this checkpoint, PR, merge, deployment and public verification were pending.

## Public verification — 2026-09-28

- [Help PR #172](https://github.com/hellotext/help/pull/172) passed the Build, Netlify header and deploy-preview checks. Netlify's page and redirect checks, and Aikido's security check, completed neutrally under their workflow conditions; none failed. The automated code review completed without suggestions. The preview returned HTTP 200 for both localized routes.
- The PR merged with merge commit `c9bea6dc9052e5e7d49db3e1714a12d2a9948b20` at 05:35:58 UTC, preserving the verifier and ledger commits as ancestors. The normal [main Build](https://github.com/hellotext/help/actions/runs/36382616026) passed for that exact SHA.
- Netlify's normal [production deploy](https://app.netlify.com/projects/legendary-lollipop-e2d131/deploys/6ab9fcc0d904e2000819d858) reports `ready`, branch `main`, context `production`, commit `c9bea6dc9052e5e7d49db3e1714a12d2a9948b20`, and publication at 05:36:32 UTC. No manual deployment was run.
- The public [Spanish guide](https://help.hellotext.com/es/politica-fair-use-mensajes) and [English guide](https://help.hellotext.com/fair-use-message-policy) both returned HTTP 200. Their rendered titles, US$2 per 1,000 rate, winning US$100 example, canonical and reciprocal language links were present. The articles are unchanged; this deployment integrates the verified editorial decision and ledger.
