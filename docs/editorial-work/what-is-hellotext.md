# What is Hellotext editorial batch

## Source and scope

- Article key: `getting-started/what-is-hellotext.md`.
- Published routes: `https://help.hellotext.com/es/que-es-hellotext` and `https://help.hellotext.com/what-is-hellotext` (both HTTP 200 before editing on 2026-09-27).
- Inventory state: `published_original`; progress state before editing: `pending`.
- The byte-for-byte original Spanish, English and shared-stub files are under `originals/what-is-hellotext/`. Their SHA-256 values are `3edbbcb78256d4942dbc4c89a0f212ecf7426bafefb7f03a9f750011e1129ba9` (Spanish), `e80e5e12002a1375a0d20fa3a721ddcde398084186aed6a18eb89b1c24e435dd` (English), and `5c2b577b1cd46ff8fa244e946dc254c968b6da6d1970fc610c2366f6c8a053f4` (stub). The first two match `inventory.csv`.
- Branch `codex/clarify-hellotext-actions` starts at `origin/main` merge `b064002b147f7c0c836e1f5fd12dbaf3f73dea91`.

## Article-specific plan

The introduction and action list currently make a planned campaign sound like a signal-triggered action of a prioritized mission/playbook. Both the current bilingual Campaigns overview and How Hellotext works guides say a team chooses the audience, message and send time for a one-time campaign, while a playbook reacts to signals. Remove campaigns from the automatic action list and keep the eligible-mission prioritization. Remove “updating a segment or report” from the customer-action list without suggesting that data and reports never update. Add one short abandoned-cart versus product-launch example in each language, with a link to the Campaigns overview.

Preserve the existing titles, slugs, front matter, all existing article links, publication state and section structure. Add no product screenshot: this article explains the conceptual choice between playbooks and campaigns, with no UI step or control to show. A single UI image would depict only one part and be decorative rather than answer a reader question. This decision follows `docs/editorial/guide.md`; it does not close the separate Demand insights, Performance or Service quality visual queue.

Verification target: reread both complete articles; compare the correction with the current bilingual Campaigns overview and How Hellotext works guides; build ES/EN pages; inspect both full pages at desktop and mobile widths and verify the new links. Mark `local_verified` only after these checks pass. The macOS session was locked at the start of this batch, so the native capture preflight stopped before the ScreenCaptureKit helper listing. No product capture or fixture change is needed for this article.

## Local verification

- Reread both complete revised articles against their saved originals. All 11 existing level-two/three headings and all 15 existing Liquid article links per language remain; each locale adds only the contextual Campaigns overview link. The shared stub, front matter, titles, slugs, languages and publication state are unchanged.
- The corrected distinction matches the bilingual `campaigns/campaigns-overview.md` and `getting-started/how-hellotext-works.md`: campaigns are planned one-time sends whose audience, content and delivery time the team chooses; playbooks respond to signals. The example gives a customer-signal case and a planned-launch case without pretending a campaign is an automatic playbook step.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed, including `script/verify_security_headers.rb`. Both built article files and their linked Campaigns overview targets exist. The `docs/` work record and originals are excluded from `_site`.
- Reviewed the complete local Spanish and English pages in the in-app browser, scrolling through each at 1440 × 900 desktop and 390 × 844 mobile widths. Both have the correct title and locale, an 810 px desktop article width and 358 px mobile width, with no horizontal page overflow at either width. The localized example and link render correctly, and the bottom related-guide and feedback areas remain readable.
- `git diff --check` passed. No stylesheet, fixture, contact, campaign, message or screenshot changed. The remaining native report captures are separate work and remain deferred while the macOS session is locked.

The verified content commit and publication evidence will be recorded below after the corresponding steps complete.
