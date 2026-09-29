# Messaging channels overview

## Source and scope

- Pair: `numbers/messaging-overview.md`; Spanish `/es/resumen-canales-mensajeria`, English `/messaging-channels-overview`.
- Original bodies and unchanged guide stub: `originals/messaging-overview/`. SHA-256: ES `30a6a94b63bdd70eb797640967b47ec86afa4bba6e16376c60bf688723d8f074`, EN `a2c60cf640cd9d681464b793219527396df34f330d7d7906b4823bc5708a84ac`, stub `982899211083642362e27f64d071d1c01dfd898db8c6f8680c0e42322f3fdaf9`.
- The inventory records both pages as published; preserve title, description, slugs, redirects, links, locales and publication state.
- Start from `origin/main` after checking `progress.csv` and open Help PRs. Edit Spanish first, then adapt English.

## Reader task and section plan

The reader chooses a usable channel, understands its sender requirements and checks that a first interaction can be delivered. Keep this as an orientation guide, not a substitute for the linked setup guides.

| Section | Correction | Figure decision |
| --- | --- | --- |
| Choose your first channel | State the current Colombia/Uruguay availability for Mercado Libre and distinguish eligible order conversations from campaign delivery. Clarify the campaign creator's WhatsApp, SMS and conditionally enabled Email choices; social channels begin with a customer interaction. | One screenshot would show only one channel's account state and misrepresent the cross-channel choice. The linked channel guides own their respective interface steps. |
| SMS sender options | Retain the distinction between an approved sender and an exclusive short code, conditional on country and account. | Sender availability is account-specific; one demonstration screen would not establish which sender the reader can use. The linked short-code guide owns the setup details. |
| Before launch | Replace the universal sender/inbound/outbound test with a conditional checklist for SMS/WhatsApp, social conversations, Push subscriptions, and order-linked Mercado Libre messages. Keep consent and reply routing checks relevant to the selected channel. | This is a cross-channel verification checklist, not one screen or control. A screenshot would hide important eligibility differences. |
| Related setup | Add the Push setup link needed by the conditional checklist. | Navigation links do not require a figure. |

No customer-facing example is taught here, so a message preview would be decorative.

## Evidence

- Current Rails `app/models/mercadolibre.rb` limits operation to country codes `CO` and `UY`, and `app/models/integration/category/ecommerce.rb` gates the integration card accordingly. Public [Hellotext integrations](https://www.hellotext.com/ec/integrations) and the bilingual Help [Mercado Libre guide](https://help.hellotext.com/connect-mercado-libre) agree.
- The current Rails `Technology::Selection`, campaign technology wizard, audience controller and campaign delivery engine show WhatsApp, SMS and Email options. The Email card itself is visible before eligibility checks; actual sending requires channel access and an active verified sender. The linked Email fundamentals guide also had stale blanket exclusions for Email campaigns, routes and proactive playbooks. A narrow bilingual correction is in `docs/editorial-work/email-channel-availability-errata.md`; that guide's full visual review remains pending. Help Instagram DM and Facebook Messenger fundamentals document customer-initiated social conversations, not campaign delivery.
- The current Help Push setup guide requires a device subscription and a support-arranged test notification. The Mercado Libre guide requires an eligible order/conversation rather than an arbitrary outbound test.
- The current Help consent and subscriber status guide separates marketing consent from destination reachability.
- PR #205 review identified linked contradictions in the Campaigns overview, Create a campaign, and Campaign best practices pairs: they omitted Email-only delivery or instructed every test to a phone number. Narrow bilingual corrections and preserved originals are recorded in `docs/editorial-work/campaign-email-availability-errata.md`; those campaign pairs remain `pending` for their own complete visual reviews.

## Verification and publication

- Content commit `e04f9413` preserves the bilingual article edit and narrow Email fundamentals errata after rebasing on `origin/main`.
- `yarn build` passed after the rebase; Jekyll and the security-header validation completed successfully.
- Reviewed both complete Messaging overview pages and both affected Email fundamentals pages in the local browser at 1280 CSS px desktop and 390 CSS px mobile. The headings, corrected passages, navigation and footer rendered, and none of the four pages overflowed horizontally. The Spanish and English Email availability sections remained legible on mobile. Rechecked all four pages at both widths after the rebase.
- `git diff --check` passed before committing; the Messaging overview row is `local_verified`. Email fundamentals remains `pending` for its own full review.
- Pending: PR checks and review, merge commit, main build, normal Netlify deployment and public ES/EN verification.
