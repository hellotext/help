# Meta fees for WhatsApp bilingual editorial batch

## Starting state and plan — 2026-09-28

- Article key: `billing/whatsapp-fees.md`; published English `/whatsapp-fees` and Spanish `/es/tarifas-meta-whatsapp`. `progress.csv` is `pending` on `origin/main` `a756b2319b7f1a495fc278dc4d3f9f43af1ec672`. Work on `codex/whatsapp-fees-guide`.
- The complete original Spanish and English bodies and shared stub are saved byte for byte in `originals/whatsapp-fees/`. SHA-256: Spanish `9d535a0509c2f966379b58cdfc1449803169edf235e915646f2af9a20e2a2f0d`, English `5bb7a5cb14f2df663184e50be30d483d66061cb903e556576890bf9ce54eb5e3`, stub `d3904725449d9e41bf4a0543fc36f8bb724497d552c2305104f779c5d09e5b97`.
- Reader task: distinguish direct Meta charges from Hellotext charges and estimate both with current rules. Preserve titles, slugs, links, locales and published state. Edit Spanish first and adapt English.
- Clarify that Meta prices delivered messages by recipient market and category, with free cases and volume tiers governed by its live rules. Limit Hellotext's highest-only comparison to standard monthly plans; prepaid and fixed agreements can differ. Do not freeze a rate or imply every WhatsApp message incurs a Meta fee.

## Section-level visual decision

| Section | Reader question | Screenshot decision |
| --- | --- | --- |
| Two cost layers | Who bills each charge? | This is a commercial boundary; a single account view would show only one account's private billing details. |
| What Meta controls | Which delivered messages incur a charge? | Meta's live rate card and exceptions vary by market and category. Link the authoritative current table; a fixed screenshot would stale quickly. |
| What Hellotext controls | When does non-SMS volume affect the monthly Hellotext amount? | Explain the standard comparison and agreement exceptions. A screenshot of one bill cannot establish the general rule. |
| Estimation checklist | What inputs should I gather? | The list spans Meta and Hellotext accounts and multiple destination markets; no one product screen covers both. |
| Questions and related guides | What are the common billing boundaries and next tasks? | Answers and navigation links are sufficient; Billing UI instructions belong to the linked dedicated guide. |

No new screenshot answers a distinct interface question in this conceptual article. Preserve the separate visual debt in task-based guides. Verify the complete built ES/EN pages in desktop and mobile, links, metadata, readability and overflow. Run build and relevant checks, record local verifier commit, then record PR, merge, normal deploy and public pages separately.

## Source checkpoints

- The [current official Meta pricing page](https://whatsappbusiness.com/products/platform-pricing/) says Meta charges per **delivered** message, based on recipient market and category. It currently lists uncharged service messages, utility responses and 72-hour ad/Page entry points, plus utility/authentication volume tiers. These are current rules, not fixed rates or permanent promises.
- The [current Hellotext pricing page](https://www.hellotext.com/pricing) separates Meta rates from Hellotext charges. The published [Pricing model](https://help.hellotext.com/how-pricing-works) qualifies the highest-only monthly comparison for standard plans and notes prepaid/fixed-plan exceptions.
- No account, native Chrome window, or screenshot helper is needed for this policy explanation. The outstanding native-capture blocker for other articles is unchanged; do not retry that rejected helper for this batch.

## Local verification — 2026-09-28

- Re-read the full Spanish and English source bodies and shared stub before editing. Both locales now distinguish delivered from sent messages, give the current Meta free cases and possible volume tiers without freezing a price, and qualify Hellotext's monthly comparison for prepaid and fixed-plan agreements. The two-language factual review identified a subtle 72-hour trigger: the customer must **send a message** from the ad or Page button, not merely open the chat; this was corrected in both bodies before verification. Existing titles, slugs, all original links, language metadata and published state remain unchanged.
- The production bilingual `yarn build` passed with the repository's Ruby 3.3.6 and installed bundle; `script/verify_security_headers.rb` passed as part of it. The generated site excludes `docs/editorial-work/whatsapp-fees.md`. No figure or image asset was added for the section-specific reasons above.
- Inspected the complete built Spanish and English articles in the local browser at desktop 1280 CSS px and mobile 390×844 CSS px. The title, all five sections, list, highlighted billing boundary, related links, reading index and feedback/footer rendered in both languages. At 390 px the main column was 358 CSS px, visual viewport scale was 1, and document scroll width matched the viewport; at desktop there was no horizontal overflow. Mobile viewport screenshots of the opening, middle and lower sections showed readable text without clipping. The browser review did not produce a publishable screenshot asset.
- `git diff --check` passed. Content and original snapshots are in `dac57685e099e398621344871dd64628dcfcdbae`; `progress.csv` records that commit as locally verified. Publication remains pending until PR, checks, merge, normal Netlify deploy and public-page verification.

## Public verification

Pending.
