"""Add the full Inbox context before the preserved history and ownership details."""
from pathlib import Path
import hashlib
import html
import json
import shutil

ROOT = Path(__file__).resolve().parent
HELP = ROOT.parents[3]
SOURCE = ROOT / 'overview-sources'
destination = HELP / 'images/editorial/inbox-context'
destination.mkdir(parents=True, exist_ok=True)
copy = {
    'es': {
        'old': 'Abre una conversación de la lista para revisar su historial y el contexto del cliente. En el móvil, la lista, la conversación y el perfil se muestran en vistas separadas.',
        'intro': 'En escritorio, el Inbox muestra la lista de conversaciones a la izquierda, el historial de la conversación seleccionada en el centro y el contexto del cliente a la derecha. En este ejemplo, el panel del cliente está desplazado a **Actividad**. En el móvil, la lista, la conversación y el perfil se muestran en vistas separadas.',
        'label': 'Ubica las vistas del Inbox',
        'alt': 'Inbox con una lista de conversaciones ficticias. En escritorio también se ven la consulta de Emma Vargas, una nota interna y la actividad del cliente.',
        'caption': 'Interfaz real con datos ficticios. Escritorio muestra los tres paneles; móvil muestra la lista de conversaciones en su propia vista.',
        'detail': 'Abre una conversación para leer la consulta y las notas internas antes de responder.',
    },
    'en': {
        'old': 'Open a conversation from the list to review its history and customer context. On mobile, the list, conversation, and profile appear in separate views.',
        'intro': 'On desktop, the Inbox shows the conversation list on the left, the selected conversation history in the center, and customer context on the right. In this example, the customer panel is scrolled to **Activity**. On mobile, the list, conversation, and profile appear in separate views.',
        'label': 'Locate the Inbox views',
        'alt': 'Inbox with a list of fictional conversations. Desktop also shows Emma Vargas’s question, an internal note, and customer activity.',
        'caption': 'Real interface with fictional data. Desktop shows all three panels; mobile shows the conversation list in its own view.',
        'detail': 'Open a conversation to read the question and internal notes before replying.',
    },
}
for locale in ['es', 'en']:
    records = {}
    for layout in ['desktop', 'mobile']:
        name = f'context-{locale}-{layout}'
        item = json.loads((SOURCE / f'{name}.json').read_text())
        assert item['nativeDensity'] == 4 and item['transformations'] == 'none'
        assert hashlib.sha256((SOURCE / f'{name}.png').read_bytes()).hexdigest() == item['sha256']
        shutil.copyfile(SOURCE / f'{name}.png', destination / f'{name}.png')
        records[layout] = item
    desktop, mobile = records['desktop'], records['mobile']
    label, alt, caption = [html.escape(copy[locale][key], quote=True) for key in ['label', 'alt', 'caption']]
    frame_width = max(desktop['clip'][2], mobile['clip'][2]) + 18
    figure = f'''<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="{label}">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: {frame_width}px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-context/context-{locale}-mobile.png 4x" width="{mobile['pixelSize'][0]}" height="{mobile['pixelSize'][1]}" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-context/context-{locale}-desktop.png" srcset="/images/editorial/inbox-context/context-{locale}-desktop.png 4x" width="{desktop['pixelSize'][0]}" height="{desktop['pixelSize'][1]}" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="{alt}" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">{caption}</figcaption>
</figure>'''
    relative = Path(f'_i18n/{locale}/team/inbox-overview.md')
    body = (ROOT / 'originals' / relative).read_text()
    assert body.count(copy[locale]['old']) == 1, locale
    body = body.replace(copy[locale]['old'], copy[locale]['intro'] + '\n\n' + figure + '\n\n' + copy[locale]['detail'], 1)
    (HELP / relative).write_text(body)
print('Inserted four full-context sources; eight previous detail sources preserved. Article QA pending.')
