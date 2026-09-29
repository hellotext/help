import { execFileSync } from 'node:child_process';
import { mkdirSync,appendFileSync,writeFileSync } from 'node:fs';
const locale=process.argv[2];if(!['es','en'].includes(locale))throw Error('Expected ES or EN');
const root='/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help';
const out='/private/tmp/hellotext-webchat-sources';mkdirSync(out,{recursive:true});
const base='http://127.0.0.1:3191/hellotext/playbooks/RbQxgZdE/edit';
const title=locale==='es'?'Editar misión Widget de Webchat | Hellotext':'Edit Webchat Widget playbook | Hellotext';
const shared=['--port=9447','--profile=/private/tmp/hellotext-qr-guide-headless-9447','--email=design-system@example.test','--identity-url=http://127.0.0.1:3191/hellotext/journeys/new'];
const plans=[
 ['appearance','appearance','appearance',[1200,1100]],['appearance-mobile','appearance','appearance',[880,1100]],
 ['behavior','behaviour','behavior',[1200,1100]],['behavior-mobile','behaviour','behavior',[1060,1100]],
 ['opening','sequence','sequence',[1200,1100]],['opening-mobile','sequence','sequence',[810,1100]],
 ['teaser','teaser','teaser-controls',[1200,1100]],['teaser-mobile','teaser','teaser-controls',[810,1100]],
 ['channels','handoff','handoff',[1200,1100]],['channels-mobile','handoff','handoff',[810,1100]],
 ['installation','','installation',[1200,1200]],['installation-mobile','','installation',[880,1400]],
];
for(const[name,component,mode,viewport]of plans){
 if(process.argv[3]&&!process.argv[3].split(',').includes(name))continue;
 const url=base+(component?`?component=webchat--${component}`:'');
 execFileSync(process.execPath,[`${root}/script/sign_in_isolated_chrome.mjs`,...shared,`--url=${url}`,'--password-file=/private/tmp/hellotext-editorial-capture-password'],{cwd:root,stdio:'pipe'});
 const info=JSON.parse(execFileSync(process.execPath,['/private/tmp/hellotext-webchat-prepare.mjs',url,...viewport.map(String),mode],{encoding:'utf8'}));
 if(info.title!==title||info.locale!==locale||info.zoom!==1||info.dpr!==2)throw Error('Unexpected actual UI state');
 let clip,text;
 const mobile=name.endsWith('-mobile');
 const rect=info.form;
 if(name.startsWith('appearance')){
  const detail=info.details.find(e=>e.section==='brand').rect;
  if(mobile){const label=info.labels.find(e=>e.text===(locale==='es'?'Color primario':'Primary Color')).rect;clip=[label[0]-10,label[1]-16,360,68]}
  else clip=[rect[0]-12,rect[1]-12,rect[2]+24,detail[1]+detail[3]-rect[1]-2];
  text=locale==='es'?'Color primario':'Primary Color';
 }else if(name.startsWith('behavior')){
  const d=info.details.find(e=>e.section==='opening').rect;clip=[d[0]-12,d[1]+10,d[2]+24,d[3]-22];if(mobile){const label=info.labels.find(e=>e.text===(locale==='es'?'Solo en la primera visita':'First visit only')).rect;const last=info.labels.find(e=>e.text===(locale==='es'?'Una vez por sesión':'Once per session')).rect;clip=[d[0]+36,label[1]-4,360,last[1]+last[3]-label[1]+18]}text=locale==='es'?'Después de 5 segundos':'After 5 seconds';
 }else if(name.startsWith('opening')){
  if(mobile){const m=info.message;clip=[m[0]-8,m[1]-8,m[2]+16,m[3]+16]}
  else{const b=info.labels.find(e=>e.text===(locale==='es'?'Nuevo mensaje':'New message')).rect;clip=[rect[0]-12,rect[1]-12,rect[2]+24,b[1]+b[3]+16-rect[1]+12]}
  text=locale==='es'?'Podemos ayudarte con tu pedido':'We can help with your order';
 }else if(name.startsWith('teaser')){
  const end=Math.max(...info.labels.map(e=>e.rect[1]+e.rect[3]));clip=[rect[0]-20,rect[1]-12,rect[2]+40,end+18-rect[1]+12];text=locale==='es'?'Burbuja teaser':'Teaser bubble';
 }else if(name.startsWith('channels')){
  const end=Math.max(...info.labels.map(e=>e.rect[1]+e.rect[3]));clip=[rect[0]-12,rect[1]-12,rect[2]+24,end+72-rect[1]+12];text='+1 202 555 0148';
 }else{
  const p=info.popovers[0].rect;clip=[p[0]+26,p[1]+26,p[2]-52,p[3]-52];if(mobile){const t=info.installationText;if(!t)throw Error('Missing manual installation text');clip=[t[0]-8,t[1]-8,t[2]+16,t[3]+16]}text=locale==='es'?'Instalación manual en tu sitio web':'Manual Installation on your website';
 }
 clip=clip.map(Math.round);
 if(clip[0]<0||clip[1]<0||clip[0]+clip[2]>viewport[0]||clip[1]+clip[3]>viewport[1])throw Error(`Invalid planned bounds for ${name}: ${clip}`);
 const result=execFileSync(process.execPath,[`${root}/script/capture_isolated_chrome.mjs`,...shared,`--url=${url}`,`--title=${title}`,`--locale=${locale}`,`--text=${text}`,`--viewport=${viewport}`,`--clip=${clip}`,`--output=${out}/${name}-${locale}.png`],{cwd:root,encoding:'utf8'});
 appendFileSync(`${out}/capture-results.jsonl`,result);
 writeFileSync(`${out}/${name}-${locale}-ui.json`,JSON.stringify(info,null,2));
 console.log(result.trim());
}
