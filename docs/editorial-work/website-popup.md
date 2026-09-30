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
