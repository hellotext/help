import {execFileSync} from 'node:child_process';
import {readFileSync,writeFileSync} from 'node:fs';
import WebSocket from 'ws';
const config=JSON.parse(readFileSync(new URL('./revision-config.json',import.meta.url),'utf8'));
const port=config.browser_port,profile=config.browser_profile,previewOrigin=config.preview_origin;
const safeOrigin=value=>{const u=new URL(value);return u.protocol==='http:'&&u.hostname==='127.0.0.1'&&u.port&&u.origin===value};
if(![previewOrigin,...config.bootstrap_origins].every(safeOrigin))throw Error('Review origins must be exact loopback origins');
if (process.argv[2] === '--check-only') {
 console.log(JSON.stringify({helper:import.meta.url,dependency:'ws',port,profile,check:'passed'}));
 process.exit(0);
}
const listener=execFileSync('lsof',['-nP',`-iTCP:${port}`,'-sTCP:LISTEN','-Fpcn'],{encoding:'utf8'});
const pids=[...listener.matchAll(/^p(\d+)$/gm)].map(m=>m[1]);
if(pids.length!==1 || !listener.includes(`n127.0.0.1:${port}`)) throw Error('Browser owner mismatch');
const files=execFileSync('lsof',['-nP','-p',pids[0],'-Fn'],{encoding:'utf8'});
if(!files.split('\n').some(l=>l.startsWith(`n${profile}/`))) throw Error('Browser profile mismatch');
// The root-owned prior preview is permitted only as a bootstrap tab.
const allowed=url=>[...config.bootstrap_origins,previewOrigin].includes(new URL(url).origin);
const captureAllowed=url=>new URL(url).origin===previewOrigin;
const pages=(await(await fetch(`http://127.0.0.1:${port}/json/list`)).json()).filter(t=>t.type==='page');
if(pages.length!==1 || !allowed(pages[0].url)) throw Error('Tab scope mismatch');
const ws=new WebSocket(pages[0].webSocketDebuggerUrl);
await new Promise((ok,no)=>{ws.once('open',ok);ws.once('error',no)});
let seq=0;const pending=new Map();
ws.on('message',raw=>{const r=JSON.parse(raw);
 if(r.method==='Fetch.requestPaused'){
  const request=r.params.request;let approved=false;
  try{approved=new URL(request.url).origin===previewOrigin&&['GET','HEAD'].includes(request.method)}catch{}
  call(approved?'Fetch.continueRequest':'Fetch.failRequest',approved?{requestId:r.params.requestId}:{requestId:r.params.requestId,errorReason:'BlockedByClient'}).catch(()=>{});
 }
 const p=pending.get(r.id);if(p){pending.delete(r.id);r.error?p[1](Error(r.error.message)):p[0](r.result)}});
const call=(method,params={})=>new Promise((ok,no)=>{const id=++seq;pending.set(id,[ok,no]);ws.send(JSON.stringify({id,method,params}))});
const evaluate=async expression=>{const r=await call('Runtime.evaluate',{expression,returnByValue:true,awaitPromise:true});if(r.exceptionDetails)throw Error(JSON.stringify(r.exceptionDetails));return r.result.value};
const args=JSON.parse(process.argv[2]||'{}');
try {
 await call('Fetch.enable',{patterns:[{urlPattern:'*',requestStage:'Request'}]});
 if(args.url){if(!captureAllowed(args.url))throw Error('Navigation outside new local preview');await call('Page.navigate',{url:args.url});await new Promise(r=>setTimeout(r,1800))}
 if(args.viewport){await call('Emulation.setDeviceMetricsOverride',{width:args.viewport[0],height:args.viewport[1],deviceScaleFactor:2,mobile:false});await new Promise(r=>setTimeout(r,450))}
 await evaluate('document.fonts.ready.then(()=>true)');
 if(args.hover){await call('Input.dispatchMouseEvent',{type:'mouseMoved',x:args.hover[0],y:args.hover[1]});await new Promise(r=>setTimeout(r,500))}
 if(args.expression) console.log(JSON.stringify(await evaluate(args.expression)));
 else console.log(JSON.stringify(await evaluate(`({url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,text:document.body.innerText.slice(0,6500),fonts:document.fonts.status})`)));
 if(args.screenshot){
  await evaluate(`(async()=>{const position=[scrollX,scrollY];for(const image of document.querySelectorAll('figure img')){image.scrollIntoView({behavior:'instant',block:'center'});await new Promise(r=>setTimeout(r,100));await image.decode();}window.scrollTo({left:position[0],top:position[1],behavior:'instant'});await new Promise(r=>setTimeout(r,200));return true;})()`);
  const before=await evaluate('({url:location.href,title:document.title,dpr:devicePixelRatio,zoom:visualViewport.scale,width:innerWidth,height:innerHeight})');
  if(!captureAllowed(before.url)||before.dpr<2||before.zoom!==1)throw Error('Capture scope or density mismatch');
  if(args.expectedUrl && before.url!==args.expectedUrl)throw Error('Unexpected review route');
  if(!args.viewport||before.width!==args.viewport[0]||before.height!==args.viewport[1])throw Error('Capture viewport does not match requested review layout');
  const params={format:'png',fromSurface:true,captureBeyondViewport:!!args.full||!!args.tile||!!args.clip};
  if(args.full){const m=await call('Page.getLayoutMetrics');params.clip={x:0,y:0,width:m.cssContentSize.width,height:m.cssContentSize.height,scale:1}}
  if(args.tile){const m=await call('Page.getLayoutMetrics');params.clip={x:0,y:args.tile[0],width:m.cssContentSize.width,height:args.tile[1],scale:1}}
  if(args.clip){const [x,y,width,height]=args.clip;if(![x,y,width,height].every(Number.isFinite)||x<0||y<0||width<=0||height<=0)throw Error('Invalid review clip');params.clip={x,y,width,height,scale:1}}
  const shot=await call('Page.captureScreenshot',params);const after=await evaluate('({url:location.href,title:document.title,dpr:devicePixelRatio,zoom:visualViewport.scale,width:innerWidth,height:innerHeight})');
  if(JSON.stringify(before)!==JSON.stringify(after))throw Error('Capture state changed');
  writeFileSync(args.screenshot,Buffer.from(shot.data,'base64'));
  const meta=execFileSync('sips',['-g','profile','-g','pixelWidth','-g','pixelHeight',args.screenshot],{encoding:'utf8'});
  if(!meta.includes('profile: Display P3'))throw Error('Missing genuine P3');
  const pixels=[Number(meta.match(/pixelWidth: (\d+)/)?.[1]),Number(meta.match(/pixelHeight: (\d+)/)?.[1])];
  const logical=params.clip?[params.clip.width,params.clip.height]:[before.width,before.height];
  if(pixels.some((p,i)=>Math.abs(p-logical[i]*before.dpr)>2))throw Error('Review PNG density mismatch');
  console.log(meta);
 }
} finally {ws.close()}
