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

Plan and originals saved before article edits. Implementation and verification pending.
