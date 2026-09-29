# QR Code Subscriber

- Pair: `captures/qr-codes.md`; public ES `/es/codigos-qr`, EN `/qr-codes`.
- Base: `origin/main` `4bd95a3931f8110f70da7274e261b923e4b2ff41`; this branch remains `visual_pending` and must not be pushed or published yet.
- Original ES, EN and stub are preserved in `originals/qr-codes/`; SHA-256 ES `cba3c36db7a03201f06154647ed96fb9804811af1785b507382ffdfd641e2e1a`, EN snapshot `21b71210574ebe9cbe599a6cb5163f749dfca832f666db67da4327337726c7f4`, stub `c4a2559a4348a254b300eb55da9031c3422b1e220cedd2c3153160c35608021f`. The EN snapshot normalizes inherited trailing spaces solely for `git diff --check`; the raw source SHA in `origin/main` is `9d82e62136d4fc0c9318706f81e3e81c0faab337bb8987632e8fc89257c12815`. Titles, slugs, links, languages and publication state are preserved; only the outdated SMS-only descriptions were corrected.

## Source audit and section coverage

Rails `JourneysHelper#playbook_catalog_categories` contains `qr_code_subscriber` in the singular Capture group. `Captures::QRCodesController#new` first renders a choice of SMS or WhatsApp. WhatsApp is disabled when the business has not enabled it. The QR code generator uses `SMSTO:` for SMS or a `wa.me` URL for WhatsApp; both include the configured message and a unique reference. `QRCode#scanned` registers a subscription only when an inbound message is processed. The old SMS-only prose and implication that scanning alone subscribes someone were corrected in both languages.

The number/message form uses a channel selector and text preview. The default SMS destination is found from compatible available channels. `Capture::Create` creates a capture without a journey or coupon; the original guide's promised automatic welcome message was therefore false. After saving, the user can assign a compatible subscription-triggered playbook and, when its message supports a coupon, a coupon. Skipping that assignment leaves no automatic welcome follow-up. The guide now says so in ES and EN.

| Section | Visual decision |
| --- | --- |
| Examples and how scanning works | Conceptual placements and the customer's send decision; the type chooser below identifies the SMS/WhatsApp distinction. A phone's own SMS UI would not verify Hellotext configuration, and no message is sent for documentation. |
| Find and name the capture | Reuse the approved ES/EN QR catalog cards from Capture tools overview. No duplicate source PNGs. |
| Select SMS or WhatsApp | New native ES/EN desktop and mobile figures show the actual choice, including WhatsApp disabled in this fictional account. |
| Number and opt-in message | New native ES/EN desktop and narrow-screen figures show the default control and an unsent fictitious draft. The 450 CSS px narrow source keeps the complete default label visible; the 390 CSS px version truncated it in the app. |
| Assign follow-up | **Visual debt:** this is a distinct step. The legacy read-only `/hellotext/capture/qr-code/text` route throws `NoMethodError` for `business_qrcodes_path`; the current flow reaches the assignment screen only after creating a QR capture. Prepare a guarded inactive fixture in the isolated clone before capture, or leave this pair pending. Do not show an invented welcome state. |
| Download and test | **Visual debt:** the final QR/SVG screen is a distinct result. It needs a real inactive fixture with a coherent destination and reference. Never scan or send a real opt-in for a figure, and never capture a placeholder or broken QR. |
| Related links | Navigation only; no figure. |

## Local capture evidence

The preflight identified DB `hellotext_editorial_workload_20260928`, business 5, fictional `design-system@example.test`, 127 contacts, zero messageable and zero subscribed contacts, and zero existing QR captures. There are also zero coupons and zero journeys with a subscription trigger; a screenshot of the follow-up selector now would be mostly empty and would not explain the choice. The demo owner locale was changed ES→EN→ES under exact DB/account/contact guards and restored to Spanish. The dedicated headless Chrome profile `/private/tmp/hellotext-qr-guide-headless-9447` held one loopback tab at `127.0.0.1:3191`. Each source was captured from its actual local route with exact title, locale, fictional account, visible control, viewport, zoom 1 and DPR 2 checks. Eight approved PNGs are native Display P3 at 2× and are byte-identical to the local Help assets; exact URLs, clips, dimensions and hashes are in `captures/qr-codes/capture-provenance.json`. The debug overlay was outside every final crop. No QR capture was created, activated, scanned or sent. The unsaved message drafts contain no real contact data.

The current article has three figures per language: one reused catalog image plus the new type and message figures. Both final-step figures are still owed. Do not set `local_verified`, push, or open a PR until those views are captured and the complete ES/EN pages pass desktop/mobile review and build. The `NoMethodError` came from a stale GET route; it was not used as a screenshot and is not a reason to fake a final state.

The production-mode Jekyll build and security-header check passed after the bilingual draft and metadata correction. The eight new source, Help asset, and built PNGs matched byte for byte; `sips` identified Display P3 for all eight sources. This is an intermediate build only: complete-page desktop/mobile review and publication checks remain outstanding with the two missing figure concepts.
