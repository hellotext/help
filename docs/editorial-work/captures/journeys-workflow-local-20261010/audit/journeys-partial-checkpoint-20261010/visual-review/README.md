# Partial Journeys rendered-page review

Status: partial checkpoint reviewed; desktop figure legibility still requires native recapture. Neither guide is complete or publication-ready.

Four pages (ES/EN getting started and custom journey) were reviewed at 1440, 580 and 390 CSS pixels. The 30 unchanged compositor outputs comprise 12 full pages and 18 figure details, all native 2× Display P3 PNGs. See [capture metadata](capture-receipt.json), [pixel findings](pixel-review.json), [independent review](independent-review.json), [post-review byte checks](post-review-integrity.json) and [process cleanup](cleanup.json).

Article layout, static figures, native-size limits, separate stage/frame insets, borders and absence of horizontal overflow pass. Desktop sources shrink from 1600 to 698.4 CSS pixels, making instructional detail too small. Replace them later with tighter genuine captures around the relevant cards or trigger pane and context, preserving the original twelve PNGs. Do not add image-opening controls or enlarge beyond native size. Mobile sources are more readable; the Spanish AI-title ribbon and the selector's internally clipped final row remain genuine source limitations.

The existing selector image shows opening a list before selecting or confirming. Configuration, saved/reloaded draft and activation/deactivation coverage remains pending. The production build with ten approved copy corrections and twelve original sources remains unchanged. No new app screenshot, Save/Publish action, inventory closure or publication occurred.

Only a new server on 127.0.0.1:4306 and a dedicated headless Chrome on 127.0.0.1:9494 were used. They were stopped; both listener ports and owned PIDs were checked absent. External browser requests were blocked. Review data stays under the already excluded docs directory.
