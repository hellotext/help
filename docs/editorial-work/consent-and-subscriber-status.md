# Consent and subscriber status bilingual batch

## Source and current state

- Article key: `audience/consent-and-subscriber-status.md`. Public routes: `https://help.hellotext.com/es/a-quien-puedo-escribirle` and `https://help.hellotext.com/who-can-i-message`, both listed as HTTP 200 in `inventory.csv`.
- The complete Spanish and English bodies and the shared stub were preserved byte for byte under `originals/consent-and-subscriber-status/` before editing. Their SHA-256 hashes are Spanish `de63ce550874b018d2d85b5342e3b359d83f0515f5d5f32aa37de8d5cb07d64e`, English `5f2e57aeb705ea9d7821744b2ba457a88f045c91115d07fa046ef932accd0976`, and stub `385de4543ba9e1168890ea40e520507369e39329349a91bc7c98d8da5f3193a1`. The locale body hashes match the inventory.
- Each original locale body has eight second-level headings and seven Liquid article links. `progress.csv` marks this pair `pending`; every existing `local_verified` ledger commit is an ancestor of branch base `79dc450041e93d873f3958072ed8af3e9d844393`. Preserve titles, slugs, the legal-review caveat, language pairing, links, navigation placement, and publication state.

## Reader task and article-specific plan

The reader decides whether a selected audience can receive a particular promotional message on a particular channel before importing or sending. The existing three-question framework is sound but needs one short worked decision example that applies subscription state, destination availability, and channel rules together.

1. Verify the current product state and destination rules against Rails source and the linked import and go-live guides before changing any factual claim. Keep the distinction between a recorded profile subscription and proof of consent at a particular destination. Avoid presenting this guide as legal advice.
2. Immediately after **Disponibilidad no significa consentimiento** / **Reachability is not consent**, add a compact illustrative comparison: a subscribed profile with a usable destination still needs channel/sender/template checks; a subscribed profile with an opted-out or invalid destination must not be sent on that destination; an unconfirmed profile with a valid phone is not established as eligible for marketing. Do not depict any actual contact or assert that one check alone authorizes a send.
3. In the final checklist, direct the reader to use their own or authorized internal test profiles first, in line with the linked go-live checklist. Do not send any test message as part of this editorial batch.
4. Start with the complete Spanish body and adapt English. Keep the eight headings, seven Liquid links and their order, state table, metadata, and published state. No screenshot is planned: this article explains an eligibility decision, and a real interface capture would add little while risking customer identifiers. No message example is needed because it does not explain customer-facing copy.
5. Verify both complete local articles at desktop and mobile widths, build Help and security headers, inspect link targets and diff, then record the verifying content commit in `progress.csv`. Push and merge only after checks and review; record actual public verification separately.

## Checkpoint

Originals are preserved and the article bodies are unchanged. Source audit is pending before edits.
