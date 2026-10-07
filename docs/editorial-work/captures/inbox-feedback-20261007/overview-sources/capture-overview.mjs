import { execFileSync } from 'node:child_process';
import { createHash } from 'node:crypto';
import { writeFileSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import WebSocket from 'ws';

const port = 9489;
const profile = '/Users/pel/Documents/Codex/2026-10-06/task-8/current-app-capture/chrome';
const origin = 'http://127.0.0.1:3298';
const outputDirectory = dirname(fileURLToPath(import.meta.url));
const identity = 'design-system@example.test';
const sourceRevision = '6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31';
if (process.argv[2] === '--check-only') {
  console.log(JSON.stringify({ check: 'passed', dependency: 'ws', port, profile, browserContacted: false }));
  process.exit(0);
}
const args = JSON.parse(process.argv[2] || '{}');
const allowed = value => new URL(value).origin === origin;
if (!args.viewport || args.viewport.length !== 2 || !args.viewport.every(Number.isInteger)) throw Error('Explicit CSS viewport required');
if (!['es', 'en'].includes(args.locale)) throw Error('Explicit locale required');
if (args.url && !allowed(args.url)) throw Error('Navigation must remain in owned app');
if (args.screenshot && (!args.expectedUrl || !allowed(args.expectedUrl))) throw Error('Exact planned capture URL required');
const listener = execFileSync('lsof', ['-nP', `-iTCP:${port}`, '-sTCP:LISTEN', '-Fpcn'], { encoding: 'utf8' });
const pids = [...listener.matchAll(/^p(\d+)$/gm)].map(match => match[1]);
if (pids.length !== 1 || !listener.includes(`n127.0.0.1:${port}`)) throw Error('Browser listener owner mismatch');
const files = execFileSync('lsof', ['-nP', '-p', pids[0], '-Fn'], { encoding: 'utf8' });
if (!files.split('\n').some(line => line.startsWith(`n${profile}/`))) throw Error('Browser profile mismatch');
const pages = (await (await fetch(`http://127.0.0.1:${port}/json/list`)).json()).filter(page => page.type === 'page');
if (pages.length !== 1 || !allowed(pages[0].url)) throw Error('Expected one owned app tab');
const ws = new WebSocket(pages[0].webSocketDebuggerUrl);
await new Promise((resolve, reject) => { ws.once('open', resolve); ws.once('error', reject); });
let sequence = 0;
const pending = new Map();
ws.on('message', raw => {
  const response = JSON.parse(raw);
  const callbacks = pending.get(response.id);
  if (!callbacks) return;
  pending.delete(response.id);
  response.error ? callbacks[1](Error(response.error.message)) : callbacks[0](response.result);
});
const call = (method, params = {}) => new Promise((resolve, reject) => {
  const id = ++sequence;
  pending.set(id, [resolve, reject]);
  ws.send(JSON.stringify({ id, method, params }));
});
const read = async expression => {
  const result = await call('Runtime.evaluate', { expression, returnByValue: true, awaitPromise: true });
  if (result.exceptionDetails) throw Error(JSON.stringify(result.exceptionDetails));
  return result.result.value;
};
const pause = ms => new Promise(resolve => setTimeout(resolve, ms));
const verifyIdentity = async () => {
  const found = await read(`(async()=>{const response=await fetch('/hellotext/journeys/new');const page=new DOMParser().parseFromString(await response.text(),'text/html');return [...page.querySelectorAll('h2')].some(node=>node.textContent.trim()===${JSON.stringify(identity)})})()`);
  if (!found) throw Error('Fictional identity mismatch');
};
const state = () => read(`(()=>{
  const rectangle=node=>{const r=node.getBoundingClientRect();return {x:r.x,y:r.y,width:r.width,height:r.height,scrollTop:node.scrollTop,scrollHeight:node.scrollHeight,clientHeight:node.clientHeight}};
  const visible=node=>{
    let r=node.getBoundingClientRect();let bounds={left:Math.max(r.left,0),right:Math.min(r.right,innerWidth),top:Math.max(r.top,0),bottom:Math.min(r.bottom,innerHeight)};
    for(let parent=node;parent;parent=parent.parentElement){const style=getComputedStyle(parent);if(style.display==='none'||style.visibility==='hidden')return false;if(parent!==node&&/(auto|scroll|hidden|clip)/.test(style.overflowY+' '+style.overflowX)){const p=parent.getBoundingClientRect();bounds={left:Math.max(bounds.left,p.left),right:Math.min(bounds.right,p.right),top:Math.max(bounds.top,p.top),bottom:Math.min(bounds.bottom,p.bottom)}}}
    return bounds.right>bounds.left&&bounds.bottom>bounds.top;
  };
  return {url:location.href,title:document.title,locale:document.documentElement.lang,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,fonts:document.fonts.status,
    rightPanes:[...document.querySelectorAll('aside[data-right-pane]')].map(node=>({...rectangle(node),visible:visible(node),text:node.innerText.slice(0,2500)})),
    debugVisible:[...document.querySelectorAll('label')].some(node=>node.textContent.includes('Impersonate')&&visible(node)),
    text:document.body.innerText.slice(0,10000)};
})()`);
try {
  await call('Emulation.setDeviceMetricsOverride', { width: args.viewport[0], height: args.viewport[1], deviceScaleFactor: 2, mobile: false });
  if (args.url) { await call('Page.navigate', { url: args.url }); await pause(1800); }
  await pause(600);
  await read('document.fonts.ready.then(()=>true)');
  await verifyIdentity();
  for (const action of args.actions || []) {
    if (!['click', 'wheel'].includes(action.type)) throw Error('Only native click and wheel actions are supported');
    const point = await read(`(()=>{const candidates=[...document.querySelectorAll(${JSON.stringify(action.selector)})];const node=candidates.find(element=>(!${JSON.stringify(action.text || '')}||element.textContent.trim()===${JSON.stringify(action.text || '')})&&element.getBoundingClientRect().width>0&&element.getBoundingClientRect().height>0);if(!node)return null;const r=node.getBoundingClientRect();return {x:Math.min(innerWidth-2,Math.max(2,r.x+r.width/2)),y:Math.min(innerHeight-2,Math.max(2,r.y+r.height/2))}})()`);
    if (!point) throw Error(`Native target not found: ${action.selector}`);
    await call('Input.dispatchMouseEvent', { type: 'mouseMoved', ...point });
    if (action.type === 'wheel') {
      await call('Input.dispatchMouseEvent', { type: 'mouseWheel', ...point, deltaX: 0, deltaY: action.deltaY, pointerType: 'mouse' });
    } else {
      await call('Input.dispatchMouseEvent', { type: 'mousePressed', ...point, button: 'left', clickCount: 1 });
      await call('Input.dispatchMouseEvent', { type: 'mouseReleased', ...point, button: 'left', clickCount: 1 });
    }
    await pause(action.waitMs || 700);
  }
  await call('Input.dispatchMouseEvent', { type: 'mouseMoved', x: 0, y: 0 });
  await pause(300);
  const before = await state();
  console.log(JSON.stringify(before));
  if (!args.screenshot) process.exitCode = 0;
  else {
    if (before.url !== args.expectedUrl || before.locale !== args.locale || before.title !== (args.locale === 'es' ? 'Bandeja | Hellotext' : 'Inbox | Hellotext')) throw Error('Planned page identity mismatch');
    if (JSON.stringify(before.viewport) !== JSON.stringify(args.viewport) || before.dpr !== 2 || before.zoom !== 1 || before.fonts !== 'loaded') throw Error('Viewport, font or density mismatch');
    if (before.debugVisible) throw Error('Development control remains visible');
    for (const text of args.requiredText || []) if (!before.text.includes(text)) throw Error(`Expected fictional content missing: ${text}`);
    if (args.layout === 'desktop' && !before.rightPanes.some(pane => pane.visible && pane.scrollTop > 0)) throw Error('Desktop requires the naturally scrolled customer pane');
    const output = resolve(outputDirectory, args.screenshot);
    if (dirname(output) !== outputDirectory || !output.endsWith('.png')) throw Error('Capture output must be a PNG in the owned sources directory');
    const clip = { x: 0, y: 0, width: before.viewport[0], height: before.viewport[1], scale: 2 };
    const shot = await call('Page.captureScreenshot', { format: 'png', fromSurface: true, captureBeyondViewport: false, clip });
    const after = await state();
    await verifyIdentity();
    if (JSON.stringify(before) !== JSON.stringify(after)) throw Error('Capture state changed');
    const png = Buffer.from(shot.data, 'base64');
    if (png.subarray(0, 8).toString('hex') !== '89504e470d0a1a0a') throw Error('Compositor output is not PNG');
    const pixelSize = [png.readUInt32BE(16), png.readUInt32BE(20)];
    if (pixelSize.some((value, index) => value !== args.viewport[index] * 4)) throw Error('Native 4x output mismatch');
    writeFileSync(output, png);
    const profileOutput = execFileSync('sips', ['-g', 'profile', '-g', 'pixelWidth', '-g', 'pixelHeight', output], { encoding: 'utf8' });
    if (!profileOutput.includes('profile: Display P3')) throw Error('Native Display P3 missing');
    writeFileSync(output.replace(/\.png$/, '.json'), JSON.stringify({ capturedAt: new Date().toISOString(), sourceRevision, identity, browserProfile: profile, browserPort: port, initialUrl: args.url || null, layout: args.layout || null,
      ...before, clip: [0, 0, ...args.viewport], captureScale: 2, nativeDensity: 4, pixelSize,
      sha256: createHash('sha256').update(png).digest('hex'), icc: 'Display P3', route: 'native Chrome compositor via CDP',
      nativeActions: args.actions || [], transformations: 'none', pointer: 'absent from compositor; moved to viewport origin', finalArticleReview: 'pending' }, null, 2));
    console.log(JSON.stringify({ saved: output, pixelSize, icc: 'Display P3' }));
  }
} finally { ws.close(); }
