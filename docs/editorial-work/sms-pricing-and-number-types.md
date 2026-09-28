# SMS pricing and sender types editorial batch

## Source and plan

- Article key: `billing/sms-pricing-and-number-types.md`; published routes `/sms-pricing-and-number-types` and `/es/precios-sms-tipos-remitente`. `progress.csv` is `pending` on `origin/main` `dd4dabb923f9e80787c27e46633bca74409da0d3`. This batch uses `codex/sms-pricing-and-sender-types-guide`.
- Complete original Spanish, English and shared stub sources were saved byte for byte in `originals/sms-pricing-and-sender-types/`. SHA-256: Spanish `255e5058155f60cf4a56739e95674bc171f7d58f6a32285b916dad23b770a711`, English `95479c0f95fd0b4ad234e41df3a6cbc68a4f570d58cc9317ba75ab995ac5f6cd`, stub `ffdb04a0a6f693718f34d1e5477eca7b11b949d1a67ca9ac61a7da03d2810f41`.
- Preserve titles, slugs, all existing links, locales, topic and published state. Adjust only the descriptions' allowance wording to match the corrected article. Edit Spanish first and adapt English. Explain how SMS parts affect estimated use, how the rounded displayed SMS equivalent relates to the highest-amount comparison, and where country/account-specific prices and sender availability must be checked. Avoid hard-coded rates.

## Section-level visual decision

| Section | Reader question | Decision |
| --- | --- | --- |
| Opening and public pricing page | Where can I find the current country rate? | Direct link and country-selection instruction. A static price capture would become stale and show only one market. |
| Monthly comparison | When does SMS determine the Hellotext amount? | Conceptual billing rule across four amounts; a snapshot of one business's invoice cannot explain the rule. |
| Displayed SMS equivalent and additional use | What does the rounded “up to” quantity mean? | Explain the plan-floor comparison and SMS parts in prose; a single country's price card cannot show personalization or all agreements. |
| Approved senders and short codes | Which sender can my business use? | Availability and provisioning depend on market and account, with no representative shared application state. |
| Campaign estimate checklist | What must I check before sending? | Planning list spanning country, parts and sender. The editor's part estimator belongs in the SMS channel guide; a message mockup would not prove the cost. |
| Related guides | Where can I read the underlying tasks? | Navigation only. |

This is a billing and sender-choice explanation, not an interface walkthrough. No native capture or illustrative customer message currently answers a distinct question in this article. The separate visual debt in task-based guides remains open.

## Source checkpoints

- The [current Hellotext pricing page](https://www.hellotext.com/pricing) states that the main monthly Hellotext charge is the highest of plan minimum, performance fee, SMS cost and variable non-SMS messaging. Country-specific pricing pages show different SMS rates and rounded displayed SMS equivalents; checked 2026-09-28. This article will not freeze those values.
- Rails `origin/master` `2da94c3082f123e77446be99f16b44501a272884`: `app/models/products/package.rb` calculates the public “up to” SMS count from plan price divided by the country SMS price and rounds the marketing count. `app/models/quota/transaction.rb` counts encoded SMS parts; `app/models/quota/biller.rb` applies the account-specific feature price. `app/models/invoice.rb` chooses the highest credit-invoice quota item, with explicit prepaid and fixed-plan exceptions. Therefore the displayed count is not a separate free bucket deducted before an additive SMS overage.
- The published [SMS channel fundamentals guide](https://help.hellotext.com/sms-channel-fundamentals) already explains that message length, characters, personalization and links can produce multiple SMS parts. The current target should connect that point to estimates without duplicating its full channel walkthrough.
- `app/models/sms/channel_finder.rb` selects an active owned sender or available shared/fallback channel according to account and destination. Current public pricing lists an exclusive short code under Enterprise subject to market availability. The linked `numbers/exclusive-short-codes.md` still cites a legacy Scale plan and narrow country list; it remains `pending` for its own factual and visual review. Do not use those commercial terms here.
- The published `billing/how-pricing-works.md` pair uses “after allowance” wording for SMS, which could imply the same false separate bucket; its unconditional introductory rule also omits the prepaid and fixed-plan exceptions. This batch makes a narrow bilingual linked correction with separate pre-erratum snapshots and updates its existing work record, without repeating that pair's completed full review.

## Local verification — 2026-09-28

- Read both complete source bodies and the shared stub before editing. Spanish and English now explain the same standard monthly comparison, rounded SMS equivalent, per-part estimate and conditional sender availability. All original internal links, titles, slugs, locale metadata and publication state remain intact. The linked Pricing model receives the narrow SMS calculation correction documented in its own record.
- The production bilingual `yarn build` and `script/verify_security_headers.rb` passed. A final read-only audit found no factual, translation or diff-scope blocker, and `git diff --check` passed.
- Inspected the complete built Spanish and English SMS guide and Pricing model guide in the local browser at 1440×900 and 390×844. The four localized titles, section headings, content, related links and footer rendered; no broken images or horizontal overflow occurred. At 390 CSS px, each main column was 358 px wide and the visual viewport scale remained 1. The mobile pricing-model view was visually checked. No screenshot asset was created.
- The original and focused Pricing model visual decisions above still apply. The verified bilingual content and narrow linked correction are in `295ebb80`. Local verification does not imply publication; PR, normal deploy and public checks will be recorded below.
