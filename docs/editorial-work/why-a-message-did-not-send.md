# Message delivery failures — 2026-10-07

Status: published and publicly verified on 2026-10-07 at 01:13 UTC.

The Spanish and English guide now illustrates four decisions: reading the exact
failure reason, respecting an unsubscribe, recognizing a converted-cart
cancellation, and choosing an eligible sender when a retry menu is available.
Each figure has desktop and mobile sources. Twelve PNGs are new; four daily-limit
PNG sources are reused unchanged from the published SMS-limits guide.

The English status label is corrected to **Not delivered**. The text no longer
names an unimplemented **Choose channel** button. It explains that **Try again**
opens a menu when choices exist, while the single-current-channel control can
submit directly. Titles, slugs, collection metadata and existing links remain
unchanged. No screenshot action is interactive in the published article.

## Source and capture provenance

Application revision: `992de02f9ff379bf248a8f88e611d484d53bf7d7`, whose
[deployment completed successfully](https://github.com/hellotext/hellotext/actions/runs/37547475320)
on 2026-10-06 at 23:48 UTC. Views, components, helpers, JavaScript and locale source
were unchanged. The source implementation is `Message::DeliveryFailure`,
`Message::RetryComponent`, its real ERB template, and the message retry controller.

Captures use the independently owned demo database `hellotext_help_batch_20261007`,
the dedicated headless Chrome profile, a loopback-only connection and the fictional
account `design-system@example.test`. No previous writer checkout, draft, browser,
database or worker was changed. Three error messages were stored with `deliver:
false`; their native error mappings are `failed`, `profile_unsubscribed` and
`cart_saver_converted_cancellation`. Two local SMS channel records use reserved
fictional numbers and have no provider connection. No contact gained a deliverable
phone property. The menu was opened only after checking that its trigger was a
`type=button`; no sender was selected and no form was submitted.

Final runtime checks require 53 stored business messages, all three new records
still in error, zero messageable contacts, zero enabled playbooks, zero active
workflows, zero integrations or authorization tokens, TestAdapter jobs and disabled
mail deliveries. Account locale was restored to Spanish. Fictional outcomes are
identified in accessible captions; they are not reports of delivered messages or
real customer activity.

Every source image is a genuine 4× Chrome-compositor PNG with embedded Display P3.
There was no image editing, color relabeling, upscaling or generated interface.
Native popovers, focus styling and muted cancellation/error styling are preserved.
The retry crop was recaptured to remove clipped unrelated text at its upper edge.
Each responsive source is capped at its actual logical width (392px desktop,
406px mobile); the stage remains full width with separate stage and frame insets.

Original article bodies, reproducible fixture scripts, source capture metadata,
runtime checks, build checks and native page-review images are stored in
[`captures/message-delivery-failure/`](captures/message-delivery-failure/).
Long mobile page reviews use separate native compositor captures because a single
very tall review capture exceeded the color-preserving compositor path. The failed
review image was discarded; accepted images retain their genuine Display P3 profile.

## Section coverage

| Section | Reader question and visual decision |
| --- | --- |
| Message never created | Source-specific diagnostic checklist and links; a screenshot of a different campaign or playbook would not establish the missing event. |
| Pending or routed | Processing-state meanings and duplicate avoidance; conceptual text, no fabricated provider success. |
| Not delivered | Where to find the precise reason: native daily-limit error beside the complete message. |
| Consent and customer identity | What an unsubscribe failure looks like: native reason without a retry action. A second profile badge would repeat the same decision; the linked consent guide owns profile-state details. |
| Billing and limits | First error figure establishes a real account limit; the linked SMS-limits guide shows the Settings state. Other payment conditions remain conditional guidance without a billing mutation. |
| Channel/sender problems | Diagnostic checklist and channel setup links; no single unrelated provider configuration answers all cases. |
| WhatsApp, SMS and Mercado Libre reasons | Existing reason lists distinguish provider conditions. The first error figure teaches how to locate any specific reason; duplicating every error label would add little. |
| Message no longer relevant | What a converted-cart cancellation looks like and why no retry action appears. |
| Retry decision | Real multi-sender menu and explicit explanation of the direct single-channel action; no retry or delivery fabricated. |
| Asking for help and related guides | Evidence checklist and navigation; no additional interface action needs a figure. |

## Verification and publication

- Production `yarn build` passed with Ruby 3.3.6, including security-header checks.
- All 16 referenced source PNGs have their genuine profile; both built locale
  copies match each source exactly (32 byte comparisons).
- Generated JavaScript is unchanged and built byte-identically; `docs/` is excluded.
- Both complete localized pages and every figure were visually reviewed at desktop
  and mobile sizes, with intermediate-width checks at 580px. All six viewport
  checks passed: no overflow, native-size caps respected, no image links, and
  accessible captions visually hidden. There are 28 accepted native review PNGs.
- No competing Help PR was open, and main remained
  `817032f6eb795ac52e0137ac94a9c12edf155722` before preparing publication.

Published routes, verified after the normal PR merge:

- <https://help.hellotext.com/es/por-que-no-se-envio-un-mensaje>
- <https://help.hellotext.com/why-a-message-did-not-send>

[PR #390](https://github.com/hellotext/help/pull/390) merged at 01:13:02 UTC as
`4321bf17dcbea04af138399ba99598d05c4abca4`. The normal PR checks passed, and the
[main build](https://github.com/hellotext/help/actions/runs/37555981946/job/112582197171)
also passed. The Aikido PR check reported six low-severity findings below its
blocking threshold and completed successfully; this is not a claim of zero findings.

Public verification at 01:13:40 UTC passed all 18 checks: both localized pages
returned HTTP 200 with their four figures and corrected wording, and all 16 served
PNG assets matched the reviewed source SHA-256 hashes. The full results are in
[`public-verification.json`](captures/message-delivery-failure/public-verification.json).
No visual or publication step remains pending for this article pair.
