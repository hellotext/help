"""Review the real built guide through the dedicated localhost-only Chrome."""
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent
OUT = ROOT / 'page-review'
OUT.mkdir(exist_ok=True)
BROWSER = ROOT.parent / 'inbox-filter-search/review-browser.mjs'
MANIFEST = {record['file']: record for record in json.loads((ROOT/'manifest.json').read_text())['records']}

def browser(**args):
    output = subprocess.check_output(['node', str(BROWSER), json.dumps(args)], text=True)
    return json.loads(output.splitlines()[0])

results = []
for locale, route in [('es', 'es/resumen-inbox-conversaciones'), ('en', 'inbox-conversations-overview')]:
    for layout, width in [('desktop',1440), ('narrow',580), ('mobile',390)]:
        state = browser(url=f'http://127.0.0.1:4298/{route}.html', viewport=[width,1000], expression='''(async()=>{
          for(const image of document.querySelectorAll('figure img')){
            image.scrollIntoView({behavior:'instant',block:'center'});
            await new Promise(r=>setTimeout(r,300));
            await image.decode();
          }
          window.scrollTo({top:0,behavior:'instant'});
          return {url:location.href,viewport:[innerWidth,innerHeight],height:document.documentElement.scrollHeight,overflow:document.documentElement.scrollWidth>innerWidth,
            figures:[...document.querySelectorAll('figure')].map(f=>{
              const image=f.querySelector('img'),stage=f.querySelector('.ht-editorial-visual__stage'),caption=f.querySelector('figcaption');
              return {src:image.currentSrc,alt:image.alt,width:image.getBoundingClientRect().width,nativeLogicalWidth:image.naturalWidth,links:f.querySelectorAll('a').length,
                stage:stage.getBoundingClientRect().toJSON(),border:getComputedStyle(stage).borderWidth,padding:getComputedStyle(stage).padding,
                captionWidth:caption.getBoundingClientRect().width,captionClip:getComputedStyle(caption).clipPath};
            })};})()''')
        assert not state['overflow'], state
        assert len(state['figures']) == 2, state
        for index, figure in enumerate(state['figures']):
            expected_kind = ['workspace', 'ownership'][index]
            expected_layout = 'mobile' if width <= 600 else 'desktop'
            expected_file = f'{expected_kind}-{locale}-{expected_layout}.png'
            assert figure['src'].endswith('/inbox-overview/'+expected_file), figure
            source = MANIFEST[expected_file]
            assert source['sourceDensity'] >= 2 and source['nativeCssSize'][0] == figure['nativeLogicalWidth'], figure
            assert figure['width'] <= source['nativeCssSize'][0] + 0.1, figure
            assert figure['width'] <= figure['nativeLogicalWidth'] + 0.1, figure
            assert figure['links'] == 0 and figure['alt'], figure
            assert figure['captionWidth'] <= 1 and figure['border'] != '0px', figure
        (OUT/f'{locale}-{layout}.json').write_text(json.dumps(state,indent=2)+'\n')
        if layout != 'narrow':
            for part, top in enumerate(range(0,state['height'],2500),1):
                browser(viewport=[width,1000],screenshot=str(OUT/f'{locale}-{layout}-page-{part}.png'),tile=[top,min(2500,state['height']-top)],expression='({url:location.href})')
            for index in range(2):
                browser(viewport=[width,1000],expression=f'''(async()=>{{const f=document.querySelectorAll('figure')[{index}];window.scrollTo({{top:scrollY+f.getBoundingClientRect().top-100,behavior:'instant'}});await new Promise(r=>setTimeout(r,300));return {{url:location.href,figure:{index}}};}})()''',screenshot=str(OUT/f'{locale}-{layout}-figure-{index+1}.png'))
        results.append({'locale':locale,'width':width,'figures':len(state['figures']),'overflow':False,'native_size_and_accessibility':'passed'})
        print(json.dumps(results[-1]),flush=True)
(OUT/'summary.json').write_text(json.dumps(results,indent=2)+'\n')
