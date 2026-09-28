# Lists guide editorial work

## Starting state — 2026-09-28

- Article key: `audience/lists.md`; Help `origin/main` records it as `pending`. Branch `codex/lists-guide` starts from `origin/main` in a separate worktree. The tool created that checkout but could not register an attachment because the task already has over 100 attachment identities; reuse this returned path and do not create a duplicate.
- The current Spanish and English bodies and shared stub were saved byte for byte under `originals/lists/` before editing. Preserve titles, descriptions, slugs (`listas`, `lists`), languages, links, navigation and published state. A local edit is not publication.

## Reader task and visual plan

The reader creates a fixed audience list, adds or removes one or many customer profiles, understands import, journey and integration membership, then renames or deletes the list without confusing list membership with consent.

Distinct UI figures needed for this guide: the Audience **+** menu and unsaved **Nueva Lista / New List** form; a verified fictitious profile's **Listas / Lists** picker; two or more fictitious selected rows with the bulk Lists controls and pre-apply confirmation; and the existing synthetic list editor with its name and trash control. A source-managed icon and disabled name field need a genuine synthetic integration fixture. An inactive journey's Lists property step and a draft campaign's include/exclude selector may help only if they show distinct controls legibly at Help width. Stop before final update, deletion, import, campaign send or journey activation. A segment condition is covered by the dedicated segment guide; import will be illustrated in its dedicated guide. The list-versus-segment and consent sections are conceptual, so duplicate figures would not help. Avoid personal rows or a private queue. Do not save a list or change a profile until the isolated account and guarded fictitious state are confirmed. Never send a campaign or message.

Use localized, native Display P3 PNG at 2x or more from the dedicated exact local window after the Mac/session blocker changes. Keep complete panels, no cursor or cut row, and static unlinked figures in the bordered full-column lavender stage within the existing 810px article width. Verify every retained figure in full ES/EN desktop and mobile pages, plus build and public assets after authorized publication.

## Checkpoint

- Originals saved. The complete ES/EN article and Rails list creation, profile membership, batch update, integration source, audience and deletion flows were checked. The only text defect found was the bulk action: selecting **at least two** profiles opens **Selección múltiple / Multiple selection** automatically; opening a list merely scopes the rows. Both translations now describe the actual action and final apply control. Titles, slugs, links, languages and published flags were unchanged.
- `yarn build` passed in the lists worktree on 2026-09-28, including the production Jekyll ES/EN build and security-header check. The full article and corrected section were inspected in the local Help browser at 1280×900 and 390×844 for both locales. No clipping or incorrect labels were observed in the revised steps. The source article still contains no new figures.
- The native capture remains blocked by the absent authorized dedicated local Chrome window and locked Mac session. Earlier automatic review rejected broad Chrome selection because it could enumerate personal windows. Do not repeat it. Resume only when that exact local tab is shown and the session is unlocked; then verify the isolated account/database and capture each distinct safe state in ES/EN. Do not publish one language alone.
- Text verifier commit: `21df9562aec443cd88cb6c8d691b1c767b543552`. No lists PR, deployment or publication. Keep this branch `visual_pending` while its valuable figures are missing; Help main remains `pending`.

## Safe capture states — 2026-09-28 Rails UI audit

- The **+** menu and unsaved **Nueva Lista / New List** form can be shown without changing data. Stop before **Guardar / Save changes**. The menu requires an account allowed to create audience lists.
- On a verified fictitious profile, opening the **Listas / Lists** property and its search picker is safe. Selecting an existing list immediately creates membership; selecting a new name can also create a list. Stop before either selection. Show an already established synthetic membership if a result state is needed.
- Selecting at least two fictitious audience rows opens **Selección múltiple / Multiple selection** automatically. Opening a list first only scopes the rows. In batch mode, list additions and removals remain staged; the confirmation modal is safe to capture before **Aplicar a … clientes / Apply to … customers** creates the background update. Never press that button for a screenshot.
- Opening an existing synthetic list's editor shows its name and trash control without changing the list. Opening the trash confirmation is also safe; stop before **Eliminar / Delete**. A list used by a draft campaign can trigger a further confirmation, but no deletion state is needed for this guide.
- A source icon appears only for a known integration source, and the editor prevents renaming a Shopify-sourced list. Capture that distinct state only from an authentic fictitious integration fixture; do not manufacture source pixels or imply a manual list is source-managed.

The Rails UI audit found no further material factual discrepancy in the complete Spanish and English bodies. The original snapshots match the inventory hashes, and the shared stub remains unchanged. The branch has incorporated `origin/main` at `b79f27c51bf942ffce4ea0afa2a417d286f290ed`; its only lists article edits remain the previously verified bilingual bulk-step correction. The `visual_pending` status is unchanged. Captures and rendered-figure verification remain pending.
