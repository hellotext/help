# SMS sending limits — 2026-10-07

Status: published and publicly verified on 2026-10-07 at 00:41 UTC.

The Spanish and English guides now show the actual Settings summary status and
the Inbox's explicit daily-limit failure reason. Each figure has matching desktop
and mobile captures: eight original PNGs in total. Titles, routes, collection
metadata and existing publication state are unchanged.

The reset explanation is corrected against `Compliance::Reputation#capped?`,
`#increment_usage` and `#reset?`: capacity becomes available after 24 hours since
the last counted send, rather than each earlier message individually leaving a
rolling window. Notification wording identifies owners and administrators, the
recipients selected by `#send_business_verified_email`. Inbox instructions match
the new visible failure label and desktop hover behavior.

## Evidence and source

The application source is `992de02f9ff379bf248a8f88e611d484d53bf7d7`.
Its [normal deployment succeeded](https://github.com/hellotext/hellotext/actions/runs/37547475320)
on 2026-10-06 at 23:48 UTC. No application view, component, helper, JavaScript or
locale source was modified for these captures.

An independent current-source checkout uses a new local database, Redis instance
and headless Chrome profile. The earlier writer's checkout, drafts, database,
browser and workers remain untouched. The copied database contains fictional
users only; all copied contacts are non-messageable and saved automations are
inactive. There are no connected integrations or authorization tokens. Active
Job uses TestAdapter, mail delivery is disabled, and no delivery worker runs.

The business name Casa Lila and its prepaid review state are explicit local
fixtures. One additional fictional SMS message was stored directly in the error
state with `deliver: false` and the real `daily_message_limit_reached` response.
No send, retry, verification or provider action was executed. The selected
business has 50 stored messages after preparation, up from 49; this is a fixture
change, not delivery evidence. The owner locale was restored to Spanish.

Original article bodies, fixture definition, capture metadata, source audit,
runtime counts and build checks are in
[`captures/sms-sending-limits/`](captures/sms-sending-limits/).

## Section coverage

| Section | Visual decision |
| --- | --- |
| Why the account is limited | Policy and quality explanation; no interface action to illustrate. |
| Recognizing review status | Native Settings card, desktop/mobile in both languages. The tooltip was inspected; a second image would repeat the adjacent explanation and its translucent overlay obscures the business name. |
| Recognizing a blocked SMS | Native complete message bubble, error indicator and explicit failure label, desktop/mobile in both languages. The genuine error tooltip was inspected by hover. |
| Limit increases and notification | Explain the review outcome and actual email recipients; no fabricated verification or notification. |
| Sending-quality advice | Editorial guidance; no additional control or outcome requires a screenshot. |
| Credit-account scope and FAQ | Conceptual answers, including the source-backed reset correction. |

No useful visual remains pending for this guide. This closes one article pair;
it does not close any of the other pending or in-progress guides.

## Verification

- Production `yarn build` passed under Ruby 3.3.6, including security-header checks.
- All eight assets are native 4× compositor PNGs with embedded Display P3. There
  is no image editing, upscaling, generated UI or pointer overlay.
- Both built locale copies of each asset match the original bytes: 16 checks.
  Editorial work records remain excluded from the public build.
- Both complete pages and their figures were visually reviewed at 1440, 580 and
  390 CSS pixels. The full-width lavender stages retain their border and inset;
  white image frames retain a separate inset. Images are static, unlinked,
  localized and never displayed above their recorded logical capture width.
- The error figure preserves the application's genuine muted failure styling;
  its exact reason is also named in adjacent accessible prose.
- Main was checked at `7eeb71e0f26c84d7633f8027a34499cc33a305d9`; no competing Help
  PR was open before preparing this batch. Publication requires another check.

## Public routes

- <https://help.hellotext.com/es/limites-de-envio-sms-para-negocios-nuevos>
- <https://help.hellotext.com/sms-sending-limits-for-new-businesses>

Record the actual merge/deployment revision and served page/asset checks after
publication; local verification alone does not establish a public result.

## Publication result

[PR #389](https://github.com/hellotext/help/pull/389) merged at 00:39:21 UTC as
`817032f6eb795ac52e0137ac94a9c12edf155722`. The normal main build passed.
Public HTTP checks passed 10/10 at 00:41:11 UTC: both routes returned 200 with
the new figures and reset wording, and all eight served PNGs matched their
reviewed SHA-256 hashes. See `captures/sms-sending-limits/public-verification.json`.
This records observed publication of this batch; it does not assert that the
separate GitHub deployment API returned a Netlify production deployment object.
