# Segments pilot

## Source and publication

- Article bodies: `_i18n/es/audience/segments.md` and `_i18n/en/audience/segments.md`.
- Shared stub: `_audience/segments.md`.
- Current public pages: `https://help.hellotext.com/es/segmentos` and `https://help.hellotext.com/segments`, both HTTP 200 with matching canonical and reciprocal `hreflang` on 2026-09-25.
- Original sources: `originals/segments/`. Keep the title, description, slugs, links, two languages, and published state in the stub.
- Current public pages still contain the original article. No pilot edit, export, build, or local commit is a production publication.

## Reader task and visual plan

The reader creates a dynamic audience using **Audiencia → + → Nuevo Segmento**, selects a customer activity or characteristic condition, combines blocks with **Y** and **O**, and uses **Guardar**. The Spanish article is the lead version; adapt the English article when the corresponding interface state is verified. Keep the existing explanation, troubleshooting, and related links.

| Insertion point | Reader question | Planned visual | Required state |
| --- | --- | --- | --- |
| After the first creation steps | Where is **Nuevo Segmento**? | Focused real UI capture, pointer on the menu action only if it improves discovery. | Audience action menu open; crop excludes all contact identifiers. |
| After the condition-type instruction | Which choice opens activity or characteristics? | Focused real UI capture of the condition chooser. | New Segment editor with the chooser open and demonstration values only. |
| After the **Y/O** explanation | How do two alternative conditions and a required block relate? | One real editor capture of the rule structure, or the existing exported `segmentation-filters` fixture if its scope and labels still match the live editor. | No tenant data; show the rule and its controls at readable size. |

Do not add a message preview to this configuration guide unless it explains a result that the prose actually discusses. Do not save a demonstration segment or publish a draft for a screenshot. A save-state image is useful only if a safe, permitted demonstration state exists.

## Source and integration record

- Shared guide: `hellotext/editorial` `v1.0.0`, `eba6acad77f40ac0e5fa35fcc491a6285051ded5`.
- Rails export: `bin/rails editorial:export_help` from `fb67ff9419699e65291d711335e9f51d1eb54717` on 2026-09-25, with no custom visual file.
- Generated module SRI: `sha256-zqkNwVRm5VAWrAC7VCC5ZgIicKlfkzgKdIWgmCu2oH0=`.
- Imported generated includes, data, CSS, JS modules, and image dependencies only. Bundle preview files and fonts were excluded.
- The exported `segmentation-filters.png` is a 2576 × 3388 PNG with embedded Display P3. Rails documents it as a capture of an inert component fixture with demonstration values, not a saved customer segment. It has no visible pointer. Its relevance to the current live editor remains to be checked before article insertion.

## Verification and pending checks

- Help production build: `yarn build` passed after installing locked gems locally under ignored `vendor/bundle` and selecting Ruby 3.3.6. `script/verify_security_headers.rb` passed.
- Built English and Spanish module bytes match the export; the built PNG matches the source; `docs/` and `AGENTS.md` are absent from `_site`.
- The locally built Spanish and English guides were visually reviewed in the in-app browser at the default desktop width and at 390px mobile width. Their page shells, article text, and navigation remained readable. The browser reported no application errors; Hotjar warned that it does not run on local HTTP.
- Live editor check in the Awesome test account: **Audiencia → + → Nuevo Segmento** opens the side editor. It displays **Elige una condición** and the **Actividad del cliente** / **Características del cliente** choices. Activity exposes **Ocurrió** and **Elegir**; a selected **Se suscribió** condition shows a channel/capture filter and time choice. The small **o** control adds an alternative under **O**; **y** adds a required block under **Y**. **Guardar** is visible and disabled until the rule is complete. No segment has been saved, so the article's post-save behavior has not been confirmed in this account.
- New live capture readiness: blocked on a privacy-safe, correctly targeted source capture. Browser and native UI observations returned JPEG. A native macOS region probe yielded a genuine 1172 × 1638 PNG with embedded Display P3, but it captured an unrelated foreground window rather than the Awesome editor and was deleted. The exact Awesome window was identified, but a full-window capture would include potentially identifiable Audience rows. The supported browser viewport override did not isolate the editor. No new screenshot was retained. A dedicated window displaying only the editor, or a supported native way to focus and resize that exact window without contact rows, is needed before capture. Recheck actual source density against the article's maximum display width after that setup.
- Auto-review rejected accessibility inspection of a potentially populated segment and a misbound unrelated Chrome window as outside the authorized editor inspection. Those paths were stopped without using their content.
- Article insertion, inserted-figure desktop/mobile review, full-size image access, alt text, and public deployment: pending.
- Publication: original pages remain live. This branch has local integration work only; no merge or deployment has been made.
