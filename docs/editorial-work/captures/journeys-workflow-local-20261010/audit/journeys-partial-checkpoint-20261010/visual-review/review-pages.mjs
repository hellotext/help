import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {fileURLToPath} from 'node:url';
import {execFileSync} from 'node:child_process';
import assert from 'node:assert/strict';
const HERE=path.dirname(fileURLToPath(import.meta.url));
let HELP=HERE; while(!fs.existsSync(path.join(HELP,'_config.yml'))) HELP=path.dirname(HELP);
const ORIGIN='http://127.0.0.1:4306', DEBUG='http://127.0.0.1:9494';
const sha=b=>crypto.createHash('sha256').update(b).digest('hex');
const read=p=>fs.readFileSync(path.join(HELP,p));
const checkpointPath=path.join(HERE,'../checkpoint.json');
const checkpoint=JSON.parse(fs.readFileSync(checkpointPath));
const processes=JSON.parse(fs.readFileSync(path.join(HERE,'processes.json')));
const delay=ms=>new Promise(r=>setTimeout(r,ms));
function ownedIdentity(){
  const output=execFileSync('/usr/sbin/lsof',['-nP','-iTCP:9494','-sTCP:LISTEN','-Fpcn'],{encoding:'utf8'});
  assert.deepEqual([...output.matchAll(/^p(\d+)$/gm)].map(x=>+x[1]),[processes.browser_pid]);
  assert.match(output,/n127\.0\.0\.1:9494/);
  const command=execFileSync('/bin/ps',['-p',String(processes.browser_pid),'-o','command='],{encoding:'utf8'});
  assert(command.includes(`--user-data-dir=${processes.profile}`));
  assert(command.includes('--force-color-profile=display-p3-d65'));
}
ownedIdentity();
assert.equal(processes.status,'ready');
for(const a of checkpoint.articles){assert.equal(sha(read(a.source)),a.source_sha256);assert.equal(sha(read(a.built_html)),a.built_html_sha256);}
for(const item of checkpoint.images){assert.equal(sha(read(item.source)),item.sha256);for(const copy of item.built_copies_equal)assert.equal(sha(read(copy)),item.sha256);}
const tabs=await (await fetch(`${DEBUG}/json/list`)).json();
const pages=tabs.filter(t=>t.type==='page');assert.equal(pages.length,1);
assert(pages[0].url==='about:blank'||pages[0].url.startsWith(ORIGIN+'/'));
const ws=new WebSocket(pages[0].webSocketDebuggerUrl);
await new Promise((res,rej)=>{ws.addEventListener('open',res,{once:true});ws.addEventListener('error',rej,{once:true});});
let sequence=0;const pending=new Map(),blocked=[],errors=[];
function cdp(method,params={}){return new Promise((resolve,reject)=>{const id=++sequence;const timer=setTimeout(()=>{pending.delete(id);reject(Error('CDP timeout '+method));},30000);pending.set(id,{resolve,reject,timer});ws.send(JSON.stringify({id,method,params}));});}
ws.addEventListener('message',event=>{
  const m=JSON.parse(event.data);
  if(m.id){const p=pending.get(m.id);if(!p)return;clearTimeout(p.timer);pending.delete(m.id);if(m.error)p.reject(Error(JSON.stringify(m.error)));else p.resolve(m.result);return;}
  if(m.method==='Fetch.requestPaused'){
    const r=m.params.request,u=new URL(r.url),allowed=u.origin===ORIGIN&&['GET','HEAD'].includes(r.method);
    if(!allowed)blocked.push({origin:u.origin,method:r.method,resourceType:m.params.resourceType});
    cdp(allowed?'Fetch.continueRequest':'Fetch.failRequest',{requestId:m.params.requestId,...(allowed?{}:{errorReason:'BlockedByClient'})}).catch(e=>errors.push(e.message));
  }
  if(m.method==='Runtime.exceptionThrown')errors.push(m.params.exceptionDetails.text);
});
async function evaluate(expression){const r=await cdp('Runtime.evaluate',{expression,awaitPromise:true,returnByValue:true});if(r.exceptionDetails)throw Error(JSON.stringify(r.exceptionDetails));return r.result.value;}
await cdp('Page.enable');await cdp('Runtime.enable');await cdp('Network.enable');
await cdp('Fetch.enable',{patterns:[{urlPattern:'*'}]});
await cdp('Network.setCacheDisabled',{cacheDisabled:true});
const output={started_at:new Date().toISOString(),status:'capturing',checkpoint_sha256:sha(fs.readFileSync(checkpointPath)),capture_route:'Native Chrome Page.captureScreenshot PNG, Display P3 D65, DPR 2; no post-processing',origin:ORIGIN,browser_pid:processes.browser_pid,server_pid:processes.server_pid,views:[],blocked_requests:blocked,runtime_errors:errors};
const receipt=path.join(HERE,'capture-receipt.json');
const geometryExpression=`(()=>{
 const rect=e=>{const r=e.getBoundingClientRect();return {x:r.x,y:r.y+scrollY,width:r.width,height:r.height,right:r.right,bottom:r.bottom+scrollY}};
 const style=e=>{const s=getComputedStyle(e);return {padding:[s.paddingTop,s.paddingRight,s.paddingBottom,s.paddingLeft],border:[s.borderTopWidth,s.borderTopStyle,s.borderTopColor],radius:s.borderTopLeftRadius,background:s.backgroundColor,display:s.display,position:s.position,visibility:s.visibility}};
 return {url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,documentWidth:document.documentElement.scrollWidth,documentHeight:Math.max(document.documentElement.scrollHeight,document.body.scrollHeight),article:rect(document.querySelector('article.guide-content')),headings:[...document.querySelectorAll('article h2,article h3')].map(e=>e.textContent.trim()),figures:[...document.querySelectorAll('[data-journey-figure]')].map(f=>{const s=f.querySelector('.ht-editorial-visual__stage'),fr=f.querySelector('.ht-editorial-visual__image-frame'),im=f.querySelector('img'),cap=f.querySelector('figcaption');return {id:f.dataset.journeyFigure,figure:rect(f),stage:rect(s),stageStyle:style(s),frame:rect(fr),frameStyle:style(fr),image:rect(im),imageStyle:style(im),currentSrc:im.currentSrc,naturalSize:[im.naturalWidth,im.naturalHeight],loaded:im.complete&&im.naturalWidth>0,alt:im.alt,caption:cap.textContent.trim(),captionStyle:style(cap),interactiveCount:f.querySelectorAll('a,button,[role=button],input,[tabindex]').length,ancestorsLinked:!!f.closest('a')};})};})()`;
async function state(){return evaluate(`({url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,scroll:[scrollX,scrollY]})`);}
async function capture(name,clip,expected){
  ownedIdentity();const pageList=(await(await fetch(`${DEBUG}/json/list`)).json()).filter(t=>t.type==='page');assert.equal(pageList.length,1);assert.equal(pageList[0].url,expected.url);
  assert.deepEqual(await state(),expected);
  const image=await cdp('Page.captureScreenshot',{format:'png',fromSurface:true,captureBeyondViewport:true,clip:{...clip,scale:1}});
  assert.deepEqual(await state(),expected);
  const b=Buffer.from(image.data,'base64');assert.equal(b.subarray(0,8).toString('hex'),'89504e470d0a1a0a');
  const pixelSize=[b.readUInt32BE(16),b.readUInt32BE(20)];assert.deepEqual(pixelSize,[clip.width*2,clip.height*2]);
  const file=path.join(HERE,name);fs.writeFileSync(file,b);
  const metadata=execFileSync('/usr/bin/sips',['-g','profile','-g','pixelWidth','-g','pixelHeight',file],{encoding:'utf8'});assert.match(metadata,/profile: Display P3/);
  return {file:name,clip,viewport:expected.viewport,dpr:2,pixelSize,icc:'Display P3',sha256:sha(b)};
}
try{
 for(const a of checkpoint.articles){
  const route=a.built_html.replace(/^_site/,'');const url=ORIGIN+route;
  const response=await fetch(url);assert.equal(response.status,200);assert.equal(sha(Buffer.from(await response.arrayBuffer())),a.built_html_sha256);
  const locale=a.source.split('/')[1],slug=path.basename(a.source,'.md');
  for(const width of [1440,580,390]){
   await cdp('Emulation.setDeviceMetricsOverride',{width,height:1000,deviceScaleFactor:2,mobile:false});
   await cdp('Page.navigate',{url});
   for(let i=0;i<100;i++){if(await evaluate(`location.href===${JSON.stringify(url)}&&document.readyState==='complete'`))break;await delay(100);}
   await evaluate(`(async()=>{await document.fonts.ready;for(const im of document.querySelectorAll('article img')){im.scrollIntoView({block:'center',behavior:'instant'});await new Promise(r=>setTimeout(r,60));await im.decode();}scrollTo({top:0,left:0,behavior:'instant'});await new Promise(r=>requestAnimationFrame(()=>requestAnimationFrame(r)));})()`);
   await delay(150);
   const g=await evaluate(geometryExpression),expected={url,title:g.title,locale:g.locale,viewport:[width,1000],dpr:2,zoom:1,scroll:[0,0]};assert.deepEqual(await state(),expected);
   assert.equal(g.figures.length,a.preserved_figure_structures_exported);assert(g.documentWidth<=width,'Horizontal page overflow');
   for(const f of g.figures){
    assert(f.loaded);assert(f.alt&&f.caption);assert.equal(f.interactiveCount,0);assert.equal(f.ancestorsLinked,false);
    assert(f.image.width<=f.naturalSize[0]+.5,'Native source upscale');assert(f.image.x>=f.frame.x);assert(f.image.right<=f.frame.right+.5);
    assert(Math.abs(f.stage.width-g.article.width)<1,'Stage does not fill article');assert(f.figure.x>=g.article.x-.5);assert(f.figure.right<=g.article.right+.5);
    assert(f.stageStyle.padding.every(v=>parseFloat(v)>0));assert(f.frameStyle.padding.every(v=>parseFloat(v)>0));assert(parseFloat(f.stageStyle.border[0])>0);assert(parseFloat(f.stageStyle.radius)>0);
    assert(f.currentSrc.endsWith(`-${locale}-${width<=600?'mobile':'desktop'}.png`));
   }
   const prefix=`${slug}-${locale}-${width}`;const captures=[];
   captures.push(await capture(`${prefix}-full.png`,{x:0,y:0,width,height:Math.ceil(g.documentHeight)},expected));
   for(const f of g.figures){const x=Math.max(0,Math.floor(f.figure.x)-12),y=Math.max(0,Math.floor(f.figure.y)-12),right=Math.min(width,Math.ceil(f.figure.right)+12);captures.push(await capture(`${prefix}-${f.id}.png`,{x,y,width:right-x,height:Math.ceil(f.figure.bottom)+12-y},expected));}
   output.views.push({source:a.source,source_sha256:a.source_sha256,built_html:a.built_html,built_html_sha256:a.built_html_sha256,geometry:g,captures});
   fs.writeFileSync(receipt,JSON.stringify(output,null,2)+'\n');console.log(JSON.stringify({view:prefix,figures:g.figures.length,height:g.documentHeight,image_widths:g.figures.map(f=>f.image.width)}));
  }
 }
 assert.equal(output.views.length,12);
 for(const a of checkpoint.articles){assert.equal(sha(read(a.source)),a.source_sha256);assert.equal(sha(read(a.built_html)),a.built_html_sha256);}
 for(const item of checkpoint.images){assert.equal(sha(read(item.source)),item.sha256);for(const copy of item.built_copies_equal)assert.equal(sha(read(copy)),item.sha256);}
 output.status='native_capture_and_geometry_passed_pixel_review_pending';output.finished_at=new Date().toISOString();output.source_and_build_hashes_preserved=true;
}catch(e){output.status='failed';output.error=e.stack;throw e;}finally{fs.writeFileSync(receipt,JSON.stringify(output,null,2)+'\n');await cdp('Page.navigate',{url:'about:blank'}).catch(()=>{});ws.close();}
