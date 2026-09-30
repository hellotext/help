# Website Popup

- Pair `captures/website-popup.md`; ES `/es/popup-sitio-web`, EN `/website-popup`.
- Starting origin/main `69ea04795b224eb58b19f5cb6c7745c470ab89d9`: 51 local_verified, 102 pending, one redirect out_of_scope; no open Help PR. Originals preserved in `originals/website-popup/`.
- Creating a campaign remains separately visual_pending. No safe Shopify admin is available for Shopify Checkout. No blocked capture was retried.

## Source audit and section plan

Read AGENTS, canonical skill/guide/workflow/screenshots, Help integration, inventory/progress, pilot and both complete articles before edits. Rails clone `d348bd09825d62c2cf551757598ed04a4bca0ce6` supplies Popup model, Saver, CouponAssignment, Install, Publish, editor views/controllers, preview views, submission eligibility/verification and delivery services. Its safe GET editor and wizard steps are audited against actual labels.

| Section | Reader question | Plan |
| --- | --- | --- |
| Introduction/use cases/prerequisites | Which capture tool fits? | Conceptual checklist, no separate screen; editor preview below illustrates the visitor experience. |
| Create | Where is the popup and how do its steps relate? | Reuse locale-matched desktop catalog card; capture editor tabs and coherent fictional preview. |
| Signup fields | How do I choose a property and set required fields? | Real field editor/selector; no submit. |
| Completed state/copy | What should the visitor see after finishing? | Configured completed-state preview, explicitly not proof of a signup or delivery. |
| Style | Where do fonts and colors live? | Complete real style panel; preserve desktop typography. |
| Layout | How do desktop and mobile layouts differ? | Real layout selectors and device preview controls; no duplicate trivial dropdown clicks. |
| Opening behavior | How do device targeting and bubble mode combine? | Actual settings panel; verify delay is exposed before promising it. |
| Coupon/journey | Where do optional follow-up assignments live? | Actual assignment controls with existing fictional coupon; never enable a journey, assign persistently or submit. |
| Installation | How do I choose a method and identify the generated code? | Installation method controls and exact GET manual instructions/code; never confirm/publish. |
| Testing/troubleshooting/links | What should I check after launch? | Operational checklist in prose. No manufactured successful submission, delivery or storefront installation. |

## Protected fixture

Verified isolated DB `hellotext_editorial_workload_20260928`, business 5, owner `design-system@example.test`, 127 contacts, zero messageable/subscribed, 49 messages and all saved playbooks disabled. No earlier seed ran. A guarded one-time fixture creates only hidden Popup 1 (`e9Z2LN51`) with draft capture `Popup editorial · ejemplo`, two coherent email/name steps, no coupon/journey, zero submissions. Locale changes update this exact draft and never duplicate it. All subsequent UI edits are transient. No delivery worker or final action is used.

## Capture and verification

Automatic captures completed without a window picker or personal Chrome access. There are ten static figures per locale: a reused desktop catalog card, step/device controls, field controls, configured completion preview, Style, Layout, Settings, coupon/journey assignment controls, installation methods and generated code. Twenty-six native source captures yield 24 distinct new published assets; the locale-independent code and its mobile focus are byte-identical and shared. The two approved catalog PNGs are reused without duplicates.

Every source has Display P3 ICC, DPR 2, scale/zoom 1, exact local URL/title/locale and dedicated-process/account guard evidence. Saved pixels were inspected in ES/EN. Desktop fields retain the complete real preview and field panel; mobile uses a readable focus of the actual type, placeholder and required controls. Panels retain desktop typography, and the responsive installation methods come from the real narrow wizard. No control, cursor, scrollbar or debug overlay is published. No screenshot is enlarged beyond its native logical size at 1440, 390 or 590 CSS px; lavender stages stay within the original article column and white frames fit the selected source.

The section audit corrected subscription/identity verification, inactive journey availability, WhatsApp/SMS fallback, the missing delay control, exact Settings labels and hidden field-label editor, and installation/publication boundaries. The completed preview is explicitly a design simulation. A sent verification, welcome message, successful storefront submission and live installation are intentionally omitted because they would require external deliveries or final activation; the actual controls, preview and generated code cover these tasks without fabricating success. The existing fictional coupon is selected only transiently and the disabled journey is not shown as an active option.

Production `yarn build` (Ruby 3.3.6 with the existing shared bundle) and security-header verification passed. Source→asset→build hashes passed for all 26 native captures, the shared code and two reused assets. Sources and provenance stay under excluded `docs/`; no source record is in the public build. Both complete articles, reading index, links, every static figure and end of page were checked in the isolated local browser at desktop/mobile widths. Original titles, slugs, links, languages and publication metadata remain unchanged. No CSS or migration tests were added.

Postflight: 127 contacts, zero messageable/subscribed, 49 messages, all saved playbooks disabled, Popup 1 hidden/draft with two steps, no submissions/coupon/journey. Spanish and the original fictional business label Enterprise were restored. No seed repeated, worker started or final save/install/publish/send/test action used. Public verification of the integrated content is recorded below.

Local content verifier: `47364a64a3c89f42be2c7c51fc1ecfcc39685190`. The separate ledger commit preserves this verified content commit as its ancestor.

## Public verification (2026-09-30)

Help PR [#247](https://github.com/hellotext/help/pull/247) merged by commit `e699783005766ce5fdf663fbb9eb82a97f8f2c05`, preserving content `47364a64a3c89f42be2c7c51fc1ecfcc39685190` and ledger verifier `7b5d12f17e147d1f2553d070978d37330649eaf8` as ancestors. Build, Aikido, Netlify preview and header checks passed. Both preview pages and all 26 preview PNGs matched the intended figures and approved hashes. PR review and comments were checked before merge; the final review completed without an unresolved finding. Main [Build 36649103454](https://github.com/hellotext/help/actions/runs/36649103454) passed for the exact merge SHA. No check or protection was bypassed. Attaching the PR reached the existing 100-identity limit.

The public [ES page](https://help.hellotext.com/es/popup-sitio-web) and [EN page](https://help.hellotext.com/website-popup) returned HTTP 200 with ten static figures each and the corrected installation explanation. All 24 new PNGs and two reused catalog PNGs returned 200 and matched approved SHA-256 hashes. Locale-independent code and its responsive source are shared, and no reused image was uploaded again. Exact URLs/hashes are saved in `captures/website-popup/public-verification.json`. No manual deploy was used. A production Netlify deploy ID to SHA association is not asserted because the authenticated production listing has not been accessible.


## Editor overview and header-image follow-up — 2026-09-30

User requested the complete editor at the beginning and a header image in the fictional example. Preserve all published originals in `originals/popup-editor-follow-up`. Review the existing eleven sections; retain their factual copy, links and publication identity.

Section plan:
- Introduction: add the complete real desktop editor, including name/actions, Style/Layout/Settings, device/step controls and first-step preview. Use the focused first-step source on narrow pages.
- Create the popup: refresh the steps/device figure and focused preview to include the header photograph.
- Build the signup steps: refresh the field panel/context and completed preview so their shared header remains coherent.
- Style/Layout/Settings: retain approved panel crops; their controls do not display the changed example image. Desktop Footer and mobile Default remain selected.
- Assignment, installation, code and remaining conceptual/troubleshooting sections: retain existing figures and text; they do not display the changed header. No new figure clarifies a distinct control there.

Use existing protected hidden Popup 1 / e9Z2LN51, draft capture, two existing steps, zero submissions and no coupon/journey. Do not rerun fixture.rb. Add only the existing application example photograph `app/assets/images/examples/intro-popup-left2.jpg` (SHA256 8bdd2a5c28352db450dbd6bb40a7019cc5fb1fc9dd268c44e93a5aa0c96070ac) to the isolated fixture header; localize existing text records in place. All contacts remain non-deliverable and unsubscribed, messages remain 49, playbooks disabled. No publish/install/save/next/test/send actions. Restore ES and Enterprise after capture.

Sources come from the reviewed Rails UI commit 11731d118e581bb1d67853b1add1f4f495160288, local port 3192, dedicated headless profile/port 9460, actual desktop CSS viewport with a mobile-device popup preview, DPR 2, zoom 1, native Display P3. No application renderer or shared generated bundle changes are needed.

Local verification: 12 approved native P3 PNGs at 2×, no pixel editing, with 11 figures per locale. Six complete-page desktop/mobile/narrow states and twelve responsive-boundary states were inspected at 390/580/600/601/1024/1280/1399/1400/1440 CSS px. All measured image widths stay at or below their logical source width, without page overflow. Overview uses the focused first-step source through 1399 px; the full editor appears from 1400 px. Steps and field figures retain their 600 px source switch. Source/asset/build bytes match and docs remain excluded. Build/security headers and diff checks passed. The header image remains attached only to the hidden fictional draft; ES/Enterprise and all delivery-safety counts are restored. Publication remains pending until PR gates and public verification complete.

Follow-up local verifier: `11466e9e94fa7fe69c641708ece3dbd9aa3d829b`. This is a visual follow-up to an already complete pair; inventory totals remain 52 local_verified, 101 pending and one out_of_scope redirect.

PR #253 review: corrected the alternative text of all three changed responsive figures in ES/EN to cover both the wide context and focused source accurately. Native PNG bytes and visual layout are unchanged. The reviewer ancestry claim used a synthetic reviewed commit; provider head ac04ec1cd7eb7301f75751fad084b165e47d1a9e is a direct child of 11466e9e, confirmed by GitHub's commit parents and git merge-base. The provider history preserves the real verifier.

Final local verifier after the responsive accessibility correction: `e233b4ef227cb15c0e387ffeb00ec3ed8f03ed07`. Production build/security headers and both built alternative-text variants passed; all twelve built PNG hashes remain unchanged.


## Editor overview and header-image public verification — 2026-09-30

Help PR [#253](https://github.com/hellotext/help/pull/253) merged by commit `a28e7261dc92315d848f9db67db1388d23fe7c39`, preserving the content and every verifier commit. Build, Aikido, Netlify preview and header checks passed. The responsive alternative-text finding was corrected in both languages; the claimed unreachable verifier was refuted using the actual provider commit parents. Both threads were resolved and the final review completed with no further finding. Attaching the PR reached the existing 100-identity limit. No protection or check was bypassed.

Main [Build 36662621122](https://github.com/hellotext/help/actions/runs/36662621122) succeeded for that exact merge SHA. The normal Netlify production deploy `6abc7bd7f79bfc0008c85369` has matching `commit_ref`, state ready and published_at `2026-09-30T03:03:18.190Z` in the public site-alias API. No manual deployment was used.

Both public [ES](https://help.hellotext.com/es/popup-sitio-web) and [EN](https://help.hellotext.com/website-popup) pages returned HTTP 200 with eleven static figures per language. All twelve new native PNGs and sixteen preserved referenced PNGs returned HTTP 200 and matched their approved SHA-256 hashes. No preserved PNG was uploaded as a duplicate. Exact URLs, hashes and deployment evidence are in `captures/website-popup/editor-follow-up/public-verification.json`. The follow-up refreshes only the full editor and image-bearing step/field/completion examples; unrelated figures are preserved.

The protected Popup remains hidden/draft with two existing steps and zero submissions; its actual header image uses the existing application photograph. Contact/message/delivery guards are unchanged, and the fictional business label Enterprise and locale ES are restored. No earlier seed, delivery, final save, test, installation or publish action was executed. The durable row remains local_verified with the reachable final content verifier.


## Assignment default-label refresh — 2026-09-30

The user requested a fresh capture of the coupon/journey assignment panel after its labels returned to the standard size. Preserve current ES/EN originals in originals/popup-assignment-label-refresh. Section review: refresh only “Assign a coupon and journey”; every other section and all ten other figures per locale retain their approved sources because their controls do not show these labels. Preserve titles, slugs, links, translations and publication identity.

The running reviewed Rails revision 11731d118e581bb1d67853b1add1f4f495160288 includes the standard-label correction bcfc5e91c4. Its assignment partial is byte-identical to current origin/master e6ae33a310d46ba88d9bf5b70845618a0b4a6461. Browser measurements show both labels at 16px with 24px line height and weight 500. The isolated compositor captured the actual panel at a desktop viewport of 1440×1200, zoom1/DPR2, with GUIA-QR-10 selected only transiently. Both real selectors and complete labels have 12px source margins; no pointer, cut control, overlay or private data is present. No pixels were edited.

Two approved native Display P3 PNGs are 808×456 ES and 808×408 EN, logical widths 404 CSS px. The fitted white frame caps include their 18px padding/border overhead (422px), while the lavender stage retains the full article column. Existing PNG URLs remain available for historical references; this article references fresh paths. No unrelated screenshot was recaptured or duplicated.

The existing hidden draft and its header image were reused without seeding, saving coupon/journey assignment, publishing or sending. Protected contacts remain 127 total, zero messageable/subscribed, messages49 and saved playbooks disabled; Popup remains draft/hidden with two steps, no submissions or assignments. Spanish was restored after both captures. Local build and complete article review are pending below.

Local verification passed: production build/security headers and both source→asset→build hash triples; actual PNG signatures/dimensions/Display P3 profiles inspected. Complete ES/EN article browser review at 1440,390,580 CSS px retained eleven figures and no page overflow. The refreshed image displays at 404 CSS px on desktop/narrow and 316 on mobile, never above its logical width. Native pixels and all six article views were reviewed; labels and selectors remain complete and readable. Only two images and their figure dimensions/frame caps changed.

Default-label refresh local verifier: `fbb366c649e695ec68d0f16ff7cc3d860e8d5b51`. The following ledger commit preserves this content verifier as its ancestor.


## Assignment default-label public verification — 2026-09-30

Help PR [#255](https://github.com/hellotext/help/pull/255) merged by `11d1050dd2b22674e35c802c426e1caaf5f473e5`, preserving the content verifier and ledger commit. Build, Aikido, Netlify preview and header checks passed; the final review completed without an unresolved finding. The ancestry comment compared a temporary synthetic commit with the verifier; actual provider head 23fd7f2 has direct parent fbb366c, both appear in the PR commit list, and the thread was resolved with that evidence. No check or protection was bypassed. Attaching the PR reached the existing 100-identity limit.

Main [Build 36665385834](https://github.com/hellotext/help/actions/runs/36665385834) succeeded for the exact merge SHA. Normal Netlify production deploy `6abc847bd93d5b000808f292` is ready with matching commit_ref and published_at `2026-09-30T03:40:14.057Z`, verified through the public site-alias API; no manual deployment.

The public [ES page](https://help.hellotext.com/es/popup-sitio-web) and [EN page](https://help.hellotext.com/website-popup) returned HTTP 200 with eleven figures per locale and the refreshed assignment panels. Both new native PNGs and all twenty-six preserved referenced assets returned HTTP 200 and matched approved SHA-256 hashes. Exact URLs and hashes are in captures/website-popup/assignment-label-refresh/public-verification.json. Previously published PNGs remain available and no unchanged figure was duplicated. The protected fixture and its header remain unchanged, with locale ES restored. Inventory remains 52 local_verified,101 pending,1 out_of_scope.
