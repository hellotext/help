# Send messages with the API bilingual review

## Starting state and preserved scope

Origin/main d34dcd355d84fc91da293f6291ec300708f63a60, after independent Node 22 PR #282. Progress is 60 local_verified, 93 pending and one out_of_scope; all 60 content verifiers are ancestors and no Help PR is open. New branch codex/send-messages-api-editorial preserves the older merged codex/send-messages-api-guide (#52) and the primary protected campaign branch. Preserve the original 12 h2 sections, two choice subheadings, links, titles/slugs/stub/locales/publication and six code blocks. Spanish first, then English.

## Section-specific visual plan before editing or capturing

| Section | Useful visual / concrete omission reason |
| --- | --- |
| Introduction | Explain individual API versus audience/campaign/playbook use; no screenshot establishes consent or delivery. |
| Before starting | Reuse the four current approved P3 2× authorization-name draft sources from Custom store integration with original evidence. No new secret or token. Explain token business scope and active API subscription. |
|1 Free-form versus template | Real current Settings template editor in Message/SMS preview mode, with a complete localized unsaved fictional return-follow-up draft. It shows reusable message content and preview, explicitly not saved or WhatsApp-approved. If a full editor is unreadable on mobile, focus actual controls from the same desktop view rather than upscale. No new template/approval/job. |
|2 Technology/origin | Backend parameter/routing decisions; the template preview is not proof that the Messages API supports every editor technology. Audit current whitelist, channel identifier and omitted-technology behavior without using active channels. No selector or unavailable-channel error screenshot. |
|3 Profile/destination | Explain same-business public profile ID, exact phone matching, consent separation and async invalid-ID uncertainty. A saved profile figure would repeat fields without proving API routing; use prose/readback instructions and existing profile guide. |
|4 Free-form request | Syntax-only cURL and origin data explain POST. No request or outgoing result fabricated. Ensure first reply includes the useful return URL. |
|5 Template request | Complementary actual dynamic-shortlink control if it identifies the name used in template.shortlinks; otherwise retain code and the section1 draft screenshot. Audit string/object/header URLs/shortlinks, pending changes and actual approval binding. Never represent a local approved state as Meta approval. |
|6 Attachments | API URLs/channel rules are best represented as code. No real upload/download/send or misleading SMS attachment figure. |
|7 Acceptance/state | Audit 200/received without ID versus eventual message object. Existing protected DB has 49 inbound messages and no failure example; no fake delivered/error screenshot. Read-only serializer probes on unsaved objects may establish exact state naming without jobs/DB writes. Explain public-reference failed versus current serializer error, timestamps and bounded listing correlation. |
|8 Retry | Explain no general request idempotency key, uncertain acceptance and later queue/provider failures; another UI picture cannot prove no duplicates. |
|9 Troubleshooting | Preserve linked diagnosis and add subscription/ID/origin/failure-state distinctions. No captured runtime error or empty pane. |
| Go-live checklist | Instructions for the reader's separately controlled authorized environment. Editorial batch executes no messages, tests, examples or final actions. No fabricated success evidence. |
| Related guides | Preserve every link; no decorative figure. |

Before/after exact DB/account guards: hellotext_editorial_workload_20260928, business5, design-system@example.test, 127 contacts, zero sendable/subscribed, 49 messages, 318 events, zero tokens and zero enabled playbooks. Existing templates and profiles remain unchanged. Locale ES restored. Automatic owned Chrome 9460 only, PNG Display P3 >=2×, full-column lavender stage, logical size+18px frame cap and no amplification. Full ES/EN desktop/mobile/narrow review, original integrity, syntax-only examples, build/security/hash checks and exact-head PR review required before publication. Publication pending.


## Editable message example definition

This is an unsaved draft in the actual Settings template editor, Message mode with SMS preview selected. It was not submitted for Meta approval or sent. The preview tabs do not establish Messages API capabilities.

```json
{
  "es": {
    "name": "Seguimiento de devolución",
    "body": "Hola {name}. Consulta las instrucciones de devolución: https://shop.example.com/returns/1001. BAJA para salir"
  },
  "en": {
    "name": "Return follow-up",
    "body": "Hi {name}. Read your return instructions: https://shop.example.com/returns/1001. Reply STOP to opt out."
  }
}
```

## Completed local review

- Spanish reviewed first, then English against current Rails e6ae33a310, official Messages API reference and WhatsApp policy. Preserved every original heading (12 h2/two h3), original link, stub/title/slug/publication. Six examples per locale checked only for shell/JSON/header syntax. No examples executed.
- Corrected business/token/subscription scope, explicit technology, origin identifier, same-business public profile and exact existing destination, consent separation, active template version/Meta approval, public attachment URLs and asynchronous validation.
- Reconciled public reference versus current serializer: HTTP200 received contains no message ID, failure is currently error, dispatched is not delivered, nullable state timestamps use Unix seconds, listing has no profile/date/template filter or template ID. Bounded pagination and client correlation do not guarantee a unique POST match. No general idempotency key or immediate retry of an uncertain acknowledgement.
- Two figures per locale. Four new native Display P3 2× PNGs of complete unsaved message controls; four approved token-name sources reused from Custom store integration with original UI evidence and no duplicate assets. Desktop editor logical624×354; mobile334×380 ES /334×359 EN. Frames cap642px and558px for editor/token including18px inset/border; full-column lavender stage, proper2× density for every source, no enlargement.
- The full1280px editor and clipped phone/mobile preview strip were omitted because essential labels would be too small or controls incomplete. Actual Link popover exposes static URL creation viaPOST and no named dynamic-link control; skipped it, explaining template.shortlinks with code. No outbound/failure fixture exists; omitted fake delivered/error UI and recorded readonly serializer probes on six unsaved objects instead.
- Complete ES/EN browser inspection at1440/390/580px: all sections, examples, figures and footer; no page overflow, image enlargement or clipped controls. Production yarn build with Ruby3.3.6 and security headers passed. Eight source/asset/root-build/ES-build hashes match, embedded P3/PNG/dimensions verified; originals unchanged in separate snapshots.
- Protected fixtures unchanged before/after:127contacts,0messageable/subscribed,49inboundmessages,318events,12existingtemplates,0tokens,0enabledplaybooks; Spanish restored. Only guarded locale changed. No seed, saved template, static link, message, event, approval request, final Save/Send/Test, API example or delivery worker. No CSS/migration tests, shared renderer/export changes or unrelated fixes.

## Publication

Content checks/review, exact main Build, normal production deployment and public verification are complete; see evidence below. A local build alone is not publication. The verified content commit is recorded separately in progress.csv.

Local content verifier: `6e7ae88260f08f767f92b5fc7f7d63f2305cc227`. Ledger reconciled to61local_verified/92pending/1out_of_scope; all61verifiers are ancestors of this branch. This was the local-stage checkpoint; main/public verification is now recorded below.

Provider follow-up: Meta announced eligible utility Direct Send in June2026. Current Hellotext Gateway::Text uses type:text and no Direct Send parameter; approved-template guidance is scoped to this endpoint, avoiding a universal claim about every Meta flow. Source: https://developers.meta.com/resources/videos/whatsapp-direct-send-api/. No API send or SDK change.

## Public verification — 2026-09-30

Help PR [#283](https://github.com/hellotext/help/pull/283) merged by `f7500957ff896b69c4ec2c456f28fba2d4a49948`, retaining all individual commits. Required Build, Aikido, Netlify preview/header checks and independent review passed on exact head `fb734cb39f4b138cbe352abbc5554753b15f4411`. Actual review threads/comments were read with no unresolved findings before the separate merge call. Review: https://github.com/hellotext/help/pull/283#issuecomment-5916216368. PR attachment was attempted and reached the existing 100-identity limit.

Exact main [Build 36753185542](https://github.com/hellotext/help/actions/runs/36753185542) passed. Normal Netlify production `6abd49c0f6d5bd0008b5e9d9` is ready/published at `2026-09-30T17:42:09.473Z` with matching commit_ref `f7500957ff896b69c4ec2c456f28fba2d4a49948`. Both pages contain two localized figures each and updated Messages endpoint guidance. Both pages and all eight responsive PNGs returned HTTP 200 with approved native source hashes: four new unsaved Message editor images and four token-name sources reused without duplicate uploads. Source density remains 2× and browser/native logical caps prevent upscaling. No manual deployment.

Public pages:

- [https://help.hellotext.com/es/enviar-mensajes-con-api](https://help.hellotext.com/es/enviar-mensajes-con-api) — HTTP 200, two figures.
- [https://help.hellotext.com/send-messages-with-api](https://help.hellotext.com/send-messages-with-api) — HTTP 200, two figures.

New native images, including mobile:

- [https://help.hellotext.com/images/developers/send-messages-with-api/editor-es.png](https://help.hellotext.com/images/developers/send-messages-with-api/editor-es.png) — HTTP 200; SHA256 `27cbe0e6670b0412f590a6030287ce264393c7d56f1ebaafb407d20dd059da02`.
- [https://help.hellotext.com/images/developers/send-messages-with-api/editor-en.png](https://help.hellotext.com/images/developers/send-messages-with-api/editor-en.png) — HTTP 200; SHA256 `330f9832b65d012cbdb0cc97cb757f2c90ac197a37bbae711cb5285521261011`.
- [https://help.hellotext.com/images/developers/send-messages-with-api/editor-es-mobile.png](https://help.hellotext.com/images/developers/send-messages-with-api/editor-es-mobile.png) — HTTP 200; SHA256 `0b6fcf98897f7a89bce1654e31fe8eb5fe31195f36ff3d1eb801ddfd76eb9639`.
- [https://help.hellotext.com/images/developers/send-messages-with-api/editor-en-mobile.png](https://help.hellotext.com/images/developers/send-messages-with-api/editor-en-mobile.png) — HTTP 200; SHA256 `d5f1753c4577120e5953e7b211cf36850141722623937bc72fccf729bf8b9ca2`.

Approved sources reused without duplicates:

- [https://help.hellotext.com/images/developers/custom-store-integration/token-es.png](https://help.hellotext.com/images/developers/custom-store-integration/token-es.png) — HTTP 200; SHA256 `1aee0b74d12bed3eb995c7211316047bd59158a92f2c491dfc4a01287c5fb953`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-es-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-es-mobile.png) — HTTP 200; SHA256 `ab734e406f700b90cd37365b7a1d084cedb9e8adda7bca8757182d471e6d355a`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-en.png](https://help.hellotext.com/images/developers/custom-store-integration/token-en.png) — HTTP 200; SHA256 `ca4b35ca243e0e6db3c52219e00162ef2c708efd61d7265dc25f599907c97bd6`.
- [https://help.hellotext.com/images/developers/custom-store-integration/token-en-mobile.png](https://help.hellotext.com/images/developers/custom-store-integration/token-en-mobile.png) — HTTP 200; SHA256 `716908e63c1f6e914b3dc8d7456e224c02fe69b24797477dded04096b9ec7652`.

Review evidence: both P2 findings were checked against primary implementation data. The ancestry claim used a synthetic commit outside the PR; actual GitHub parent links and merge-base prove reachability. The timestamp claim used raw Ruby method values before ApplicationSerializer.sort_hash converts TimeWithZone to Unix seconds. serializer-wire-readonly.json records final serialized integer/null values for six unsaved duplicates in a READ ONLY transaction, without changing the original DB row. serializer-readonly.json is raw method evidence, not an HTTP response. Both threads were replied to with proof and resolved before merge.

The independent public record PR and its exact main Build/normal production/page/hash verification close this batch. Post-record evidence is attached to that PR after merge. Ledger: 61 local_verified, 92 pending, 1 out_of_scope. Content verifier remains 6e7ae88260f08f767f92b5fc7f7d63f2305cc227; all verifiers must be ancestors of final main. Protected campaign branch and local dependencies preserved. No examples, tracking, messages, tokens, static links, saved templates, deliveries, API requests or new captures are needed for this record.

## Token label spacing refresh — 2026-09-30

The token-name figure now uses the four current native P3 2× sources from Rails #6054, shared across all six consumers without duplicate upload per guide. Only its source paths and corrected height metadata changed; prose, captions, links, other figures and publication are preserved. Original source/provenance and publication evidence above are historical and retained. Current correction evidence: [token-spacing-refresh.md](token-spacing-refresh.md) and `captures/custom-store-integration/token-spacing-refresh/capture-provenance.json`. No token created; locale restored ES. Complete ES/EN page review at desktop/mobile/narrow sizes, native/build hash checks and the build passed. Public verification passed after Help #285: exact main Build and normal production commit_ref, both localized pages and approved native served PNG hashes. See the focused record for current URLs and hashes; the historical source proof above remains unchanged.
