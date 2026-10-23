# Connect VTEX: Legacy CMS installation

## Source and state before editing

- Article key: `integrations/connect-vtex.md`. Published routes: `https://help.hellotext.com/connect-vtex` and `https://help.hellotext.com/es/conecta-vtex`; inventory records HTTP 200 for both and `progress.csv` marked the pair `pending`.
- Complete pre-edit bodies and the shared stub are preserved byte for byte under `originals/connect-vtex/`. SHA-256: Spanish `cbb3dc7c70ef110566fb774c034ff9905582ac7f0c018c39e75022cd6135cd0f`; English `da198f2c29a9a25cb7e70e9108bdfb1853f7a11055a32c5e40b2851a53602d71`; stub `e7215332615582de4717d6ce2ca172497f01be84314751df443e7685eb7f75cf`. The body hashes match `inventory.csv`.
- Started from Help `origin/main` at `fa6c979b9115b63e111dffe4e2b01903d247f7fb` on `vtex-legacy-cms-guide`. Titles, slugs, languages, navigation, existing anchors (`checkout`, `affiliate`) and publication state are preserved.

## Reader task and article-specific plan

A merchant connecting a VTEX store needs to know which pixel installation applies to their storefront, and how to complete the one the setup wizard shows.

1. Match the wizard's new step order (domains, checkout, install, affiliate): move **Checkout Funnel Tracking / Seguimiento del Embudo de Checkout** before the pixel section. Its text and its `checkout` anchor are unchanged.
2. Explain in **Pixel Installation / Instalación del Pixel** that the wizard detects the storefront technology: Store Framework (VTEX IO) installs the Hellotext app, Legacy CMS pastes a script. Mention the wizard's link to switch when the detection is wrong.
3. Add **Legacy CMS installation / Instalación en tiendas con Legacy CMS** with a `legacy-cms` anchor for the wizard's guide link: why the app can't run there, the CMS template steps, the snippet, where it may go (`<head>` or before `</body>`), what it tracks, not to paste it into checkout, and its source code link, matching the checkout section's.
4. State in **Automatic Push installation / Instalación automática de Push** that automatic Push applies to the app on Store Framework stores, and the Legacy CMS script doesn't install Push.
5. Visuals: a capture of VTEX's **HTML Templates** editor would help readers find the subtemplate, but no Legacy CMS admin account is available to capture it. The Hellotext wizard step for Legacy CMS is not deployed yet, so it can't be captured from the current interface either. Both captures are recorded as pending; the steps name each control in the text.
6. Revise Spanish first and adapt English. Build and check both complete articles; the wizard behavior ships in the Rails PR, which should merge before this Help PR.

## Checkpoint

Both translations were revised. The relocated checkout section is identical to the original in both languages; the only removed sentence is the pixel step's former introduction, which the detection explanation replaces. Both pages keep all original headings and Liquid link targets, and add one heading and the `legacy-cms` anchor.

The production-mode Jekyll build and security-header verification passed with Ruby 3.3.12 (3.3.6 is not installed locally). The built pages contain the new headings, the snippet, and resolving `#legacy-cms` and `#checkout` in-page links, with no unrendered Liquid; `docs/` is absent from `_site`. Browser review at desktop and mobile widths is pending on the Netlify deploy preview.

The linked `hellotext/vtex-legacy-cms` repository is internal on GitHub at this checkpoint; the source code link only works for the public once the repository is public.
