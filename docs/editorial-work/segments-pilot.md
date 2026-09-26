# Segments pilot

## Source and publication

- Article bodies: `_i18n/es/audience/segments.md` and `_i18n/en/audience/segments.md`.
- Shared stub: `_audience/segments.md`.
- Current public pages: `https://help.hellotext.com/es/segmentos` and `https://help.hellotext.com/segments`, both HTTP 200 with matching canonical and reciprocal `hreflang` on 2026-09-25.
- Original sources: `originals/segments/`. Keep the title, description, slugs, links, two languages, and published state in the stub.
- Current public pages still contain the original article. No pilot edit, export, build, or local commit is a production publication.

## Reader task and visual plan

The reader creates a dynamic audience using **Audiencia → + → Nuevo Segmento**, selects a customer activity or characteristic condition, combines blocks with **Y** and **O**, and uses **Guardar**. The Spanish article is the lead version. The English article retains its correct interface labels and has the equivalent updated rule example. Keep the existing explanation, troubleshooting, and related links.

| Insertion point | Reader question | Final visual | Source state |
| --- | --- | --- | --- |
| After the creation steps | Where is **Nuevo Segmento**? | `images/audience/segments/audience-menu-es.png`, 586 × 598. | Real Audience menu with **Nuevo Segmento** hovered; crop excludes contact rows and identifiers. |
| After the condition-type instruction | Which choice opens activity or characteristics? | `images/audience/segments/condition-chooser-es.png`, 1144 × 760. | Real unsaved New Segment editor with the chooser open. |
| After the **Y/O** explanation | How do two alternative conditions and a required block relate? | `images/audience/segments/rule-logic-es.png`, 1144 × 1250, with a focused 640 × 1160 mobile crop. | Real unsaved editor with two activity alternatives under **O** and an age characteristic under **Y**. |

Do not add a message preview to this configuration guide unless it explains a result that the prose actually discusses. Do not save a demonstration segment or publish a draft for a screenshot. A save-state image is useful only if a safe, permitted demonstration state exists.

## Source and integration record

- Shared guide: `hellotext/editorial` `v1.0.0` base `eba6acad77f40ac0e5fa35fcc491a6285051ded5`, advanced locally to `a6b9195f2b0416dd7d4f4da34d23dd6e2a92f083` on `codex/static-screenshots` to require static screenshot figures. The Help submodule points to that local commit; it must be available from the shared remote before any Help branch is pushed for review.
- Rails export: `rbenv exec bundle exec rake editorial:export_help` from local Rails commit `9570500373b89b56018a9634bcc295bfa6f56cfb` on `codex/editorial-screenshots-static` (based on `fb67ff9419699e65291d711335e9f51d1eb54717`), with no custom visual file. The Rails source commit removes screenshot links and expand controls. A second Rails commit, `449d6ccc461716e198b31a25c6b2d4ebee2c1007`, pins the shared guide at `a6b9195`. Neither commit has been pushed or merged.
- Generated module SRI: `sha256-zqkNwVRm5VAWrAC7VCC5ZgIicKlfkzgKdIWgmCu2oH0=`.
- Initial import included generated includes, data, CSS, JS modules, and image dependencies only. The static-screenshot re-export changed only the two `segmentation-filters` locale includes and `editorial_visuals.css`; those three files match the Rails export byte for byte. Bundle preview files and fonts were excluded.
- The exported `segmentation-filters.png` is a 2576 × 3388 PNG with embedded Display P3. Rails documents it as a capture of an inert component fixture with demonstration values, not a saved customer segment. The pilot uses focused live UI captures instead because they show the actual **O** alternative and the creation menu.

## Verification and pending checks

- Help production build: `yarn build` passed after installing locked gems locally under ignored `vendor/bundle` and selecting Ruby 3.3.6. `script/verify_security_headers.rb` passed.
- Built English and Spanish module bytes match the export; the built PNG matches the source; `docs/` and `AGENTS.md` are absent from `_site`.
- The locally built Spanish and English guides were visually reviewed in the in-app browser at the default desktop width and at 390px mobile width. Their page shells, article text, and navigation remained readable. The browser reported no application errors; Hotjar warned that it does not run on local HTTP.
- Live editor check in the Awesome test account: **Audiencia → + → Nuevo Segmento** opens the side editor. It displays **Elige una condición** and the **Actividad del cliente** / **Características del cliente** choices. Activity exposes **Ocurrió** and **Elegir**; a selected **Se suscribió** condition shows a channel/capture filter and time choice. The small **o** control adds an alternative under **O**; **y** adds a required block under **Y**. **Guardar** is visible and disabled until the rule is complete. No segment has been saved, so the article's post-save behavior has not been confirmed in this account.
- Current Rails templates and locale files confirm the English article's **Choose a condition**, **Subscriber's Activity**, **Subscriber's Characteristics**, **or**, **and**, and **Save changes** labels. The English save label applies to creation as well as editing. The translated source needs no label correction before visual insertion.
- The earlier browser and native UI observations returned JPEG. A macOS region probe captured an unrelated foreground window and was deleted. Auto-review rejected inspection of a potentially populated segment and a misbound unrelated Chrome window; those paths were stopped without using their content.
- A local ScreenCaptureKit helper (`capture-tools/hellotext_capture_editor.swift`) resolved the source-capture issue. It selects the exact Awesome Chrome window, includes only that window in a display filter, crops to a verified editor or menu rectangle at capture time, requires native 2× density and Display P3, and refuses ambiguous targets or outputs without the embedded ICC profile. It did not write a whole-window or contact-list intermediate. A native Display P3 probe was used because macOS did not expose the display color-space metadata through `CGDisplayCopyColorSpace` in this session.
- All four site image assets are genuine PNGs with embedded Display P3 profiles and at least two source pixels per planned display CSS pixel. The menu copy is byte-identical to its original. The editor derivatives, including the mobile rule crop, retain original pixels without resampling. Capture records and untouched originals are under `captures/segments/` and excluded from the public site.
- The demonstration segment was never saved. The editor was closed with **Cancelar**, the menu was dismissed, the temporary Audience search was cleared, and Chrome zoom was restored to 100%. No contact was modified.
- The Spanish article contains three static screenshot figures with alt text and accessible hidden captions. None has an image link, new-window target, or expand control. The English article has a matching text example without a Spanish-language screenshot.
- Final Help build passed in both languages with `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build`, including `script/verify_security_headers.rb`. The built root and Spanish-path copies of all three PNGs are byte-identical to the source assets, preserving the verified Display P3 profiles. JSON capture records parse and `git diff --check` passes.
- Browser review at 1635px desktop and 390px mobile passed for the Spanish guide. All three figures appear in order as inert white frames, with no image links, arrows, focusable controls, click navigation, or page overflow. At 390px the responsive O/Y crop renders at 316 × 573 CSS pixels, and its key conditions and values are readable inline; desktop uses the complete source crop. The English guide remains readable at 390px with no overflow. Chrome reported no application errors. The plain local static server needs `.html` URLs and does not emulate production's extensionless rewrite.
- The copied Swift source compiles with the matching Xcode compiler and SDK using writable temporary module caches. The article and capture records have been verified locally; this is not a production publication.
- Publication: original pages remain live. The Help, Rails and shared-guide changes are local commits or worktree changes only; no push, merge or deployment has been made.
