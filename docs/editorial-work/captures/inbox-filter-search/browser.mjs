import {execFileSync} from 'node:child_process';
import {writeFileSync} from 'node:fs';
import WebSocket from 'ws';
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
const args=JSON.parse(process.argv[2]||'{}');
try {
 if(args.url){if(!allowed(args.url))throw Error('URL outside demo');await call('Page.navigate',{url:args.url});await new Promise(r=>setTimeout(r,1800))}
 if(args.viewport){await call('Emulation.setDeviceMetricsOverride',{width:args.viewport[0],height:args.viewport[1],deviceScaleFactor:2,mobile:false});await new Promise(r=>setTimeout(r,450))}
 await evaluate('document.fonts.ready.then(()=>true)');
 if(args.hover){await call('Input.dispatchMouseEvent',{type:'mouseMoved',x:args.hover[0],y:args.hover[1]});await new Promise(r=>setTimeout(r,500))}
 if(args.expression) console.log(JSON.stringify(await evaluate(args.expression)));
 else console.log(JSON.stringify(await evaluate(`({url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,text:document.body.innerText.slice(0,6500),fonts:document.fonts.status})`)));
 if(args.screenshot){
  const identity = await evaluate(`(async()=>{const r=await fetch('/hellotext/journeys/new');const d=new DOMParser().parseFromString(await r.text(),'text/html');return [...d.querySelectorAll('h2')].some(e=>e.textContent.trim()==='design-system@example.test')})()`);
  if(!identity)throw Error('Fictional identity mismatch');
  if(args.locale && await evaluate('document.documentElement.lang')!==args.locale)throw Error('Locale mismatch');
  if(args.text && !await evaluate(`document.body.innerText.includes(${JSON.stringify(args.text)})`))throw Error('Expected target missing');

  const before=await evaluate('({url:location.href,title:document.title,dpr:devicePixelRatio,zoom:visualViewport.scale,width:innerWidth,height:innerHeight})');
  if(!allowed(before.url)||before.dpr<2||before.zoom!==1)throw Error('Capture scope or density mismatch');
  const params={format:'png',fromSurface:true,captureBeyondViewport:!!args.full||!!args.tile};
  if(args.clip){params.clip={x:args.clip[0],y:args.clip[1],width:args.clip[2],height:args.clip[3],scale:2}}
  if(args.full){const m=await call('Page.getLayoutMetrics');params.clip={x:0,y:0,width:m.cssContentSize.width,height:m.cssContentSize.height,scale:1}}
  if(args.tile){const m=await call('Page.getLayoutMetrics');params.clip={x:0,y:args.tile[0],width:m.cssContentSize.width,height:args.tile[1],scale:1}}
  const shot=await call('Page.captureScreenshot',params);const after=await evaluate('({url:location.href,title:document.title,dpr:devicePixelRatio,zoom:visualViewport.scale,width:innerWidth,height:innerHeight})');
  if(JSON.stringify(before)!==JSON.stringify(after))throw Error('Capture state changed');
  const png=Buffer.from(shot.data,'base64');
  if(png.subarray(0,8).toString('hex')!=='89504e470d0a1a0a')throw Error('Capture is not PNG');
  const captureScale=params.clip?.scale??1;
  const clip=params.clip?[params.clip.x,params.clip.y,params.clip.width,params.clip.height]:[0,0,before.width,before.height];
  const pixelSize=[png.readUInt32BE(16),png.readUInt32BE(20)];
  const nativeDensity=pixelSize[0]/clip[2];
  if(pixelSize.some((value,index)=>Math.abs(value-clip[index+2]*before.dpr*captureScale)>1))throw Error('PNG density does not match compositor parameters');
  writeFileSync(args.screenshot,png);
  const meta=execFileSync('sips',['-g','profile','-g','pixelWidth','-g','pixelHeight',args.screenshot],{encoding:'utf8'});
  if(!meta.includes('profile: Display P3'))throw Error('Missing genuine P3');
  console.log(meta);
  writeFileSync(args.screenshot.replace('.png','.json'),JSON.stringify({url:before.url,title:before.title,locale:args.locale,identity:'design-system@example.test',cssViewport:[before.width,before.height],browserDpr:before.dpr,clip,captureScale,pixelSize,nativeDensity,icc:'Display P3',route:'isolated Chrome compositor via CDP',target:args.text},null,2));
 }
} finally {ws.close()}
