# Tracked links editorial batch

## Source and reader task

- Article key: `analytics-reporting-attribution/tracked-links.md`; published routes: `https://help.hellotext.com/es/links-con-tracking` and `https://help.hellotext.com/tracked-links`. Progress is `pending` at main revision `633ec2abe60b8e8870ddb684378ed31eba025b98`.
- The complete pre-edit Spanish and English bodies and shared stub are preserved byte for byte under `originals/tracked-links/`. Original SHA-256 values: Spanish `12e4a1d7ff25f3fb7a4f1cab6c764fe9855a7bada378638a5f21a1c7dacdfd65`; English `f6c594879788dfa5586ce3f372d9b80e7d1cc85437f45a5a28a1e44bd9a1c378`.
- The reader needs to insert a tracked link in a message, understand the redirect and session parameter, and distinguish a click from a sale attributed to Hellotext.

## Article-specific plan

1. Remove the duplicated opening and turn the existing editor instructions into a short sequence using the actual Spanish controls **Insertar enlace corto**, **Crear un enlace corto**, and **Agregar enlace corto**. Adapt the verified result in English using **Insert short link**, **Create a shortlink**, and **Add short link**.
2. Explain the default six-character `hello.link` form and the verified business link-domain alternative. Explain that the redirect adds `hello_session` and that an eligible click provides attribution evidence but does not guarantee credit for every later sale. Preserve the existing links and the supported default attribution windows.
3. Keep the real link-tool SVG icon already in the article on a same-origin path, constrain it to 20 × 20 pixels inline, and mark it decorative (`alt=""`) because the adjacent control name conveys its purpose. The icon and exact control names answer the short placement task; no screenshot is needed to explain a distinct choice or result in this batch. Do not substitute a browser JPEG for a native capture.
4. Preserve the stub's titles, descriptions, slugs, redirects, languages, navigation placement, and publication state. Re-read bodies before saving; build the site and inspect the full rendered Spanish and English articles on desktop and mobile, including links and the icon. Mark `local_verified` only after those checks and record the verifying content commit in `progress.csv`.

## Implementation evidence

- Rails revision `26742adc0c4a848cc58ab6504cd46f28df769401`: `app/components/compose/toolbar/link_component/link_component.html.erb`, `config/locales/views/compose/tools/{es,en}.yml:12`, `config/locales/informational/{es,en}.yml:130`, and `config/locales/actions/{es,en}.yml:104` define the controls. `app/javascript/controllers/editor/link/form_controller.js` validates and creates the link.
- `app/models/link.rb:23-37` and `app/models/short_link.rb:62-68` generate six-character codes and choose the verified business link alias or `hello.link`. `app/models/hello_link.rb:10-30` appends `hello_session`. `app/models/attribution/window.rb:7-8` records the default seven-day session and one-day delivery windows.

## Local verification

- The Spanish body was revised first, then adapted in English. A separate read-only review confirmed the labels, redirect/domain behavior, attribution caveat, and translation parity against Rails revision `26742adc0c4a848cc58ab6504cd46f28df769401`.
- The production `yarn build` completed for both languages, including `script/verify_security_headers.rb`. The rendered routes `/es/links-con-tracking.html` and `/tracked-links.html` were read in full in the local browser at 1280 px desktop and 390 px mobile widths. Both mobile layouts had `scrollWidth` equal to `clientWidth`.
- The existing SVG was initially too large because article image styles overrode its intrinsic size. The final same-origin image loaded in both locales and rendered at 20 × 20 px after explicit inline dimensions. Its empty alternative text is deliberate: the adjacent bold control label names the same control. Browser screenshots confirmed the numbered steps and article ending remain readable on desktop and mobile.
- Both localized article bodies retain the five prior link destinations. The shared stub was not changed. The original snapshots remain byte-identical to the pre-edit bodies and stub. No native product screenshot or message preview was added because the real toolbar icon and exact labels cover the only placement action in this short guide.
