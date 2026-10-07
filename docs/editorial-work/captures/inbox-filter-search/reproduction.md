# Reproduction scope and dependencies

This archive records captures from application revision `6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31`. It requires an already prepared, owned fictional dataset. It is not a standalone seed or a recipe for connecting to an existing business. No helper reads or writes the original application checkout. The 4,473 UI files listed in `source-ui-hashes.json` matched the immutable application revision.

The accepted source files are twelve PNGs in `images/editorial/inbox-filter-search` and eight in `images/editorial/inbox-overview`. Their manifests record exact hashes, crops, native dimensions and provenance. Repeating a session need not produce byte-identical timestamps or ordering; validate the new saved pixels independently.

## Owned runtime prerequisites

| Component | Capture-session dependency |
| --- | --- |
| Rails | An isolated source snapshot; Ruby 4.0.6 and its locked gems |
| Frontend | Node 24.11.1, Yarn 4.9.2 and the application's locked dependencies |
| Database | Local PostgreSQL database `hellotext_help_inbox_task8_20261007`, prepared with only fictional records |
| Jobs | Dedicated loopback Redis `127.0.0.1:6418/0`; no Sidekiq or other workers |
| App/assets | Rails on `127.0.0.1:3298`; Vite on `127.0.0.1:3098` |
| Capture | Dedicated headless Chrome on loopback CDP port 9489, Node `ws`, macOS `lsof` and `sips` |
| Help review | Built Help on loopback port 4298; separate Chrome CDP 9488; Python 3 standard library |

`browser.mjs` intentionally pins the capture profile to `/Users/pel/Documents/Codex/2026-10-06/task-8/current-app-capture/chrome`. `review-browser.mjs` pins the separate review profile to `/private/tmp/hellotext-inbox-help-review-20261007`. Neither browser may be replaced by a personal browsing session. These session-specific paths are not portable defaults. The parameterized `capture.mjs` is available for another explicitly owned session after equivalent provenance checks.

The private database snapshot, private environment JSON, login password/session, browser profiles, installed dependencies and original startup commands are deliberately excluded. Do not obtain these from real accounts or a shared development environment. This archive alone cannot reconstruct the baseline database.

## Dataset contract

The baseline had business 5, 132 non-messageable contacts, nine users with `example.test` email addresses, 53 messages, and no integrations or authorization tokens. The scripts depend on these existing records:

| Record | Required fictional identity |
| --- | --- |
| User 1 | `design-system@example.test`, display name Sofía Castro |
| User 2 | Lucía Méndez |
| Conversation/contact 11 | Emma Vargas, assigned to user 1 |
| Conversation/contact 12 | Benjamín López, assigned to user 2 |
| Conversation/contact 13 | Isabella Ruiz, unassigned |
| Business label 5 | Prioridad |
| Messages 57, 58, 59 | Existing delivery-error examples, each still in `error` state |

`prepare_inbox_fixture.rb` updates these local conversations and labels. It does not create the baseline, owner display name, teammate or login. `../inbox-overview/prepare_overview_fixture.rb` then creates two incoming fictional messages and one internal note; it rejects a repeated run once its fixture marker exists. `../inbox-overview/localize_overview_fixture.rb` changes only the marked sample bodies and the fictional owner's locale. Its expected final count is 55 messages. No outgoing message, customer endpoint or connected channel is required. Rendered webchat bubbles demonstrate conversation history, not a verified channel connection.

## Bootstrap boundary

Place the archived `verify_safety.rb` in the owned Rails snapshot's `tmp/` directory: the fixture scripts load that location. Place `help_editorial_batch.rb` only in that snapshot's `config/initializers/`. The overview scripts share this guard; they are not independent of the filter-capture folder.

The archived `with-editorial-env.py` belongs in the same Rails `tmp/` directory. It preserves only a small operating-system environment allowlist, then requires the private `tmp/editorial-batch-env.json`. Before executing any command it checks `RAILS_ENV=development`, `HELP_EDITORIAL_BATCH=task8-inbox-20261007`, the exact database/Redis values above and the initializer's presence. The archived launcher adds these early checks to the original session launcher; it contains no credential values. Its private JSON must supply only fictional/dummy application keys and owned paths. Review that file separately: the launcher cannot prove that arbitrary supplied values are harmless. Never source credentials or configuration from the original checkout.

The initializer selects the Active Job test adapter, disables mail deliveries and uses local storage. Fixture callbacks can still enqueue direct Sidekiq jobs; the test adapter is not a substitute for a separate zero-worker check. Run the guard before and after fixture changes, verify all three error-example IDs exist, verify all provider connections are absent, inspect the two new messages' nil origin/destination/channel/provider/source IDs, and verify the dedicated Redis has zero worker processes. The existing guard checks selected reserved phone numbers and error states, but does not by itself prove the entire dataset's provenance. Local conversation viewing can update sightings.

## Captures and review

Use genuine native Chrome Display P3 output (`--force-color-profile=display-p3-d65`) and a dedicated profile. Keep the requested viewport, native UI actions and capture in one CDP invocation: metrics can reset after the connection closes. Source captures use DPR 2 and clip scale 2, yielding 4× PNGs. Do not repair the UI or attach a color profile afterward. The helper's expression argument is trusted local automation code, not an untrusted-input sandbox.

Desktop filter captures explicitly selected Open, Sofía and Lucía; label captures also selected Prioridad. On mobile, opening the real Inbox list clears the query string while the rendered controls retain their selections. These images locate the search field and show a pre-search queue. They do not demonstrate a typed matching search or guarantee the next search's scope. Actual search returned HTTP 500 because local Elasticsearch was absent; that limitation remains open. The development-only My unread item is outside the accepted crops.

The archive's `browser.mjs` metadata was corrected after capture: `captureScale`, `clip`, `pixelSize` and `nativeDensity` now derive from actual compositor parameters and PNG dimensions. Full/tile captures at DPR 2 report 2× instead of the former hardcoded 4×. All twenty accepted editorial PNGs used 4× clips; none was changed by this correction.

Both `review-guide.py` files use the shared `review-browser.mjs`; the overview reference resolves through `../inbox-filter-search/`. Review expects a completed Help build and both locales, at 1440, 580 and 390 CSS pixels. `verify-build.py` resolves the Help root relative to its own location and checks that source PNGs survive both locale builds unchanged. Keep those relative folder relationships. Runtime metadata and DOM assertions supplement, rather than replace, inspection of every source image and complete built article.
