# Event tracking bilingual editorial review

## Scope and baseline

Key: `developers/tracking-events.md`. Base main `9afebea4b3e16ff506d77304c9de2999c95c46fe`; reconciled64 local_verified,89 pending,one out_of_scope, all verifiers ancestors and no Help PR open. Protected campaign branch preserved. Originals, stub and current Custom store paragraph baseline have separate snapshots and SHA records in `captures/tracking-events/capture-provenance.json`.

## Editorial and visual plan, recorded before edits

Spanish first, then English. Preserve eight H2 sections, ten H3 subsections, titles/slugs/stub/publication and all links. Correct automatic page.viewed against actually published SDK2.6.0 and current Rails5403a7dcb. Explain definition/occurrence/object, supported actions by source, async initialization and explicit page recording, consent versus event, identity/session association, creation versus received/processed, payload/time/value/source, manual object requirement, limited deduplication and uncertain retries.

| Section | Useful control/state/result and decision |
| --- | --- |
| Signals/actions/events/objects | Existing product JSON plus public-ID/payload context; a screenshot cannot explain the request contract. |
| Built-in actions | Preserve six groups and existing names, clarify source compatibility, explicit page recording, cart quantities and order lifecycle. Text gives meaningful distinctions; no fabricated event list. |
| Generated actions | Explain internal versus supported source recording and duplicate effects; no decorative figure. |
| Custom actions | Reuse current catalog, recognizing display title versus appointment.booked tracking name. This is a definition with zero events, not an occurrence. |
| How events reach Hellotext | Async SDK example and backend receipt text; reuse unsaved real manual New event form for required associated object/disabled Save. Keep four source subsections. |
| Event data | Explain stable business-scoped public IDs, pre-associated session, ISO/Unix seconds, monetary inheritance/currency and caller origin bookkeeping in text. |
| Verify tracking | Concrete readback/identity/object/time/duplicate checks and uncertain response handling; no invented success fixture or test/send action. |
| Related guides | Preserve links; narrowly replace the stale automatic-page-view debt paragraph in already reviewed Custom store ES/EN now that this guide is corrected. All other Custom store bytes, examples and figures stay unchanged. |

Two useful figures per language reuse eight approved PNGs from Custom actions#267/#268. Catalog logical876×419 desktop/382×173 mobile, cap894; manual431×650 desktop/389×650 mobile, cap449. Native Display P3 2×, full lavender stage, white frame cap logical+18px, no enlargement. Preserve original source/UI evidence paths; no new images or duplicates. Current token/business sources on Custom store remain intact and will be checked with the four complete pages.

No app/DB/UI/account/locale/fixture/API/token/template/link/message/event/test/send/worker execution or creation. Examples syntax only. Full ES/EN at1440/390/580px, build, hashes, clean diff and protected publication pending.

## Local verification completed

Complete Tracking events and the narrowly corrected Custom store pages were reread and visually reviewed in ES/EN at1440/390/580px. Tracking retains eight H2 and ten H3 sections and all original links, with two useful figures and two syntax-only examples per language. Custom store differs by exactly one paragraph per locale; all13 sections,16 code blocks and existing figures retain their original bytes. Eight approved Custom actions PNGs and eight unchanged Custom store PNGs match source/asset/root-build/ES-build hashes, native Display P3 profile and2× density. Frame caps are logical width+18px, stages fill the column and no image is enlarged or linked; no page overflow. Existing code blocks scroll internally on mobile and preserve complete copyable examples.

During local source audit, the draft SDK example was corrected to the actual published Response wrapper (`failed`, `succeeded`, `json()`), and omitted `tracked_at` was clarified as recording time rather than a guaranteed receipt timestamp. Both corrections preceded commits and publication, followed by rebuild and repeated whole-page review. No examples, API, app/DB/fixture/locale/token/event/send/worker actions occurred. No PNGs were recaptured or uploaded. Build/security headers and `git diff --check` passed. Local review, protected content checks and post-merge public verification are complete and recorded below.

Local content verifier: `636f7d5e9c178b47af82a0ef6f9d9ed710443c1e`. Ledger: 65 local_verified, 88 pending and one out_of_scope; public verification remains pending.

## Exact-head review correction before merge

PR #293 review on 627c84dc identified a real P2: Developers overview ES/EN still warned that Tracking events contained the inherited automatic-page-view claim. The revised plan extends the narrow cross-reference correction to exactly one paragraph per overview locale, preserving every other byte, all nine sections, links, examples, existing token/catalog figures and publication state. Original overview baselines are lossless deterministic gzip archives; record the decompressed original SHA and archive SHA separately. Rebuild and review both complete overview pages at 1440/390/580px, then obtain a fresh exact-head review before merge. The six affected pages still use only sixteen distinct approved PNGs; no capture or duplicate asset is needed.

The overview P2 correction passed rebuild/security headers, exact one-line-per-locale comparison against immutable gzip originals, complete ES/EN browser review at 1440/390/580px and all sixteen unchanged source/build hashes. Six pages and eighteen complete browser states now verified locally; fresh exact-head review remains pending before merge.

## Public verification — 2026-09-30

Help [#293](https://github.com/hellotext/help/pull/293) merged by `215c33e36a9d6786e3b53f07290045c88c58973d` with all individual commits preserved. Build/Aikido/Netlify preview/header checks passed on exact head `b661dadcdaaf1e1d0d2a0044e80f27b19ae536e7`. Independent exact-head review and every actual comment/review/thread were read before the separate merge call, with zero unresolved findings. The real P2 about obsolete overview warnings was corrected in exactly one paragraph per locale, followed by rebuild, full ES/EN overview browser review and a new exact-head independent review. PR attachment was attempted; the existing 100-identity limit prevented it.

Exact main [Build 36782774473](https://github.com/hellotext/help/actions/runs/36782774473) passed. Normal production Netlify `6abd85fc7006b40008fe67e1` is ready/published at `2026-09-30T21:59:23.145Z`, with matching commit_ref `215c33e36a9d6786e3b53f07290045c88c58973d`. Six affected localized pages and all sixteen approved unchanged PNGs returned HTTP 200; source/asset/public SHA256 values match. Two useful figures per locale in Tracking and the preserved Custom store/overview figures retain native P3/2× density, logical size+18px frame caps and full-column lavender stages. No new capture, duplicate PNG upload or manual deployment.

Public pages:

- [https://help.hellotext.com/es/seguimiento-de-eventos](https://help.hellotext.com/es/seguimiento-de-eventos) — HTTP 200, two figures.
- [https://help.hellotext.com/tracking-events](https://help.hellotext.com/tracking-events) — HTTP 200, two figures.
- [https://help.hellotext.com/es/integrar-tienda-personalizada](https://help.hellotext.com/es/integrar-tienda-personalizada) — HTTP 200, two figures.
- [https://help.hellotext.com/integrate-custom-store](https://help.hellotext.com/integrate-custom-store) — HTTP 200, two figures.
- [https://help.hellotext.com/es/resumen-desarrolladores-api](https://help.hellotext.com/es/resumen-desarrolladores-api) — HTTP 200, two figures.
- [https://help.hellotext.com/developers-api-overview](https://help.hellotext.com/developers-api-overview) — HTTP 200, two figures.

Current approved sources reused without duplicates, including mobile:

- [https://help.hellotext.com/images/developers/custom-actions/catalog-es.png](https://help.hellotext.com/images/developers/custom-actions/catalog-es.png) — HTTP 200; SHA256 `a12712f6c78adc83c29a0c497ccb3a061449789f26a7d5cbaf6fdab127612389`.
- [https://help.hellotext.com/images/developers/custom-actions/catalog-es-mobile.png](https://help.hellotext.com/images/developers/custom-actions/catalog-es-mobile.png) — HTTP 200; SHA256 `fab59f9490d84ad14feb17be6a5701ba29c39161fdc7bd5fbd391a2a16651d76`.
- [https://help.hellotext.com/images/developers/custom-actions/manual-es.png](https://help.hellotext.com/images/developers/custom-actions/manual-es.png) — HTTP 200; SHA256 `144e3281a27f8c6e5434f2e5e12585039d18bd9f300e259df95381af25c376a2`.
- [https://help.hellotext.com/images/developers/custom-actions/manual-es-mobile.png](https://help.hellotext.com/images/developers/custom-actions/manual-es-mobile.png) — HTTP 200; SHA256 `9cc3f116cb1a88b065f769c74e3b215dc3a39383af884a203e240a965970dacf`.
- [https://help.hellotext.com/images/developers/custom-actions/catalog-en.png](https://help.hellotext.com/images/developers/custom-actions/catalog-en.png) — HTTP 200; SHA256 `6fdbbbe59759abe2be46c35406174c9dae62c52dcdb56d65f5875e003e278bef`.
- [https://help.hellotext.com/images/developers/custom-actions/catalog-en-mobile.png](https://help.hellotext.com/images/developers/custom-actions/catalog-en-mobile.png) — HTTP 200; SHA256 `9f1460df43463d2eef8bbd04d6c550782d05bd4129eb7f9bf0faa5f553588561`.
- [https://help.hellotext.com/images/developers/custom-actions/manual-en.png](https://help.hellotext.com/images/developers/custom-actions/manual-en.png) — HTTP 200; SHA256 `77dd2a9505cbc073897db00674689fcf819a0ace5b5b58bc53ad36e3aad8ba7b`.
- [https://help.hellotext.com/images/developers/custom-actions/manual-en-mobile.png](https://help.hellotext.com/images/developers/custom-actions/manual-en-mobile.png) — HTTP 200; SHA256 `77277beaf19ecfad6b22bb3933c8a563bedb3dabc0a43fbaff07a055358fa80e`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es.png) — HTTP 200; SHA256 `9edcb6a1e9354047b98feb41d5a10b613acdaed33e1dfce768406dd6f3504f8a`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-es-mobile.png) — HTTP 200; SHA256 `6c9ef30747a2fe23a65542aa040142515cfe034a5df24c6a51e0161f4052b94b`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en.png) — HTTP 200; SHA256 `efe16993a26fbf2e3047bc57da420ff888069022f45fcebd3af561965906a4c2`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-spacing/token-en-mobile.png) — HTTP 200; SHA256 `2200d9bccae650ed15f47970ab7eb729365e544e6000b1bde4758e600697778b`.
- [https://help.hellotext.com/images/developers/custom-store-integration/business-es.png](https://help.hellotext.com/images/developers/custom-store-integration/business-es.png) — HTTP 200; SHA256 `17ec399500cee235d73459ced0de47fac99054987976a56f4e09603150ef5dfb`.
- [https://help.hellotext.com/images/developers/custom-store-integration/business-es-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/business-es-mobile.png) — HTTP 200; SHA256 `0c7ac4c233075fa5d072e27ac33e7947092bf6406858524ab12fa546be553ed8`.
- [https://help.hellotext.com/images/developers/custom-store-integration/business-en.png](https://help.hellotext.com/images/developers/custom-store-integration/business-en.png) — HTTP 200; SHA256 `1f7f132b2245056eda5166b1b1cfdbeee406ebcf7bad4a13a6eb3fd501184d7f`.
- [https://help.hellotext.com/images/developers/custom-store-integration/business-en-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/business-en-mobile.png) — HTTP 200; SHA256 `c7badab42d6878393ab746c2950605b8153dc38d60ac1ae09c747a949706bfeb`.

Source publication and UI evidence remain in the original Custom actions, token-spacing and Business ID directories. No app/DB/fixture/locale/token/template/link/message/event/test/send/worker action occurred. Final ledger: 65 local_verified, 88 pending and one out_of_scope; all 65 verifiers must remain ancestors of final main. The separate public record PR receives exact post-merge main Build, normal production SHA association and repeated public page/PNG proof in its GitHub comment, avoiding a recursive record commit.
