# Spanish Segments chooser crop correction

## Starting state and plan

- The existing Spanish and English Segments articles are already reviewed and published. Preserve their titles, slugs, links, body text, and publication state. The English chooser and the other Segments figures are unaffected.
- The Spanish chooser asset has a gray horizontal shadow at its top edge. This is part of the bitmap, not the lavender figure frame. Its original native Display P3 screenshot is retained at `captures/segments/condition-chooser-es-original.png` with SHA-256 `b6552dae83127225d011ca1eb0b16f0cf979f50a9e22cca752c810b8c667e74f`.
- Re-extract only the useful rectangle from that original: 1144 × 748 pixels at x=0, y=110. This removes 12 top rows containing the unrelated overlay shadow while retaining the full editor heading, chooser, and both choices. Update the HTML intrinsic height and capture record. The maximum 550 CSS-pixel display width retains 2.08× source density.
- Verify the resulting pixels and Display P3 profile, build the complete site, and review both language pages at desktop and mobile widths. Publish through the normal PR and Netlify process, then compare the public image and pages.

## Verification and publication

- The new derivative is `images/audience/segments/condition-chooser-es.png`, SHA-256 `9f4dee1166cc3f1cafbb64d66b74effe0825b53e5521f7fa856bd7656844044d`. ImageMagick reported zero differing pixels between it and rows 12–759 of the prior derivative. `sips` and ImageMagick identified its embedded Display P3 ICC profile. The untouched original remains in the repository.
- `PATH="$HOME/.rbenv/shims:$PATH" BUNDLE_PATH=vendor/bundle yarn build` passed, including the security-header check. The root and Spanish built PNG copies are byte-identical to the corrected source asset; `docs/` and `AGENTS.md` stay outside `_site`.
- In the local browser, the complete Spanish article shows all three static figures. The corrected chooser has no top shadow at 1280px desktop or 390px mobile, while its heading and both choices remain visible. The English article still shows three static figures at both widths. The mobile pages have no horizontal overflow; every figure has one image and no link or button. The Spanish chooser is complete at a 316 CSS-pixel mobile width.
- Pull request, merge, and public deployment are pending.
