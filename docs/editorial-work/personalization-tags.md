# Personalization tags

## Source and task

- Pair: `audience/personalization-tags.md`; Spanish `/es/etiquetas-personalizacion`, English `/personalization-tags`.
- Published original, with original ES/EN bodies and unchanged guide stub preserved in `originals/personalization-tags/`. SHA-256: ES `4ecca31f141d89644cc8b2c9ca5083f16bc9065ef8ac74af096462573ad1283c`, EN `ec9f4503b45a9bbf365500f4934434d98f27e3cd64f1747955317b8066b89558`, stub `ddfb66d75dcaaa78d5e29fe7ae2642b051851f4d58547ec391b00554d8f956f4`.
- Reader task: insert a customer value in a message, add a safe fallback for a missing profile value, and check whether a contextual token can resolve before sending. Preserve titles, slugs, links, languages and publication state.

## Section plan and source evidence

| Section | Reader question and correction | Useful figure |
| --- | --- | --- |
| Where and insert | Where is **Insertar etiquetas / Insert tags**, and what does the selector actually offer? `Compose::Toolbar::TagsComponent#default_tag_list` contains `Liquid::Contact::TAGS` and kept custom business properties. It does not list every contextual token. | Focused native capture of the open tag selector in a safe unsent draft, in each UI language, including a fictitious custom property if available. |
| Fallback and profile properties | How does `{name|cliente}` behave when a profile value is missing? `Liquid::Tag#default` and `Liquid::Contact`/`Liquid::Property` implement the vertical-bar fallback for these values. | A second focused editor/preview state is useful only if the real UI shows the inserted token and result legibly without sending or editing a real contact. The selector figure can also cover the property choice, so do not duplicate it. |
| Contextual tokens | Why might `{product.url}` work in one workflow but remain literal in another? The contextual interpolator uses the workflow's product object; it is separate from the profile-tag selector. The article now says to verify the workflow and does not promise the selector lists these tokens or that the profile fallback syntax applies. | No single screenshot would establish the object availability across workflows. Keep this as an explanation with a token example. |
| Preflight and related guides | Which final checks prevent broken wording or links? | Reusing the adjacent selector/editor figures is enough; a generic checklist screenshot adds no distinct control. |

Spanish text was corrected first, then adapted to English. No demo campaign, message, or automation was sent or activated.

## Capture readiness and exact resume point

The previously selected fictitious Chrome window ID `33329` / PID `18093` expired: an exact-ID check did not find it. A fresh native `CGPreflightScreenCaptureAccess` check returned false. Do not reuse that ID, enumerate other windows or substitute browser screenshots as native sources.

On 2026-09-28, a new Chrome demo tab `437089151` was opened directly at `http://127.0.0.1:3191/hellotext/audience`. It was already signed in as the fictional `design-system@example.test` account in Enterprise. A read-only database check confirmed `hellotext_editorial_workload_20260928` and zero messageable contacts in business 5. The Campaigns UI had no drafts, so the normal wizard created only the new draft `95DJOZvb` (database row 16: `state=pending`, `status=draft`) and opened `/hellotext/campaigns/95DJOZvb/broadcasts/compose`. Its editor contains only the unsent `Hola ` sample; the native tag popover is open and visibly offers profile tags plus the fictional `Nivel de fidelidad` custom property. No send, test message, schedule, or final action was invoked. The clone still has zero messageable contacts. The exact tab was marked for handoff; verify it again before use.

A one-window native picker helper was compiled from the existing Workload capture code with this compose route and Spanish/English titles. A first sandboxed launch could not connect to macOS screen services. The authorized unsandboxed launch presented the picker, but its selection failed the helper's combined exact-window/2× guard before any PNG was saved. The helper process ended. Because the failure did not identify which non-content check failed, its temporary source was changed to report only failed check names (`window_style`, `one_window`, `chrome_bundle`, `exact_title`, `layer_zero`, `density_2x`) without printing a title or enumerating windows, and recompiled. Both connected displays report 2× scale. Do not ask the editor to select the window again or rerun the picker until the target-selection failure is diagnosed; do not weaken the exact-window or 2× requirements. Keep `visual_pending` until bilingual native figures and the complete rendered guides are verified.

## Verification and publication

The complete ES/EN article text, headings, related links and footers were reviewed in the locally built site at 1280 CSS px desktop and 390 CSS px mobile. The contextual-token and fallback corrections appeared in both languages without page overflow. Long code examples were split across lines or reduced to the tag after a mobile screenshot showed the original property sentence clipped; the final English and Spanish fallback examples and the English property token were visually checked at mobile width. `yarn build` and the security-header check passed, and `git diff --check` passed. These checks verify text/layout only, not the missing interface figures.

Pending: native ES/EN figures and provenance, complete post-insertion article review at desktop/mobile widths, final verifier commit, PR checks and review, merge commit, normal Netlify deployment, and public page/PNG checks. Keep the row `visual_pending`; do not mark `local_verified` while useful figures are missing.
