# How Hellotext works editorial batch

## Source and current state

- Article key: `getting-started/how-hellotext-works.md`; the published routes are `https://help.hellotext.com/es/como-funciona-hellotext` and `https://help.hellotext.com/how-hellotext-works`.
- `inventory.csv` classifies the Spanish and English pair as published originals, and `progress.csv` records it as `pending` before this batch.
- The complete pre-edit Spanish and English bodies and shared stub are preserved byte for byte under `originals/how-hellotext-works/`. Their SHA-256 values are Spanish `9fadb719280692315a26ab277ceb22c8e7e8b1669270ee4e5479804fae219c0c`, English `58e3f667107aafa305b23e4c87ce71aa2868567f9251cc90bc3fd7540ce0a838`, and stub `5273dccae7b0af88d8d7efedc40789a44cad636ec26fbeeabf62ab450099ffab`. The body values match `inventory.csv`.
- This batch starts from `origin/main` at `b79f27c51bf942ffce4ea0afa2a417d286f290ed` on `codex/how-hellotext-works-guide`. Keep the shared stub, titles, descriptions, slugs, language pair, links, `popular: true`, and publication state unchanged.

## Reader task and specific plan

The reader chooses between an ongoing mission or route, a planned campaign, a capture, and a teammate conversation in Inbox before building a workflow. The decision is conceptual; it does not require the reader to reproduce an application screen.

1. Correct the basic sequence so a planned campaign begins with a team decision, while missions and routes can react to customer signals. Keep the distinction in the existing campaigns section and decision table.
2. Qualify the final reporting step. The published Sales attribution guide explains that a recorded order or click does not automatically become Hellotext-attributed revenue; customer or order context, eligible source evidence, source precedence and the applicable window determine attribution. Link that guide from the corrected sentence.
3. Qualify the capture-to-welcome example. A capture can record a subscription event, but the welcome route must be configured and active and its conditions must pass before it starts. Rails `db/seeds/playbooks.rb` defines the welcome route template with a subscription trigger in disabled state; `app/models/form_submission/trackable.rb` and `app/models/popup_submission/process.rb` show capture-related subscription events.
4. Write the Spanish correction first, then adapt the English equivalent. Re-read both complete articles and the shared stub immediately before saving. Preserve the existing H2 sequence, all current links and their order, and all front matter.

## Section-level visual decision

| Article section | Reader question | Visual decision |
| --- | --- | --- |
| The basic model | How can a signal-driven workflow and a planned campaign begin? | The corrected five-step text states the two paths; a single application screen would represent only one. |
| Playbooks for repeatable missions | Which recurring goal, route, agent or capture fits? | The use-case list and links to specific guides carry the choice; no common screen can show all types faithfully. The existing **Playbooks/Misiones → Explore/Explorar → Captures/Capturas** path names the only simple navigation point. |
| Planned campaigns | When is a one-time send appropriate? | The examples and timing rule answer the decision, not a campaign editor view. |
| Inbox conversations | When should a teammate handle the conversation? | This explains ownership and judgment, not an unfamiliar control; the Inbox guide covers its interface. |
| How they work together | How can the tools pass work between them? | The cross-tool examples describe distinct contexts; one screenshot would be incomplete and potentially misleading. |
| Quick decision guide | Which tool matches each need? | The existing accessible Markdown comparison table is the direct answer. |
| Questions before you build | What should be decided before setup? | This is a planning checklist with no application state to capture. |
| Related guides | Where to continue? | Existing localized article links provide the navigation. |

No screenshot, message preview or decorative figure is planned. This section-by-section decision follows the shared editorial guide's requirement that each visual answer a specific reader question rather than meet an image count.

## Verification and publication checkpoint

- Complete Spanish and English source review: the original eight H2 headings and nineteen existing article links remain in order in each language; the new twentieth link resolves to the localized Sales attribution guide. The shared stub is byte-identical to its saved original.
- `yarn build` completed successfully with Jekyll output for both languages and the repository security-header verification. The generated pages are `_site/es/como-funciona-hellotext.html` and `_site/how-hellotext-works.html`.
- The local Help preview at `http://127.0.0.1:8765` returned HTTP 200 for both generated pages. At the desktop viewport, both complete articles rendered with their correct title, headings, decision table, related links, and localized attribution link; neither page overflowed horizontally at the observed 1253 px width.
- Independent mobile Help preview review passed for Spanish and English at an actual 390 px viewport: body scroll width was 390 px, article and table width 358 px, and there was no horizontal overflow or clipped label. The reviewer inspected each page's opening, corrected basic model and capture example, decision table, related links, and feedback area; the temporary viewport override was reset afterward.
- The content, exact originals, and this work record were committed as `dd237037fa7387704e78bdd917481d3ec27b7ab8` (`Clarify Hellotext workflow and attribution guide`). The focused staged diff and `git diff --check` were clean.
- Local editorial verification is complete. The separate ledger commit records `local_verified` against the content commit above. Push, PR, merge, Netlify deployment, and public verification are separate later steps and are not implied by local work.
