# Campaigns overview

## Scope and sources

- Pair: `campaigns/campaigns-overview.md`; public ES `/es/resumen-campanas-broadcasts`, EN `/campaigns-broadcasts-overview`.
- Original ES, EN and stub are preserved in `originals/campaigns-overview/`; SHA-256: ES `ea3f040bc40b4f9e7e49b1d7dcd77665c9e7e8f8837ce7bdd73db1c04ae06b47`, EN `33d3659ad62f528df571a281404adcb1cd678d863d01a3aedf164a051081426e`, stub `4fa70e1d9b45796f1ac77049d961f6389ffd1c805ec80ae679eacc564dfeac3f`. Titles, slugs, links, locale pair and published status are unchanged.
- Reader task: decide when a one-time campaign fits, recognize its lifecycle in the product, prepare the audience and channels, and find the resulting report.
- Rails source at `/private/tmp/hellotext-workload-fixed` commit `d348bd09825d62c2cf551757598ed04a4bca0ce6`: `CampaignsController#index` redirects to a campaign tab; `app/views/campaigns/index.html.erb` renders Scheduled, Delivered, Draft and Archived tabs. `Campaign::TargetsContactables#needs_review?` makes editorial review conditional, including an approved-template bypass; the former blanket assertion that larger campaigns always need review was corrected in both languages.

## Section-by-section visual coverage

| Section | Decision and reason |
| --- | --- |
| When to use a campaign | Choice of one-time campaign versus ongoing automation; no unique control or result to recognize. No figure. |
| Campaigns, playbooks and routes | Conceptual distinction; the linked guides own their respective interface. No duplicate figure. |
| Campaign lifecycle | New localized native figure of the four tabs in desktop Help. A separate 390 CSS px native close-up shows two complete, legible neighboring labels and the selected Draft tab; the text names all four. This avoids a cut-off mobile tab. |
| Prepare the essentials | Checklist of consent, audience, channel and timing decisions. Detailed audience and channel controls are in the linked Create a campaign and Campaign best practices guides, so a second capture here would duplicate those workflows. |
| Replies | The Inbox owns the one-to-one reply state. No campaign was sent to manufacture a reply; the linked guide explains that screen. |
| Automatic result | Reuse the approved Campaign reporting funnel in localized desktop/mobile versions, with no duplicate PNG. It identifies the resulting report's stages without sending a campaign. |
| Related guides | Links already route to procedures; no distinct interface state. |

## Safe capture and provenance

- Isolated Rails at `127.0.0.1:3191` uses clone `hellotext_editorial_workload_20260928`, business 5 and fictional owner `design-system@example.test`. Preflight found 127 contacts, all `unconfirmed` and `messageable=false`; no campaign was created, saved, tested, scheduled or sent. The owner's locale was guardedly switched ES→EN→ES. The dedicated headless Chrome profile used one loopback CDP tab, no personal browser windows.
- Accepted four new source/asset pairs, viewport, crop, hashes and Display P3 metadata are in `captures/campaigns-overview/capture-provenance.json`. PNGs are direct compositor crops at DPR 2, byte-copied into `images/` with no pixel editing. Rejected incomplete mobile probes were removed. Four Campaign reporting funnel assets were reused by reference, with no duplicate upload.
- The accepted native crops show no cursor, debugger overlay, private customer data, partial tab label, scrollbar or cut row. The mobile Help tab frame is capped at 205 CSS px; its 410 px narrowest source remains at least 2×. The lavender stage fills the Help column within its existing border and inset.

## Local verification

- `yarn build` passed, including security headers. Complete ES and EN article HTML was reviewed at desktop 1280 CSS px and mobile 390 CSS px. Each locale rendered two static figures in the intended sections, the correct localized responsive assets, and no horizontal page overflow (`scrollWidth=390` at mobile). The mobile tab and funnel were visually inspected in both languages; all labels and complete controls are readable. Desktop tabs and funnels were visually inspected in both languages in the local Help browser. The article does not link its figures to new windows.
- Content and four new P3 sources were committed in `a185ed50`; this following verifier commit records the local `local_verified` state in `progress.csv`. Public status remains pending until the Help PR, main build and public pages/assets are verified.

## Public verification

Pending merge and public inspection.
