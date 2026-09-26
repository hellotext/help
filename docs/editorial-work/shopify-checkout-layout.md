# Shopify checkout image layout correction

## Starting state

- Published pair: [Spanish](https://help.hellotext.com/es/shopify-checkout) and [English](https://help.hellotext.com/shopify-checkout). Both bodies have the explanatory marketing-method sentence immediately followed by the image Markdown without an empty line. The Markdown renderer places both in one paragraph. The Help image-box rule gives that paragraph a flex layout, leaving the text squeezed at the left of the image.
- The user-provided screenshot shows the Spanish defect. The English source has the same structure. This article is `pending` in `progress.csv`; the current batch corrects layout only and does not claim a complete bilingual screenshot review.
- Original copies are under `originals/shopify-checkout-layout/`. Starting SHA-256: Spanish `2e2ea4cfc1073c9d95a45d0ea5b23ed7388556ccd4d166235901efbfc601505e`; English `53b0ea3ce6c0fece2c42bd64ab636e312de16f8ca54c4a5802c2adf040c677e6`; stub `c931aca2d2c224c69dfaa8900c29841c0feb3a5b0d0b19929b1989ec89b163b7`.

## Focused plan

In both languages, place the existing image in its own Markdown paragraph immediately after the steps, then place the unchanged explanatory sentence in a separate paragraph below the image box. Preserve headings, text, Shopify link, image bytes and URL, titles, slugs, locale, and publication state. Do not change the shared CSS or generated Rails bundle.

Build the full site and inspect both complete pages at desktop and 390 px mobile widths. Verify the image paragraph contains only the image, the explanatory paragraph follows below it, the page has no horizontal overflow, and the image remains static and unlinked. Run `git diff --check`, commit, review PR checks, merge with a merge commit, and verify the two public pages after normal Netlify publication.

The existing `shopify-marketing-options.png` is a legacy 693 × 223 PNG with a `VG272U` profile and remains byte-identical in this layout correction. A future screenshot update should recapture the actual Shopify interface to the shared native Display P3, at-least-2× standard before replacing this asset. Use synthetic store data and keep the figure static and unlinked.

## Progress

- 2026-09-26: Starting state and originals recorded. The unchanged image now precedes the unchanged explanatory paragraph in both languages, with a blank Markdown line between them. `progress.csv` links this record while the complete editorial pair remains `pending`.
- The production-mode `yarn build` passed, including `script/verify_security_headers.rb`. Parsed built Spanish and English pages each have an image-only `<p>` followed immediately by a separate explanatory `<p>`; the image is not linked. The source and both built language copies of the PNG have the same SHA-256 `8c585d2757a32b17573f7043029d1227b20149b20bcf6c03f60dc26574783772`.
- Both complete local pages were reviewed at 1280 px desktop and 390 px mobile widths. In each language, the lavender image box is above the full-width explanatory text. At both widths the document has no horizontal overflow. The mobile Spanish box ends at CSS y=184 and the text starts at y=200; the English desktop box ends at y=459 and the text starts at y=475. No image link or open control was introduced. `git diff --check` passed; the verified content is commit `6ef4724095c11f8a6586b74941742635e383edd5`.
- [Help PR #114](https://github.com/hellotext/help/pull/114) passed its build, Netlify deploy-preview and header checks, and Aikido security check; the two preview pages rendered an image-only paragraph followed by the explanatory paragraph. It merged with merge commit `bd6be2372de9ae686eb4a001ad2405e77c300131` on 2026-09-26. The post-merge build passed. After the normal Netlify publication, [Spanish](https://help.hellotext.com/es/shopify-checkout) and [English](https://help.hellotext.com/shopify-checkout) both returned HTTP 200 and rendered the image alone in its paragraph, followed by the correct explanatory paragraph. Their PNG URLs returned HTTP 200 with the unchanged source SHA-256. This completes the requested layout correction; the pair remains `pending` for its broader editorial and screenshot review.
