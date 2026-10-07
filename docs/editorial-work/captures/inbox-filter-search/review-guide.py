"""Review the real built guide through the dedicated localhost-only Chrome."""
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent
OUT = ROOT / 'page-review'
OUT.mkdir(exist_ok=True)
BROWSER = ROOT / 'review-browser.mjs'

def browser(**args):
    output = subprocess.check_output(['node', str(BROWSER), json.dumps(args)], text=True)
    return json.loads(output.splitlines()[0])

results = []
for locale, route in [('es', 'es/filtrar-buscar-conversaciones-inbox'), ('en', 'filter-and-search-inbox')]:
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
        assert len(state['figures']) == 3, state
        for figure in state['figures']:
            assert figure['width'] <= figure['nativeLogicalWidth'] + 0.1, figure
            assert figure['links'] == 0 and figure['alt'], figure
            assert figure['captionWidth'] <= 1 and figure['border'] != '0px', figure
        (OUT/f'{locale}-{layout}.json').write_text(json.dumps(state,indent=2)+'\n')
        if layout != 'narrow':
            for part, top in enumerate(range(0,state['height'],2500),1):
                browser(viewport=[width,1000],screenshot=str(OUT/f'{locale}-{layout}-page-{part}.png'),tile=[top,min(2500,state['height']-top)],expression='({url:location.href})')
            for index in range(3):
                browser(viewport=[width,1000],expression=f'''(async()=>{{const f=document.querySelectorAll('figure')[{index}];window.scrollTo({{top:scrollY+f.getBoundingClientRect().top-100,behavior:'instant'}});await new Promise(r=>setTimeout(r,300));return {{url:location.href,figure:{index}}};}})()''',screenshot=str(OUT/f'{locale}-{layout}-figure-{index+1}.png'))
        results.append({'locale':locale,'width':width,'figures':len(state['figures']),'overflow':False,'native_size_and_accessibility':'passed'})
        print(json.dumps(results[-1]),flush=True)
(OUT/'summary.json').write_text(json.dumps(results,indent=2)+'\n')
