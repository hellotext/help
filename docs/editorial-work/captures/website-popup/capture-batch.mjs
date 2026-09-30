import{execFileSync}from'node:child_process';import{mkdirSync,writeFileSync,appendFileSync}from'node:fs';
const locale=process.argv[2];if(!['es','en'].includes(locale))throw Error('Locale required');
const root='/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help',out='/private/tmp/hellotext-popup-sources';mkdirSync(out,{recursive:true});
const base='http://127.0.0.1:3191/hellotext/capture/popup/e9Z2LN51/';
const shared=['--port=9447','--profile=/private/tmp/hellotext-qr-guide-headless-9447','--email=design-system@example.test','--identity-url=http://127.0.0.1:3191/hellotext/journeys/new'];
const plans=[['steps','edit','inspect',[1440,1200]],['steps-mobile','preview?device=mobile','inspect',[1440,1200]],['fields','edit','fields',[1440,1200]],['fields-mobile','edit','fields',[1440,1200]],['completion','preview?device=mobile&preview_mode=completed','inspect',[1440,1200]],['style','edit','style',[1440,1200]],['layout','edit','layout',[1440,1200]],['settings','edit','settings',[1440,1200]],['assignment','assign-coupon','assignment',[1440,1200]],['installation','install','inspect',[1440,1200]],['installation-mobile','install','inspect',[430,1400]],['code','done?manual=true','inspect',[1440,1200]],['code-mobile','done?manual=true','inspect',[430,1200]]];
for(const[name,route,mode,viewport]of plans){
if(process.argv[3]&&!process.argv[3].split(',').includes(name))continue;
const url=base+route;
const j=JSON.parse(execFileSync(process.execPath,[new URL('./prepare.mjs',import.meta.url).pathname,url,...viewport.map(String),mode],{encoding:'utf8'}));
if(j.locale!==locale||j.dpr!==2||j.zoom!==1||!j.title.includes('Hellotext'))throw Error('Unexpected state');
const panel=t=>{const p=j.panels.find(e=>e.target===t);if(!p)throw Error(`Missing ${t}`);return p.rect};
let r,text;
if(name==='steps'){const body=panel('canvas'),header=j.panels.find(e=>e.target==='mt-10 flex shrink-0').rect;r=[Math.min(body[0],header[0])-12,header[1]-12,Math.max(body[0]+body[2],header[0]+header[2])-Math.min(body[0],header[0])+24,body[1]+body[3]+12-(header[1]-12)];text=locale==='es'?'Novedades de Tienda Ejemplo':'News from Example Store'}
else if(name==='steps-mobile'||name==='completion'){r=j.panels.find(e=>e.target.includes('popup--')||e.target.includes('popup-preview'))?.rect||j.menus.find(e=>e.rect[2]===350).rect;r=[r[0]-12,r[1]-12,r[2]+24,r[3]+24];text=name==='completion'?(locale==='es'?'¡Gracias por tu interés!':'Thanks for your interest!'):(locale==='es'?'Novedades de Tienda Ejemplo':'News from Example Store')}
else if(name.startsWith('fields')){const menu=j.menus.find(e=>e.target.includes('dropdown-container')).rect;if(name.endsWith('mobile')){r=[menu[0]+14,menu[1]+14,menu[2]-28,menu[3]-28]}else{const b=panel('canvas');r=[b[0]-12,b[1]-12,menu[0]+menu[2]+12-b[0]+12,Math.max(menu[1]+menu[3],b[1]+b[3])+12-b[1]+12]}text=locale==='es'?'Requerido':'Required'}
else if(['style','layout','settings'].includes(name)){r=panel(name+'Panel');r=[r[0]-12,r[1]-12,r[2]+24,r[3]+24];text=name==='style'?(locale==='es'?'Tipografía':'Typography'):name==='layout'?(locale==='es'?'Escritorio':'Desktop'):(locale==='es'?'Ajustes':'Settings')}
else if(name==='assignment'){const c=panel('coupons-dropdown'),d=panel('journeys-dropdown');r=[c[0]-12,c[1]-65,c[2]+24,d[1]+d[3]+12-(c[1]-65)];text='GUIA-QR-10'}
else if(name.startsWith('installation')){r=panel('popup-install-options');r=[r[0]-12,r[1]-12,r[2]+24,r[3]+24];text=locale==='es'?'Instalación manual en tu sitio web':j.text.match(/Manual[^\n]*website/i)[0]}
else {r=j.menus.find(e=>e.target.includes('popup-code-page__code')).rect;r=[r[0]-12,r[1]-12,r[2]+24,r[3]+24];text='Hellotext.initialize'}
r=r.map(Math.round);if(r[0]<0||r[1]<0||r[0]+r[2]>viewport[0]||r[1]+r[3]>viewport[1])throw Error(`Invalid clip ${name} ${r}`);
const output=execFileSync(process.execPath,[`${root}/script/capture_isolated_chrome.mjs`,...shared,`--url=${url}`,`--title=${j.title}`,`--locale=${locale}`,`--text=${text}`,`--viewport=${viewport}`,`--clip=${r}`,`--output=${out}/${name}-${locale}.png`],{cwd:root,encoding:'utf8'});appendFileSync(`${out}/capture-results.jsonl`,output);writeFileSync(`${out}/${name}-${locale}-ui.json`,JSON.stringify(j,null,2));console.log(output.trim());
}
