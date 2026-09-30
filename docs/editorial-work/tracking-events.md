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

During local source audit, the draft SDK example was corrected to the actual published Response wrapper (`failed`, `succeeded`, `json()`), and omitted `tracked_at` was clarified as recording time rather than a guaranteed receipt timestamp. Both corrections preceded commits and publication, followed by rebuild and repeated whole-page review. No examples, API, app/DB/fixture/locale/token/event/send/worker actions occurred. No PNGs were recaptured or uploaded. Build/security headers and `git diff --check` passed. Local review is complete; protected publication remains pending.
