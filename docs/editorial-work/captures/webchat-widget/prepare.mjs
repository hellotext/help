import WebSocket from '/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help/node_modules/ws/index.js';
import { execFileSync } from 'node:child_process';
const [url, width = '1200', height = '1000', mode = 'inspect'] = process.argv.slice(2);
if (!url?.startsWith('http://127.0.0.1:3191/hellotext/playbooks/')) throw Error('Unexpected route');
const profile = '/private/tmp/hellotext-qr-guide-headless-9447';
const owner = execFileSync('lsof', ['-nP', '-iTCP:9447', '-sTCP:LISTEN', '-Fpcn'], {encoding:'utf8'});
const pids = [...owner.matchAll(/^p(\d+)$/gm)].map(x=>x[1]);
if (pids.length !== 1 || !owner.includes('n127.0.0.1:9447')) throw Error('Unexpected CDP owner');
if (!execFileSync('lsof', ['-nP','-p',pids[0],'-Fn'], {encoding:'utf8'}).includes(`n${profile}/`)) throw Error('Wrong profile');
const pages = (await (await fetch('http://127.0.0.1:9447/json/list')).json()).filter(x=>x.type==='page');
if (pages.length !== 1 || new URL(pages[0].url).origin !== 'http://127.0.0.1:3191') throw Error('Wrong demo tab');
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
    const form=document.querySelector('.playbook-component--form:not(.hidden)');
    const click=e=>{if(!e)throw Error('Missing target');e.click()};
    if(mode==='appearance'){click(form.querySelector('details[data-section="brand"] summary'))}
    if(mode==='behavior'){
      click(form.querySelector('details[data-section="opening"] summary'));
      click(form.querySelector('[data-playbook--webchat--behaviour-target="onLoadRadio"]'));
      click(form.querySelector('[data-playbook--webchat--behaviour-target="firstVisitOnlyCheckbox"]'));
      click(form.querySelector('[data-playbook--webchat--behaviour-target="oncePerSessionCheckbox"]'));
      click(form.querySelector('[data-playbook--webchat--behaviour-target="delayLabel"]').closest('[data-ui--popover-target="trigger"],button,[popovertarget]'));
      click(form.querySelector('[data-playbook--webchat--behaviour-target="delayOption"][data-delay-seconds="5"]'));
    }
    if(mode==='teaser-controls'){
      click(form.querySelector('[data-playbook--webchat--teaser-target="enabledToggle"]'));
    }
    if(mode==='handoff'){
      click(form.querySelector('[data-playbook--webchat--handoff-target="enabledToggle"]'));
      click(form.querySelector('[data-playbook--webchat--handoff-target="selectorLabel"]').closest('[data-ui--popover-target="trigger"],button,[popovertarget]'));
      const input=form.querySelector('[data-playbook--webchat--handoff-target="customIdentifierInput"]');
      input.value='+1 202 555 0148'; input.dispatchEvent(new Event('input',{bubbles:true}));
      await new Promise(r=>setTimeout(r,100));
      click(form.querySelector('[data-playbook--webchat--handoff-target="customIdentifierOption"]'));
    }
    if(mode==='sequence'){
      const editor=form.querySelector('trix-editor');
      if(!editor?.editor)throw Error('Missing actual message editor');
      const text=(locale==='es'?'¡Hola! Somos Tienda Ejemplo. Podemos ayudarte con tu pedido o a elegir un producto. ¿Qué necesitas?':'Hi! We are Example Store. We can help with your order or choosing a product. What do you need?');
      editor.editor.loadHTML('<div>'+text+'</div>');
      editor.dispatchEvent(new Event('trix-change',{bubbles:true})); editor.blur();
    }
    if(mode==='installation')click(document.querySelector('[data-playbook--form-target~="installationPopover"] [data-ui--popover-target="trigger"]'));
    await new Promise(r=>setTimeout(r,350));
    const rect=e=>{if(!e)return null;const r=e.getBoundingClientRect();return [r.x,r.y,r.width,r.height]};
    const visible=e=>!!e.getBoundingClientRect().width && !!e.getClientRects().length && getComputedStyle(e).visibility!=='hidden';
    return JSON.stringify({url:location.href,title:document.title,locale,viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,
      form:rect(form),details:form?[...form.querySelectorAll('details')].map(e=>({section:e.dataset.section,open:e.open,rect:rect(e)})):[],
      editors:[...document.querySelectorAll('trix-editor,textarea,input,[contenteditable="true"]')].filter(visible).map(e=>({tag:e.tagName,id:e.id,type:e.type,target:e.dataset,rect:rect(e)})),
      preview:rect(document.querySelector('[data-playbook--webchat--personalization-target="webchatBody"]')), message:rect(document.querySelector('[data-playbook--webchat--personalization-target="messagesContainer"] article')), 
      labels:form?[...form.querySelectorAll('label,p,button')].filter(visible).map(e=>({text:e.innerText.slice(0,70),rect:rect(e)})):[],
      installationText:(()=>{const card=document.querySelector('[popover]:popover-open [data-kind="manual"]');return rect(card?.querySelector('.card-title-row')?.parentElement)})(),popovers:[...document.querySelectorAll('[popover]')].filter(e=>e.matches(':popover-open')).map(e=>({id:e.id,rect:rect(e),text:e.innerText.slice(0,1000)})),
      text:document.body.innerText.slice(0,5000)});
  })()`,returnByValue:true,awaitPromise:true});
  if(response.exceptionDetails)throw Error(response.exceptionDetails.exception?.description?.split('\n')[0] || 'Demo inspection failed');
  console.log(response.result.value);
}finally{socket.close()}
