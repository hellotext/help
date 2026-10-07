"""Review all four revised Help pages at their actual responsive widths."""
from pathlib import Path
import json
import subprocess
import sys

ROOT = Path(__file__).resolve().parent
OUT = ROOT / 'page-review'
OUT.mkdir(exist_ok=True)
BROWSER = ROOT.parent / 'inbox-filter-search/review-browser.mjs'

def browser(**args):
    output = subprocess.check_output(['node', str(BROWSER), json.dumps(args)], text=True)
    return json.loads(output.splitlines()[0])

routes = [
    ('overview', 'es', 'es/resumen-inbox-conversaciones'),
    ('overview', 'en', 'inbox-conversations-overview'),
    ('filters', 'es', 'es/filtrar-buscar-conversaciones-inbox'),
    ('filters', 'en', 'filter-and-search-inbox'),
]
selected_guide = sys.argv[1] if len(sys.argv) > 1 else 'all'
assert selected_guide in ['all', 'overview', 'filters']
routes = [item for item in routes if selected_guide == 'all' or item[0] == selected_guide]
checks = []
for guide, locale, route in routes:
    for layout, width in [('desktop', 1440), ('narrow', 580), ('mobile', 390)]:
        state = browser(url=f'http://127.0.0.1:4298/{route}.html', viewport=[width, 1000], expression='''(async()=>{
          for(const image of document.querySelectorAll('figure img')){
            image.scrollIntoView({behavior:'instant',block:'center'});
            await new Promise(r=>setTimeout(r,250));await image.decode();
          }
          window.scrollTo({top:0,behavior:'instant'});
          return {url:location.href,viewport:[innerWidth,innerHeight],height:document.documentElement.scrollHeight,
            overflow:document.documentElement.scrollWidth>innerWidth,
            figures:[...document.querySelectorAll('figure')].map(f=>{
              const i=f.querySelector('img'),s=f.querySelector('.ht-editorial-visual__stage'),c=f.querySelector('figcaption');
              return {src:i.currentSrc,alt:i.alt,width:i.getBoundingClientRect().width,nativeWidth:i.naturalWidth,
                links:f.querySelectorAll('a').length,stage:s.getBoundingClientRect().toJSON(),
                border:getComputedStyle(s).borderWidth,padding:getComputedStyle(s).padding,
                captionWidth:c.getBoundingClientRect().width,captionClip:getComputedStyle(c).clipPath};
            })};})()''')
        assert not state['overflow'] and len(state['figures']) == 3, state
        for figure in state['figures']:
            source_layout = 'mobile' if width <= 600 else 'desktop'
            assert f'-{locale}-{source_layout}.png' in figure['src'], figure
            assert figure['width'] <= figure['nativeWidth'] + 0.1, figure
            assert figure['links'] == 0 and figure['alt'], figure
            assert figure['captionWidth'] <= 1 and figure['border'] != '0px', figure
        (OUT / f'{guide}-{locale}-{layout}.json').write_text(json.dumps(state, indent=2) + '\n')
        if layout != 'narrow':
            for part, top in enumerate(range(0, state['height'], 2500), 1):
                browser(viewport=[width, 1000], screenshot=str(OUT / f'{guide}-{locale}-{layout}-page-{part}.png'),
                        tile=[top, min(2500, state['height'] - top)], expression='({url:location.href})')
            for index in range(3):
                browser(viewport=[width, 1000],
                        expression=f'''(async()=>{{const f=document.querySelectorAll('figure')[{index}];window.scrollTo({{top:scrollY+f.getBoundingClientRect().top-100,behavior:'instant'}});await new Promise(r=>setTimeout(r,250));return {{url:location.href,figure:{index}}};}})()''',
                        screenshot=str(OUT / f'{guide}-{locale}-{layout}-figure-{index+1}.png'))
        check = {'guide': guide, 'locale': locale, 'layout': layout, 'width': width, 'figures': 3, 'result': 'passed'}
        checks.append(check)
        print(json.dumps(check), flush=True)
(OUT / f'summary-{selected_guide}.json').write_text(json.dumps(checks, indent=2) + '\n')
if selected_guide == 'all':
    (OUT / 'summary.json').write_text(json.dumps(checks, indent=2) + '\n')
elif all((OUT / f'summary-{guide}.json').exists() for guide in ['overview', 'filters']):
    combined = sum([json.loads((OUT / f'summary-{guide}.json').read_text()) for guide in ['overview', 'filters']], [])
    (OUT / 'summary.json').write_text(json.dumps(combined, indent=2) + '\n')
