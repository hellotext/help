# Custom store integration bilingual review

## Scope and starting state

Review `developers/custom-store-integration.md`, Spanish first then English, preserving both published titles/slugs/stub, all original section headings and link targets. Base main `507e112c01d1481793e83933c8ec7b6669a361c4`: 54 local_verified,99 pending,1 out_of_scope; all 54 verifier commits are ancestors. No Help PR is open. Originals and exact hashes are recorded separately under `originals/custom-store-integration` and `captures/custom-store-integration`. The blocked campaign branch remains untouched. Shopify/Wix need unavailable isolated storefronts and are not retried.

## Section plan before editing/capture

| Section | Reader question and visual decision |
| --- | --- |
| Introduction / prerequisites | Backend private token versus public storefront Business ID, stable reference mappings and consent: prose and a compact mapping table. No invented architecture screenshot. |
| 1 API token | Where to name a token and what it authorizes: capture the real unsaved token-creation wizard, desktop/mobile ES/EN, with a fictional integration name. Never create a token, click Continue or expose any credential. Explain business context and receipt separately. |
| 2 Properties | Definition IDs/kinds and profile values: exact request example and explanation. Earlier property selector sources are too narrow and show profile fields, not this global API contract; no redundant or misleading figure. |
| 3 Profiles | Store the returned ID, PATCH known mappings, consent is separate: code/prose, no captured real profile or synthetic successful API response. |
| 4 Products | Catalog/variant ID versus source/reference/SKU and stock: code/prose; no isolated storefront is required and no incomplete product UI should substitute for API validation. |
| 5 Historical orders | Order object versus event, unit price/quantity/monetary event amount and original seconds timestamp: explain verified current API fields and exact example. No fabricated import result. |
| 6 SDK install | Where to find the public Business ID: capture only the actual fictional business header with public ID, desktop/mobile ES/EN, excluding unrelated channels/settings. This is distinct from the private token wizard. |
| 7 Browser activity | Initialize/automatic page view versus explicit product/cart/order events, real cart semantics, received versus processed: code/prose. No browser console screenshot or live tracking request. |
| 8 Identity | Real session, authenticated backend mapping, attachment and logout semantics: steps/code; screenshots cannot establish safe identity across accounts. |
| 9 Backend tracking | Trusted milestones, existing ORDER_ID, real campaign session and retries: prose/code. No event or message is sent for a figure. |
| 10 Verification / go-live / related | Recognizable isolated test flow, processed results and stable IDs: checklist, no invented success or empty result screenshot. |

## Source audit and capture rules

Audit official API reference, current Hellotext.js README/sessions/tracking/source and reviewed Rails `e6ae33a310` API controllers/services. Specific risks identified for verification: a successful profiles GET does not alone prove the expected business; the current token control is Crear token nuevo and the wizard uses Nombre del token/Continuar; SDK initialize is async; standalone order creation currently filters top-level total and computes its total from item prices/quantity; cart.abandoned requires an existing object; SDK forget keeps hello_session and does not detach the backend session; accepted tracking is not processing or attribution proof. Preserve the distinctions in the final prose and document source discrepancies, without changing Rails or API code.

Reuse scan found no approved same-route/state localized token wizard or current public business-ID source. Custom-actions and earlier profile property figures answer different questions, so do not reuse them as credential/settings evidence. Capture two meaningful current controls from the actual app, without saved actions. Verify DB/account, non-deliverable contacts, disabled playbooks and stable message/event/token counts before/after. Use only headless profile/CDP 9460 and Rails3192/Vite3042. Every native PNG needs P3 ICC, genuine2x, zoom1, actual CSS viewport/breakpoint and account/route/control guards before/after. Keep complete borders and labels, native logical frame caps including inset/border and a full lavender Help stage. No secrets, pointer, scrollbar, JPEG, pixel edits, fixture reseeding or final button.

## Completed content and local verification — 2026-09-30

Spanish was edited first, then English. All 13 original section headings and original link targets are preserved; the published stub, both titles/slugs and publication state are unchanged. Each locale has two useful figures (unsaved token name; actual public Business ID in Settings), using eight new native desktop/mobile Display P3 PNGs at 2×. Reuse was considered before capture; no existing approved source answers these two exact controls. The token crop deliberately focuses on the complete name field and heading, with the distant final-action footer omitted; captions describe an unsaved name, not a generated credential. Section-specific reasons for omitting other screenshots remain in the plan above. No useful article figure remains blocked.

The released official npm SDK 2.6.0 and its matching CDN bundle were verified separately from GitHub main. This release does not automatically dispatch page.viewed during initialization; the guide now explicitly tracks each page navigation once, awaits initialize, and avoids duplicating the first no-bundler event. Current Rails sources also corrected standalone order totals, cart quantity/object lookup, profile processing, session attachment/forget semantics, received versus processed, stable mapping and timeout/duplicate behavior. Complete source audit and explicit inherited tracking-events guide debt are in captures/custom-store-integration/source-audit.json. No unrelated guide or renderer was changed.

The complete ES/EN article was reviewed in the isolated Help browser at 1440×1000 desktop,390×844 mobile and580×900 narrow, including all sections/code blocks and footer. Tables wrap, long code remains independently scrollable, full lavender stages stay in the original article column, and white frames follow actual logical source sizes. Token native width540px uses a558px frame including18px inset/border; business native width868px uses an886px cap. Mobile sources are374px logically and all sources declare2×. Observed rendered widths are540px/698.4px desktop and316px mobile, all at or below native logical sizes; no page overflow. All eight raw sources were inspected for complete labels/borders and no cursor, scrollbar, debugger, gray line or private data. PNG sources are unedited.

Normal yarn build passed with Ruby3.3.6 and configured security headers. Eight source/asset/root-build/ES-build hash sets match. Docs originals/provenance remain excluded from public output. All16 code examples per locale passed syntax-only Bash/JavaScript and embedded JSON parsing; no example request or tracking event was executed. git diff --check passed. No CSS or migration tests were added. Local evidence: captures/custom-store-integration/local-verification.json.

Safe fixture checks before/after confirm the isolated DB/account:127contacts,zero messageable/subscribed,49messages,318existing tracked events,zero tokens,zero enabled playbooks. Only account locale changed for ES/EN and was restored ES; token names were temporary DOM drafts. No token, profile, property, product, order, cart, event, campaign, message, test delivery or worker was created. Existing fixtures and old3191checkout were preserved. Commit, PR/independent review and actual public deployment remain pending below.

## PR review correction — linked page-view instructions

Independent PR269 review found a real P2: the inherited tracking-events pair describes automatic page views, so presenting its link as this integration's page-view flow could make a reader omit the explicit call required by SDK2.6.0. Both current locales now keep the original link only as context, explicitly describe this difference, and direct page-view implementation to the verified steps6/7 here. The linked pair remains pending for its full independent review. Original link targets and all other figures/content remain intact; no new captures or fixture actions. Build and focused desktop/mobile review of the corrected browser-activity section passed; external review of the corrected head remains required.

## Exact dependency pin follow-up

The second review of PR269 found another real P2: npm's default save prefix would record ^2.6.0 despite the verified-version wording. The content PR was already merged when this thread was inspected, so it is not yet treated as the completed batch. A focused supported follow-up PR corrects both npm commands with --save-exact and explains retaining package-lock.json plus npm ci; no assets or fixtures change. The linked-guide finding was already corrected. All current-head checks, reviews, threads and exact normal production evidence are required before the final public record.

The follow-up normal build passed, all eight source/asset/root-build/ES-build hashes remain unchanged, and the updated SDK section was inspected ES/EN desktop/mobile. The install command passes syntax-only Bash checking. No install, live request, recapture or fixture change occurred.
