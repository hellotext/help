import {execFileSync} from 'node:child_process';
import {writeFileSync,readFileSync} from 'node:fs';
import WebSocket from '/Users/pel/Documents/Codex/2026-10-06/task-8/current-app-capture/app/node_modules/ws/index.js';
const port=9489, profile='/Users/pel/Documents/Codex/2026-10-06/task-8/current-app-capture/chrome';
if (process.argv[2] === '--check-only') {
 console.log(JSON.stringify({helper:import.meta.url,dependency:'ws',port,profile,check:'passed'}));
 process.exit(0);
}
const listener=execFileSync('lsof',['-nP',`-iTCP:${port}`,'-sTCP:LISTEN','-Fpcn'],{encoding:'utf8'});
const pids=[...listener.matchAll(/^p(\d+)$/gm)].map(m=>m[1]);
if(pids.length!==1 || !listener.includes(`n127.0.0.1:${port}`)) throw Error('Browser owner mismatch');
const files=execFileSync('lsof',['-nP','-p',pids[0],'-Fn'],{encoding:'utf8'});
if(!files.split('\n').some(l=>l.startsWith(`n${profile}/`))) throw Error('Browser profile mismatch');
const allowed=url=>['http://127.0.0.1:3298','http://127.0.0.1:3298'].includes(new URL(url).origin);
const pages=(await(await fetch(`http://127.0.0.1:${port}/json/list`)).json()).filter(t=>t.type==='page');
if(pages.length!==1 || !allowed(pages[0].url)) throw Error('Tab scope mismatch');
const ws=new WebSocket(pages[0].webSocketDebuggerUrl);
await new Promise((ok,no)=>{ws.once('open',ok);ws.once('error',no)});
let seq=0;const pending=new Map();
ws.on('message',raw=>{const r=JSON.parse(raw);const p=pending.get(r.id);if(p){pending.delete(r.id);r.error?p[1](Error(r.error.message)):p[0](r.result)}});
const call=(method,params={})=>new Promise((ok,no)=>{const id=++seq;pending.set(id,[ok,no]);ws.send(JSON.stringify({id,method,params}))});
const evaluate=async expression=>{const r=await call('Runtime.evaluate',{expression,returnByValue:true,awaitPromise:true});if(r.exceptionDetails)throw Error(JSON.stringify(r.exceptionDetails));return r.result.value};
const args=JSON.parse(readFileSync(process.argv[2],'utf8'));
try {
 if(!args.viewport)throw Error('Explicit intended viewport is required');
 await call('Emulation.setDeviceMetricsOverride',{width:args.viewport[0],height:args.viewport[1],deviceScaleFactor:2,mobile:false});
 await call('Emulation.setFocusEmulationEnabled',{enabled:true});
 await new Promise(r=>setTimeout(r,450));
 if(args.url){if(!allowed(args.url))throw Error('URL outside demo');await call('Page.navigate',{url:args.url});await new Promise(r=>setTimeout(r,1800))}
 await evaluate('document.fonts.ready.then(()=>true)');
 if(args.hover){await call('Input.dispatchMouseEvent',{type:'mouseMoved',x:args.hover[0],y:args.hover[1]});await new Promise(r=>setTimeout(r,500))}
 if(args.expression) console.log(JSON.stringify(await evaluate(args.expression)));
 else console.log(JSON.stringify(await evaluate(`({url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,text:document.body.innerText.slice(0,6500),fonts:document.fonts.status})`)));
 if(args.screenshot){
  const identity = await evaluate(`(async()=>{const r=await fetch('/hellotext/journeys/new');const d=new DOMParser().parseFromString(await r.text(),'text/html');return [...d.querySelectorAll('h2')].some(e=>e.textContent.trim()==='design-system@example.test')})()`);
  if(!identity)throw Error('Fictional identity mismatch');
  if(args.locale && await evaluate('document.documentElement.lang')!==args.locale)throw Error('Locale mismatch');
  if(args.text && !await evaluate(`document.body.innerText.includes(${JSON.stringify(args.text)})`))throw Error('Expected target missing');

  if(args.typeSearch){
   const point=await evaluate(`(()=>{const e=document.querySelector('input[type=search]'); const r=e.getBoundingClientRect();if(!r.width)throw Error('Search not visible');return [r.x+24,r.y+r.height/2]})()`);
   await call('Input.dispatchMouseEvent',{type:'mousePressed',x:point[0],y:point[1],button:'left',clickCount:1});
   await call('Input.dispatchMouseEvent',{type:'mouseReleased',x:point[0],y:point[1],button:'left',clickCount:1});
   await call('Input.insertText',{text:args.typeSearch});
   await new Promise(r=>setTimeout(r,900));
   await call('Input.dispatchMouseEvent',{type:'mouseMoved',x:args.viewport[0]-2,y:2});
   await call('Input.dispatchKeyEvent',{type:'keyDown',key:'ArrowLeft',code:'ArrowLeft',windowsVirtualKeyCode:37});
   await call('Input.dispatchKeyEvent',{type:'keyUp',key:'ArrowLeft',code:'ArrowLeft',windowsVirtualKeyCode:37});
   await call('Input.dispatchKeyEvent',{type:'keyDown',key:'ArrowRight',code:'ArrowRight',windowsVirtualKeyCode:39});
   await call('Input.dispatchKeyEvent',{type:'keyUp',key:'ArrowRight',code:'ArrowRight',windowsVirtualKeyCode:39});
   const focus=await evaluate(`(()=>{const e=document.querySelector('input[type=search]');return {focused:document.activeElement===e,value:e.value,start:e.selectionStart,end:e.selectionEnd}})()`);
   if(!focus.focused||focus.value!==args.typeSearch||focus.start!==args.typeSearch.length||focus.end!==args.typeSearch.length)throw Error('Native search input/caret state mismatch');
  }
  let menuEvidence=null;
  if(args.menuSection){
   if(!['users-filters','labels-filters'].includes(args.menuSection))throw Error('Unapproved screenshot section');
   menuEvidence=await evaluate(`(()=>{const e=document.getElementById(${JSON.stringify(args.menuSection)});const pop=e.closest('[popover]');const r=e.getBoundingClientRect();const forbidden=document.getElementById('my_unread-filter').getBoundingClientRect();return {open:pop.matches(':popover-open'),section:${JSON.stringify(args.menuSection)},bounds:r.toJSON(),menu:pop.getBoundingClientRect().toJSON(),forbidden:forbidden.toJSON(),text:e.innerText,submenu:(()=>{const q=e.querySelector('[popover]');return q&&q.matches(':popover-open')?{id:q.id,bounds:q.getBoundingClientRect().toJSON(),text:q.innerText}:null})()}})()`);
   if(!menuEvidence.open||menuEvidence.bounds.width<1)throw Error('Expected native menu section not open');
   const r=menuEvidence.bounds;
   const sub=menuEvidence.submenu?.bounds;
   if(args.requireSubmenu&&!sub)throw Error('Native chooser not open');
   const right=Math.max(menuEvidence.menu.right,sub?.right||0)+18;
   const x=8;
   const top=Math.floor(Math.min(r.top,sub?.top||r.top)-(args.menuSection==='labels-filters'?45:8));
   const bottom=Math.max(menuEvidence.menu.bottom+18,sub?sub.bottom+18:0);
   args.clip=[x,top,Math.min(args.viewport[0]-8,Math.ceil(right))-x,Math.ceil(bottom)-top];
   if(args.clip[1]<=menuEvidence.forbidden.bottom)throw Error('Development-only state option would enter candidate');
  }
  const before=await evaluate('({url:location.href,title:document.title,dpr:devicePixelRatio,zoom:visualViewport.scale,width:innerWidth,height:innerHeight,search:(()=>{const e=document.querySelector("input[type=search]");return e?{value:e.value,focused:document.activeElement===e,start:e.selectionStart,end:e.selectionEnd}:null})()})');
  if(before.title!==({es:'Bandeja | Hellotext',en:'Inbox | Hellotext'})[args.locale])throw Error('Exact expected page title mismatch');
  if(!args.clip||args.clip[0]<0||args.clip[1]<0||args.clip[0]+args.clip[2]>before.width||args.clip[1]+args.clip[3]>before.height)throw Error('Clip outside real viewport');
  if(!allowed(before.url)||before.dpr!==2||before.zoom!==1||before.width!==args.viewport[0]||before.height!==args.viewport[1])throw Error('Capture scope or density mismatch');
  const params={format:'png',fromSurface:true,captureBeyondViewport:!!args.full||!!args.tile};
  if(args.clip){params.clip={x:args.clip[0],y:args.clip[1],width:args.clip[2],height:args.clip[3],scale:2}}
  if(args.full){const m=await call('Page.getLayoutMetrics');params.clip={x:0,y:0,width:m.cssContentSize.width,height:m.cssContentSize.height,scale:1}}
  if(args.tile){const m=await call('Page.getLayoutMetrics');params.clip={x:0,y:args.tile[0],width:m.cssContentSize.width,height:args.tile[1],scale:1}}
  const shot=await call('Page.captureScreenshot',params);const after=await evaluate('({url:location.href,title:document.title,dpr:devicePixelRatio,zoom:visualViewport.scale,width:innerWidth,height:innerHeight,search:(()=>{const e=document.querySelector("input[type=search]");return e?{value:e.value,focused:document.activeElement===e,start:e.selectionStart,end:e.selectionEnd}:null})()})');
  if(JSON.stringify(before)!==JSON.stringify(after))throw Error('Capture state changed');
  writeFileSync(args.screenshot,Buffer.from(shot.data,'base64'));
  const meta=execFileSync('sips',['-g','profile','-g','pixelWidth','-g','pixelHeight',args.screenshot],{encoding:'utf8'});
  if(!meta.includes('profile: Display P3'))throw Error('Missing genuine P3');
  console.log(meta);
  writeFileSync(args.screenshot.replace('.png','.json'),JSON.stringify({url:before.url,title:before.title,locale:args.locale,identity:'design-system@example.test',cssViewport:[before.width,before.height],browserDpr:before.dpr,clip:args.clip,captureScale:2,nativeDensity:4,icc:'Display P3',route:'isolated Chrome compositor via CDP',target:args.text,before,after,menuEvidence,nativeInput:args.typeSearch??null,limitations:args.typeSearch?['Real input and native focused caret only; Elasticsearch unavailable, matching search result not demonstrated.']:[]},null,2));
 }
} finally {ws.close()}
