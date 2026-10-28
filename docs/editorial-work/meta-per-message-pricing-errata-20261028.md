# Meta per-message pricing linked errata

## Scope

- Three published pairs still described Meta's WhatsApp pricing before the October 1, 2026 update: `billing/whatsapp-fees.md` (`local_verified` at `c004d2bb3ee0d8a4cca6117036413e2579042165`), `integrations/connect-whatsapp.md` (`pending`) and `numbers/whatsapp-channel-fundamentals.md` (`local_verified` at `1c50ccd00ce4fc17377e89cf270f6791351a6a56`). This narrow correction changes only their Meta pricing and sending-limit statements. It neither closes nor reopens the rows' own editorial reviews, so `progress.csv` is unchanged.
- Original ES and EN bodies were preserved at `originals/meta-per-message-pricing-errata-20261028/`. SHA-256: whatsapp-fees ES `ba69e1ad05446e02f1dc6dc4e18d18504a1b921793b0fa60712ead82fe6099de`, EN `80fae10172e2134ce8a71b5e13ec2be942ee6ca9b4c28d6481f7899d659f8254`; connect-whatsapp ES `4ac6190455ae66cff4dac4b8a7c2f8068a0a75578166fe87a73c944a163bf4ae`, EN `5ad5739c12871ad2596f1350e5d2817c164cd23de3376a7639362073d12007dc`; whatsapp-channel-fundamentals ES `9197f9d50ec875297ba7a1f08174dd3d3e2bc5f9806c339f9398eda8cc4bf6f6`, EN `9fc243593f9d7cab2132ba54d1870564ea934ce0d620394893d384c8eecc0ff0`.
- The branch `claude/meta-per-message-pricing` starts at Help main `eb114acc`. Titles, routes, headings, links, images and publication state are preserved.

## Verified correction

Sources read on 2026-10-28:

- Meta, [Pricing on the WhatsApp Business Platform](https://developers.facebook.com/documentation/business-messaging/whatsapp/pricing). The page states that it reflects pricing updates effective as of October 1, 2026. Meta has charged per delivered message since July 1, 2025. Each business phone number has a free tier of 1,000 delivered service messages per month; it applies only to service messages and does not roll over. Utility messages sent in response to users inside an open customer service window changed from free to regular pricing on October 1, 2026. Without a payment method, Meta delivers service messages only within the free tier. The free entry point applies to users who message from a Click-to-WhatsApp ad with the Android or iOS app; when the business responds inside the customer service window, the window may stay open for up to 7 days and Meta charges none of its four categories. Volume tiers apply only to utility and authentication messages.
- Meta, [Messaging limits](https://developers.facebook.com/documentation/business-messaging/whatsapp/messaging-limits). The limit counts unique users reached outside the customer service window in a moving 24-hour period and is set at the business portfolio level. New portfolios start at 250; the limit rises to 2,000 after business verification or 2,000 delivered messages with high-quality templates in 30 days, then to 10,000, 100,000 and unlimited while quality stays high and at least half of the current limit was used in the last 7 days.

Changes in both languages:

- `whatsapp-fees`: the billable categories now include service. The former sentence about free service and in-window utility replies and the 72-hour ad or Page entry point is replaced by the current service-message charge, the 1,000-message free tier, the in-window utility charge, the no-payment-method behavior and the 7-day Click-to-WhatsApp free entry point. Meta's page names only Click-to-WhatsApp ads, so the Facebook Page button was removed. The estimation checklist mentions the service free tier.
- `connect-whatsapp`: the FAQ note no longer calls Meta's charges conversation costs. The per-message answer, which said neither Hellotext nor Meta charges per message and described 72-hour conversations, now states per-delivered-message pricing and links to the Meta fees guide. The sending-limit answer now counts unique customers and gives the 2,000 step and the 7-day usage condition.
- `whatsapp-channel-fundamentals`: the pricing sentence no longer says service replies have no Meta charge.

## Visual decision and verification

- No figure was added or changed. Meta's live page owns the rates, and the two existing Meta screenshots in the Connect WhatsApp FAQ remain as published; recapturing them is outside this correction.
- `git diff --check` passed. The production `yarn build` was not run in this environment: its Linux VM has Ruby 3.0.2 and no access to rubygems.org, while the repository pins Ruby 3.3.6. Pending: production build with security-header checks, ES/EN review of the three pairs at 1280 and 390 CSS px, PR deploy preview, merge, normal Netlify deploy and public verification.
- The www pricing FAQ in the Rails repository is corrected separately on `claude/meta-per-message-pricing-faq`.
