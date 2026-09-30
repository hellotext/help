# Products and inventory API bilingual editorial review

## Starting state

Separate codex/products-inventory-api-guide from main c9a7ef06f9e3925689a4bcd041e1de276508907a. Inventory153 pairs plus one redirect; progress59 local_verified,94 pending,1 out_of_scope; all59 verifier commits are ancestors. No Help PR open. Preserve protected campaign branch and unchanged commerce-environment blockers. Spanish first, English second; preserve nine original h2 sections, titles/slugs/stub/publication, original links and examples.

## Section-specific visual plan before editing

| Section | Reader question / visual decision |
| --- | --- |
| Introduction | Explain catalog context versus live inventory in prose; no screenshot can prove stock is synchronized. |
| Before starting | Reuse four current approved P3 2x authorization-name draft sources from Custom store integration with original UI evidence; no token created or exposed. |
|1 Stable identity | New focus of actual Product editor: name/reference/SKU/source. Existing draft product vjNEoZop from Orders batch is safe and coherent; no reseeding. Explain UI labels versus public ID and reference ambiguity. |
|2 Create parent/variants | Audit POST/201/validation, variants/parent IDs/response without executing examples. No existing safe variant fixture; do not manufacture a saved variant merely for screenshot. Code illustrates parent/variant contract; identity editor covers common fields. |
|3 Update | New real price editor control focus with amount/currency and converted amount where visible. Explain money versus misleading UI quantity label. Open control without final Save; do not change stored price/state. Audit PATCH variants[] deletion risk and use separate variant endpoints. |
|4 Inventory boundary | Inventory parameters absent from product contract; do not fake stock or availability with custom metadata or draft status. Prose and verified source explain boundary; no empty/unavailable control screenshot. |
|5 Activity | Audit actually published SDK2.6.0: async initialize/page.viewed explicit/product vs variant action/context/received. No event or fake success screenshot. |
|6 Safe synchronization | Prose checklist explains ID mapping, pagination, source ambiguity, POST retry uncertainty; avoid redundant editor image. |
|7 Catalog quality | Explain readback API and actual Settings → Objects → Products editor. Reuse adjacent identity/price figures; no new order/event or inventory transition fabricated. |
| Related | Preserve original links; no decorative image. |

Three concepts per language planned: token draft reuse plus identity and price controls (eight new native PNGs if clean and useful). Existing product remains draft with0 events, no variant/coupon/workflow changes. Before/after guards: exact isolated database/account,127 contacts,0sendable/subscribed,49messages,318events,0tokens,0enabled playbooks. Restore Spanish names/locale. Full article ES/EN1440/390/580px, native P3 2x, logical cap+18px, static full-width lavender stage, complete controls, original integrity, syntax-only examples, build/security headers, four-way hashes and public verification required. Publication pending.

## Source and local audit

Current Rails e6ae33a310 contracts and official API reference reviewed. Published scoped npm package @hellotext/hellotext2.6.0 tarball shasum verified and matching CDN source inspected; unscoped package URL is not authoritative. SDK initialization is async, page.viewed must be explicit. Preserve existing three examples per locale, syntax only. Product creation201 versus tracking received, public IDs/reference/SKU/source ambiguity, case-insensitive lookup, default parent variant representation, dedicated variant endpoints, destructive PATCH variants empty array, money/converted money, absence of inventory fields and internal fallback availability, same-business session/profile/consent, pagination/uncertain retry are clarified. No live API examples executed.

Reused existing Orders draft product, unchanged name/state/price/zero variants/events. Its fictitious proper name Agenda semanal intentionally stays identical across UI locales. Only account locale changed and restored ES. All fixture counts unchanged. Opened amount control without saving. Eight new native identity/amount PNGs verified visually with complete controls, P3 and2x; four original token images reused with original UI evidence, no duplicates. Native logical widths identity503/389, price471/357, token540/374; frame caps native+18.

First complete browser pass found a9px mobile page overflow from the newly added long inline POST-and-path literal. The shorter method/path split still overflowed; final prose names POST /products/:product_id/variants under the explicit /v1/attribution base in both locales. This preserves the complete endpoint while allowing normal wrapping. Rebuilt and repeated full browser review. No stylesheet changes or styling tests.

## Local verification complete

Normal yarn build with Ruby3.3.6 on PATH passed including security headers. All twelve native/asset/root-build/ES-build hashes match and docs are excluded from publication. Full ES/EN browser review at1440,390,580px passed with nine original headings, three figures and three syntax-only examples; original links/stub/publication preserved. All source densities are2x and image/frame caps stay within their original logical sizes including responsive sources. No overflow remains after the inline endpoint correction. No CSS/migration tests or renderer changes. Article/source audit/fixture/provenance are locally complete; PR checks/review and exact normal/public verification remain pending.

Content verifier `9eb84f0ce33bc1b4550c9d4bdcc5c85d8cbc6a2c`. Progress now60 local_verified,93 pending,1 out_of_scope; publication remains pending and is recorded separately after normal deployment.

## Public verification — 2026-09-30

Help PR [#280](https://github.com/hellotext/help/pull/280) merged by `ff984286a2aa8fa71919745ece1d81c1c2ffd815`, retaining all individual commits. Required Build, Aikido, Netlify preview/header checks and independent review passed on exact head `cc23481894e2cf06897485e725cf78a37cc7e36f`. Actual review threads/comments were read with no unresolved findings before the separate merge call. Review: https://github.com/hellotext/help/pull/280#issuecomment-5914715502. PR attachment was attempted and reached the existing 100-identity limit.

Exact main [Build 36739969883](https://github.com/hellotext/help/actions/runs/36739969883) passed. Normal Netlify production `6abd3020d23b2c0008e10084` is ready/published at `2026-09-30T15:52:43.297Z` with matching commit_ref `ff984286a2aa8fa71919745ece1d81c1c2ffd815`. Both pages contain three localized figures each and updated product/variant/identity/amount/inventory/retry guidance. Both pages and all twelve responsive PNGs returned HTTP 200 with approved native source hashes: eight new product editor images and four token-name sources reused without duplicate uploads. Source density remains 2× and browser/native logical caps prevent upscaling. No manual deployment.

Public pages:

- [https://help.hellotext.com/es/productos-inventario-con-api](https://help.hellotext.com/es/productos-inventario-con-api) — HTTP 200, three figures.
- [https://help.hellotext.com/products-and-inventory-with-api](https://help.hellotext.com/products-and-inventory-with-api) — HTTP 200, three figures.

New native images, including mobile:

- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-es.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-es.png) — HTTP 200; SHA256 `cad5dac8389b4545324ad7b0d2cdc0c1cfd2d04a476b42f7bf5110530cc50f43`.
- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-es-mobile.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-es-mobile.png) — HTTP 200; SHA256 `e59c825526ab948c121cde309ff647e98d8b8b015546116fe91e5cdf15ebdb00`.
- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-es.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-es.png) — HTTP 200; SHA256 `b02b57decfb690fdbcd3cc26f8972fe0933c6d190ca0d5eb848ae25fadcafb31`.
- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-es-mobile.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-es-mobile.png) — HTTP 200; SHA256 `2e7469ff34da4443c11ae232f485b4306330a4446a56e970d1c0d8012396906a`.
- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-en.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-en.png) — HTTP 200; SHA256 `0ad4775d9bd3d743c1aa60c89c9db36609032046126386e77710f41b682c78e8`.
- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-en-mobile.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/identity-en-mobile.png) — HTTP 200; SHA256 `ee47e9bab2033b8dc413e0eb63a5d89ad5f65f322dd07b4431e864677a332b60`.
- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-en.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-en.png) — HTTP 200; SHA256 `d7def7c8355e24a8cf478cc1905d9dd4ff37d40fff2a315fb900181eea56b17d`.
- [https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-en-mobile.png](https://help.hellotext.com/images/developers/products-and-inventory-with-api/price-en-mobile.png) — HTTP 200; SHA256 `4236f24c45cd0b7ac0d8a6b9e00f4ab0752ba0e5fe04e46adf6e08711e4e589d`.

Approved sources reused without duplicates:

- [https://help.hellotext.com/images/developers/custom-store-integration/token-es.png](https://help.hellotext.com/images/developers/custom-store-integration/token-es.png) — HTTP 200; SHA256 `1aee0b74d12bed3eb995c7211316047bd59158a92f2c491dfc4a01287c5fb953`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-es-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-es-mobile.png) — HTTP 200; SHA256 `ab734e406f700b90cd37365b7a1d084cedb9e8adda7bca8757182d471e6d355a`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-en.png](https://help.hellotext.com/images/developers/custom-store-integration/token-en.png) — HTTP 200; SHA256 `ca4b35ca243e0e6db3c52219e00162ef2c708efd61d7265dc25f599907c97bd6`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-en-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-en-mobile.png) — HTTP 200; SHA256 `716908e63c1f6e914b3dc8d7456e224c02fe69b24797477dded04096b9ec7652`.

The independent public record PR and its exact main Build/normal production/page/hash verification close this batch. Post-record evidence is attached to that PR after merge. Ledger: 60 local_verified, 93 pending, 1 out_of_scope. The content verifier remains 9eb84f0ce33bc1b4550c9d4bdcc5c85d8cbc6a2c; all verifiers must be ancestors of final main. Existing protected campaign branch and local dependency folders are preserved. No API examples, tracking events, delivery workers, final send/test/save actions or new captures are needed for this record.

## Token label spacing refresh — 2026-09-30

The token-name figure now uses the four current native P3 2× sources from Rails #6054, shared across all six consumers without duplicate upload per guide. Only its source paths and corrected height metadata changed; prose, captions, links, other figures and publication are preserved. Original source/provenance and publication evidence above are historical and retained. Current correction evidence: [token-spacing-refresh.md](token-spacing-refresh.md) and `captures/custom-store-integration/token-spacing-refresh/capture-provenance.json`. No token created; locale restored ES. Complete ES/EN page review at desktop/mobile/narrow sizes, native/build hash checks and the build passed. Public verification passed after Help #285: exact main Build and normal production commit_ref, both localized pages and approved native served PNG hashes. See the focused record for current URLs and hashes; the historical source proof above remains unchanged.
