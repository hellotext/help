# Shareable Link

- Article key: `captures/shareable-link.md`; public ES `/es/link-compartible`, EN `/shareable-link`.
- Original ES, EN and stub are preserved in `originals/shareable-link/`; SHA-256 ES `bf1ea20429a12d3f97f675a8e3d95fc6cf8717a5a7267bf4702bd4e523339419`, EN `a29c2c7a79c678e5778f72ee9014590c93617cec5a5f1e28500c3f82cae75e1d`, stub `c201a387a786a62b68683db28204045f3554b5faf1f11e1ad80ca948182ccb1a`.
- Main remains `pending`. This branch records `visual_pending`; these text corrections are not a publication claim.

## Source audit and coverage plan

The current Rails `Captures::SocialMediaLinksController` offers SMS and conditionally WhatsApp, renders the number/message step through the shared QR form, creates a `SocialMediaLink` and `Capture`, then redirects to `Captures::SocialMediaLink::CouponAssignmentController`. The assignment view lists playbooks with a subscription trigger; it does not create a welcome message by default. `Capture::ValidateParams` requires a selected playbook and a message with an attached coupon when a coupon is selected. `SocialMediaLink#clicked` records a subscription only after the inbound message is processed. The original claim of an automatic welcome message was therefore corrected in both languages. The original claim that the WhatsApp number selector exclusively lists WABA numbers was narrowed because the shared form lists the business's active phone-number channels; the final destination must be verified for the configured technology.

| Section | Distinct reader task | Visual decision |
| --- | --- | --- |
| What the link does | Understand opt-in requires the customer to send the prepared message. | Conceptual behavior; a phone's external SMS/WhatsApp UI would not prove the Hellotext setup and no message is sent for documentation. |
| Find the capture | Recognize the Shareable Link catalog card. | Reuse approved localized `capture-overview/desktop-link` sources; do not upload duplicates. |
| Choose SMS or WhatsApp | Recognize the conditional choice and disabled WhatsApp state in the fictional account. | New native ES/EN desktop and narrow-screen sources from the safe type chooser. |
| Number and message | Recognize the default destination control, unsent opt-in text and preview. | New native ES/EN sources; confirm the app route and preview agree, and do not save merely to photograph this step. |
| Optional follow-up | Recognize coupon and compatible subscription-triggered playbook selectors. | New native ES/EN sources from a disabled fictional Shareable Link with a valid fictional coupon and draft playbook, if the isolated fixture passes safety guards. Do not show an empty selector. |
| Copy the result | Recognize the generated link and Copy control. | New native ES/EN final view from the same disabled fixture, without clicking the link, downloading or sending a message. |
| Instagram | Explain where to paste the link. | This is external Instagram UI, not a Hellotext control; the copied-link result is the relevant Hellotext state. No screenshot of a personal Instagram account. |
| Related guides | Navigate to detail. | Links only; no distinct control. |

## Pending capture and verification

Use only the guarded local clone `hellotext_editorial_workload_20260928`, business 5, fictional account `design-system@example.test`, with no messageable contacts. Before making any fixture, recheck the exact DB, account, existing Shareable Links, channel, coupon, playbook and message/contact counts. The QR guide's coupon and draft subscription playbook can be reused only if their identities and inactive states still match its recorded provenance. Do not rerun its fixture. A new Shareable Link must remain disabled, its destination must be a reserved fictional number, and no message, test or subscription may be sent. Restore account locale to ES after EN captures. Record exact routes, viewport, logical crop, source pixels, DPR, color profile and hashes for each source. Do not mark local_verified or open a PR until the complete bilingual guide, all useful figures, desktop/mobile rendering, production build and security headers pass.
