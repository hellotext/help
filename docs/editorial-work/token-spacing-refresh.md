# Authorization token label spacing refresh

## Focused plan — 2026-09-30

Refresh the same unsaved token-name view after the user reported corrected label/input spacing. Spanish first, then English, desktop and mobile. Four native sources replace the token figure across the four requested guides (Developers overview, Custom store integration, External tracking, Orders API) and the two other consumers (Products/inventory API, Messages API). Each guide keeps its existing reading task, insertion point, captions, links and other figures. No additional screenshot answers a different question in this correction.

Actual UI is Rails `5403a7dcb567b63cae87d4c088112d65fad4eb7f`, merged #6054; local protected settings are retained. All four live views measure the corrected 8px field gap. Names remain Tienda propia · desarrollo / Custom store · development in unsaved DOM drafts. No token is created and no credential is shown. Guarded fixtures have zero tokens, zero messageable/subscribed contacts and no enabled playbooks before/after. Locale restored ES.

Evidence, twelve pre-refresh article snapshots/hashes and four native untouched P3 2× sources are in `captures/custom-store-integration/token-spacing-refresh`. The original sources and their historical publication proof remain unchanged. New assets live once in `images/developers/custom-store-integration/token-spacing`, reused by all consumers without duplicate upload per guide. Desktop 540×238 CSS /1080×476 PNG; mobile 374×216 CSS /748×432 PNG. Native-size frame cap remains 558px, including its 18px inset/border; stage remains full-width lavender. No shared guide/renderer/CSS change or tests.

## Verification

Source pixels inspected in both languages and both layouts: clean Object Sans text, complete heading/label/name input, balanced margins, no pointer, caret, scrollbar, private data or pixel editing. Canonical capture guards checked PID/profile/loopback/single tab/title/account/locale/viewport/zoom/DPR before and after. Reverse-patch checks recover all twelve snapshots exactly; text, captions, links, stubs, publication and other figures stay byte-identical.

Build including security headers passed. All twelve complete articles were reviewed in the isolated Help browser at 1440×1000, 390×844 and 580×900; all existing figures loaded, native-size caps held, and no page overflow appeared. The four native sources and all 32 distinct existing/new figure PNGs match their built copies. Source pixels and all 36 token-figure presentations were inspected. Metadata for sections, examples, figures and footer review is retained under page-review. Public publication is pending. Ledger remains 61 local_verified, 92 pending and one out_of_scope; all 61 verifier commits are ancestors of baseline main. A new correction verifier will record this focused refresh without replacing the original full-article verifiers.

Correction content verifier: `4bca01d1ac460dfe5ce07b8845673492b109ffcb`. This commit contains all reviewed sources, twelve localized path/height updates, unchanged-content snapshots and local verification. Original full-article progress verifiers remain unchanged and reachable.
