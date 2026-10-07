"""Replace the two filter details with reviewed native contextual captures."""
from pathlib import Path
import hashlib
import html
import json
import re
import shutil

ROOT = Path(__file__).resolve().parent
HELP = ROOT.parents[3]
SOURCE = ROOT / 'filter-sources'
DESTINATION = HELP / 'images/editorial/inbox-filter-context'
records = {r['file']: r for r in json.loads((SOURCE / 'manifest.json').read_text())['records']}
copy = {
    'es': {
        'team': ('Selecciona integrantes con la lista del Inbox a la vista',
                 'Sección Equipo del menú Mostrar filtros abierta sobre la lista del Inbox, con Lucía Méndez y Sofía Castro seleccionadas y el control Elegir.',
                 'Interfaz real con datos ficticios. Los controles acotan la lista por integrante; no muestran un cambio de asignación.'),
        'labels': ('Abre las opciones del filtro por etiqueta',
                   'Selector Elegir de Etiquetas abierto sobre el Inbox, con las opciones Prioridad, Devoluciones y Ventas y una conversación ficticia visible detrás.',
                   'Interfaz real con datos ficticios. El selector muestra las etiquetas disponibles; todavía no hay ninguna etiqueta aplicada como filtro.'),
    },
    'en': {
        'team': ('Select teammates with the Inbox list in view',
                 'Team section of Show filters open over the Inbox list, with Lucía Méndez and Sofía Castro selected and the Choose control visible.',
                 'Real interface with fictional data. These controls narrow the list by teammate; they do not show an assignment change.'),
        'labels': ('Open the label filter choices',
                   'Labels Choose menu open over the Inbox, with Prioridad, Devoluciones and Ventas available and a fictional conversation visible behind it.',
                   'Real interface with fictional data. The chooser shows available custom labels; no label filter has been applied yet.'),
    },
}
for locale in ['es', 'en']:
    path = HELP / f'_i18n/{locale}/team/filter-and-search-inbox.md'
    body = path.read_text()
    old_figures = re.findall(r'<figure\b[\s\S]*?</figure>', body)
    assert len(old_figures) == 3
    for index, kind in [(1, 'team'), (2, 'labels')]:
        versions = {}
        for layout in ['desktop', 'mobile']:
            name = f'{kind}-{locale}-{layout}.png'
            data = (SOURCE / name).read_bytes()
            record = records[name]
            assert hashlib.sha256(data).hexdigest() == record['sha256']
            assert record['nativeDensity'] == 4
            shutil.copyfile(SOURCE / name, DESTINATION / name)
            versions[layout] = record
        desktop, mobile = versions['desktop'], versions['mobile']
        label, alt, caption = [html.escape(s, quote=True) for s in copy[locale][kind]]
        frame_width = max(desktop['maxDisplayWidth'], mobile['maxDisplayWidth']) + 18
        figure = f'''<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="{label}">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: {frame_width}px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-filter-context/{kind}-{locale}-mobile.png 4x" width="{mobile['pixelSize'][0]}" height="{mobile['pixelSize'][1]}" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-filter-context/{kind}-{locale}-desktop.png" srcset="/images/editorial/inbox-filter-context/{kind}-{locale}-desktop.png 4x" width="{desktop['pixelSize'][0]}" height="{desktop['pixelSize'][1]}" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="{alt}" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">{caption}</figcaption>
</figure>'''
        body = body.replace(old_figures[index], figure, 1)
    path.write_text(body)
print('Integrated eight contextual filter sources; all previous original assets preserved.')
