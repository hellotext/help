# Filter/search feedback source captures

Twelve accepted compositor sources: {search,team,labels}-{es,en}-{desktop,mobile}.png. See manifest.json for every source hash, native logical cap and exact UI state.
All twelve final saved PNGs were individually inspected. Search sources: Native focused caret appears immediately after Emma. Mouse pointer is outside the crop. No DOM, image, or app-source editing was used.

Desktop logical crop 484×64 at viewport 1920×1000; mobile 414×72 at viewport430×1000. Both use browser DPR2 and compositor scale2, producing genuine4× DisplayP3. Display each image at no more than its logical width. The final article figure/typography still require root review.

The search request executes normally against the isolated local app; Elasticsearch is unavailable and matching results are not demonstrated. The screenshot intentionally includes only the real entered search field and its filter control. Never claim it shows a successful search or matching result.

Mobile reproduction: load the explicit Open+Sofía/Lucía conversation route; use the real Inbox navigation button, then Show filters → Open. This restores explicit query parameters before typing Emma. Native CDP Input inserts the text, then Left/Right resets the native caret blink before compositor capture. Input focus, value, collapsed selection at4, actual viewport, zoom1, locale/title, fictional account identity, and before/after page state are checked.

Existing isolated localize_overview_fixture.rb changed only fictional message text/note locale and demo user locale, guarded by verify_safety.rb. Verified55 messages in business5, zero deliverable contacts, enabled playbooks, active workflows, integrations, authorization tokens or connected fixture numbers; TestAdapter and disabled mail deliveries. No messages sent, assignments, settings, permissions, automation changes or external publication.

Team/Labels contextual captures are complete. Root created six additional guarded fictional contacts/conversations, without messages or deliverable endpoints; see ../feedback-context-fixture.json. The native eight-row Open+Sofía/Lucía queue now provides genuine background behind the lower menu sections.

Team captures show selected Sofía/Lucía and the Choose control in the lower portion of the real main filter dropdown. Desktop logical599×320 at1280×1200; mobile414×320 at430×1000. Labels captures show the native Choose flyout containing Prioridad, Devoluciones and Ventas. No label is applied in these screenshots: the visible queue is scoped to Open+Sofía/Lucía only. Desktop logical705×270 at1024×1200; mobile414×299 at430×1000. Saved custom label names are business data and remain Spanish in both UI locales.

The native mobile popover naturally occludes portions of background names; target menu labels and buttons are complete. Early crops clipping names at the image edge or exposing portions of unrelated warning text were rejected and recaptured with appropriate native viewport/crop geometry. Desktop height1200 moves genuine notification/unreachable-contact warnings below the crop, without changing the interface.

The development main menu exposes My unread, which production server-side rendering omits. The upper state section stays entirely outside these lower-section crops. No runtime source, DOM, CSS, environment, permissions or configuration was changed to hide it. No all-member chooser was used, so old load-test member names remain untouched.

Safety was verified before and after the batch; see safety-before-filters.log and safety-after-filters.log. Browser9489 released to root in localeEN at430×1000, with main filter and Labels chooser open, search empty, explicit Open+Sofía/Lucía query parameters.

Complete rendered Help-page readability, responsive caps and build validation remain root integration work. These source captures do not assert publication or close the executed matching-search-result gap.

Integration follow-up: root completed the production build, all48 image byte comparisons and12 responsive checks. See ../README.md and the final page-review records for the full-page pixel verdicts. The original source-stage notes above describe checks at handoff.
