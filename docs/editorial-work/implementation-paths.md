# Implementation paths editorial batch

## Source and scope

- Article key: `getting-started/implementation-paths.md`.
- Published Spanish and English routes: `https://help.hellotext.com/es/caminos-de-implementacion` and `https://help.hellotext.com/implementation-paths`; both returned HTTP 200 before editing on 2026-09-27.
- Inventory status: `published_original`; progress status before editing: `pending`.
- Original Spanish, English and shared-stub files are preserved byte for byte under `originals/implementation-paths/`. The inventory SHA-256 values match the current Spanish (`e0e6f1f6bb789e1d85a14153bb1a681647f697cfc11f41568ec9e9b62406b626`) and English (`9af082bd76e9e3a26b6e2406e436b0a82379d4bba557612800149d2e94a19c41`) bodies; the stub SHA-256 is `45d8572864408fe841347b11bfd0644af42b44c85824bda503a5954956eeab77`.
- Branch `codex/implementation-paths-guide` starts at `origin/main` merge `de298abcf3c22907b254ebf6461664249c925620`.

## Article-specific plan

The reader must choose a starting source of customer and commerce data, then add the relevant messaging or marketplace channel. The existing guide lists seven paths in sequence but does not make that combination explicit. Add a compact bilingual decision aid near the introduction and one Shopify-plus-WhatsApp example. Keep all seven detailed paths, their existing links, front matter, titles, slugs, locale pairing and publication state. Correct only wording that affects the task.

The linked current guides expose two material sequence/scope errors to fix in both languages. `connect-catalog-to-whatsapp.md` requires a compatible store integration and Meta catalog before linking the catalog during WhatsApp Embedded Signup; the current path lists WhatsApp connection first. `connect-mercado-libre.md` limits the channel to Colombia/Uruguay, order-linked post-sale conversations and eligible outbound activity, and excludes campaigns; the generic launch/test steps currently imply otherwise. Also narrow Wix to a store, align the Shopify repeat-purchase translation, and make checkout opt-in and test steps conditional on the selected path. These statements are grounded in the linked Help source guides, not in a demonstration account.

No product screenshot is planned: a Shopify, Wix, WooCommerce, VTEX, Mercado Libre or WhatsApp screen would show only one integration and imply that it represents the other paths. The choice is about where business data originates and which channel to add, so a scannable HTML decision aid and a concrete cross-channel example answer the reader's question more directly. Linked platform guides remain the place for interface screenshots.

Verification target: reread both complete articles and current linked instructions; build the site and inspect generated ES/EN pages, links and article metadata. Review both full pages at desktop and mobile browser widths, check that any table is readable without horizontal page overflow, and confirm `docs/` remains excluded from the built site. Mark `local_verified` only after all checks pass, then commit and publish through the authorized PR/merge workflow. The macOS GUI was still locked at this batch's start; no ScreenCaptureKit window listing or capture was attempted.

## Local verification — 2026-09-27

- Reread the complete revised Spanish and English bodies. The four-row choice table points to all seven retained path sections; the Shopify-plus-WhatsApp example distinguishes optional checkout opt-in and catalog setup. The Mercado Libre path and final checklist no longer imply campaigns or arbitrary outbound tests on that channel.
- Cross-checked the corrected sequence against the current Spanish and English `connect-catalog-to-whatsapp.md`, `connect-whatsapp.md`, `connect-mercado-libre.md`, `connect-wix.md`, and `custom-store-integration.md` source guides. The public Mercado Libre guide also confirmed the Colombia/Uruguay and order-linked scope during this batch.
- The shared stub and its published front matter were not edited. All nine original section headings and all 22 existing Liquid article-link targets per locale are preserved; the only new section is the localized choice table. The built table's fragment links all resolve to existing section IDs.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed in both languages, including `script/verify_security_headers.rb`. The generated pages are `_site/es/caminos-de-implementacion.html` and `_site/implementation-paths.html`; `docs/` is absent from `_site`.
- An isolated Chrome 154 headless session loaded each full built page from the local static server at 1440 × 900 and 390 × 844 CSS pixels, with device scale factor 2, without saving a review image. In both languages and widths, titles and locale were correct, all table anchors resolved, the 16 px table stayed within the article (774 px desktop; 358 px mobile), and neither the page nor any table cell overflowed or clipped. The longest mobile table row was 169 px in Spanish and 145 px in English. No stylesheet or raster asset changed. The headless session was closed after the checks.
- `git diff --check` passed. No fixture, contact, campaign or message was changed. The locked macOS GUI still prevents native product captures for the separate Demand, Performance and Service quality queue; this conceptual article has no product image to capture. Local verification is separate from PR merge, deployment and public-page verification.

The verified bilingual content commit is `e0dc5cadf816044cb5d7705cead91e9f52f7681a`. The progress row records this revision and the no-figure decision. Publication remains pending until the article PR merges, the normal Netlify deployment finishes, and both public routes are checked.
