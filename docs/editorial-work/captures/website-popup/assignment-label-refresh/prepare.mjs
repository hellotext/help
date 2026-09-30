import WebSocket from '/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help/node_modules/ws/index.js';
import { execFileSync } from 'node:child_process';
const [url, width = '1200', height = '1000', mode = 'inspect'] = process.argv.slice(2);
if (!url?.startsWith('http://127.0.0.1:3192/hellotext/capture/popup/')) throw Error('Unexpected route');
const profile = '/private/tmp/hellotext-forms-ui-refresh-headless-9460';
const owner = execFileSync('lsof', ['-nP', '-iTCP:9460', '-sTCP:LISTEN', '-Fpcn'], {encoding:'utf8'});
const pids = [...owner.matchAll(/^p(\d+)$/gm)].map(x=>x[1]);
if (pids.length !== 1 || !owner.includes('n127.0.0.1:9460')) throw Error('Unexpected CDP owner');
if (!execFileSync('lsof', ['-nP','-p',pids[0],'-Fn'], {encoding:'utf8'}).includes(`n${profile}/`)) throw Error('Wrong profile');
const pages = (await (await fetch('http://127.0.0.1:9460/json/list')).json()).filter(x=>x.type==='page');
if (pages.length !== 1 || new URL(pages[0].url).origin !== 'http://127.0.0.1:3192') throw Error('Wrong demo tab');
const socket = new WebSocket(pages[0].webSocketDebuggerUrl);
await new Promise((resolve,reject)=>{socket.once('open',resolve);socket.once('error',reject)});
let seq=0;const pending=new Map();
socket.on('message',data=>{const x=JSON.parse(data);const p=pending.get(x.id);if(p){pending.delete(x.id);x.error?p.reject(Error(x.error.message)):p.resolve(x.result)}});
const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++seq;pending.set(id,{resolve,reject});socket.send(JSON.stringify({id,method,params}))});
try {
  await call('Emulation.setDeviceMetricsOverride',{width:Number(width),height:Number(height),deviceScaleFactor:2,mobile:false});
  await call('Page.navigate',{url});
  await new Promise(r=>setTimeout(r,1500));
  const response=await call('Runtime.evaluate',{expression:`(async()=>{
    await document.fonts.ready;
    const r=await fetch('/hellotext/journeys/new',{credentials:'same-origin'});
    const d=new DOMParser().parseFromString(await r.text(),'text/html');
    if(location.href!==${JSON.stringify(url)}||!document.title.includes('Hellotext')||![...d.querySelectorAll('h2')].some(e=>e.textContent.trim()==='design-system@example.test'))throw Error('Demo identity failed');
    const mode=${JSON.stringify(mode)};
    const locale=document.documentElement.lang;
    const click=e=>{if(!e)throw Error('Missing target');e.click()};
    if(mode!=='assignment')throw Error('Only assignment inspection is supported');
    click(document.querySelector('#coupons-dropdown [data-custom-dropdown-target="placeholder"]'));
    click(document.querySelector('#coupons-dropdown li[data-coupon]:not([data-coupon=""])'));
    await new Promise(r=>setTimeout(r,300));
    await new Promise(r=>setTimeout(r,350));
    const rect=e=>{if(!e)return null;const r=e.getBoundingClientRect();return [r.x,r.y,r.width,r.height]};
    const visible=e=>!!e.getBoundingClientRect().width && !!e.getClientRects().length && getComputedStyle(e).visibility!=='hidden';
    return JSON.stringify({url:location.href,title:document.title,locale,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,
      labels:[...document.querySelectorAll('p.default__label')].map(e=>({text:e.innerText,rect:rect(e),fontSize:getComputedStyle(e).fontSize,lineHeight:getComputedStyle(e).lineHeight,fontWeight:getComputedStyle(e).fontWeight})),panels:['coupons-dropdown','journeys-dropdown'].map(id=>({target:id,rect:rect(document.getElementById(id))})),
      text:document.body.innerText.slice(0,5000)});
  })()`,returnByValue:true,awaitPromise:true});
  if(response.exceptionDetails)throw Error(response.exceptionDetails.exception?.description?.split('\n')[0] || 'Demo inspection failed');
  console.log(response.result.value);
}finally{socket.close()}
