import WebSocket from '/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help/node_modules/ws/index.js';
import { execFileSync } from 'node:child_process';
import { mkdir, writeFile } from 'node:fs/promises';

const port = 9452;
const profile='/private/tmp/hellotext-subscriber-help-review-9452';
const owner=execFileSync('lsof',['-nP','-iTCP:9452','-sTCP:LISTEN','-Fpcn'],{encoding:'utf8'});
const pids=[...owner.matchAll(/^p(\d+)$/gm)].map(x=>x[1]);
if(pids.length!==1||!owner.includes('n127.0.0.1:9452')||!execFileSync('lsof',['-nP','-p',pids[0],'-Fn'],{encoding:'utf8'}).includes(`n${profile}/`))throw Error('Wrong isolated review profile');
const output = '/private/tmp/hellotext-property-style-refresh/page-review';
await mkdir(output, { recursive: true });
const targets = await (await fetch(`http://127.0.0.1:${port}/json/list`)).json();
const pages = targets.filter((target) => target.type === 'page');
if (pages.length !== 1 || !(pages[0].url.startsWith('http://127.0.0.1:4191/')||pages[0].url.startsWith('https://help.hellotext.com/'))) throw new Error('Unexpected local review tab');
const socket = new WebSocket(pages[0].webSocketDebuggerUrl);
await new Promise((resolve, reject) => { socket.once('open', resolve); socket.once('error', reject); });
let nextId = 0;
const pending = new Map();
socket.on('message', (raw) => {
  const response = JSON.parse(raw);
  const current = pending.get(response.id);
  if (!current) return;
  pending.delete(response.id);
  response.error ? current.reject(new Error(response.error.message)) : current.resolve(response.result);
});
const call = (method, params = {}) => new Promise((resolve, reject) => {
  const id = ++nextId;
  pending.set(id, { resolve, reject });
  socket.send(JSON.stringify({ id, method, params }));
});
const evaluate = async (expression) => {
  const result = await call('Runtime.evaluate', { expression, returnByValue: true, awaitPromise: true });
  if (result.exceptionDetails) throw new Error('Page evaluation failed');
  return result.result.value;
};
for (const [locale, path] of [['es', '/es/recolector-propiedades.html'], ['en', '/property-collector-playbook.html']]) {
  for (const [device, width, height] of [['desktop', 1440, 1000], ['mobile', 390, 844], ['narrow', 580, 900]]) {
    await call('Emulation.setDeviceMetricsOverride', { width, height, deviceScaleFactor: 2, mobile: false });
    await call('Page.navigate', { url: `http://127.0.0.1:4191${path}` });
    await new Promise((resolve) => setTimeout(resolve, 750));
    await evaluate(`(async()=>{await document.fonts.ready;const imgs=[...document.querySelectorAll('figure img')];for(const i of imgs){i.loading='eager';if(!i.complete)await new Promise((r,j)=>{i.onload=r;i.onerror=j});}})()`);
    const page = await evaluate(`(() => ({url:location.href,lang:document.documentElement.lang,title:document.title,width:innerWidth,
      figures:[...document.querySelectorAll('figure.ht-editorial-visual')].map((figure,i)=>{
        const image=figure.querySelector('img');const frame=figure.querySelector('.ht-editorial-visual__stage');
        const rect=figure.getBoundingClientRect();const imageRect=image.getBoundingClientRect();
        return {i,top:Math.round(rect.top+scrollY),height:Math.round(rect.height),figWidth:Math.round(rect.width),
          imageWidth:imageRect.width,naturalWidth:image.naturalWidth,src:image.currentSrc,
          whiteFrameWidth:figure.querySelector('.ht-editorial-visual__image-frame').getBoundingClientRect().width,
          frameWidth:Math.round(frame.getBoundingClientRect().width),caption:figure.querySelector('figcaption')?.textContent.trim()};
      }),scrollWidth:document.documentElement.scrollWidth}))()`);
    if (page.url !== `http://127.0.0.1:4191${path}` || page.lang !== locale || page.width !== width || page.figures.length !== 6) {
      throw new Error(`Bad page state ${locale} ${device}: ${JSON.stringify(page)}`);
    }
    for (const figure of page.figures.filter(f=>[0,1,2,3,4,5].includes(f.i))) {

      await evaluate(`window.scrollTo(0,${Math.max(0, figure.top - 80)})`);
      await new Promise((resolve) => setTimeout(resolve, 150));
      const loaded = await evaluate(`(async()=>{const image=document.querySelectorAll('figure.ht-editorial-visual')[${figure.i}].querySelector('img');if(!image.complete)await new Promise((resolve,reject)=>{image.onload=resolve;image.onerror=reject});return {src:image.currentSrc,width:image.naturalWidth}})()`);
      if (loaded.width < 100 || !loaded.src.includes('/images/captures/')) throw new Error(`Image failed to load ${locale} ${device} ${figure.i}`);
      const shot = await call('Page.captureScreenshot', { format: 'png', fromSurface: true, captureBeyondViewport: false });
      await writeFile(`${output}/${locale}-${device}-${figure.i}.png`, Buffer.from(shot.data, 'base64'));
    }
    await evaluate('window.scrollTo(0,document.documentElement.scrollHeight)');
    const bottom=await call('Page.captureScreenshot',{format:'png',fromSurface:true,captureBeyondViewport:false});
    await writeFile(`${output}/${locale}-${device}-bottom.png`,Buffer.from(bottom.data,'base64'));
    await writeFile(`${output}/${locale}-${device}.json`,JSON.stringify(page,null,2));
    console.log(JSON.stringify({locale,device,...page}));
  }
}
socket.close();
