# Authorization token label spacing refresh

## Focused plan — 2026-09-30

Refresh the same unsaved token-name view after the user reported corrected label/input spacing. Spanish first, then English, desktop and mobile. Four native sources replace the token figure across the four requested guides (Developers overview, Custom store integration, External tracking, Orders API) and the two other consumers (Products/inventory API, Messages API). Each guide keeps its existing reading task, insertion point, captions, links and other figures. No additional screenshot answers a different question in this correction.

Actual UI is Rails `5403a7dcb567b63cae87d4c088112d65fad4eb7f`, merged #6054; local protected settings are retained. All four live views measure the corrected 8px field gap. Names remain Tienda propia · desarrollo / Custom store · development in unsaved DOM drafts. No token is created and no credential is shown. Guarded fixtures have zero tokens, zero messageable/subscribed contacts and no enabled playbooks before/after. Locale restored ES.

Evidence, twelve pre-refresh article snapshots/hashes and four native untouched P3 2× sources are in `captures/custom-store-integration/token-spacing-refresh`. The original sources and their historical publication proof remain unchanged. New assets live once in `images/developers/custom-store-integration/token-spacing`, reused by all consumers without duplicate upload per guide. Desktop 540×238 CSS /1080×476 PNG; mobile 374×216 CSS /748×432 PNG. Native-size frame cap remains 558px, including its 18px inset/border; stage remains full-width lavender. No shared guide/renderer/CSS change or tests.

## Verification

Source pixels inspected in both languages and both layouts: clean Object Sans text, complete heading/label/name input, balanced margins, no pointer, caret, scrollbar, private data or pixel editing. Canonical capture guards checked PID/profile/loopback/single tab/title/account/locale/viewport/zoom/DPR before and after. Reverse-patch checks recover all twelve snapshots exactly; text, captions, links, stubs, publication and other figures stay byte-identical.

Build including security headers passed. All twelve complete articles were reviewed in the isolated Help browser at 1440×1000, 390×844 and 580×900; all existing figures loaded, native-size caps held, and no page overflow appeared. The four native sources and all 32 distinct existing/new figure PNGs match their built copies. Source pixels and all 36 token-figure presentations were inspected. Metadata for sections, examples, figures and footer review is retained under page-review. Public publication is verified; exact content-merge main Build, normal production commit_ref, twelve pages and 32 approved PNG hashes are recorded below. Ledger remains 61 local_verified, 92 pending and one out_of_scope; all 61 verifier commits are ancestors of baseline main. The correction verifier recorded below covers this focused refresh without replacing the original full-article verifiers.

Correction content verifier: `4bca01d1ac460dfe5ce07b8845673492b109ffcb`. This commit contains all reviewed sources, twelve localized path/height updates, unchanged-content snapshots and local verification. Original full-article progress verifiers remain unchanged and reachable.

## Public verification — 2026-09-30

Help PR [#285](https://github.com/hellotext/help/pull/285) merged by `e89db5e3a1668bc97396ffa356563278f6396b2d`, preserving all individual commits. Build/Aikido/Netlify preview/header checks passed on exact head `a199b41a308586f3a2b5ec084c096e11b203f2a5`. Independent review completed for that head; actual comments/reviews/threads were read before the separate protected merge. Review: https://github.com/hellotext/help/pull/285#issuecomment-5917113187. PR attachment attempted; existing 100-identity limit.

Exact main [Build 36758255231](https://github.com/hellotext/help/actions/runs/36758255231) passed. Normal Netlify production `6abd53af03038c0008433540` is ready/published at `2026-09-30T18:24:34.705Z` with matching commit_ref `e89db5e3a1668bc97396ffa356563278f6396b2d`. No manual deploy. All twelve localized pages contain the updated shared token figure and every expected existing figure. All 32 distinct PNGs responded HTTP200 with approved source/asset hashes: four new native screenshots once and 28 unchanged other PNGs. No duplicates uploaded per guide.

Public pages:

- [https://help.hellotext.com/es/resumen-desarrolladores-api](https://help.hellotext.com/es/resumen-desarrolladores-api) — HTTP200, 2 existing figures.
- [https://help.hellotext.com/es/integrar-tienda-personalizada](https://help.hellotext.com/es/integrar-tienda-personalizada) — HTTP200, 2 existing figures.
- [https://help.hellotext.com/es/seguimiento-externo](https://help.hellotext.com/es/seguimiento-externo) — HTTP200, 2 existing figures.
- [https://help.hellotext.com/es/pedidos-con-api](https://help.hellotext.com/es/pedidos-con-api) — HTTP200, 3 existing figures.
- [https://help.hellotext.com/es/productos-inventario-con-api](https://help.hellotext.com/es/productos-inventario-con-api) — HTTP200, 3 existing figures.
- [https://help.hellotext.com/es/enviar-mensajes-con-api](https://help.hellotext.com/es/enviar-mensajes-con-api) — HTTP200, 2 existing figures.
- [https://help.hellotext.com/developers-api-overview](https://help.hellotext.com/developers-api-overview) — HTTP200, 2 existing figures.
- [https://help.hellotext.com/integrate-custom-store](https://help.hellotext.com/integrate-custom-store) — HTTP200, 2 existing figures.
- [https://help.hellotext.com/external-tracking](https://help.hellotext.com/external-tracking) — HTTP200, 2 existing figures.
- [https://help.hellotext.com/orders-with-api](https://help.hellotext.com/orders-with-api) — HTTP200, 3 existing figures.
- [https://help.hellotext.com/products-and-inventory-with-api](https://help.hellotext.com/products-and-inventory-with-api) — HTTP200, 3 existing figures.
- [https://help.hellotext.com/send-messages-with-api](https://help.hellotext.com/send-messages-with-api) — HTTP200, 2 existing figures.

New native screenshots, shared without duplicates:

- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es-mobile.png) — HTTP200; SHA256 `6c9ef30747a2fe23a65542aa040142515cfe034a5df24c6a51e0161f4052b94b`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es.png) — HTTP200; SHA256 `9edcb6a1e9354047b98feb41d5a10b613acdaed33e1dfce768406dd6f3504f8a`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en.png) — HTTP200; SHA256 `efe16993a26fbf2e3047bc57da420ff888069022f45fcebd3af561965906a4c2`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en-mobile.png) — HTTP200; SHA256 `2200d9bccae650ed15f47970ab7eb729365e544e6000b1bde4758e600697778b`.

All other unchanged reused image URLs and hashes are in public-verification.json. The twelve historical snapshots and old approved token assets remain intact. The public record receives exact post-merge main Build/deploy/pages/PNG evidence in its GitHub comment. Ledger remains 61 local_verified, 92 pending, one out_of_scope; all original verifiers and the focused refresh verifier must be ancestors of final main.
