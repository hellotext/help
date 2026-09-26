# Lists versus segments bilingual batch

## Source and state before editing

- Article key: `audience/lists-and-segments.md`. Published routes: `https://help.hellotext.com/es/listas-y-segmentos` and `https://help.hellotext.com/lists-and-segments`. Inventory records HTTP 200 for both and `progress.csv` marks the pair `pending`.
- The complete pre-edit Spanish and English bodies and shared stub are preserved byte for byte under `originals/lists-and-segments/`. SHA-256: Spanish `3eda69e8a23a2f12282603995a70e352a288ca76ec366983abf9fb1b61332888`; English `775f16e21ce004e974fd9ab0cce3db2e560a92509992024ecdbcad3b98582bfb`; stub `c1ade45aefe0e16d193943e2bf2c6367f6cbe42dc21d765af7161d1e90e45a39`.
- Start from `origin/main` at `07765790109f98a571e6246bab1ebe846479812a` on `codex/help-lists-and-segments`. Preserve title, slug, links, languages, navigation and publication state.

## Reader task and article-specific plan

The reader chooses a fixed list or a rule-based segment and combines groups into a campaign audience without accidentally including a profile meant to be excluded.

1. Replace the unsupported cumulative-spend example with a purchase-in-period example the Rails segment builder implements (`app/models/segmentation/order.rb`). Keep the existing list example and distinction between explicit and dynamic membership.
2. At the existing audience-combination paragraph, state that included lists and segments are combined, duplicate profiles count once, and a selected exclusion removes a profile even when it belongs to another included group. `app/models/contact/audience_query.rb` implements the inclusion union, distinct count and exclusion filtering. Use the article's existing recent-purchaser, event-attendee and internal-test groups to illustrate the overlap.
3. Keep the consent distinction and full link set. No screenshot is useful: the article explains group semantics, the existing comparison table covers the choice, and a UI capture would add little to the overlap example while exposing possible contact data. No message example is involved.
4. Revise Spanish first and adapt English. Re-read current content before saving; verify the complete rendered articles at desktop and mobile, build and security headers, links and metadata. Record the verifying content commit in `progress.csv`, then integrate with PR and verify the normal public deploy separately.

## Checkpoint

The Spanish article was revised first, followed by its English counterpart. Both now use a purchase-in-period example supported by the Rails segment builder and explain that an included profile appears once and is removed when a selected list or segment excludes it. An independent read-only review found no other material factual issue in the complete articles and confirmed bilingual parity against Rails `app/models/contact/audience_query.rb` and `app/models/segmentation/order.rb`.

Local verification on 2026-09-26: `yarn build` passed for both languages, including `script/verify_security_headers.rb`; `git diff --check` passed. The complete rendered pages were read in the in-app browser. Desktop screenshots showed the title and article layout in both languages; the revised audience section was inspected in both languages. At a 390 × 844 mobile viewport, both revised sections remained readable and each page's document `scrollWidth` equaled its 390 px `clientWidth`. The six section headings, nine Liquid links and their order, shared stub, titles, slugs, navigation and publication state are unchanged; all link target files exist. No image was added because the existing comparison table and textual overlap example cover this conceptual task without exposing contact data. Verifying content commit: `c94f3cb3aa683d0394d00b0427c136916a512f4e`.

`progress.csv` records `local_verified` with the content commit; public integration is recorded below.

## Public verification (2026-09-26)

Help [PR #106](https://github.com/hellotext/help/pull/106) passed the GitHub Build, Aikido Security, Netlify header and deploy-preview checks. The automated code review completed without inline comments. Both preview routes returned HTTP 200 with the revised localized text. The PR merged into `main` at 16:31:35 UTC with merge commit `0a3910a197e6e5c036f89be4b9410beb365e0d58`; its parents are prior main `07765790109f98a571e6246bab1ebe846479812a` and article branch tip `87236f9e90bf6075b739a4dcab817458692ff07f`, preserving both individual commits. The [main Build run](https://github.com/hellotext/help/actions/runs/36255772349) passed for that merge commit.

Normal Netlify production deploy `6ab7f36a93994c0007df0cb9` reached `ready` for the exact merge commit at 16:32:15 UTC; no manual deployment was used. The public [Spanish article](https://help.hellotext.com/es/listas-y-segmentos) and [English article](https://help.hellotext.com/lists-and-segments) each returned HTTP 200 with the expected language and new inclusion/exclusion explanation. Neither page contained the removed cumulative-spend example. The article remains `local_verified` in `progress.csv` because that status tracks the verifying content commit; this section records publication separately.
