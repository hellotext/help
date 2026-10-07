# Image size guides (Website Popup section and Image sizes for emails)

## Source and reader task

- Pairs: `captures/website-popup.md` (new section "Choose the right image size" / "Elige el tamaño correcto de la imagen") and `campaigns/email-image-sizes.md` (new article). Public routes once published: EN `/website-popup`, ES `/popup-sitio-web`, EN `/email-image-sizes`, ES `/es/tamanos-imagen-emails`.
- Reader task: prepare an image at the right size before uploading it to a popup or an email, without trial and error.
- No translated body existed for the email article, so there is no original to preserve. The popup bodies were edited only by inserting the new section before "Assign a coupon and journey".

## Product source checked (Hellotext Rails)

Checked in the `hellotext-popup-bugs` worktree (base `9340b0d53a`):

| Claim | Source |
| --- | --- |
| Popup accepts JPG and PNG | `Popup::IMAGE_CONTENT_TYPES = %w[image/jpeg image/png]` in `app/models/popup.rb` |
| Popup image limit 10 MB | `Popup::MAX_IMAGE_SIZE = 10.megabytes` |
| Desktop popup is 768 px wide; image on top defaults to 200 px high | `w-[48rem]` panel width; `desktop_media_height` default 200 in `db/structure.sql` |
| Side image is 40% of the width (about 307 px) | `desktop_media_width_percentage` default 40 |
| Mobile image is 350 px wide, 200 px high by default | `mobile_media_height` default 200; runtime panel measured at 350 px |
| Cover crops, Fit shows the whole image | `overlay_background_size` (`cover` / `contain`) |
| Email width defaults to 640 px, range 320 to 1200 | `Mailing::Theme` (`max_width`) |
| Email images: PNG, JPG, GIF, WebP, up to 5 MB | `Mailing::Design::IMAGE_TYPES`, `MAX_IMAGE_BYTES` |
| Email image width 10 to 100% of the content, height keeps proportions | `Mailing::Blocks::Image` (`image_width`) |

Open dependency: the 450 px desktop minimum height of the popup is implemented in the unmerged Rails branch `fix/popup-runtime-preview-parity`. The popup section states it as current behavior, so it must not be published before that fix ships.

## Local verification

- `yarn install --frozen-lockfile`, then `JEKYLL_ENV=production bundle exec jekyll build` (Ruby 3.3.11 through mise; the pinned 3.3.6 was not installed) and `script/verify_security_headers.rb` passed ("Security headers are configured"). `docs/` is absent from `_site`. `node_modules` is tracked in this repository, so the install was reverted afterwards and is not part of the change.
- Inspected the built EN and ES popup and email pages in a browser at 1280×720 and 390×844. All four pages and both new sections render with the Help layout and sidebar entry; no horizontal page overflow at either width.
- Finding fixed: the first popup table had four columns and scrolled horizontally at 390 px with size values breaking across lines. The "Shape" column was removed and each `px` unit is bound to its number with a non-breaking space. After the fix every table fits its container at 390 px in both languages.
- No screenshots were added; the sections describe values, not product controls. The shared screenshot checks do not apply.
- This is a local build, not public publication.
