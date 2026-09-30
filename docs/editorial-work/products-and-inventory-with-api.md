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
