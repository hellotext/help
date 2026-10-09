# Inbox overview: WhatsApp publication candidate

This branch starts from published Help `0729ce7cb263ad0c481f4938a6dfb6be10db6070`. It does not inherit the experimental full-context branch. The only article changes are the Spanish and English Inbox overview. All twelve native sources are accepted and integrated locally. Raw-pixel acceptance, integration, build, rendered-page review and publication have separate records; the production build and both rendered-page reviews have now passed. See [local QA closure](local-qa.json). Remote controls and publication are the remaining gates.

The canonical editorial submodule remains pinned to `d5319b02e1c6a85f3a6294f11763b9be8dd58a43`. The user-approved criteria in canonical editorial commit `ccd086486b8d1c078d7bc7380d71e6acd0543bf4` also apply; the Help gitlink is unchanged.

## Scope

- Replace the first overview figure with the complete desktop Inbox and its native mobile list.
- Replace the second overview figure with the customer profile, including its header and relevant saved information.
- Add a conversation/editor detail below the message-editor explanation. The real WhatsApp editor stays empty; no delivery capability or sent reply is claimed.
- Retain the published assignment figure unchanged. Native initials remain valid avatars; no photos, channel badges or extra controls are invented.
- Preserve both published filter guides and all twelve filter PNG sources exactly. This revision does not correct their readability or close the search-results gap. The eight experimental Team/Labels images containing My unread are excluded.

[Originals](originals/baseline.json), [preservation hashes](preservation-baseline.json), [figure copy and permitted prose](proposed-figure-copy.json) and [revision configuration](revision-config.json) define the scope. Headings, all existing links, route stubs and the inventory remain unchanged: 45 unresolved pairs, including filter/search `visual_pending`.

## Raw import and acceptance

Store the twelve native source PNGs once, without conversion, under `images/editorial/inbox-whatsapp-20261009/`, using `{context,profile,composer}-{es,en}-{desktop,mobile}.png`. These are both the preserved native originals and the published assets. The source record and pixel acceptance bind their exact SHA-256 hashes; no second PNG copy is needed under `docs/`.

Keep a compact `manifest.json` here with a `records` array. Each record requires `file`, `id`, `locale`, `layout`, `clip` (native CSS coordinates), `pixelSize`, `nativeDensity: 4`, `icc` containing `Display P3`, and `sha256`. Preserve relevant date, viewport, browser zoom and color provenance as safe metadata. Do not import raw app source, database dumps, account exports, environment variables, browser session files, private URLs or large historical logs. Source references may use immutable repository paths, revisions and hashes.

The pending [source review template](source-review.template.json) and [raw acceptance template](raw-acceptance.template.json) show the required schema. An actual reviewer must verify the authentic WhatsApp state, clean customer-facing controls, no fabricated pixels and no sends, then bind the exact manifest, copy, config and safe evidence files. Pending templates do not authorize integration.

## Local integration and verification

Run from this worktree after actual source and raw-pixel acceptance:

```sh
python3 docs/editorial-work/captures/inbox-whatsapp-publication-20261009/integrate-candidates.py --plan
python3 docs/editorial-work/captures/inbox-whatsapp-publication-20261009/integrate-candidates.py --manifest docs/editorial-work/captures/inbox-whatsapp-publication-20261009/manifest.json --acceptance docs/editorial-work/captures/inbox-whatsapp-publication-20261009/raw-acceptance.json
```

Add `--apply` to the second command only when the validation has passed. The integration is idempotent; it rejects unexpected article changes, unreviewed hashes and out-of-scope manifest entries. No application, network, browser, build or publishing action is performed by this helper.

The root operator then runs the repository's `yarn build` with Ruby 3.3.6, followed by:

```sh
python3 docs/editorial-work/captures/inbox-whatsapp-publication-20261009/verify-build.py
python3 docs/editorial-work/captures/inbox-whatsapp-publication-20261009/review-local-pages.py --plan
python3 docs/editorial-work/captures/inbox-whatsapp-publication-20261009/review-local-pages.py --guide overview
```

The page reviewer requires the root-owned local preview at the configured loopback origin and its existing dedicated browser. It does not launch either. Only that preview receives GET/HEAD requests. Review both overview pages at desktop, narrow and mobile sizes (six geometry checks). The filter articles and shared CSS are unchanged, so their regression coverage uses exact source/build preservation and HTTP verification instead of another browser pass. The build and public HTTP checks cover all four pages and 28 sources. Geometry verification does not replace a person's inspection of the complete pages and figure pixels at their rendered size.

The build verifier covers 28 referenced native sources and 56 source-to-built byte comparisons: 12 new overview sources, 4 retained ownership sources and 12 retained published filter sources, each in the root and Spanish build. It also verifies the 4 exported-JavaScript copies, excluded editorial documentation, original headings/links/stubs, scoped prose and unchanged inventory. Records and page review bind the current integration, source evidence, configuration, accepted raw hashes and actual built/served HTML to reject stale results.

No git commit, push, pull request, merge or deployment is performed by these helpers. Publication uses `https://github.com/hellotext/help`; the inherited `origin` points to an older local checkout and must not be used for pushing. Root handles authorized publication after all required checks pass.

## Completed local checks

`yarn build` with Ruby 3.3.6 passed, including security headers. All 28 referenced PNG sources matched both exported copies (56 byte comparisons), and all four exported JavaScript copies, excluded documentation, original headings, links and route stubs passed verification. The two overview pages passed six geometry checks at 1440, 580 and 390 CSS pixels. Root inspected all 15 Spanish page/figure PNGs and an independent reviewer inspected all 15 English PNGs at desktop/mobile sizes; 580px received geometry verification only. Both pixel reviews passed. Page-review PNGs stay local, with their hashes in the committed verdicts. The independent scoped patch review also passed.

The user explicitly authorized a Help PR, merge and deployment after passing controls. This local record does not claim remote checks or publication have occurred. Those results are recorded separately against the immutable PR head and deployed merge revision.
