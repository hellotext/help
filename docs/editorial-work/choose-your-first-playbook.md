# Choose your first playbook editorial batch

## Source and plan

- Article key: `journeys/choose-your-first-playbook.md`; public routes `/choose-your-first-playbook` and `/es/elige-tu-primera-mision`. Both originals are published and HTTP 200 in `inventory.csv`; the row is `pending` before this batch. Start from `origin/main` `80711041cb196a163fb3af8c89a35cab0ad1c371` on `codex/choose-first-playbook-guide`.
- The complete original Spanish, English and shared stub are preserved under `originals/choose-your-first-playbook/`. SHA-256: Spanish `044fb87c6b66ea202f6a36d94ab3323381499be83a241a96333cdc8f265020e8`, English `8c3c3c907dd16488f28e76a6844616ae5feb75ac92f0d8d16b7a41fc1511d063`, stub `7cc50747c4204b1e586eac832a9c7b532edcf27dea1b19a15427c70867ddc0c4`. The localized hashes match the inventory.
- Preserve titles, descriptions, slugs, redirect, both languages, links, section order, published state and shared stub. Spanish leads; adapt the same corrections in English. Re-read the complete article immediately before saving.
- Verify current product vocabulary, mission availability, feedback scale and Cart Saver scope against the Rails application and the just-published comparison. Correct only unsupported claims and misleading UI labels. The related `getting-started/first-wins-starter-pack.md` repeats the Cart Saver overclaim, and `journeys/nps-pulse-playbook.md` repeats an incorrect score range; publish their narrow bilingual errata with this batch, but leave both full progress rows `pending`.

## Section-level visual decision

| Section | Reader question | Decision |
| --- | --- | --- |
| Opening | What kinds of tools are available? | A short category path is recognizable from the named labels; a capture would show one menu state instead of the overall choice. |
| Before you choose | Which data, channels and people must be ready? | This checklist spans several systems; no single screen demonstrates readiness. |
| Choose by first goal | Which tool fits a business outcome? | A goal-by-goal list is the decision aid. Interface images of individual tools belong in their linked setup guides. The original three-column table clipped its rationale column on a 390 CSS px viewport, so the bilingual list keeps every recommendation and reason readable without horizontal scrolling. |
| Start small | How narrow should the initial rollout be? | This is planning advice without a distinct UI state. |
| Use the simplest tool that fits | When should I use a campaign, route, AI mission or capture? | The distinctions are conceptual; one editor screenshot would privilege only one option. |
| Questions to answer before launch | What must be decided before enabling? | The checklist concerns multiple sources and rules rather than a shared control. |
| After the first launch | What should I inspect and adjust? | Links to report and setup guides lead to the relevant screenshots; a single report crop would not cover every option. |
| Related guides | Where do I follow the chosen path? | Localized links provide the next step directly. |

No screenshot or message preview is warranted in this cross-product decision guide. This decision does not close screenshot work in the linked interface guides.

## Source checkpoints

- Rails `config/locales/views/journeys/{es,en}.yml` calls the catalog tab **Captura/Capture** and action **Explorar misiones/Explore Playbooks**. `JourneyTemplate` seeds First-Purchase Driver disabled and its card is labeled on request; the guide must not present it as always directly available.
- `Playbook::PROACTIVE` separates event-triggered AI playbooks such as Cart Saver and Browse Recovery from reactive Product Recommender and other response-oriented agents. Cart Saver's context, send guard and composer support one contextual outbound reminder, not reply handling; the published cart comparison documents this behavior.
- `Artifact::Product::RestockFanout` accepts wishlist, cart or exact-product-view intent. Dormant and churn-imminent lifecycle sweepers use 90 and 365 days respectively; those existing article claims can remain.
- NPS's localized default question, `Playbook::NPS::Responder` and `Attempt` accept **1–10** only, with detractors **1–6**. `Playbook::Report` does not expose a dedicated merchant NPS report; the goal list must warn readers to confirm result access before choosing it. Correct the linked NPS guide as a focused erratum and leave its complete visual review pending. Review Builder's purported review-record export was not confirmed in the report export implementation; omit the unsupported export promise here and record it for the future full Review Builder review.

## Local verification

- Re-read the complete Spanish and English source after the goal list conversion, preserving all 15 goals, recommendations and reasons. The bilingual NPS row now also warns that the current Playbooks view has no dedicated NPS report.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed for both locales and the security-header check. `git diff --check` passed.
- Reviewed the complete local preview in both languages at 1440×900 and 390×844. The goal list has no horizontal clipping; every recommendation and reason is a separate paragraph, and both locales show 15 items. Headings, footer, locale mapping and focused cross-links to First Wins and NPS resolve correctly. This is local verification, not publication.
- The guide is a cross-product choice aid with no distinctive single interface state to capture. The visual decision table above covers every section; linked interface guides retain their own screenshot debt.

The content and original-snapshot commit is `1419af6f` (`Clarify first playbook choices and linked feedback behavior`). This is the local verification anchor recorded in `progress.csv`; First Wins and NPS stay `pending` for their complete future reviews.

## Publication and public verification

- [Help PR #186](https://github.com/hellotext/help/pull/186) passed Build, Aikido Security, Netlify deploy-preview and header checks. Netlify's page/redirect checks were neutral skips. The six changed preview pages returned HTTP 200. An automated review completed after merge and identified a P2 contradiction in the linked Playbook reporting guide; the follow-up is recorded separately below.
- The PR merged without squash as merge commit `d27cb2cdcf7b5e85ce3bf3381565c98014d532b1`, preserving content commit `1419af6f` and verifier commit `38c9f04f`. The [normal main Build](https://github.com/hellotext/help/actions/runs/36430827540) passed for the exact merge SHA. Netlify's [production deploy](https://app.netlify.com/projects/legendary-lollipop-e2d131/deploys/6aba6f5cf569c30008123b36) reports `ready`, `main`, `production`, and that same SHA, published at 2026-09-28 13:45:32 UTC. No manual deployment was run.
- The public [English guide](https://help.hellotext.com/choose-your-first-playbook) and [Spanish guide](https://help.hellotext.com/es/elige-tu-primera-mision) returned HTTP 200 with the NPS reporting limitation and the localized goal list. The four linked erratum pages below also returned HTTP 200 with their corrected text; their pairs remain `pending` for complete independent reviews.
- Attaching PR #186 to the Codex task failed because the thread has exceeded 100 attachment identities. The PR itself is merged and publicly verified.

The late P2 review finding concerned the already published Playbook reporting guide's promise of a dedicated NPS report. The bilingual correction and its linked Review Builder and CSAT errata are tracked in `choose-first-reporting-errata.md` and `choose-first-feedback-errata.md` and were published by [follow-up PR #187](https://github.com/hellotext/help/pull/187), merge commit `c8f3fed59af7e8b200669fe8c725134abc962e09`. Its main Build and normal Netlify deploy passed for that exact SHA, and both Choose-first public routes returned HTTP 200 with the narrower CSAT escalation language. Its NPS results-access warning remains correct. This focused follow-up does not change the original visual decision or verifier commit for the completed Choose-first pair.
