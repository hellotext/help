import WebSocket from '/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help/node_modules/ws/index.js';
import { execFileSync } from 'node:child_process';
const [url, width = '1200', height = '1000', mode = 'inspect'] = process.argv.slice(2);
if (!/^http:\/\/127\.0\.0\.1:3192\/hellotext\/playbooks\/(property-collector|subscriber-booster)\/new\?component=property_collection$/.test(url || '')) throw Error('Unexpected route');
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
 await call('Page.navigate',{url});await new Promise(r=>setTimeout(r,1800));
 const response=await call('Runtime.evaluate',{expression:`(async()=>{
 await document.fonts.ready;
 const d=new DOMParser().parseFromString(await (await fetch('/hellotext/journeys/new',{credentials:'same-origin'})).text(),'text/html');
 if(location.href!==${JSON.stringify(url)}||![...d.querySelectorAll('h2')].some(e=>e.textContent.trim()==='design-system@example.test'))throw Error('Wrong fictitious account');
 const form=document.querySelector('#property-collection-component-form');
 if(!form||!form.getBoundingClientRect().width)throw Error('Missing property form');
 if(${JSON.stringify(mode)}==='fields'){
 const root=form.closest('[data-controller="playbook--property-collection"]');
 for(const kind of ['name','email']){form.querySelector('.playbook-property-collection-select').click();await new Promise(r=>setTimeout(r,100));const option=root.querySelector('[data-playbook--property-collection-target="option"][data-kind="'+kind+'"]');if(!option)throw Error('Missing safe property');option.click();await new Promise(r=>setTimeout(r,100));}
 const name=root.querySelector('[data-playbook--property-collection-target="property"][data-id="name"]');
 const toggle=name.querySelector('[data-property-must-collect-toggle]');if(!toggle.checked)toggle.click();
 }
 document.activeElement?.blur();await new Promise(r=>setTimeout(r,250));
 const rect=e=>{const r=e.getBoundingClientRect();return [r.x,r.y,r.width,r.height]};
 const items=[...form.querySelectorAll('[data-playbook--property-collection-target="property"]')];
 return JSON.stringify({url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,
 form:rect(form),main:rect(form.querySelector('main')),header:rect(form.querySelector('header')||form.querySelector('main').firstElementChild),titleBounds:[...form.querySelectorAll('h1,h2,h3')].map(e=>({text:e.innerText,rect:rect(e)})),
 notice:form.querySelector('[data-property-collector-disabled-notice]')?.innerText,
 rows:items.map(e=>({rect:rect(e),text:e.innerText,important:e.querySelector('[data-property-must-collect-toggle]').checked,avatar:rect(e.querySelector('[data-avatar]'))})),text:form.innerText,html:form.outerHTML});
 })()`,returnByValue:true,awaitPromise:true});
 if(response.exceptionDetails)throw Error(response.exceptionDetails.exception?.description?.split('\n')[0]||'Inspection failed');
 console.log(response.result.value);
}finally{socket.close()}
