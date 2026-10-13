Emails are 640 px wide by default, with 24 px of padding on each side, so the content area is 592 px wide. Upload each image at twice the width it is displayed, so it stays sharp on phones and high-density screens. The height is up to you: the email keeps the proportions of your image and never crops it.

## How to calculate an image size

The displayed width of an image is the content width multiplied by the width you set on the image block. Inside a table cell, also subtract the cell's left and right padding, which is 12 px each by default. Upload at twice the result.

On phones, images shrink to fit the screen, but they are never shown larger than their displayed width.

## Image blocks

These sizes assume the default email width of 640 px.

| Image | Displayed at | Upload at least |
| --- | --- | --- |
| Full width (100%) | 592&nbsp;px | 1200&nbsp;px wide |
| Half width (50%) | 296&nbsp;px | 600&nbsp;px wide |
| Custom width (10–100%) | 592&nbsp;px × your % | Twice that width |

## Image galleries

There is no separate gallery block. Build a gallery with a table (up to 6 columns and 12 rows) and add one image to each cell.

| Equal columns | Each image displayed at | Upload at least |
| --- | --- | --- |
| 2 columns | 272&nbsp;px | 550&nbsp;px wide |
| 3 columns | About 173&nbsp;px | 350&nbsp;px wide |
| 4 columns | 124&nbsp;px | 250&nbsp;px wide |

- Use the same proportions for every image in a row, for example all square or all 4:5. Each cell keeps its image's proportions, so mixed shapes make uneven rows.
- Tables keep their columns on phones, so images in 3- or 4-column galleries look small on mobile.

## Product blocks

Product images come from your connected store catalog, so adjust their size in the catalog, not in the email. The email shows each product image at the width below and keeps its proportions.

| Product block | Displayed at | Upload at least |
| --- | --- | --- |
| Grid, default card style | 276&nbsp;px | 600 × 600&nbsp;px |
| Grid, custom size | 48–160&nbsp;px | Twice the chosen size |
| List, default thumbnail | 88&nbsp;px | 176&nbsp;px |
| List, largest thumbnail | 160&nbsp;px | 320 × 320&nbsp;px |

- **Grid** shows products in two columns that stack on phones. Each image fills its card unless you set a smaller image size in the card style.
- **List** shows a thumbnail next to the product details.
- Square photos of 600 × 600 px or larger work in both layouts. Keep the same proportions across your catalog so grid rows line up.
- Center the product with even margins and use a plain or white background. Cards can round the image corners up to 40 px, so avoid details right at the edges.

## Logo

The theme logo is shown at up to 200 px wide and 80 px tall. Upload a PNG with a transparent background at twice that size, up to 400 × 160 px. A horizontal logo, for example 400 × 100 px, fits best.

## File requirements

- **Formats:** PNG, JPG, GIF, or WebP.
- **Size:** up to 5 MB per image. Aim for under 300 KB so the email opens quickly.

## If you change the email width

The email width can be set between 320 and 1200 px in the theme. Recalculate with the new width:

- The content area is the email width minus 48 px.
- A full-width image is as wide as the content area.
- A grid product image is half the content area minus 20 px. For example, it is 256 px in a 600 px email and 356 px in an 800 px email.

Then upload at twice the displayed width.

## Related guides

- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Campaign best practices]({% link _campaigns/campaign-best-practices.md %})
- [Website Popup]({% link _captures/website-popup.md %})
