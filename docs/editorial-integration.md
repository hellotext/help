# Help Center editorial integration

Initialize the pinned `docs/editorial` submodule and read its skill before article work. Its guide owns the visual and capture rules; this file records only Help-specific paths and build steps.

## Source and export

The Hellotext Rails repository owns `Editorial::FigureComponent`, the visual catalogs, styles, and tab behavior. From a reviewed Rails revision, run `bin/rails editorial:export_help` with the Rails project's Ruby environment. The task writes `tmp/editorial-help-bundle/`. Record the Rails revision and generated module SRI with each import in `docs/editorial-work/`.

Copy these generated paths into the same Help paths without changing their bytes:

- `_includes/editorial/`
- `_data/editorial/`
- `assets/editorial/editorial_visuals.css`
- `assets/editorial/editorial_visuals.js`
- `assets/editorial/editorial_tabs.js`
- `images/editorial/`

Do not import the bundle's preview page, preview stylesheet, README, or fonts. Help already supplies Object Sans. To use a registered figure, put its locale-specific Liquid include on its own line in the translated article body. Message examples require an editable source definition in the article work record.

## Page and security integration

`_includes/document_head.html` loads the generated stylesheet after Help's stylesheet. `_layouts/guide.html` loads the generated module entrypoint once. Keep that tag's SRI synchronized with the generated bundle README, `netlify.toml` script policy, and `script/verify_security_headers.rb`. `_config.yml` excludes both exported modules and their `es/` copies from Jekyll JavaScript minification, preserving the exported entrypoint bytes. Do not relax the global CSP or edit generated assets to satisfy a build.

`_config.yml` excludes `docs/` and `AGENTS.md` from the public build. Article originals, inventory, plans, source capture records, and verification logs live in `docs/editorial-work/`; the published image used by an article belongs under `images/` and retains its original PNG bytes and profile.

## Guide image width

Keep screenshot figures inside the guide's existing article column (up to `810px` on desktop) and within that column on smaller screens. A larger native PNG may scale down in the browser; it must not widen the guide layout, displace its side navigation, or open in a separate view. If essential labels become too small at this width, use a tighter capture or explain them in adjacent text, following the shared screenshot standard.

Keep the screenshot frame inside the article column. When a figure uses the lavender stage, retain a visible inset around the image and include both insets in the stage's width limit; padding should not shrink a density-limited image. Display each source as wide as the article column and its native 2× density allow. Keep a narrower source and its stage centered at a safe width until a larger native capture is available, without broad side gutters.

Run `yarn build` with the repository's Ruby 3.3.6 and installed gems. Its production build also runs `script/verify_security_headers.rb`. Compare built JS and image bytes with committed assets, confirm `docs/` stays absent from `_site`, and inspect affected English and Spanish pages in a browser at desktop and mobile widths. A local build is not publication; record deployed revision and public asset checks separately when publication is authorized.
