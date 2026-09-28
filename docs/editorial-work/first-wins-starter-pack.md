# First wins starter pack editorial batch

## Source and plan

- Article key: `getting-started/first-wins-starter-pack.md`; public routes `/first-wins-starter-pack` and `/es/primeros-logros-recomendados`. The `progress.csv` row was `pending` on `origin/main` `457db976500e6271552e3a7034fd8962c6cc72a5`. This batch uses `codex/first-wins-starter-pack-guide`.
- The complete current Spanish, English and shared stub were preserved before editing in `originals/first-wins-starter-pack/`. SHA-256: Spanish `32a05a1c2cd01f181b70b68ad4e0ca90dd74aae458bde6798b868bc6275c3402`, English `fdb52becb37ff0578661b693fe47bfa496b215360f1853fd1f2cc5b67132a131`, shared stub `2d8fdab8dd23475337687cafdee93eff75a51e7e3ab107a1826ac9f9b4d7a206`. The earlier narrow Cart Saver and catalog erratum is already published; this is the pair's first complete review.
- Preserve the shared stub, titles, descriptions, slugs, language pairing, all existing links, draft/publication state and the article's five-goal path. Spanish leads; adapt the checked meaning into English.
- Clarify that three to five wins form a staged shortlist with one first launch. Keep post-delivery Review Builder and NPS under feedback rather than conversion, and CSAT under feedback rather than support-load reduction. Verify outcome, response access and first-week timing claims against the current Rails source. Re-read complete bodies before saving.

## Section-level visual decision

| Section | Reader question | Current decision |
| --- | --- | --- |
| Opening and staged shortlist | How do I select and sequence early goals? | Planning across several tools; a single interface would not show the sequence. |
| Grow audience | Which capture approach fits the entry point? | The alternatives span QR, links, web, checkout and Webchat; linked setup guides show the distinct controls. |
| Recover carts | Should I use a fixed route or a contextual outbound reminder? | The linked Cart Saver comparison explains the two workflows and owns interface-specific visuals. |
| Convert or recommend | Which signal fits a conversion-oriented mission? | A cross-product choice list; linked mission guides show their own setup. |
| Reduce support load | Which response task could be automated? | The options use different Inbox and mission screens; a single screenshot would privilege one option. |
| Feedback or campaign | Which moment and measurement path fits? | Review Builder, NPS, CSAT, restock, price drop and campaigns have distinct screens; their linked guides own those visuals. Do not depict a nonexistent dedicated feedback report. |
| Avoid, review, related guides | What should I monitor before expanding? | Planning and cross-report checks, without a distinct shared control or result state. |

The article is a chooser, not a setup walk-through. No screenshot or message preview currently explains a distinct reader task at the article's final width. This decision does not close screenshot debt in the linked interface guides.

## Source checkpoints

- Rails revision `26742adc0c` handles Review Builder and NPS from recognized `order.delivered` events. Their schedulers use the tracked delivery time plus seven days, with send-time or contact pacing able to move the message later. Review Builder also needs product data. They belong under feedback, not conversion, and their first answers need not exist in a first-week review.
- CSAT runs after a qualifying resolved conversation; it measures feedback rather than reducing repeated support questions. The NPS responder records the first valid score but does not start recovery for low scores. `Playbook::Report::IDENTIFIERS_BY_TYPE` excludes Review Builder, NPS and CSAT; Service Quality shows aggregate Customer Satisfaction. The guide now plans human NPS follow-up and results access separately.
- Complete-the-Look requires an `order.confirmed` event with products in that order; mere browsing does not start it. Back-in-Stock fanout can use eligible recorded product interest from wishlist, recent cart addition or recent exact-product view; a separate explicit alert request is not required. The guide now states those narrower launch conditions.
- The linked Complete-the-Look and Back-in-Stock guides are still `pending` and contain broader trigger descriptions that need their own source-backed revisions and native interface coverage. Complete-the-Look needs a confirmed-order frame across many sections; Back-in-Stock needs its request/waitlist examples reconciled with the actual recorded-interest sources. This batch does not mark those pairs verified or use their current prose as evidence.

## Local verification

The complete Spanish and English bodies were reviewed after the focused changes. Both retain nine H2 sections and 45 Liquid link references (the three removed references were duplicates in the wrong categories); the stub, titles, descriptions, slugs and published state are unchanged. The original snapshots above represent the current pre-batch article, after the earlier narrow public erratum.

`PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed the bilingual Jekyll build and security-header check. The full local rendered guide was checked in both languages at 1440 × 900 and 390 × 844 CSS px. The desktop article stayed within its existing column; mobile article width was 358 CSS px inside a 390 CSS px viewport, with stable document width 390 CSS px and no visible horizontal overflow. The opening, conversion, feedback, weekly review, related links, headings and footer were inspected; both versions retained readable paragraphs and the correct localized link set. This is browser review of a conceptual article, not a native screenshot source for publication. `git diff --check` passed.

The verifying bilingual content and original-snapshot commit is `6ef072e7` (`Clarify staged first wins and feedback timing`), now recorded in `progress.csv`. This locally verified pair increases the count to 30 of 153; the linked Complete-the-Look and Back-in-Stock pairs remain `pending`. A local build is not public publication; record the PR, normal deployment and public checks separately.

## Publication and public verification

- [Help PR #189](https://github.com/hellotext/help/pull/189) passed Build, Aikido Security, Netlify deploy-preview and header checks; the automated review completed without findings. Both localized preview pages returned HTTP 200. The PR merged without squash on 2026-09-28 at 14:43:50 UTC as `5b3e33f93b4afa3d759eccc142ffcc04328a6378`, preserving the individual content commit `6ef072e7` and verifier commit `45d254c7` as ancestors of `main`.
- The [normal main Build](https://github.com/hellotext/help/actions/runs/36438174685) completed successfully for that exact merge SHA. Netlify's [production deploy](https://app.netlify.com/projects/legendary-lollipop-e2d131/deploys/6aba7d28134a490007a8dcbd) reported `ready` for branch `main`, context `production`, and the same SHA; it published at 2026-09-28 14:44:28 UTC. No manual deployment ran.
- The public [English](https://help.hellotext.com/first-wins-starter-pack) and [Spanish](https://help.hellotext.com/es/primeros-logros-recomendados) pages each returned HTTP 200 and contained the staged first-win and seven-day feedback timing corrections. This pair has no new PNG by the section-level visual decision above. The linked Complete-the-Look and Back-in-Stock articles retain their separate pending review and screenshot debt.
- Attaching PR #189 to the Codex task was attempted but rejected by the task's 100-identity attachment limit; the GitHub merge and production publication succeeded independently.
