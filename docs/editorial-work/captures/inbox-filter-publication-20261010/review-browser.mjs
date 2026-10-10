// Root-run local Help review only. Never launches a browser or a server.
import {execFileSync} from 'node:child_process';
import {createHash} from 'node:crypto';
import {readFileSync, writeFileSync, realpathSync} from 'node:fs';
import {dirname, resolve, relative, isAbsolute} from 'node:path';
import {fileURLToPath} from 'node:url';

const here = dirname(fileURLToPath(import.meta.url));
const help = resolve(here, '../../../..');
const config = JSON.parse(readFileSync(resolve(here, 'revision-config.json'), 'utf8'));
const origin = 'http://127.0.0.1:4301';
const port = 9488;
const profile = '/private/tmp/hellotext-inbox-help-review-20261007';
const outputRoot = resolve(help, '../audit/filter-publication-20261010/page-review');
const routes = new Map([
  [`${origin}/es/filtrar-buscar-conversaciones-inbox.html`, 'es'],
  [`${origin}/filter-and-search-inbox.html`, 'en'],
]);
const inside = (root, path) => {
  const rel = relative(root, path);
  return rel !== '' && rel !== '..' && !rel.startsWith('../') && !isAbsolute(rel);
};
if (config.preview_origin !== origin || config.browser_port !== port || config.browser_profile !== profile)
  throw Error('Unexpected preview/browser configuration');
if (config.page_review_output_directory !== outputRoot)
  throw Error('PNG output must be the external filter review directory');
const bootstrap = config.bootstrap_urls;
if (!Array.isArray(bootstrap)) throw Error('bootstrap_urls must be an explicit array');
if (typeof WebSocket !== 'function') throw Error('This helper requires the native WebSocket API in Node 22 or newer');
for (const value of bootstrap) {
  const u = new URL(value);
  if (u.protocol !== 'http:' || u.hostname !== '127.0.0.1' || !u.port || u.username || u.password || u.hash || u.search || u.href !== value)
    throw Error('Bootstrap URLs must be exact loopback URLs');
}
if (process.argv[2] === '--check-only') {
  console.log(JSON.stringify({status:'offline_contract_checked', origin, port, profile, outputRoot, routes:[...routes.keys()]}));
  process.exit(0);
}
const args = JSON.parse(process.argv[2] || '{}');
if (!['measure', 'capture'].includes(args.operation)) throw Error('Expected measure or capture');
const expectedUrl = args.url;
if (!routes.has(expectedUrl)) throw Error('Only the two filter-guide routes are allowed');
if (!Array.isArray(args.viewport) || ![1440,580,390].includes(args.viewport[0]) || args.viewport[1] !== 1000)
  throw Error('Expected an explicit review viewport');
if (args.operation === 'capture') {
  if (!isAbsolute(args.screenshot || '') || !args.screenshot.endsWith('.png')) throw Error('Expected an absolute PNG path');
  const parent = realpathSync(dirname(args.screenshot));
  const root = realpathSync(outputRoot);
  if (root !== outputRoot || (parent !== root && !inside(root, parent)) || inside(help, parent))
    throw Error('PNG output escaped the external audit directory');
  if (!Array.isArray(args.clip) || args.clip.length !== 4 || !args.clip.every(Number.isInteger)) throw Error('Invalid document clip');
  const [x,y,width,height] = args.clip;
  if (x !== 0 || y < 0 || width !== args.viewport[0] || height <= 0 || height > args.viewport[1]) throw Error('Invalid review clip bounds');
}

function owner() {
  const listener = execFileSync('lsof', ['-nP', `-iTCP:${port}`, '-sTCP:LISTEN', '-Fpcn'], {encoding:'utf8'});
  const pids = [...new Set([...listener.matchAll(/^p(\d+)$/gm)].map(m=>m[1]))];
  const sockets = listener.split('\n').filter(line=>line.startsWith('n'));
  if (pids.length !== 1 || !sockets.length || sockets.some(line=>line !== `n127.0.0.1:${port}`)) throw Error('Browser listener mismatch');
  const files = execFileSync('lsof', ['-nP','-p',pids[0],'-Fn'], {encoding:'utf8'});
  if (!files.split('\n').some(line=>line.startsWith(`n${profile}/`))) throw Error('Browser profile mismatch');
  const command = execFileSync('ps', ['-p',pids[0],'-o','command='], {encoding:'utf8'}).trim();
  const profileArg = command.match(/(?:^|\s)--user-data-dir=(\S+)/)?.[1];
  const colorProfile = command.match(/(?:^|\s)--force-color-profile=(\S+)/)?.[1];
  if (!/Google Chrome|chrome/i.test(command) || !profileArg || realpathSync(profileArg) !== realpathSync(profile) || !command.includes(`--remote-debugging-port=${port}`))
    throw Error('Browser process arguments do not identify the owned Chrome');
  if (colorProfile !== 'display-p3-d65') throw Error('Browser compositor is not configured for native Display P3');
  return {pid:pids[0],profile,colorProfile,commandSha256:createHash('sha256').update(command).digest('hex')};
}
async function pages() {
  const response = await fetch(`http://127.0.0.1:${port}/json/list`, {signal:AbortSignal.timeout(5000)});
  if (!response.ok) throw Error('Cannot read the owned browser target');
  return (await response.json()).filter(t=>t.type === 'page');
}
const browserOwner = owner();
const targets = await pages();
const initialAllowed = new Set([`${origin}/`, ...routes.keys(), ...bootstrap]);
if (targets.length !== 1 || !initialAllowed.has(targets[0].url)) throw Error('Expected exactly one approved local preview tab');
if (args.operation === 'capture' && targets[0].url !== expectedUrl) throw Error('Capture cannot navigate another tab');
const target = targets[0];
const endpoint = new URL(target.webSocketDebuggerUrl);
if (endpoint.protocol !== 'ws:' || endpoint.hostname !== '127.0.0.1' || endpoint.port !== String(port) || endpoint.pathname !== `/devtools/page/${target.id}`)
  throw Error('Unexpected CDP endpoint');
const ws = new WebSocket(endpoint.href);
await new Promise((ok,no)=>{ws.addEventListener('open',ok,{once:true});ws.addEventListener('error',()=>no(Error('CDP connection failed')),{once:true})});
let sequence = 0;
let fatal = null;
const pending = new Map();
const blocked = [];
const navigatedFrames = new Map();
const loadedDocuments = new Set();
let navigationEvidence = null;
const call = (method, params={}) => new Promise((ok,no)=>{
  const id = ++sequence;
  const timer = setTimeout(()=>{pending.delete(id);no(Error(`CDP timeout: ${method}`))},30000);
  pending.set(id, [ok,no,timer]);
  ws.send(JSON.stringify({id,method,params}));
});
ws.addEventListener('message', message=>{
  const event = JSON.parse(message.data);
  if (event.method === 'Fetch.requestPaused') {
    const request = event.params.request;
    let approved = false;
    let destination = 'invalid';
    try {
      const u = new URL(request.url);
      destination = u.origin + u.pathname;
      approved = u.origin === origin && !u.username && !u.password && ['GET','HEAD'].includes(request.method) && !request.hasPostData;
    } catch {}
    if (!approved) blocked.push({method:request.method, destination});
    call(approved ? 'Fetch.continueRequest' : 'Fetch.failRequest', approved ? {requestId:event.params.requestId} : {requestId:event.params.requestId,errorReason:'BlockedByClient'})
      .catch(error=>{fatal=error.message});
  }
  if (event.method === 'Network.webSocketCreated') fatal = 'Unexpected page websocket';
  if (event.method === 'Page.frameNavigated') navigatedFrames.set(event.params.frame.id, event.params.frame);
  if (event.method === 'Page.lifecycleEvent' && event.params.name === 'load')
    loadedDocuments.add(`${event.params.frameId}:${event.params.loaderId}`);
  const handlers = pending.get(event.id);
  if (handlers) {
    pending.delete(event.id);clearTimeout(handlers[2]);
    event.error ? handlers[1](Error(event.error.message)) : handlers[0](event.result);
  }
});
const evaluate = async expression => {
  const result = await call('Runtime.evaluate', {expression,returnByValue:true,awaitPromise:true});
  if (result.exceptionDetails) throw Error(result.exceptionDetails.text + ': ' + (result.exceptionDetails.exception?.description || ''));
  return result.result.value;
};
const stateExpression = `(()=>{
  const rect=n=>{if(!n)throw Error('Incomplete screenshot figure');const r=n.getBoundingClientRect();return [r.x+scrollX,r.y+scrollY,r.width,r.height]};
  return {url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,fonts:document.fonts.status,ready:document.readyState,height:document.documentElement.scrollHeight,width:document.documentElement.scrollWidth,scroll:[scrollX,scrollY],contentBottom:Math.max(document.documentElement.getBoundingClientRect().bottom,document.body.getBoundingClientRect().bottom)+scrollY,footerBottom:document.querySelector('footer')?.getBoundingClientRect().bottom+scrollY,
    figures:[...document.querySelectorAll('figure')].map(f=>{const i=f.querySelector('img');return {id:f.dataset.inboxFigure||null,src:i?.currentSrc,complete:i?.complete,naturalWidth:i?.naturalWidth,naturalHeight:i?.naturalHeight,
      rect:rect(f),imageRect:rect(i),frameRect:rect(f.querySelector('.ht-editorial-visual__image-frame')),stageRect:rect(f.querySelector('.ht-editorial-visual__stage'))}})};
})()`;
async function waitForNavigation(navigation) {
  if (navigation.errorText) throw Error(navigation.errorText);
  if (!navigation.frameId || !navigation.loaderId) throw Error('Expected an identified new document');
  const deadline = Date.now() + 15000;
  while (Date.now() < deadline) {
    if (fatal) throw Error(fatal);
    const frame = navigatedFrames.get(navigation.frameId);
    if (frame && !frame.parentId && frame.loaderId === navigation.loaderId && frame.url === expectedUrl &&
        loadedDocuments.has(`${navigation.frameId}:${navigation.loaderId}`)) {
      const {frameTree} = await call('Page.getFrameTree');
      if (frameTree.frame.id !== navigation.frameId || frameTree.frame.loaderId !== navigation.loaderId || frameTree.frame.url !== expectedUrl)
        throw Error('Loaded document changed before readiness checks');
      return {frameId:navigation.frameId,loaderId:navigation.loaderId,url:expectedUrl,frameNavigated:true,load:true};
    }
    await new Promise(r=>setTimeout(r,50));
  }
  throw Error('Timed out waiting for the exact main-frame document to load');
}
async function ready() {
  const captureTop = args.operation === 'capture' ? args.clip[1] : 0;
  await evaluate(`(async()=>{await document.fonts.ready;for(const image of document.querySelectorAll('figure img')){if(${args.operation === 'measure'})image.scrollIntoView({behavior:'instant',block:'center'});await image.decode()}window.scrollTo({left:0,top:${captureTop},behavior:'instant'});await new Promise(r=>requestAnimationFrame(()=>requestAnimationFrame(r)));return true})()`);
  // Let native layout transitions finish; do not disable or modify animations.
  const deadline = Date.now() + 10000;
  let previous = null, stableSince = 0, state = null, settled = false, repositioned = false;
  while (Date.now() < deadline) {
    const sample = await evaluate(`(()=>{
      const milliseconds=v=>parseFloat(v)*(v.trim().endsWith('ms')?1:1000);
      const styles=getComputedStyle(document.documentElement);
      const finite=document.getAnimations().filter(a=>Number.isFinite(a.effect?.getComputedTiming().endTime));
      return {state:(${stateExpression}),active:finite.some(a=>!['finished','idle'].includes(a.playState)),
        stableWindow:Math.max(400,...['--sidebar-transition-duration','--page-transition-duration'].map(k=>milliseconds(styles.getPropertyValue(k))||0),...finite.map(a=>a.effect.getComputedTiming().endTime))};
    })()`);
    if (fatal) throw Error(fatal);
    state = sample.state;
    const snapshot = JSON.stringify(state);
    if (snapshot !== previous || sample.active) { previous = snapshot; stableSince = Date.now(); }
    else if (Date.now() - stableSince >= sample.stableWindow) {
      // A pre-settlement clamp can retain an earlier page height. Reapply the
      // same native request once after layout, then prove stability again.
      if (args.operation === 'capture' && !repositioned) {
        await evaluate(`window.scrollTo({left:0,top:${captureTop},behavior:'instant'})`);
        repositioned = true; previous = null; stableSince = 0; continue;
      }
      settled = true; break;
    }
    await new Promise(r=>setTimeout(r,50));
  }
  if (!settled) throw Error('Native page layout did not settle within 10 seconds');
  if (fatal || state.url !== expectedUrl || state.locale !== routes.get(expectedUrl) || !state.title || state.ready !== 'complete' || state.fonts !== 'loaded' || state.dpr !== 2 || state.zoom !== 1 || JSON.stringify(state.viewport) !== JSON.stringify(args.viewport))
    throw Error('Page URL/locale/readiness/viewport mismatch: ' + (fatal || JSON.stringify(state)));
  return state;
}
async function sameOwner() {
  const current = await pages();
  if (JSON.stringify(owner()) !== JSON.stringify(browserOwner) || current.length !== 1 || current[0].id !== target.id || current[0].url !== expectedUrl) throw Error('Browser ownership or target changed');
}
try {
  await call('Network.enable');await call('Page.enable');
  await call('Page.setLifecycleEventsEnabled', {enabled:true});
  await call('Network.setCacheDisabled', {cacheDisabled:true});
  await call('Fetch.enable', {patterns:[{urlPattern:'*',requestStage:'Request'}]});
  await call('Emulation.setDeviceMetricsOverride', {width:args.viewport[0],height:args.viewport[1],deviceScaleFactor:2,mobile:false});
  if (args.operation === 'measure') {
    navigatedFrames.clear();loadedDocuments.clear();
    const navigation = await call('Page.navigate', {url:expectedUrl});
    navigationEvidence = await waitForNavigation(navigation);
  }
  await call('Input.dispatchMouseEvent', {type:'mouseMoved',x:0,y:0});
  const before = await ready();
  await sameOwner();
  if (args.operation === 'measure') {
    const measurement = await evaluate(`(async()=>{
      const rect=n=>{const r=n.getBoundingClientRect();return {x:r.x+scrollX,y:r.y+scrollY,width:r.width,height:r.height,right:r.right+scrollX,bottom:r.bottom+scrollY}};
      const spacing=s=>['Top','Right','Bottom','Left'].map(side=>parseFloat(s['padding'+side]));
      const response=await fetch(location.href,{cache:'no-store'});if(!response.ok)throw Error('HTML request failed');
      const servedHtmlSha256=[...new Uint8Array(await crypto.subtle.digest('SHA-256',await response.arrayBuffer()))].map(v=>v.toString(16).padStart(2,'0')).join('');
      const servedImageHashes={};
      for(const image of document.querySelectorAll('figure img')){
        const source=await fetch(image.currentSrc,{cache:'no-store'});if(!source.ok)throw Error('Image request failed');
        servedImageHashes[image.currentSrc]=[...new Uint8Array(await crypto.subtle.digest('SHA-256',await source.arrayBuffer()))].map(v=>v.toString(16).padStart(2,'0')).join('');
      }
      const article=document.querySelector('article.guide-content');if(!article)throw Error('Missing guide article');
      const ar=rect(article),ac=getComputedStyle(article),left=parseFloat(ac.paddingLeft)+parseFloat(ac.borderLeftWidth),right=parseFloat(ac.paddingRight)+parseFloat(ac.borderRightWidth);
      const column={x:ar.x+left,right:ar.right-right,width:ar.width-left-right};
      return {servedHtmlSha256,servedImageHashes,column,overflow:document.documentElement.scrollWidth>innerWidth+1,
        figures:[...document.querySelectorAll('figure')].map(f=>{
          if(f.closest('article.guide-content')!==article)throw Error('Figure outside the article');
          const i=f.querySelector('img'),s=f.querySelector('.ht-editorial-visual__stage'),frame=f.querySelector('.ht-editorial-visual__image-frame'),c=f.querySelector('figcaption');
          if(!i||!s||!frame||!c)throw Error('Incomplete screenshot figure');
          const ss=getComputedStyle(s),fs=getComputedStyle(frame),cs=getComputedStyle(c);
          return {id:f.dataset.inboxFigure||null,src:i.currentSrc,alt:i.alt,ariaLabel:f.getAttribute('aria-label'),image:rect(i),naturalWidth:i.naturalWidth,naturalHeight:i.naturalHeight,complete:i.complete,
            links:f.querySelectorAll('a').length+(i.closest('a')?1:0),openControls:f.querySelectorAll('button,[role=button],[role=link],[onclick]').length,
            stage:rect(s),figure:rect(f),frame:rect(frame),stageBackground:ss.backgroundColor,border:ss.borderWidth,borderColor:ss.borderColor,borderRadius:ss.borderRadius,stagePadding:spacing(ss),framePadding:spacing(fs),
            captionText:c.textContent.trim(),caption:rect(c),captionClip:cs.clipPath,captionDisplay:cs.display,captionVisibility:cs.visibility,captionAriaHidden:c.getAttribute('aria-hidden'),
            previous:f.previousElementSibling?rect(f.previousElementSibling):null,next:f.nextElementSibling?rect(f.nextElementSibling):null};
        })};})()`);
    const after = await ready();
    await sameOwner();
    if (JSON.stringify(before) !== JSON.stringify(after)) throw Error('Measurement state changed');
    console.log(JSON.stringify({...before,...measurement,navigation:navigationEvidence,browserOwner,blockedRequests:blocked}));
  } else {
    if (!Array.isArray(args.expectedFigures) || args.expectedFigures.length !== 3 || before.figures.length !== 3)
      throw Error('Capture requires the three measured figures');
    for (let index=0;index<3;index++) {
      for (const key of ['id','src','rect','imageRect','frameRect','stageRect']) {
        if (JSON.stringify(before.figures[index][key]) !== JSON.stringify(args.expectedFigures[index][key]))
          throw Error(`Measured figure changed before PNG: ${index+1}/${key}: ${JSON.stringify({expected:args.expectedFigures[index][key],actual:before.figures[index][key],scroll:before.scroll,viewport:before.viewport})}`);
      }
    }
    const [requestedX,requestedY,requestedWidth,requestedHeight] = args.clip;
    if (requestedY+requestedHeight > before.height || before.width > before.viewport[0]+1) throw Error('Requested region exceeds document or page overflows');
    const actualClip = [before.scroll[0],before.scroll[1],...before.viewport];
    const [x,y,width,height] = actualClip;
    if (x !== 0 || x > requestedX || y > requestedY || x+width < requestedX+requestedWidth || y+height < Math.min(requestedY+requestedHeight,before.contentBottom))
      throw Error('Native viewport does not cover the requested content: ' + JSON.stringify({requested:args.clip,actual:actualClip,contentBottom:before.contentBottom}));
    const shot = await call('Page.captureScreenshot', {format:'png',fromSurface:true,captureBeyondViewport:false,clip:{x,y,width,height,scale:2}});
    const after = await evaluate(stateExpression);
    await sameOwner();
    if (fatal || JSON.stringify(before) !== JSON.stringify(after)) throw Error('Capture state changed');
    const bytes = Buffer.from(shot.data,'base64');
    if (!bytes.subarray(0,8).equals(Buffer.from([137,80,78,71,13,10,26,10]))) throw Error('Not a PNG');
    const pixels = [bytes.readUInt32BE(16),bytes.readUInt32BE(20)];
    if (pixels[0] !== width*4 || pixels[1] !== height*4) throw Error('Actual PNG dimensions are not native 4x');
    writeFileSync(args.screenshot, bytes, {flag:'wx'});
    const icc = execFileSync('sips', ['-g','profile',args.screenshot], {encoding:'utf8'});
    if (!icc.includes('profile: Display P3')) throw Error('Review PNG lacks genuine Display P3');
    console.log(JSON.stringify({file:args.screenshot,sha256:createHash('sha256').update(bytes).digest('hex'),pixelSize:pixels,clip:actualClip,requestedClip:args.clip,captureRegion:'whole native viewport; overlap at clamped page end',nativeDensity:4,devicePixelRatio:2,captureScale:2,icc:'Display P3',browserOwner,before,after,blockedRequests:blocked,transformations:'none',pixel_review:'pending'}));
  }
} finally {
  for (const handlers of pending.values()) clearTimeout(handlers[2]);
  ws.close();
}
