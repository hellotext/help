# Campaign overview Email availability linked errata

## Scope and originals

- The bilingual `campaigns/campaigns-overview.md`, `campaigns/creating-a-campaign.md`, and `campaigns/campaign-best-practices.md` pairs remain `pending` for their own complete editorial and visual reviews. These narrow corrections resolve contradictions found while reviewing Messaging channels overview PR #205; they do not close those rows.
- Original bodies are preserved at `originals/campaign-email-availability-errata/`. SHA-256 for Campaigns overview: ES `efa272ed0d1ca3edda8699034d90d5b1fa83c3ae2ff0e32c9d72e3c13f68520c`, EN `454f31812755ab2c41739ca9031ee56f0cf5b71ed9fc6dd40d4920c1f1bc4f5e`. Create a campaign: ES `46f5b2cd0daf0b8ee007174beb4b739941bd4bcf026d8e2329a7c86787e987c3`, EN `19adb6ec90264877c75644386875e67042806262d82086db7b7b3c2b2efdf34e`. Campaign best practices: ES `6c6129f5e8b14a2857e6d9ae3a7cdb9f1a5e7bd157a3c377c62963a2d5371e53`, EN `b05f19d49b164c65c723208314059e8ac4794e7484ab86863ac612950f9d2345`.
- Preserve titles, routes, links and publication state. Correct only channel availability, the Email-only option and test destination, and estimated-reach wording.

## Evidence and figure decision

- The current Rails campaign wizard renders SMS, WhatsApp and Email choices. Email only is separate from WhatsApp with optional SMS fallback. The delivery path checks business/channel eligibility; Email also needs a verified, active sender. The campaign guides formerly excluded Email outright or instructed every test to a phone number. `Campaign::TestsController` and the Email preview render an email-address test action.
- Rails estimates Email reach from profile subscription state and a usable Email address; it does not establish marketing consent. The corrected overview and best-practices text separates the estimate from the instruction to verify permission.
- These corrections state conditional availability and test destination. A screenshot of one account's channel choices would not establish access for other businesses. The Create a campaign pair has a full interface workflow and still needs its own section-by-section figure review; all three pairs remain pending.

## Verification

`yarn build` and the security-header validation passed. All six complete edited pages were reviewed in the local browser at 1280 CSS px desktop and 390 CSS px mobile; corrected passages and headings rendered without horizontal overflow. The English option list and test guidance were also inspected visually at mobile width. `git diff --check` passed. Pending: re-run PR checks and review, merge, and public verification. The public pages remain unchanged until PR #205 merges.
