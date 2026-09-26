# Message editor basics: link icon sizing

## Starting state and scope

- Published guides: [Spanish](https://help.hellotext.com/es/conceptos-basicos-editor-mensajes) and [English](https://help.hellotext.com/message-editor-basics). Both article bodies insert `/images/icons/link.svg` after naming the link tool, but the `<img>` elements have no dimensions. The SVG only declares a `viewBox`; the Help guide CSS displays the image inline with `width: auto`, so the icon becomes much larger than the surrounding text.
- The 2026-09-26 public Spanish page was inspected in a desktop browser and visibly showed the icon spanning much of the article width. Both article sources have the same markup. The message editor basics pair remains `pending` in `progress.csv`; this batch corrects only the reported icon defect and does not claim a full bilingual screenshot review.
- Original source copies are in `originals/message-editor-basics-icon/`. Starting SHA-256: Spanish `9eb930e7b14e8b56bf8c9360effe77ab356c2910540bbdc13c9b9399410bdb67`; English `3a76538c362c63173584a34e469a34f6fd6128ac14770459901a7d52d30eea85`; stub `39077c86d483c2a33f38a7e94e4367daafeda44ef1bab9f9fda776dae9f0a874`.

## Focused change and verification plan

Give the existing inline link icon explicit 20 × 20 CSS and HTML dimensions and a localized alternative name in both article bodies, following the already published tracked-links guide. Preserve all prose, headings, keyboard shortcuts, titles, slugs, links, languages, and publication state. Do not alter the SVG or shared stylesheet. Build the complete site and inspect both full articles at desktop and 390 px mobile widths, checking icon size, line flow, and overflow. Then run `git diff --check`, commit, publish through the authorized Help PR flow, and verify both public pages.

## Screenshot follow-up

When this pair receives real editor screenshots, use the isolated local demonstration account with complete synthetic data. Match each screenshot to its article language, capture genuine native Display P3 PNG at 2× or higher without a cursor or private contacts, and keep figures static and unlinked. If a focused toolbar screenshot clearly shows the link button, remove this redundant inline icon from both languages while keeping the control named in prose. Otherwise, check that the inline icon stays near text size alongside the new figures. Keep the pair `pending` until the full bilingual article and screenshot work is verified.

## Progress

- 2026-09-26: Starting state and originals recorded. The public icon occupied about 685 × 685 CSS px at 1280 px and 358 × 358 CSS px at 390 px before this correction. Both localized article bodies now give the existing SVG a 20 × 20 inline size, matching the related tracked-links guide, and provide localized alt text. The shared stub, SVG, stylesheet, and all other article text remain unchanged. `progress.csv` points to this work record while the pair remains `pending` for the full screenshot batch.
- The production-mode `yarn build` passed, including `script/verify_security_headers.rb`. The full local Spanish and English pages were reviewed in the browser at 1280 px desktop and 390 px mobile. In both languages and widths, the icon measured 20 × 20 CSS px, sat within the paragraph, and the document width equaled the viewport width. The Spanish and English mobile paragraphs and desktop layout were visually inspected. No screenshot figure was added in this focused correction. Pending: final diff check, commit, PR checks, merge, normal Netlify publication, and public page verification.
