import argparse
import json
import math
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent
HELP = ROOT.parents[3]
parser = argparse.ArgumentParser(description='Recapture the isolated message-failure fixtures.')
parser.add_argument('locale', choices=('es', 'en'))
parser.add_argument('cases', nargs='*', choices=('retry', 'unsubscribed', 'converted'))
parser.add_argument('--output-dir', type=Path, help='Write new PNGs and metadata outside accepted evidence.')
parser.add_argument('--check-only', action='store_true', help='Check checked-in paths and the browser dependency without connecting.')
options = parser.parse_args()
LOCALE = options.locale
CASES = [('retry', 'nMNaOZrd'), ('unsubscribed', 'EqZvKQrp'), ('converted', '31Qb3NX0')]
RECORDS = options.output_dir.resolve() if options.output_dir else ROOT
IMAGES = RECORDS if options.output_dir else HELP / 'images/editorial/message-delivery-failure'
assert (HELP / 'script/capture_isolated_chrome.mjs').is_file(), 'Missing checkout capture script'
assert (ROOT / 'help-browser.mjs').is_file(), 'Missing browser helper'
if options.check_only:
    subprocess.run(['node', str(ROOT / 'help-browser.mjs'), '--check-only'], check=True)
    print(json.dumps({'checkout': str(HELP), 'records': str(RECORDS), 'images': str(IMAGES)}))
    raise SystemExit(0)
RECORDS.mkdir(parents=True, exist_ok=True)
IMAGES.mkdir(parents=True, exist_ok=True)

for case, conversation in CASES:
    if options.cases and case not in options.cases:
        continue
    for layout, viewport in [('desktop', [1200, 1000]), ('mobile', [430, 900])]:
        expression = '''(async()=>{
          for(let n=0;!document.querySelector('article[id^=message_]')&&n<100;n++)await new Promise(r=>setTimeout(r,100));
          const messages=[...document.querySelectorAll('article[id^=message_]')].filter(e=>e.getBoundingClientRect().width);
          if(messages.length!==1)throw Error('Expected one fictional message');
          const m=messages[0];
          const buttons=[...m.querySelectorAll('button')].filter(e=>e.getBoundingClientRect().width&&['Reintentar','Try again'].includes(e.innerText.trim()));
          if(RETRY){
            if(buttons.length!==1||buttons[0].type!=='button')throw Error('Expected menu-only trigger');
            buttons[0].click();
            await new Promise(r=>setTimeout(r,450));
          }else if(buttons.length)throw Error('Unexpected retry option');
          const panels=[...m.querySelectorAll('[popover]:popover-open')];
          if(RETRY&&panels.length!==1)throw Error('Retry menu did not open');
          return {url:location.href,title:document.title,locale:document.documentElement.lang,message:m.innerText,
            rect:m.getBoundingClientRect().toJSON(),panels:panels.map(e=>({id:e.id,text:e.innerText,rect:e.getBoundingClientRect().toJSON()})),
            submission:false};
        })()'''.replace('RETRY', 'true' if case == 'retry' else 'false')
        url = f'http://127.0.0.1:3291/hellotext/inbox/{conversation}'
        args = {'url': url, 'viewport': viewport, 'expression': expression}
        state = json.loads(subprocess.check_output(['node', str(ROOT / 'help-browser.mjs'), json.dumps(args)], text=True))
        assert state['locale'] == LOCALE
        rects = [state['rect']] + [p['rect'] for p in state['panels']]
        top = math.floor(min(r['top'] for r in rects) - (6 if case == 'retry' else 12))
        bottom = math.ceil(max(r['bottom'] for r in rects) + 12)
        clip = [496, top, 392, bottom-top] if layout == 'desktop' else [12, top, 406, bottom-top]
        target = state['panels'][0]['text'].splitlines()[0] if case == 'retry' else state['message'].splitlines()[-1]
        name = f'{case}-{LOCALE}-{layout}'
        command = ['node', 'script/capture_isolated_chrome.mjs', '--port=9475',
            '--profile=/private/tmp/hellotext-help-batch-chrome-20261007', f'--url={url}',
            f'--title={state["title"]}', '--email=design-system@example.test', f'--text={target}',
            f'--locale={LOCALE}', '--viewport='+','.join(map(str,viewport)), '--clip='+','.join(map(str,clip)),
            '--scale=2', '--identity-url=http://127.0.0.1:3291/hellotext/journeys/new',
            f'--output={IMAGES / (name + ".png")}']
        result = json.loads(subprocess.check_output(command, cwd=HELP, text=True))
        result['visible_state'] = state
        (RECORDS / f'{name}.json').write_text(json.dumps(result, indent=2, ensure_ascii=False)+'\n')
        print(json.dumps({'capture':name,'pixels':result['pixelSize'],'clip':clip,'sha256':result['sha256']}), flush=True)
