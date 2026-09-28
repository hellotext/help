# Frequent questions editorial batch

## Source and plan

- Article key: `getting-started/frequent-questions.md`; public routes `/frequent-questions` and `/es/preguntas-frecuentes`. `origin/main` `e9bd650549b5df1417a632d838da4b0eb7fe8787` records this pair as `pending`. This batch uses `codex/frequent-questions-guide`.
- The complete Spanish, English and shared stub sources were copied before editing to `originals/frequent-questions/`. SHA-256: Spanish `99b672cbb60ec355e9f035bf5008c433dd317622cbc008784061b770ac26e71f`; English `b3ac9c1e27153a76534cba38c00d6e87804cd9ea9e35e2676be2f427b006ce39`; stub `d4b59064403b24eac353524fdb09ee0399257bb468ccec1ce2efda00cd565faf`.
- Keep the shared stub's titles, slugs, language pairing, published state and useful guide links. Translate the Spanish description's stray English word. Review the full Spanish FAQ first, then adapt the checked meanings into English. Re-read both sources before saving.
- Reconcile four short answers with verified source guidance: signals include data and context as well as events; profile subscription is separate from channel reachability; playbooks include defined routes and captures as well as adaptive missions; Meta prices eligible delivered WhatsApp messages under current category/market rules rather than billing every conversation. Point billing readers to the dedicated WhatsApp fees guide and the current Meta pricing page.

## Section-level visual decision

| FAQ section | Reader question | Initial decision |
| --- | --- | --- |
| What is Hellotext? | What does the product do? | Conceptual overview; linked introduction owns any interface explanation. |
| Where should I start? | In what order should I prepare? | Sequence across several product areas; no single view represents it. |
| What should I connect first? | Which data/channel setup comes first? | Routing answer; linked setup guides own controls. |
| What are signals? | What data can affect a decision? | Definition and examples; the linked signals guide explains types. |
| What channels can I use? | Which channel might be available? | Availability depends on account and country; linked channel guides show setup. |
| What is a customer profile? | What does a profile represent? | Definition; linked Audience and Customer profiles guides show the record itself. |
| How do customers subscribe? | Which capture path might fit? | Choice across several tools; their guides own distinct controls. |
| Campaign versus playbook? | Which operating model fits? | Comparison of concepts; linked guides show setup for each model. |
| First send? | How do I prepare safely? | Short checklist across audience, channel, links and replies; linked launch guide owns steps. |
| Customer replies? | Where does the team work? | Inbox routing answer; linked Inbox guides show the screen. |
| Reporting? | Which measurement guide should I read? | Links to distinct reports; one screenshot would not represent all of them. |
| Pricing? | How are Hellotext charges determined? | Billing explanation and source links, not a control state. |
| Meta fees? | Who charges for WhatsApp Business Platform messages? | Fee explanation and current source links, not a control state. |
| Failed send or report? | Where should I troubleshoot? | Triage question; linked checklist owns specific views. |
| Developer? | When does custom work help? | Scope guidance and link to the developer overview, not an interface task. |
| Support? | Where should I ask for help? | Contact guidance without a distinct interface task. |

This FAQ routes readers to detailed task guides rather than teaching a unique interface step. No screenshot or message preview is planned; recheck this decision after full rendered review. The blocked native capture work in unrelated interface guides remains separate.

## Source checkpoints

- The published `journeys/what-are-signals.md` defines signals as customer/business data and activity, including events, profile properties, channel/conversation state and business context.
- The published `audience/consent-and-subscriber-status.md` defines a subscriber as a profile with a recorded promotional subscription; validity and reachability of a destination/channel require separate checks.
- The published `getting-started/how-hellotext-works.md` includes autonomous missions, reactive AI agents, defined-step routes and capture playbooks under Playbooks. Routes follow predictable steps.
- The published launch checklist prepares the first audience before launching a playbook, route or campaign. The FAQ's ordered setup steps now name the audience and all three launch choices; the unordered source list understated the sequence. The opening avoids applying proactive revenue-allocation logic to every support agent. The Spanish copy replaces untranslated generic interface jargon while preserving the product names and exact targets of internal links.
- The published `billing/whatsapp-fees.md` says Meta determines which messages are billable and charges directly, separately from Hellotext. The [current official Meta pricing page](https://whatsappbusiness.com/products/platform-pricing/) states that charges are per delivered message and depend on recipient market and message category, with some messages free. Verified 2026-09-28.
- The linked `integrations/connect-whatsapp.md` pair remains `pending` and still uses the old conversation-cost term. Its own article review should reconcile that wording; this FAQ does not mark it verified.

## Local verification

The complete Spanish and English bodies were reviewed after editing. Both retain all 16 FAQ questions and the same publication slugs. The shared stub keeps the original titles, layout, topic, popular status and two-language pairing; only its Spanish description's untranslated term changed. Both bodies have 29 Liquid guide links (28 before the batch), adding the direct consent guide and replacing the generic billing link with the WhatsApp fees guide. The eight setup steps now render as an ordered list, with the audience prepared before the first playbook, route or campaign. All Liquid targets resolved in the build.

`PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed both languages and `script/verify_security_headers.rb`. The complete rendered FAQ was checked locally in Spanish and English at 1440 × 900 and 390 × 844 CSS px. Each version displayed all 16 questions, the localized guide links, the Meta answer and the feedback/footer sections. At desktop the article remained 810 CSS px wide; at mobile it was 358 CSS px inside the 390 CSS px viewport, with no document overflow. The ordered-list markers displayed once, and the revised answers remained readable. This browser review supplies no screenshot asset for publication.

After the review correction, the eight-step list was checked again in Spanish and English on desktop and mobile. The audience now precedes the first playbook, route or campaign; all eight markers and labels remain legible without clipping or horizontal overflow.

The source and work-record diff was checked for unrelated changes and passed `git diff --check`. The original bilingual content, snapshots and work record were committed as `e33334d5e7f5e7a24bad49f7f4922faf1ccc99fa` (`Clarify frequent questions and WhatsApp fees`). PR #191's automated review correctly found that its newly ordered campaign path omitted audience preparation; both languages were corrected before merge. Record the final verifying content commit in `progress.csv` after that focused fix passes build and browser review. This brings the local count to 31 of 153 in-scope pairs. PR, normal deployment and public route checks remain separate; local build success is not publication.
