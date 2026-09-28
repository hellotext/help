# Abandoned cart: route template vs AI playbook editorial batch

## Source and current state

- Article key: `journeys/abandoned-cart-route-vs-ai-playbook.md`; public routes: `https://help.hellotext.com/es/carrito-abandonado-ruta-vs-mision-ia` and `https://help.hellotext.com/abandoned-cart-route-vs-ai-playbook`.
- `inventory.csv` records both localized bodies as published originals and HTTP 200; `progress.csv` is `pending` before this batch. Work starts from `origin/main` `6aae20798f06c62bc3b04f9ea031f38e58c7281a` on `codex/abandoned-cart-route-vs-ai-guide`.
- The complete original Spanish, English and shared stub are saved under `originals/abandoned-cart-route-vs-ai-playbook/`. SHA-256: Spanish `68f3c464484c830e90c576e83e43b5322effb8d78c3a08a9679bffaacdb10642`, English `d3409687efc91bd02937ef3b081df7850599cccf6c49db4af4350d5345b4a4a1`, stub `90d073a0d14ebfee635757afd357a18d780e7ffb5546e3d6b314ee632f715a4d`. Localized hashes match the inventory.
- Preserve front matter, both titles and descriptions, slugs and redirect, both languages, original links and section order, and published state. Leave the shared stub unchanged.

## Reader task and plan

The reader chooses between a fixed Cart Saver route and AI Cart Saver, then checks the prerequisites and settings for the selected approach before enabling it. Spanish leads; adapt the same correction in English. Factual behavior was checked against Rails revision `d348bd09825d62c2cf551757598ed04a4bca0ce6` in `/private/tmp/hellotext-workload-fixed`.

1. Explain that `cart.abandoned` is recorded after abandonment is detected; an arbitrary page exit does not by itself prove this event. The Rails cart sweeper or an integration can create it. Both default recovery approaches use this event. A separately configured route may use a different trigger, but that is outside this comparison.
2. Keep coupons conditional. Verify that checkout links work for the selected route or playbook and that each option's purchase conditions can prevent an obsolete reminder. The default route checks for a purchase without matching a specific cart product; AI Cart Saver uses a narrower relevant-purchase guard.
3. Split the before-publishing checklist into common eligibility and event-ownership checks, route-specific trigger/wait/message/purchase-condition checks, and AI-specific channel strategy, tone/discount and Inbox coverage checks. The linked Cart Saver route and AI Cart Saver guides document these different controls; do not imply that the AI mission exposes a route wait step or a fixed sender choice. The supervisor sends `cart.abandoned` to an active AI Cart Saver before trying the route; an ineligible AI send does not then fall through to the route.
4. Correct the AI scope from the Rails Cart Saver Composer and admission/send guards: the playbook prepares one proactive cart-recovery message using cart, product and profile context, and can skip or stop an ineligible send. It does not itself interpret replies, answer objections, provide product discovery or recommend alternatives. A separate configured support flow handles replies. Correct the seeded route's order to wait, purchase check, then message, without describing its purchase check as cart-product-specific.
5. Re-read the complete Spanish and English bodies immediately before saving. Preserve the existing guide links and simple decision sequence.

## Section-level visual decision

| Section | Reader question | Decision |
| --- | --- | --- |
| Opening | Which recovery approach should I consider? | The distinction is conceptual; one product screenshot would show only one approach. |
| Use a route template when | When is a fixed sequence appropriate? | The criteria and link to the detailed route guide answer this decision. A route editor screenshot belongs in the setup guide, where its controls are taught. |
| Use an AI cart saver playbook when | When is contextual adaptation useful? | The criteria and link to the AI guide are the relevant comparison; a message example would imply a particular send instead of explaining the choice. |
| What both need | Which data and permissions must be ready? | This checklist spans store integration, customer identity, channel eligibility and purchase events; no single interface state can confirm all of them. The linked verification guide covers the specific task. |
| How to choose | Which option fits the team's readiness? | The existing short decision text is more direct than two unrelated UI captures. |
| Before publishing | Which settings differ between route and AI? | Explicit separate checklists and detailed guide links keep each approach's controls distinct; a single screenshot would misrepresent one option and duplicated narrow screenshots add no new evidence here. |
| Related guides | Where can I configure or troubleshoot the chosen option? | Localized guide links provide the next steps. |

No new screenshot or message preview is warranted in this comparison article. This is a concrete coverage decision for each section, not a waiver of visual review for the linked interface guides. Native capture for other pending guides remains separately tracked and blocked by the recorded Chrome-window helper review; do not substitute a browser image here.

## Adjacent guide follow-up

The linked Cart Saver route and AI Cart Saver guides contained contradictions about reply handling, recommendations, event ownership, and route order. This content batch corrects the most misleading claims in both languages; see `docs/editorial-work/cart-saver-linked-errata.md` for the exact scope and originals. Those two guides remain `pending` for their complete bilingual visual review and native captures. This comparison alone can be marked `local_verified` after its complete verification; do not use that status for the linked guides.

## Verification checkpoint

- The complete bilingual correction was checked against Rails revision `d348bd09825d62c2cf551757598ed04a4bca0ce6`, including the cart sweeper, route seed, AI Composer, purchase guards, and event ownership. A second source review caught and corrected the overly broad claims that the store always produces `cart.abandoned`, that route purchase checks are cart-product-specific, and that AI reply invitations guarantee staffed Inbox coverage.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed for the final localized sources, including Jekyll's ES/EN production output and `script/verify_security_headers.rb`. `docs/` and `AGENTS.md` are absent from `_site`; exported editorial bundle files are unchanged. All six article bodies in this coherent correction have matching ES/EN section counts and link-target order, and the original snapshots match Git HEAD byte-for-byte.
- The controlled in-app browser review passed for all six pages in English and Spanish at 1440×900 and 390×844. The comparison has six rendered sections, the linked route and AI guides nine each; localized content, section anchors, desktop sidebar/TOC, mobile breadcrumb, related links, feedback and footer were inspected. All 12 page/viewport combinations had document `scrollWidth === clientWidth`; locale switches worked. A clean-URL check returned HTTP 200 for all 90 article links across the pages (62 unique per-page targets). The Spanish desktop titles wrap the final `IA` onto its own line without clipping; no layout change is needed in this content batch.
- The staged content diff was limited to three related bilingual articles, the AI description, article work records and exact original copies; `git diff --cached --check` passed. Content commit `71b191cf44dd3414c11757141392342b0db1d198` contains these reviewed changes. The comparison row is now `local_verified` with that exact reachable commit; the linked route and AI guide rows remain `pending` for visual work. Pending: merge, normal deploy and public verification.
- Local verification, PR review, merge, normal Netlify deployment and public ES/EN page checks are separate events. Do not describe a local build as publication.
