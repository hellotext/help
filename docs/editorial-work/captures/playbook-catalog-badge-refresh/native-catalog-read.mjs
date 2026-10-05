import {execFileSync} from 'node:child_process';
import {writeFile} from 'node:fs/promises';
import WebSocket from 'ws';
const port=9462,profile='/private/tmp/hellotext-editorial-recovery-chrome-20261004';
const listener=execFileSync('lsof',['-nP',`-iTCP:${port}`,'-sTCP:LISTEN','-Fpcn'],{encoding:'utf8'});
const pids=[...listener.matchAll(/^p(\d+)$/gm)].map(m=>Number(m[1]));
if(pids.length!==1||!listener.includes(`n127.0.0.1:${port}`))throw Error('listener');
const files=execFileSync('lsof',['-nP','-p',String(pids[0]),'-Fn'],{encoding:'utf8'});
if(!files.split('\n').some(x=>x.startsWith(`n${profile}/`)))throw Error('profile');
const pages=(await(await fetch(`http://127.0.0.1:${port}/json/list`)).json()).filter(x=>x.type==='page');
if(pages.length!==1||new URL(pages[0].url).origin!=='http://127.0.0.1:3193')throw Error('page');
const ws=new WebSocket(pages[0].webSocketDebuggerUrl);await new Promise((r,j)=>{ws.once('open',r);ws.once('error',j)});
let seq=0;const pending=new Map();ws.on('message',m=>{const x=JSON.parse(m);if(pending.has(x.id)){const p=pending.get(x.id);pending.delete(x.id);x.error?p.j(Error(x.error.message)):p.r(x.result)}});
const call=(method,params={})=>new Promise((r,j)=>{const id=++seq;pending.set(id,{r,j});ws.send(JSON.stringify({id,method,params}))});
try {
 const mode=process.argv[2]||'all';if(!['all','plan'].includes(mode))throw Error('mode');
 await call('Emulation.setDeviceMetricsOverride',{width:1100,height:1200,deviceScaleFactor:2,mobile:false});
 await call('Page.navigate',{url:'http://127.0.0.1:3193/hellotext/journeys/new'+(mode==='plan'?'?filter=in_plan':'')});
 await new Promise(r=>setTimeout(r,1800));
 const state=await call('Runtime.evaluate',{expression:`(async()=>{await document.fonts.ready;window.scrollTo(0,0);await new Promise(r=>setTimeout(r,600));return JSON.stringify({url:location.href,title:document.title,locale:document.documentElement.lang,width:innerWidth,height:innerHeight,dpr:devicePixelRatio,zoom:visualViewport.scale,scrollY,account:[...document.querySelectorAll('h2')].some(e=>e.textContent.trim()==='design-system@example.test'),header:[...document.querySelectorAll('h1,h2')].filter(e=>e.getBoundingClientRect().width>0).map(e=>({text:e.innerText,rect:((r)=>[r.x,r.y,r.width,r.height])(e.getBoundingClientRect())})),cards:[...document.querySelectorAll('.catalog-card')].slice(0,4).map(e=>({text:e.innerText,rect:((r)=>[r.x,r.y,r.width,r.height])(e.getBoundingClientRect())})),popularVisible:[...document.querySelectorAll('.catalog-card')].slice(0,3).some(e=>/Popular/.test(e.innerText))})})()`,returnByValue:true,awaitPromise:true});
 if(state.exceptionDetails)throw Error('catalog observation failed');const x=JSON.parse(state.result.value);if(!x.account||x.zoom!==1||x.dpr!==2||x.popularVisible)throw Error('page guard');
 const dest='/private/tmp/hellotext-playbook-badge-refresh-20261005/'+mode+'-'+x.locale+'.state.json';await writeFile(dest,JSON.stringify(x,null,2));console.log(JSON.stringify(x,null,2));

} finally {ws.close()}
