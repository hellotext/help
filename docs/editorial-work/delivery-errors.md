# Audience delivery errors — release documentation

## Publication state

Prepared on 2026-10-31 as a draft PR for the feature tracked in
[hellotext/hellotext#6772](https://github.com/hellotext/hellotext/issues/6772).
Revised on 2026-11-10 to match the implemented feature. Do not merge or publish
this guide until the feature is deployed and its released behavior has been
checked against both translations. Merging Help's main branch triggers
publication. Auto-merge must remain disabled.

The guide now follows the production implementation in the Hellotext Rails
repository:

- [#7018](https://github.com/hellotext/hellotext/pull/7018) (merged): the
  failure codes that count as delivery errors.
- [#7020](https://github.com/hellotext/hellotext/pull/7020) (merged): the
  `audience_delivery_errors` table, recording and backfill.
- [#7024](https://github.com/hellotext/hellotext/pull/7024) (merged): the
  Audience view, filters, search, profile warning, removal, export, report
  links and Activity line.
- [#7025](https://github.com/hellotext/hellotext/pull/7025) (open): the warning
  replaces the verified mark and is centered on the value.

The earlier draft followed the prototype on
`codex/campaign-delivery-errors-preview`. The implementation differs from it:

- **Only destination failures are listed:** WhatsApp error 131026 and SES
  permanent bounces. Temporary failures and account or configuration failures
  are not recorded, so the three prototype categories (invalid, temporary,
  needs review) are gone.
- **Error type lists the reasons:** Number unreachable, Email bounced, Mailbox
  doesn't exist and Email suppressed.
- **Channels are WhatsApp and Email; SMS isn't included.** Source adds journeys.
- **One row per profile**, not one per contact value.

## Article inventory

This is a new guide; there is no earlier published article to preserve.

| Locale | Source body | Planned route | State |
| --- | --- | --- | --- |
| English | `_i18n/en/audience/delivery-errors.md` | `/review-delivery-errors` | Draft; not published |
| Spanish | `_i18n/es/audience/delivery-errors.md` | `/es/revisar-errores-envio` | Draft; not published |

The Spanish route and title changed from "errores de entrega" to "errores de
envío" to match the interface label (**Errores de envío**). The route was never
published.

The shared stub is `_audience/delivery-errors.md`, in Audience's Profile data
& consent navigation group. Audience overview and the message-delivery
troubleshooting guide link to it in both languages.

## Reader task and scope

Find the profiles whose email address or phone number the provider reported as
unusable, understand the reason, inspect the complete profile, export the
failure details, and remove the failed value only after reviewing it.

The copy explains what does and doesn't appear in the list. It distinguishes
profile counts from failed-message counts, and states that removing a phone
removes it for WhatsApp and SMS. It names the roles that can remove and export.
It does not promise automatic retries, restoration, an emailed export, or
clearing a value after a later successful delivery.

## Section-by-section visual plan

Screenshots are still held for the deployed interface. The issue's prototype
captures don't show the released feature and must not be published. These are
pending editorial checks before merge, not completed visual work.

| Section | Reader question / decision | Planned visual or reason for prose |
| --- | --- | --- |
| Open delivery errors | Where does the list live, and how do reports link to it? | Capture the Audience entry and a focused campaign status tooltip with **Review errors** in each locale. |
| Search and filter | Where are filters and how do I recognize an active filter? | Capture the more-options menu with the Source, Error type and Channel submenus, and one active removable filter. |
| Understand the reason | What does each reason mean? | Keep the explanation in the table; another screen adds no diagnosis. |
| Inspect the profile | Which email or phone failed on this profile? | Capture the list beside a complete fictional profile with the warning beside the failed value. Use a tighter crop on narrow screens if needed. |
| Export | What is included in the CSV? | Columns and scope in prose; the menu is already shown in the filter capture. |
| Remove | Am I removing a value or the profile? | Capture the single-value confirmation and the bulk confirmation with its counts. |

No recipient-message example is planned: this guide manages failures and
contact data; it does not compose or send a message.

Follow the pinned `docs/editorial` skill and `docs/editorial-integration.md`
for final localized captures, original assets, capture records, Display P3
PNG verification, static figure rendering, and desktop/mobile review. Existing
Help templates and visual assets are unchanged by this text draft.

## Release verification before merge

Confirmed against the implementation on 2026-11-10:

- **Labels:** English and Spanish interface labels and roles. Removing values
  needs owner, administrator or manager; Export is hidden for agents.
- **Filters and search:** Source, Error type and Channel; search by name and
  failed value; the campaign and playbook **Review errors** links.
- **Selection:** "select all" includes unloaded rows. Export, bulk edits and
  removal stay inside the filtered list.
- **Removal:** single and bulk removal remove only the failed values (a phone
  together with its WhatsApp use), keep other values and message history, and
  return to the list when the profile leaves it.

Still pending:

- Check the deployed feature in both locales, including the export CSV columns.
- Add and verify the final localized screenshots planned above. Match example
  values to fictional accounts; do not send messages to prepare captures.
- Re-run the production build and security-header verifier, then review both
  locales at desktop and mobile widths.
- Merge only after #6772 is deployed and available to the guide's audience.
  Record the deployment revision and check the public routes after publication.

## Local verification

Verified on 2026-10-31 for the first draft: the production `yarn build` with
`script/verify_security_headers.rb`, both localized routes, Audience navigation
and search entries, 76 internal links, the `docs/` and `AGENTS.md` exclusions,
the editorial module bytes, and a DOM review at 1280×720 and 390×844.

Verified on 2026-11-10 for this revision:

- **Production build:** `yarn build` passed, including
  `script/verify_security_headers.rb`. It ran with Ruby 3.3.12 and a UTF-8
  locale; 3.3.6 isn't installed locally, and the default ASCII locale fails on
  existing articles. Dependency files were left unchanged.
- **Routes:** `/review-delivery-errors` and `/es/revisar-errores-envio` are
  generated, and the old `/es/revisar-errores-entrega` route is not. Every
  internal link in both guides resolves, and the other Spanish pages link to
  the new route.
- **Exclusions:** `docs/` remains excluded from the build.
- **Not repeated:** the browser review at desktop and mobile widths; it is
  still pending.

Production behavior and the localized screenshot plan above remain pending.
No deployment or public-page verification has occurred.
