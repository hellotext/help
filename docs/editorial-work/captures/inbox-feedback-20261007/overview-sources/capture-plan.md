# Full Inbox overview recapture

Status: four final raw sources captured and inspected. Browser 9489 was explicitly released back to the parent/filter-capture agent. Article integration and final page review remain with the parent. Composition candidates are archived outside the Help worktree at `current-app-capture/overview-candidates-20261007` in the owned task directory.

Use the owned application on `127.0.0.1:3298`, application snapshot `6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31`, with the guarded fictional business 5. Source freshness was checked against current master `7fdca3183697ba5099c9ce1d2f944d2c04a21917`; the relevant Inbox/profile/assignment UI is unchanged. Do not change application configuration, source, permissions, monitoring or DOM content.

The parent accepted the following real UI state: show the complete desktop Inbox with the right customer panel naturally scrolled to Activity or Notes. Its avatar/name header may be above the panel's scroll position. The selected customer's identity remains visible in the highlighted conversation-list row. Do not open the avatar menu merely to cover the development-only Impersonate control.

| Source | Final viewport | Captured native state |
| --- | --- | --- |
| context-es-desktop | 1120 × 638 CSS | Full width, three panels; Emma selected, Spanish question and note; customer Activity at native scrollTop 700 |
| context-en-desktop | 1120 × 638 CSS | Same native state with English bodies/UI; Activity at native scrollTop 680 |
| context-es-mobile | 430 × 760 CSS | Actual Inbox list with eight complete fictional rows and native navigation; no simulated simultaneous side panels |
| context-en-mobile | 430 × 760 CSS | Equivalent English Inbox list |

The selected 1120 CSS-pixel desktop width keeps Benjamín's full name visible and supports the native three-pane layout. Full viewport width is preserved. The height closes between complete visible list rows and activity entries. The existing larger history detail figure remains available for reading the conversation body. The 430 × 760 mobile viewport fits all eight rows.

## Native preparation sequence after release

1. Confirm the root's latest fixture guard and desired locale/body localization. This capture helper does not mutate the database or change locale.
2. Navigate to Emma's actual conversation route, with an explicitly selected Open queue containing the fictional sample contacts. Preserve the full URL in the record.
3. Allow participant/activity frames, images and fonts to finish loading. Verify the fictional login and message/note text.
4. On desktop, use the real properties expander only if needed to provide scrollable useful customer context. Use native wheel input over `aside[data-right-pane]` until Activity or Notes is visible and the development-only header control is entirely outside that pane's clipped visible region. Do not hide, remove, replace or restyle anything. Do not enter or save profile fields.
5. Inspect all three visible panels. Keep the conversation history and ownership header readable. Move the pointer away from controls before capturing.
6. On mobile, use the native Inbox navigation to show the conversation list and capture it independently. Do not assemble a montage or repeat the existing conversation-detail image.

Integration decision: these four `context-{locale}-{layout}.png` files form a new first figure. Preserve the earlier eight overview PNGs: the conversation history becomes a separate detail figure and the ownership-control detail remains. The resulting overview has twelve source PNGs; this subtask does not edit the articles or replace the existing images. The article must explain that mobile uses separate list/conversation/profile views.

`capture-overview.mjs` provides native mouse clicks/wheel events and full-viewport compositor capture. Its Runtime evaluations only read page state. It verifies Chrome's dedicated profile, one loopback tab, exact planned URL/title/locale, the fictional account, viewport, zoom and DPR before and after each shot. It rejects visible Impersonate text in accepted captures. Use `--check-only` without touching Chrome to check the local module dependency.

The screenshot uses DPR 2 and compositor scale 2, producing native 4× PNGs. The helper validates PNG dimensions and embedded Display P3, records pane scroll positions and selected text, and keeps output inside this directory. It cannot certify typography or composition: inspect every saved source and then review the complete Help figure at desktop/mobile widths. File metadata alone does not close this feedback.

No existing article, published asset, inventory, fixture or runtime configuration is changed by this preparation. New candidate assets remain local and require the parent's final review.
