import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent
RECORDS = ROOT / 'help-visual-batch/docs/editorial-work/captures/message-delivery-failure/page-review'
RECORDS.mkdir(exist_ok=True)
results = []
for locale, route in [('es', 'es/por-que-no-se-envio-un-mensaje'), ('en', 'why-a-message-did-not-send')]:
    for label, width in [('desktop', 1440), ('narrow', 580), ('mobile', 390)]:
        if (RECORDS/f'{locale}-{label}.json').exists() and (label=='narrow' or (RECORDS/f'{locale}-{label}-figure-4.png').exists()):
            results.append({'locale':locale,'viewport':width,'figures':4,'overflow':False,'density_and_native_size':'passed'})
            continue
        expression = '''(async()=>{
          for(let y=0;y<document.documentElement.scrollHeight;y+=700){window.scrollTo({top:y,behavior:'instant'});await new Promise(r=>setTimeout(r,120));}
          await new Promise(r=>setTimeout(r,900));
          for(const i of document.querySelectorAll('figure img')){
          i.scrollIntoView({behavior:'instant',block:'center'});
          await new Promise(r=>setTimeout(r,450));
          for(let n=0;(!i.complete||!i.naturalWidth)&&n<40;n++)await new Promise(r=>setTimeout(r,100));
          await Promise.race([i.decode(),new Promise((_,reject)=>setTimeout(()=>reject(Error('Image load timeout')),10000))]);
          }window.scrollTo({top:0,behavior:'instant'});await new Promise(r=>setTimeout(r,250));
          return {url:location.href,viewport:[innerWidth,innerHeight],height:document.documentElement.scrollHeight,overflow:document.documentElement.scrollWidth>innerWidth,
          figures:[...document.querySelectorAll('figure')].map(f=>{const i=f.querySelector('img');const c=f.querySelector('figcaption');const s=f.querySelector('.ht-editorial-visual__stage');
            return {src:i.currentSrc,alt:i.alt,width:i.getBoundingClientRect().width,natural:i.naturalWidth,links:f.querySelectorAll('a').length,
              stage:s.getBoundingClientRect().toJSON(),border:getComputedStyle(s).borderWidth,padding:getComputedStyle(s).padding,
              captionBox:c.getBoundingClientRect().toJSON(),captionClip:getComputedStyle(c).clipPath};})};})()'''
        args = {'url': f'http://127.0.0.1:4197/{route}.html', 'viewport':[width,1000],
                'expression':expression, 'screenshot':str(RECORDS/f'{locale}-{label}-full.png'), 'full':True}
        if label=='mobile':
            del args['screenshot']
            del args['full']
        output = subprocess.check_output(['node',str(ROOT/'help-browser.mjs'),json.dumps(args)],text=True)
        state = json.loads(output.splitlines()[0])
        assert not state['overflow'] and len(state['figures'])==4
        for figure in state['figures']:
            assert figure['width']<=figure['natural']+0.1 and figure['links']==0
            assert figure['alt'] and figure['captionBox']['width']<=1 and figure['border']!='0px'
        (RECORDS/f'{locale}-{label}.json').write_text(json.dumps(state,indent=2)+'\n')
        if label=='mobile':
            for part, top in enumerate(range(0,state['height'],3000),1):
                tile={'viewport':[width,1000],'screenshot':str(RECORDS/f'{locale}-{label}-part-{part}.png'),'tile':[top,min(3000,state['height']-top)]}
                subprocess.check_output(['node',str(ROOT/'help-browser.mjs'),json.dumps(tile)],text=True)
        if label != 'narrow':
            for index in range(4):
                expr = '''(async()=>{const f=document.querySelectorAll('figure')[INDEX];
                  window.scrollTo({top:scrollY+f.getBoundingClientRect().top-110,behavior:'instant'});
                  await f.querySelector('img').decode();await new Promise(r=>setTimeout(r,250));
                  return {url:location.href,figure:INDEX,rect:f.getBoundingClientRect().toJSON(),source:f.querySelector('img').currentSrc};})()'''.replace('INDEX',str(index))
                args={'viewport':[width,1000],'expression':expr,'screenshot':str(RECORDS/f'{locale}-{label}-figure-{index+1}.png')}
                out=subprocess.check_output(['node',str(ROOT/'help-browser.mjs'),json.dumps(args)],text=True)
                assert json.loads(out.splitlines()[0])['rect']['top']>=0
        results.append({'locale':locale,'viewport':width,'figures':4,'overflow':False,'density_and_native_size':'passed'})
        print(json.dumps(results[-1]),flush=True)
(RECORDS/'summary.json').write_text(json.dumps(results,indent=2)+'\n')
