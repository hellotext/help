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

Public verification is pending; local checks do not imply publication.
