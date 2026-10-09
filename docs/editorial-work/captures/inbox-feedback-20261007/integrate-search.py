"""Insert the accepted native focused-input sources into the two guides."""
from pathlib import Path
import hashlib
import html
import json
import re
import shutil

ROOT = Path(__file__).resolve().parent
HELP = ROOT.parents[3]
SOURCE = ROOT / 'filter-sources'
manifest = json.loads((SOURCE / 'search-manifest.json').read_text())
records = {item['file']: item for item in manifest['records']}
copy = {
    'es': {
        'figure_label': 'Escribe el nombre del cliente en Buscar',
        'alt': 'Campo Buscar del Inbox enfocado, con Emma escrito y el cursor de texto visible.',
        'caption': 'Entrada de una consulta en la interfaz real con datos ficticios. La captura no verifica resultados de búsqueda.',
    },
    'en': {
        'figure_label': 'Enter the customer name in Search',
        'alt': 'Focused Inbox Search field with Emma entered and the text caret visible.',
        'caption': 'Entering a query in the real interface with fictional data. This capture does not verify search results.',
    },
}
destination = HELP / 'images/editorial/inbox-filter-context'
destination.mkdir(parents=True, exist_ok=True)

for locale in ['es', 'en']:
    files = {layout: f'search-{locale}-{layout}.png' for layout in ['desktop', 'mobile']}
    for filename in files.values():
        item = records[filename]
        assert item['accepted_source'] and item['nativeDensity'] == 4
        assert hashlib.sha256((SOURCE / filename).read_bytes()).hexdigest() == item['sha256']
        shutil.copyfile(SOURCE / filename, destination / filename)
    desktop, mobile = [records[files[layout]] for layout in ['desktop', 'mobile']]
    label, alt, caption = [html.escape(copy[locale][key], quote=True) for key in ['figure_label', 'alt', 'caption']]
    frame_width = max(desktop['nativeLogicalSize'][0], mobile['nativeLogicalSize'][0]) + 18
    figure = f'''<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="{label}">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: {frame_width}px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-filter-context/{files['mobile']} 4x" width="{mobile['pixelSize'][0]}" height="{mobile['pixelSize'][1]}" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-filter-context/{files['desktop']}" srcset="/images/editorial/inbox-filter-context/{files['desktop']} 4x" width="{desktop['pixelSize'][0]}" height="{desktop['pixelSize'][1]}" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="{alt}" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">{caption}</figcaption>
</figure>'''
    article = HELP / f'_i18n/{locale}/team/filter-and-search-inbox.md'
    body = article.read_text()
    old = next(block for block in re.findall(r'<figure\b.*?</figure>', body, re.S) if f'search-{locale}-desktop.png' in block)
    body = body.replace(old + '\n\n', '', 1)
    anchor = {
        'es': 'Después, escribe el nombre u otro dato del cliente en **Buscar**, en la parte superior de la lista de conversaciones.',
        'en': "Then enter the customer's name or another identifying detail in **Search** at the top of the conversation list.",
    }[locale]
    assert body.count(anchor) == 1, locale
    body = body.replace(anchor, anchor + '\n\n' + figure, 1)
    article.write_text(body)
print('Inserted four verified search sources; article QA pending.')
