# Audience delivery errors — release documentation

## Publication state

Prepared on 2026-10-31 as a draft PR for the feature tracked in
[hellotext/hellotext#6772](https://github.com/hellotext/hellotext/issues/6772).
Do not merge or publish this guide until the production feature is implemented
and its released behavior has been checked against both translations. Merging
Help's main branch triggers publication. Auto-merge must remain disabled.

The source is the agreed Audience prototype on
`codex/campaign-delivery-errors-preview`, revision
`e602ba1fe2c723c80a55e318d49b1140618bbabc`, and its
`docs/ui/campaign-delivery-errors.md` working record. The prototype uses
development-only example data; its local interactions do not establish
production persistence, provider classifications, or access permissions.

## Article inventory

This is a new guide; there is no earlier published article to preserve.

| Locale | Source body | Planned route | State |
| --- | --- | --- | --- |
| English | `_i18n/en/audience/delivery-errors.md` | `/review-delivery-errors` | Draft; not published |
| Spanish | `_i18n/es/audience/delivery-errors.md` | `/es/revisar-errores-entrega` | Draft; not published |

The shared stub is `_audience/delivery-errors.md`, in Audience's Profile data
& consent navigation group. Audience overview and the message-delivery
troubleshooting guide link to it in both languages.

## Reader task and scope

Find failed email addresses and phone numbers across campaigns and playbooks,
understand the reason, inspect the complete profile, export the relevant
contact values, and remove selected values only after reviewing them.

The copy distinguishes contact-value counts from message counts and profiles.
It explains that temporary, provider, and configuration failures need review,
and that removing a phone affects every channel using that value. It does not
promise automatic retries, permanent suppression, restoration, an emailed
export, or a specific production provider-code mapping.

## Section-by-section visual plan

Screenshots are intentionally held for the implemented interface. The issue
contains prototype review captures, but those are not evidence of a released
feature. Do not publish those Spanish prototype captures as localized
production instructions. These are pending editorial checks before merge,
not completed visual work.

| Section | Reader question / decision | Planned visual or reason for prose |
| --- | --- | --- |
| Open delivery errors | Where does the list live, and how does a campaign link to it? | Capture the Audience entry and a focused campaign status tooltip in each locale after implementation. |
| Find the details | Where are filters and how do I recognize an active filter? | Capture the more-options filter menu and one active removable filter; include the search field and count. |
| Understand the reason | Does this error mean the contact is invalid? | Keep the explanation in accessible text/table; another screen adds no diagnosis. |
| Inspect a profile | Which email or phone failed on this profile? | Capture the list beside a complete fictional profile with a warning beside the exact failed value. Use a tighter crop on narrow screens if needed. |
| Export | What is included in the CSV? | Steps and scope in prose; reuse menu context rather than duplicate the same menu. |
| Remove contact details | Am I removing a value or the profile? | Capture the concise single-value confirmation and, if materially different in production, the bulk confirmation with its counts. |

No recipient-message example is planned: this guide manages failures and
contact data; it does not compose or send a message. A message preview would
not explain the management task.

Follow the pinned `docs/editorial` skill and `docs/editorial-integration.md`
for final localized captures, original assets, capture records, Display P3
PNG verification, static figure rendering, and desktop/mobile review. Existing
Help templates and visual assets are unchanged by this text draft.

## Release verification before merge

- Confirm Audience access, exact localized labels, source/error/channel filters,
  campaign entry link, and full-profile behavior in the production implementation.
- Confirm grouping and count semantics, search, selection of all filtered
  results including unloaded rows, and filtered versus selected CSV exports.
- Confirm actual error classifications and sender/configuration guidance.
- Confirm single and bulk removal persist only the intended contact values;
  profile, other values, history, and subscription state remain as documented.
  Verify phone removal across channels and reconcile queued-send behavior.
- Add and verify the final localized screenshots planned above. Match example
  values to fictional accounts; do not send messages to prepare captures.
- Re-run the production build and security-header verifier, then review both
  locales at desktop and mobile widths against the implemented feature.
- Merge only after #6772 is implemented and available to the guide's audience.
  Record the deployment revision and check the public routes after publication.

## Local verification

Verified on 2026-10-31:

- Production `yarn build` passed with Ruby 3.3.6 and Yarn 1.22.22, including
  `script/verify_security_headers.rb`. Dependency files were left unchanged.
- Both localized HTML routes, Audience navigation entries, and search entries
  were generated. All 76 internal links in the two guides resolve, including
  section anchors.
- `docs/` and `AGENTS.md` remain excluded from the public build. The exported
  editorial JavaScript modules match the committed source bytes in both locales.
- Browser DOM review at 1280×720 and 390×844 confirmed both article titles,
  contents, localized links, section navigation, and error tables. At 390px,
  both tables fit the 358px content area without page overflow. The existing
  Help layout and styles were not changed; no screenshots were created or
  accepted as final visual evidence in this draft.

Production behavior and the localized screenshot plan above remain pending.
No deployment or public-page verification has occurred.
