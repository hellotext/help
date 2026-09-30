# Custom actions bilingual review

## Scope and originals

Review `developers/custom-actions.md` in Spanish first, then English. Preserve the published title/slugs/stub, original section structure and link targets. Originals and SHA-256 records are under `originals/custom-actions` and `captures/custom-actions/capture-provenance.json`. Base main: `1a71b2463f05dcfdf98ed574b682ca6458e6f4cb` (53 verified pairs). No Help PR is open. The blocked campaign branch remains untouched; Shopify/Wix require unavailable isolated storefronts.

## Section plan — before editing or fixtures

| Section | Reader question and visual decision |
| --- | --- |
| Introduction / before creating | Definition versus occurrence and built-in versus custom: prose examples; no invented event result. |
| Create / naming | Recognize the Custom tab, existing definition and Create new action control: capture the real localized Actions catalog. Then show the actual unsaved New action pane with readable and tracking names and both flags. |
| Effects | The same complete pane shows conversion versus importance; place its figure here after the two flags are explained, avoiding a redundant crop of the same fields. Explain API `goal` and inverted `passive` explicitly. |
| Actions API | Endpoint/fields/definition-versus-event: a compact original parameter table and a non-executed request example; no token or fabricated response screenshot. |
| Browser tracking | Preserve original executable syntax, add accepted-versus-processed explanation; code is more useful than a console screenshot. |
| Backend tracking | Show endpoint/identity/receipt semantics in prose; no live request, delivery or false attribution result. |
| Object context | API/SDK object is optional; require `object_type` only when referencing/creating an object. No object editor screenshot because its separate guide explains structure. |
| Manual occurrence | Recognize the profile + menu and New Event, then a custom action in the real unsaved event form. Capture that form with fictional customer and associated object requirement visible; explain the current manual form may request an object although API/SDK can omit it. Never save the event. |
| Use / duplicates | Controlled verification, trigger/filters, source identity, retries: prose/checklist; screenshots cannot prove processing or deduplication. |
| Edit/delete | Name row menu Edit/Delete, clarify current UI warning and API refusal with events; no destructive action or extra screenshot of a trivial menu. |
| Troubleshooting/related | Preserve useful table and all targets, add receipt/processing and manual-object checks; no repeated screenshot. |

## Source audit / capture preparation

Read current reviewed Rails `e6ae33a310d46ba88d9bf5b70845618a0b4a6461`: Settings actions controller/form/locales, custom action model/policy, attribution action/event API controllers, Custom tracker, event form/controller and Audience::Event. Official API and Hellotext.js tracking documentation checked read-only. Source discrepancies: API title is the display-name alias; `goal=true` conversion; `passive=false` importance. API deletion with tracked events is forbidden; UI uses discard and warns about all associated events. Current manual JavaScript marks the associated object required for custom actions, unlike API/SDK optional object. No API calls executed.

Older custom-properties-and-events sources were inspected for reuse. They show `appointment.completed` at Rails 449d6ccc, different DB and earlier pane UI, and the manual figure shows a built-in order event. They cannot represent this current `appointment.booked` custom example and custom manual state; keep them unchanged and take current compliant compositor sources.

Protected preflight confirmed Rails 3192/Vite 3042 and isolated DB `hellotext_editorial_workload_20260928`, owner `design-system@example.test`, business 5, locale ES: 127 contacts, zero messageable/subscribed, 49 messages, 318 tracked events, zero enabled playbooks, zero custom actions. Plan one idempotent fixture definition `appointment.booked` with no events/automation; no new contact/object/message or delivery worker. Its name can be localized only in this fictional fixture, restored to Spanish afterward. New action pane remains unsaved. Manual event remains unsaved with disabled save. Capture only the dedicated 9460 Chrome profile, real desktop and phone UI, P3 2×, zoom 1, PID/profile/unique tab/loopback/account/control guards before/after. Preserve source logical dimensions, responsive density, full lavender stage and frame cap including inset/border. No chart editing, JPEG or window picker.

## Verification state

Local ES/EN editorial and visual review completed. Three distinct figures per language show current Actions catalog, complete unsaved name/flag configuration and unsaved manual custom-event form with the real object requirement/disabled save. Twelve fresh P3 compositor PNGs at genuine 2×; no source resampling or pixel edits. Phone catalog uses a complete row/Create new action focus because the real mobile navigation overflows horizontally; no clipped active label was published. Phone draft uses a real 900px-high viewport so its final explanation is complete. The manual pane uses 650px height to avoid excessive blank space. All final controls/borders/labels are complete.

Guarded fixture definition `61NgGoN0` (`appointment.booked`) was created once with goal false/passive true and zero events. Only its fictional readable title and account locale were changed for ES/EN, then restored to Cita reservada/ES. Messages/events/contact counts remained 49/318/127, zero messageable/subscribed and enabled playbooks before/after. No object, contact, event, campaign/message/test/worker or final UI save was used. Draft conversion true is visibly unsaved; catalog/manual select the saved definition without claiming that flag persisted. Reproduction files are guarded fixtures, not application or migration tests.

Clarified definition ID versus tracking name, exact UI labels/+ menu, goal/passive inversion, API endpoints/private token/plan requirements, accepted versus processed receipt, monetary amount/currency/original seconds timestamp, optional API/SDK object versus current manual requirement, duplicate/timeout handling and API deletion refusal. Full source reviewed Spanish first, then English; originals, all headings/link targets and title/slug/published stub preserved. Examples pass bash/JSON/JavaScript syntax without executing any request.

Ruby 3.3.6 yarn build/security headers passed; all 12 source/asset/root-build/ES-build hashes match and docs is excluded. Complete ES/EN article reviewed through all 14 sections, code blocks, three figures and footer at 1440×1000, 390×844 and 580×900; phone code also checked at its horizontal end. Actual desktop pane image431/frame449px, phone image approximately316/frame328px, below native logical431/389px; catalog desktop image approximately698px below876px, phone316px below382px. Stage stays full lavender in original article column with border/separate inset and no page overflow or image links. No renderer/shared guide/style changes or CSS/migration tests. Evidence: captures/custom-actions/local-verification.json. All planned useful visual states were safely represented; no visual debt remains. Commit, PR/independent review and actual public deployment are recorded below.

Local content verifier: `1c3c7e8503ad69ee70d1839ef349985c86c843a0`. The child ledger commit records local completion; external integration and publication are verified below.

## Public verification — 2026-09-30

Help PR [#267](https://github.com/hellotext/help/pull/267) merged by `09740770751cfa909ea5d96a9ec4122f1b1d6c2c`, preserving all individual content/verifier commits. Build, Aikido, normal Netlify preview/header checks and independent review passed on `d6ebd4d775b5b2898ea637f37c62d55593316617`; review completed with no findings (https://github.com/hellotext/help/pull/267#issuecomment-5906657387) and no unresolved threads. No bypass or squash. PR attachment hit the existing 100-identity limit without affecting publication.

Main [Build 36687001089](https://github.com/hellotext/help/actions/runs/36687001089) passed for the exact merge SHA. Normal Netlify production deploy `6abcc187033d300008f2585a` is ready/published with matching `commit_ref` and `published_at` `2026-09-30T08:00:50.212Z`, checked through the public site-alias API. No manual deployment.

Public [ES](https://help.hellotext.com/es/acciones-personalizadas) and [EN](https://help.hellotext.com/custom-actions) pages returned HTTP 200, with three localized figures each. All twelve new desktop/mobile native P3 PNGs returned HTTP 200 and matched approved source hashes. Public URLs, hashes and deployment evidence: `captures/custom-actions/public-verification.json`. The ledger reconciles 54 local_verified,99 pending,1 out_of_scope with this pair pointing to the actual content verifier. No messages, events, tests or delivery were sent for this batch; the single guarded fictional action retains zero events and ES state.
