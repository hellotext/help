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

Pending protected checks/review and exact main/public verification. A local build is not publication. The verifier commit will be recorded separately in progress.csv.

Local content verifier: `0210d72e363a558496d605ffc26aac2f2d72badf`. Ledger reconciled to61local_verified/92pending/1out_of_scope; all61verifiers are ancestors of this branch. Required main/public verification remains pending.

Provider follow-up: Meta announced eligible utility Direct Send in June2026. Current Hellotext Gateway::Text uses type:text and no Direct Send parameter; approved-template guidance is scoped to this endpoint, avoiding a universal claim about every Meta flow. Source: https://developers.meta.com/resources/videos/whatsapp-direct-send-api/. No API send or SDK change.
