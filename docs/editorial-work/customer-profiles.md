# Customer profiles editorial batch

## Source and publication

- Article key: `audience/customer-profiles.md`; the complete Spanish and English bodies and shared stub were preserved byte for byte under `originals/customer-profiles/` before editing. Their body hashes match `inventory.csv`.
- Public routes: `https://help.hellotext.com/es/perfiles-de-clientes` and `https://help.hellotext.com/customer-profiles`, originally published. This local branch does not publish an edit.
- Keep the existing titles, descriptions, slugs, language pairing, six related links, section structure and publication state.

## Reader task and article-specific plan

The reader opens one customer profile, understands its identity, channel, property, activity and conversation sections, and avoids unsafe duplicate merges or subscription changes. Audit the full current Spanish article against the Rails source and localized interface; adapt only supported corrections in English. Verify the complete rendered pages at desktop and mobile widths.

One localized screenshot per language, immediately after the open/search instructions, could show a selected synthetic profile beside the Audience list with useful profile fields and activity. Preserve enough row and panel context for the reader to see how the profile was opened. A second capture is justified only if the real UI reveals a non-obvious property/activity control or a meaningful merge choice; do not create a duplicate warning solely to fill the article. The profile must belong to the isolated local account and use complete, fictitious, non-deliverable data. Capture the real app as native Display P3 PNG at least 2× the final article width, with no private contacts, pointer, scrollbar or cut-off panel. Use a static bordered lavender stage within the existing Help column and confirm inline readability in both locales.

## Verification and pending work

The bilingual source and text review is complete. The Rails Audience layout opens a selected profile beside the list on desktop and uses **Atrás / Back** on mobile. Search supports name, phone, email, alias and profile ID. Property editability depends on property kind and permissions. The similar-profiles badge is conditional, and the localized profile action is **Combinar / Merge**. Message and block actions also depend on the profile and account state. These points were checked against the Rails Audience layout, contact search, property form, duplicate badge, profile actions and policies at Rails HEAD `449d6cc`.

The original eight sections and six related links remain in each language, and all related targets exist. `yarn build` passed. The complete Spanish and English pages were reviewed at 1280 × 900 and 390 × 844 CSS px: both have eight article sections, no horizontal overflow, and the corrected instructions are legible. `git diff --check` passed.

**Resume point:** the focused profile screenshot still adds value after the open/search instructions. The exact-title native helper did not resolve a unique dedicated on-screen Chrome demo window in the previous batch; that capture state has not changed. Do not retry the same preflight or treat browser review pixels as publishable assets. When a dedicated window is available, verify the isolated account/database identity, populate one complete fictitious non-deliverable profile and its activity, capture localized native PNGs, then review each full article on desktop and mobile. Keep this pair `visual_pending` until the images and pages are verified. No push, PR, merge or publication has occurred for this branch.
