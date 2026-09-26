# English Segments screenshot completion

## Starting state

- `audience/segments.md` is already reviewed in both languages. The published Spanish article has three static screenshot figures; the English article has none.
- This batch fills only the English visual gap. Keep the shared stub, titles, slugs, links, language, and publication state unchanged.
- Byte-for-byte source copies before this batch are under `originals/segments-english-screenshots/` (English, Spanish, and shared stub).
- The English source SHA-256 at the start of this batch is `03ca0389558e5112987863d3ddbb1c93a8fd631ebf5857ae7f19de7da9ea7a19`.

## Reader task and capture plan

Match the Spanish article's three visual explanations using the genuine English product interface:

| Insertion point | Question answered | Required source state |
| --- | --- | --- |
| After the **New Segment** steps | Where is the command in the **+** menu? | Audience menu open in a dedicated English local demonstration tenant; exclude customer rows. |
| After **Choose a condition** | Which choices open activity and characteristics? | Unsaved New Segment editor with the chooser open. |
| After the **AND/OR** example | How do alternatives and a required block relate? | Unsaved rule with two activities joined by **OR** and an age characteristic joined by **AND**; provide a legible mobile crop if needed. |

Use a proven isolated demonstration database. The user prefers local fixtures for future examples so profiles and report metrics can be filled with realistic, reproducible demonstration data before capture. Verify the page's English UI and exact window identity before native capture. Capture at least 2 source pixels per displayed CSS pixel, as PNG with embedded Display P3. Record untouched originals and provenance outside the public site, and publish only tightly cropped derivatives without customer identifiers or cursor. Do not save a segment, change real customer data, or send messages.

## Verification and integration

Before each edit, reread the current source. Insert static, unlinked figures with English alt text and captions at the matching points; preserve all other content. Check the complete English and Spanish articles in desktop and mobile browsers, build the site, verify image metadata and public HTML, run `git diff --check`, and commit the verified batch in English. Push an explicit branch, attach its PR, wait for checks, and merge with a merge commit. Verify the normal Netlify deployment and both public pages. Record exact completion or the resume point here if interrupted.

## Progress

- 2026-09-26: Isolated Help worktree `codex/help-segments-english-screenshots` created from published `origin/main` at `/private/tmp/hellotext-help-segments-en`. Shared editorial submodule initialized and required guidance read. Originals copied.
- Rails fixture snapshot `449d6ccc46` ran at `127.0.0.1:3191` with the guarded database `hellotext_editorial_capture_20260926` and English demo owner. The target Chrome window was identified as `24295` with title `View all Enterprise contacts - Hellotext`; native captures included only menu or editor rectangles. No contact row, other browser tab, or cursor appears in any retained original. The unsaved editor was closed with **Cancel** and Chrome zoom returned to 100%.
- The English article now has three static figures and four PNG assets: menu `610x690`, chooser `876x840`, complete rule `876x1280`, and responsive rule crop `700x1200`. All have embedded Display P3; the mobile crop is pixel-identical to its source rectangle. Original PNGs and JSON provenance are under `captures/segments/`, with no credentials or private records. Source-to-published SHA-256 is recorded in each JSON file.
- `PATH=/Users/pel/.rbenv/shims:$PATH BUNDLE_PATH=/Users/pel/.codex/worktrees/dad4/hellotext-help/vendor/bundle yarn build` passed, including security headers. All four built root and Spanish-path PNG copies match their sources byte for byte; `docs/` and `AGENTS.md` are excluded from `_site`. Parsed built English and Spanish HTML has three screenshot figures each, one image per figure, and no figure links or controls.
- Browser review passed for the complete English article at 1280px desktop and 390px mobile, including menu, chooser, and AND/OR example. The English figure text remains readable inline and the mobile rule uses its dedicated source without horizontal overflow. The unchanged Spanish article was also inspected at desktop and mobile widths. Native originals show no pointer. No build or local preview is a publication.
- `git diff --check` passed. The focused content and evidence commit is `7d10cc370dcc8c284596470214959f4c18c7c56a`; `progress.csv` points to it for the already reviewed bilingual pair.
- Help PR [#108](https://github.com/hellotext/help/pull/108) passed the GitHub build, Aikido security scan, Netlify header rules, and Netlify deploy preview checks. The preview returned HTTP 200 for both language pages, each with three static figures and four PNG assets; no figure contained a link or control. The PR merged with merge commit `bcf8532f187a262495b68d54caa35ba2e5699bb4` on 2026-09-26 at 18:34 UTC. That commit has two parents and contains both local commits without squashing.
- After the normal Netlify publication, [English Segments](https://help.hellotext.com/segments) and [Spanish Segments](https://help.hellotext.com/es/segmentos) returned HTTP 200 with three figures each. All eight referenced language-specific PNG assets returned HTTP 200 with `image/png`; the figures remained static without links or controls. The English captures are now verified in production. No manual deployment was used.
