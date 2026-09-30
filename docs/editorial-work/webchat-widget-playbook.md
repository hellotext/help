# Webchat Widget playbook

- Pair: `captures/webchat-widget-playbook.md`; public ES `/es/widget-webchat`, EN `/webchat-widget-playbook`.
- Starting main: `00af86ba3e7516a9f87650df59f21b72f36caacf`, 50 local_verified, 103 pending and one redirect out_of_scope. No Help PR open. Creating a campaign remains separately blocked; Shopify Checkout has no isolated fictional Shopify admin available.
- Complete originals are preserved in `originals/webchat-widget/`: ES SHA-256 `57422334a2e3d1b6e2c293eb4b0424ff7081887ecd7544f8495a2e421a488312`, EN `e3ed967e990ff600dce0984d6934e224687aa25ca5b97a44828fb6f23603fbf6`, stub `9ac7718b5c3790537e696fc56cc79960292c62538bee046e9e122999710afd50`.

## Source audit and section plan

Read the full ES/EN guides, stub, AGENTS, canonical skill/guide/workflow/screenshots, integration, inventory/progress and pilot. Current Rails clone `d348bd09825d62c2cf551757598ed04a4bca0ce6` exposes appearance, behavior, opening sequence, teaser, channels and installation components. Installation uses VTEX/Fenicio when connected, WooCommerce instructions and manual Hellotext.js instructions; the old automatic Shopify option is absent from the actual popover/controller. Its install endpoint activates the playbook and workflow, so it must never be clicked for documentation. Exact labels and safe GET editor states are checked before capture.

| Section | Reader question | Visual plan |
| --- | --- | --- |
| Introduction and capabilities | What does the visitor see? | The opening-sequence figure below includes a real editor preview with a coherent fictional greeting. No duplicate introductory figure or sent conversation. |
| Use cases and alternatives | Which tool fits my task? | Conceptual choice; linked guides supply their own controls, so no duplicate figure. |
| Prerequisites | What must be ready? | Checklist of installation location and team dependencies; no private integration/account page. The old unconditional domain-filter claim was narrowed to the site where the widget is installed. |
| Find/configure | Where is the widget? | Reuse approved locale-matched desktop Webchat catalog cards, without duplicates. |
| Appearance | How do brand and launcher settings relate to the preview? | Actual brand appearance controls; other appearance subsections share the same accordion pattern and are described in prose. |
| Behavior | How do automatic opening and limits combine? | Actual opening controls, delay and first-visit/session limits; no external widget activation. |
| Opening sequence | Where do I enter a useful greeting? | Actual unsaved sequence editor with complete fictional text and corresponding preview. |
| Teaser | Which switches control the small prompt? | Actual teaser switches, with the bubble enabled and custom sequence off. Opening copy is already illustrated; no duplicate teaser text or universal discount promise. |
| Channels | What distinguishes an icon from WhatsApp-only behavior? | Actual toggles and fictional number selection, without opening a provider link or sending. |
| Installation | Which method do I choose and what activates? | Actual installation methods popover; never confirm installation. |
| Testing and follow-up | What should I check after enabling? | Task checklist; no manufactured success screen, delivery, private Inbox or result report. |
| Related guides | Where do I continue? | No distinct interface state. |

## Protected fixture and capture preparation

DB preflight confirmed isolated `hellotext_editorial_workload_20260928`, business 5, fictional owner `design-system@example.test`, 127 contacts, zero messageable/subscribed contacts, 49 messages and all saved playbooks disabled. No seed was rerun. The existing disabled Webchat 36 had zero components, causing its GET editor preview to fail with a missing appearance component. A guarded one-time transaction completes only its five missing Webchat components from the public template, keeps it disabled with no workflow, and omits the packaged Hellotext logo from the fictional business. The guard refuses partial/unexpected fixtures; reruns do not clone duplicates. No delivery worker, install, enable, save, test or message action is used.

## Captures and local verification

Seven static figures per locale cover the catalog, brand appearance, automatic opening, opening sequence, teaser, WhatsApp controls and installation methods. Twenty-four new native Display P3 PNGs are taken automatically from the dedicated loopback Chrome compositor at DPR 2 and zoom 1. Two approved desktop catalog PNGs are reused without uploads or duplicate assets. Every accepted source was inspected as saved pixels and in the built article. Rejected temporary crops are excluded.

Responsive focuses retain complete controls at readable size: primary color, first-visit/session limits, the actual greeting preview bubble, teaser toggles, channel toggles/number and the complete manual-installation text. The full installation popup is not shown below the application's desktop breakpoint because it is hidden there; the mobile article uses a readable text focus taken from the actual visible popup. The narrow sequence editor toolbar and the delay selector overflow in the local UI, so neither is published as a clipped mobile control. The desktop figure shows the full editor or delay, and prose/captions explain each responsive focus. No pixel editing or stylesheet workaround is used.

The unsaved greeting is `¡Hola! Somos Tienda Ejemplo. Podemos ayudarte con tu pedido o a elegir un producto. ¿Qué necesitas?` / `Hi! We are Example Store. We can help with your order or choosing a product. What do you need?`. WhatsApp uses reserved fictional number `+1 202 555 0148` without a connected channel. The behavior example chooses a five-second delay and both limits. These are transient editor states, not saved or enabled configurations.

Guarded postflight restored locale ES and the original fictional business label `Enterprise`: 127 contacts, zero messageable/subscribed, 49 messages, all saved playbooks disabled, no saved Subscriber Booster. Webchat remains disabled with five repaired components and no workflow. No previous seed was repeated and no delivery worker or final action ran.

Production `yarn build` with Ruby 3.3.6 and the security-header verifier passed. All 24 source/asset/built PNG hashes match, both locales have seven figures, original links and identity metadata are unchanged, and docs/provenance remains excluded from `_site`. Complete ES/EN pages were inspected at 1440 and 390 CSS pixels, including figures and ending; the responsive boundary was also measured at 590 pixels. There is no horizontal overflow or linked screenshot. Images render at 382–526 CSS pixels on desktop and 316 or less at 390 pixels. At 590 pixels, each selected narrower source stays exactly at or below its native logical width (333–394 pixels). The white frames fit the selected sources within the full-column lavender stage.

Public verification of the integrated content is recorded below.

Local content verifier: `aad737def4620ea46ef231c8f18f990465a90397`. The separate ledger commit preserves this verified content commit as its ancestor.

## Public verification (2026-09-29)

Help PR [#245](https://github.com/hellotext/help/pull/245) merged by commit `0410c6e779236bf87b0dd836353b19f1f2eddc6c`, preserving content `aad737def4620ea46ef231c8f18f990465a90397` and ledger verifier `f64a260ae791e39c5fec2f3f369c21c5f14ec1b1` as ancestors. Build, Aikido, Netlify preview and header checks passed. The review's proposed synthetic squash reference was disproved by GitHub's actual PR commit parents and successful local ancestry; its thread was resolved. The final review completed without another finding. Main [Build 36645412496](https://github.com/hellotext/help/actions/runs/36645412496) passed for the exact merge SHA. No protection or check was bypassed. Attaching the PR reached the existing 100-identity limit.

The public [ES page](https://help.hellotext.com/es/widget-webchat) and [EN page](https://help.hellotext.com/webchat-widget-playbook) returned HTTP 200 with seven static figures each and the corrected installation explanation. All 24 new PNGs and two reused catalog PNGs returned 200 and matched approved SHA-256 hashes. No reused image was uploaded again. Exact URLs/hashes are saved in `captures/webchat-widget/public-verification.json`. No manual deploy was used. A production Netlify deploy ID to SHA association is not asserted because the authenticated production listing has not been accessible.

## Editor overview and full preview follow-up — 2026-09-30

The user requested a full Webchat preview and proposed starting the guide with the editor's subcomponents and preview together. Add two complementary figures in ES first and then EN: an introductory editor overview for orientation, and the complete native Webchat preview beside the appearance explanation. Preserve the seven existing figures and all article identities/links. On narrow Help screens use a native focus that keeps component labels legible, while the separate full-preview figure retains the header, fictional greeting, composer and launcher. Existing per-component figures still answer distinct configuration questions and need no recapture.

Reuse protected disabled Webchat 36 and its five existing components; do not seed, install, activate, save, submit or send. Localize only guarded fictional display values and use unsaved editor greeting changes. Restore Spanish and the original business name after capture. Sources/provenance remain in excluded docs paths; images use versioned `images/captures/webchat-widget/preview-follow-up/` paths. Build, full-page desktop/mobile review and public verification remain pending at this planning step.


### Accepted follow-up sources and local verification

Starting main `19f16f3d5c023eadb04ecc417f6d39741e262e4b` has 52 local_verified, 101 pending and one out_of_scope redirect; no Help PR was open. The user identified a new visual gap in this published guide, so this follow-up adds orientation and the complete result preview without repeating its full editorial rewrite.

The actual editor on Rails `11731d118e581bb1d67853b1add1f4f495160288` (merged Rails PR #6043) supplied six new native P3 PNGs at DPR 2 and zoom 1. Each locale has a 1216×863 CSS px desktop overview, a 436×936 CSS px focus of the five complete cards from a real desktop 1000×1120 viewport, and a 404×690 CSS px complete preview. The overview relates subcomponents to the result; the separate preview makes the header, greeting, message field and launcher readable. The native customer bubble and online status are editor examples, as the new prose explains. No live conversation or successful installation is implied.

The existing five Webchat components were reused, with unsaved greetings matching the previously approved fictional scenario. No install, enable, save, submit, test, delivery worker or seed ran. Postflight restored ES and the original business name Enterprise: Webchat 36 disabled with no workflow; 127 contacts, zero messageable/subscribed, 49 messages. An English source guard rejected a not-yet-settled preview; preparation now waits for the actual preview greeting before capture. No rejected PNG or failed approach is included.

Production build and the security-header verifier passed under Ruby 3.3.6. All six native/archive/asset/build PNG hashes match; sips confirms Display P3, and the sources are exactly 2× their logical crops. The complete nine-figure ES/EN pages were reviewed in the browser at 1440, 390 and 580 CSS px, including the ending. No horizontal overflow occurs. The standalone preview stays at 404 CSS px on wide/narrow desktop and about 316 px at 390 px. At 580 px the five-card focus stays at its original 436 CSS px width, with a 454 px frame including its 18 px inset/border. The white frame fits the source while the lavender stage fills the original Help column. Sources/provenance remain excluded from the build. Existing seven figure blocks, article metadata and links are unchanged.

New source details and measured full-page review are in `captures/webchat-widget/preview-follow-up/capture-provenance.json` and `local-article-review.json`. Public verification remains pending until the supported merge and normal production publication.
