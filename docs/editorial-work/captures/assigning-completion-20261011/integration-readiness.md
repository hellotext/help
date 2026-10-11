# Assigning conversations: accepted-source integration

The eight inherited PNGs have been individually inspected and remain byte exact to the historical main revision recorded in `retained-source-register.json`. Four mobile sources are candidates for both Help viewports, with a 390 CSS pixel image cap and 408 pixel white-frame cap. Four desktop sources remain preserved reference files. Their much wider 1600 pixel logical view is not selected for inline presentation. Actual inline legibility remains a final page-review gate.

`integrate-accepted-sources.py --plan` only checks the frozen article hashes, insertion anchors, historical-source hashes and proposed structure. It creates no article references or assets. It currently passes. The two article bodies still contain the five approved copy corrections and two original figure blocks. No new capture has been imported or displayed.

## Incoming sources and acceptance

The capture owner will provide sixteen real PNGs in the separate `assigning-conversations-capture-v2-20261011/captures` directory. All sixteen must be fresh V2 captures: the seven partial V1 images and their partial pixel receipts remain historical and are not admitted into this final batch. V1 closed without a completed native claim. Filenames use `claim-before`, `claim-after`, `ai-chooser` and `bulk-chooser`, followed by `es` or `en` and `desktop` or `mobile`. Each concept needs all four combinations. The helper consumes a manifest with a `records` array. Required fields are `id`, `file`, `locale`, `layout`, `clip` as `[x,y,width,height]`, `pixelSize`, `nativeDensity: 4`, `icc: Display P3` and `sha256`.

Do not generate an acceptance file until reviewers have actually inspected every saved PNG and the root has accepted the single native claim's semantic receipt. The acceptance record must have:

- `status: passed`, the exact `manifest_sha256` and `integration_inputs_sha256`.
- `records` containing the sixteen actual `file` and `sha256` pairs, each with `status: passed`.
- `pixel_reviews` with exactly `es` and `en` entries, each containing the relative `file` of that locale’s real, curated pixel-review receipt and its `sha256`. Each receipt must declare `status: passed`, its exact `locale`, and eight `records` with `id`, `locale`, `layout`, `file`, `sha256` and `status: passed`, matching that locale’s complete native source matrix. Both receipts are written only after individual pixel inspection; no pending or synthetic receipt qualifies.
- `labels_verified` with Spanish `Agentes IA` and English `AI Agents`, checked in the saved sources.
- `native_claim_semantic_review` containing `status: passed`, `completed_native_claim_count: 1`, the relative `file` of the independently reviewed, sanitized receipt and its `sha256`.

The before sources must precede the same single native claim; the after sources must follow it. The AI image shows the associated-agent chooser without selecting a target. The bulk image shows the two selected conversations and the open teammate chooser without applying it. Neither image proves AI execution or completed batch assignment. The source owner retains private runtime/session/action material outside Help; do not copy its raw sidecars blindly. Curate the reproducible source revision, isolation, action and closure evidence separately from this image-import helper.

## Integration and review

Run the helper with `--raw-dir`, `--manifest` and `--acceptance` first without `--apply`. It fails if a required source, hash, accepted matrix, P3 profile, CRC, native density or bound article is missing. It then calculates the final changes in memory. After that succeeds, the same command with `--apply` imports untouched PNG bytes, preserves the two pre-integration bodies, writes a compact accepted-source manifest and updates the source register.

The helper copies the two validated pixel-review receipts into this capture package without altering their bytes. Each new source-register entry gets `pixel_review: pass`, `transformations: []`, and `pixel_review_record` with the receipt basename and exact SHA-256. This matches the publication verifier’s `admitted_sources` contract. The receipt names must differ by locale and must not use the reserved integration-output names `accepted-source-manifest.json`, `integration-record.json` or `source-register.json`. An existing receipt can never be overwritten with different bytes.

The integration places before/after figures after the three self-assignment steps, the AI chooser after its recognition paragraph and the bulk chooser after the three selection steps. Only then does it update the exact bold group labels to `Agentes IA` / `AI Agents`. Historical menu/result blocks retain their descriptions and positions; their picture sources both use the accepted native mobile file. New figures keep the static responsive picture, full lavender stage, white inset, hidden accessible caption and per-source native size cap. There are six figures per language, twenty selected PNGs and twenty-four preserved PNGs.

A rerun checks the accepted-input and resulting article/image hashes and makes no further changes. No script changes CSV, shared styles/scripts/configuration, gitlink, commits or publication. The script does not build or launch any service.

After accepted sources are actually integrated, the existing root-owned helpers in `audit/assignment-help-qa-20261011` perform the normal production build/security/byte checks and six Help views at 1440, 580 and 390 CSS pixels. All eight historical PNGs remain part of the source and built-byte checks. Review full-page coverage, native caps, readable labels, static figures and all new sources before declaring local verification.
