# Property Collector playbook

- Pair: `captures/property-collector-playbook.md`; public ES `/es/recolector-propiedades`, EN `/property-collector-playbook`.
- Original ES, EN, and stub preserved in `docs/editorial-work/originals/property-collector/`; SHA-256: ES `7cf9f5f25d2aca46a48c2dcab10f640762feaf8b935012e357b976bb549cd5fb`, EN `2124bba3eb535feb887bd1c26a6545ab4de73f9846173632f1c9a88acd5d9086`, stub `128a30f465c9fc40b63369cc9a31377f04dab271a4d00476394caa7449ae930c`.
- Main status: `pending`. This branch is preparation only; retain `visual_pending` until bilingual images, full-page review, build, verifier, PR and public checks are complete.

## Source audit and section plan

Read the complete ES and EN originals. Current Rails master `26742adc0c4a848cc58ab6504cd46f28df769401`: `Playbook::PropertyCollector::Handoff#property_collector` finds only an enabled business Property Collector, and `collection_available?` requires one for a source playbook's prerequisite collection. `Playbook::SubscriberBooster::InitiatePropertyCollection#prepare_conversation` uses that enabled agent. Therefore the original claim that a prerequisite works without enabling the standalone Property Collector is wrong. The prerequisite keeps its own selected properties, but execution requires the enabled collector agent. `Handoff::ATTEMPT_LIMIT` and `app/prompts/property_collector.txt` also show that ordinary required items have a bounded question policy, while Subscriber Booster's required items have different behavior. Both languages now state these limits without promising that required items remain active indefinitely.

| Section | Reader question | Visual decision |
| --- | --- | --- |
| Intro and capabilities | What does the AI collect and how does it handle answers? | Conceptual description; a generic playbook card would not show validation or persistence. Explain with prose. |
| Direct versus prerequisite | Where is the standalone collector and how does the prerequisite differ? | One focused catalog or playbook header image may orient readers; a second source-playbook component image is useful only if the isolated UI displays an actual prerequisite configuration with legible labels. Avoid implying that a disabled standalone collector will execute it. |
| Property selection and required/optional | Which fields and toggles control collection? | Capture the configured property list, order and Must collect toggles in ES and EN. This is the primary distinctive control. Use safe fictional fields and do not enable or save a playbook merely to create a screenshot. |
| Before direct use and configuration | Which incoming channels, tone and handoff controls are available? | Inspect the real editor. Use complementary focused figures only for controls not already legible in the property-list figure. Do not impose a figure quota. |
| Answer handling, Playground and post-launch review | How can the behavior be checked safely? | A Playground image is useful only if a guarded local simulation can show genuine fictional events without external messages or writes. Otherwise record visual debt; do not invent a conversation or show private queues. The post-launch checklist has no distinct shared screen. |
| Related links | Which guide should be read next? | No screenshot; links identify the destinations. |

Use the isolated Rails clone and fictitious account only after read-only DB/account preflight. Capture automatically through the dedicated headless Chrome profile, one loopback tab, Display P3 and DPR 2. Inspect the exact editor state and route before selecting clips. No send, test, enable, or save action to manufacture a state. Spanish first, then English, and restore Spanish. Record each native source, asset and built hash in a provenance file under `docs/editorial-work/captures/property-collector/`, which is excluded from the public Jekyll build.

## Pending verification

- The ES/EN factual corrections passed the production Jekyll build and security-header check with Ruby 3.3.6. Preserved originals under excluded `docs/` do not appear in `_site`. The page-level visual review remains outstanding.
- Verify the exact property editor and prerequisite component in the cloned UI and reconcile copy against Rails source.
- Capture and inspect useful ES/EN desktop and mobile sources with complete controls and legible labels at the final Help width.
- Review full articles on desktop/mobile, run the production build and security check, verify hashes and diff, then record a local verifier commit.
- Publish only after both languages are complete; verify PR checks, main Build, normal deployment if accessible, public ES/EN pages and every new PNG.
