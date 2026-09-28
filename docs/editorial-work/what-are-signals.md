# What are signals? editorial batch

## Source and state

- Article key: `journeys/what-are-signals.md`; published routes: `https://help.hellotext.com/es/que-son-las-senales` and `https://help.hellotext.com/what-are-signals`.
- `inventory.csv` records both localized bodies as published originals with HTTP 200; `progress.csv` was `pending` when this batch began. Work starts from `origin/main` `351ec3d78f75b50b959c194f87e44179c71200b3` on `codex/what-are-signals-guide`.
- The complete Spanish, English, and shared-stub originals are saved byte for byte under `originals/what-are-signals/`. Original SHA-256: Spanish `4a36763fa89215c853f63a3dd6f3722ec0a1d11bce5e42c146b0ad9a1f562d82`, English `257aeaa255d74ea86fd0ce0c00be102f77a86aa9613f0fe9abe91cc9371dc080`, stub `41acaa46fe5aeecf1de167606dd5b49d1d0961fa2138b0b990a19810c200d295`. The localized hashes match the inventory.
- Preserve both titles, descriptions, slugs, languages, nine existing links, section order, and publication state; leave the shared stub unchanged.

## Reader task and article plan

The reader needs to distinguish a recorded event from persistent profile data, understand how either can influence a configured workflow, and know why a signal need not lead to a message.

1. Clarify in Spanish, then English, that an event is a timestamped occurrence for a customer or anonymous session and strings such as `cart.abandoned` name its action type. The Rails `Track::Event` and `Track::Action` models and the Tracking events guide support that distinction.
2. Keep subscription status among the broader profile signals but separate it from editable properties. The Rails `Contact` model stores `subscription_state` separately from `profile_attributes`; the published Customer profiles guide makes the same distinction.
3. Explain with two illustrative abandoned-cart customers why a configured route can make different decisions from the same event type, depending on later purchase and channel eligibility. Do not imply a send actually occurred.
4. Clarify that a team plans a campaign and may select its audience using signals. Describe report activity and attributed revenue without claiming every interaction caused a sale; link the published Sales attribution guide.
5. Link the published bilingual Customer profiles guide at the property/event distinction because its real localized screenshots already show these two states. Do not duplicate those images here.

## Section-level visual decision

| Section | Reader question | Decision |
| --- | --- | --- |
| Opening questions | What kinds of data can be signals? | The examples define a concept across store, channel, and Inbox sources; one screen cannot show the whole category. |
| Why signals matter | How do different product areas use context? | This compares multiple products and decision types. A single UI capture would imply a common workflow that does not exist. |
| Common signal types | How are signals grouped? | The taxonomy is explanatory prose, without one matching UI control or state. |
| Signals do not always trigger a message | Why might two customers get different next steps? | The conditional two-customer example makes the distinction; a message preview would misleadingly depict a send. |
| Signals, events, and profile properties | What is an event versus stored information? | The definitions and link to the already illustrated bilingual Customer profiles guide provide the actual profile fields and activity UI. Repeating its narrow order-activity screenshot would add no distinct evidence. |
| How to make signals available | Which sources should be connected and checked? | This is a cross-system checklist. Specific setup and validation screens belong to the linked integration and verification guides. |
| Related guides | Where should the reader continue? | Localized links provide the navigation; no screenshot needed. |

No new screenshot or message preview is useful in this conceptual article. The linked Customer profiles guide already publishes three real figures per language for its specific UI task. This is a concrete section-level coverage decision, not a waiver of screenshot review for other guides.

## Verification and publication checkpoint

- Re-read both complete localized bodies and the unchanged stub. All six original H2 sections remain in order in each language; all nine original Liquid links remain, and the two new localized targets exist. The Spanish and English additions explain the same rules and example.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed, including the production Jekyll build and `script/verify_security_headers.rb`. Both generated pages contain the localized Sales attribution and Customer profiles links. `docs/` and `AGENTS.md` remain absent from `_site`.
- Independent scoped in-app browser review passed for complete ES/EN pages at 1280px desktop and an actual 390px mobile viewport. The article occupied x=336–1021 at desktop and x=16–374 on mobile. Document scroll width equaled the viewport (1280px and 390px); all six sections and the new links rendered without clipped elements or horizontal overflow. Neither page contains an image or image link. The four linked local target HTML pages responded HTTP 200.
- The initial content, originals, and this record were committed as `88dff7b0c406bb057d66f41cb5484c9cd93b1854` (`Clarify signal events and eligibility guide`) after a focused staged diff review and `git diff --cached --check`. The verifier row initially pointed to that commit; the PR correction below supersedes it.
- Local verification is complete. Push, PR, merge, production deployment, and public page checks are separate later steps; no local edit is a publication.

## PR review correction

- PR #182's automated inline review found that the event definition omitted anonymous sessions. The published bilingual Tracking events guide defines an event as an occurrence for a customer **or session**, and its Hellotext.js section describes anonymous session context. The Spanish and English definitions now include anonymous sessions.
- The production build and security-header check passed again. Both served localized HTML pages returned 200 with the corrected phrase in an ordinary paragraph, six unchanged sections and no new layout markup. A scoped IAB reconnection was unavailable for a repeat viewport check; the complete desktop/mobile browser review above passed before this three-word addition, and the corrected paragraph wraps as ordinary article text. No screenshot or interface state changed.
- The corrective content commit is `4a36f7cacf225f5de1c2ad1a4ee2611880744d2e` (`Include anonymous sessions in signal events`). The verifier row now points to that commit, which descends from the original content commit and contains the complete locally verified article.
