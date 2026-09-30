import {execFileSync} from 'node:child_process';
import {mkdirSync,writeFileSync} from 'node:fs';
const root='/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help';
const helpers=new URL('.',import.meta.url).pathname;
const out=process.argv[2]||'/private/tmp/hellotext-popup-follow-up/native'; mkdirSync(out,{recursive:true});
const run=(cmd,args)=>execFileSync(cmd,args,{cwd:root,encoding:'utf8',maxBuffer:1024*1024});
const fixture=mode=>JSON.parse(run('python3',['/private/tmp/hellotext-forms-refresh-runner.py',helpers+'display-state.rb',mode]));
const preflight=JSON.parse(run('python3',['/private/tmp/hellotext-forms-refresh-runner.py',helpers+'preflight.rb']));
const images=[];
const union=(rs,m)=>{const x=Math.floor(Math.min(...rs.map(r=>r[0]))-m),y=Math.floor(Math.min(...rs.map(r=>r[1]))-m);return[x,y,Math.ceil(Math.max(...rs.map(r=>r[0]+r[2]))+m)-x,Math.ceil(Math.max(...rs.map(r=>r[1]+r[3]))+m)-y]};
try{
 for(const locale of ['es','en']){
 const display=fixture(locale);
 for(const name of ['overview','steps','steps-mobile','fields','fields-mobile','completion']){
 if(process.argv[3]&&!process.argv[3].split(',').includes(name))continue;
 const route=name==='steps-mobile'?'preview?device=mobile':name==='completion'?'preview?device=mobile&preview_mode=completed':'edit';
 const url='http://127.0.0.1:3192/hellotext/capture/popup/e9Z2LN51/'+route;
 const state=JSON.parse(run('node',[helpers+'prepare.mjs',url,'1280','1100',name.startsWith('fields')?'fields':'inspect']));
 if(state.locale!==locale||state.dpr!==2||state.zoom!==1)throw Error('Unexpected UI state');
 const canvas=state.panels.find(e=>e.target==='canvas')?.rect;
 const menu=state.menus.find(e=>e.target.includes('dropdown-container'))?.rect;
 const tabs=state.panels.find(e=>e.target==='mt-10 flex shrink-0')?.rect;
 const preview=state.menus.find(e=>e.rect[2]===350)?.rect;
 const clip=name==='overview'?[16,12,1248,Math.ceil(canvas[1]+canvas[3]+28)-12]:name==='steps'?union([canvas,tabs],16):name==='fields'?union([canvas,menu],16):name==='fields-mobile'?[menu[0]+14,menu[1]+14,menu[2]-28,menu[3]-28]:union([preview],16);
 if(clip[0]<0||clip[1]<0||clip[0]+clip[2]>1280||clip[1]+clip[3]>1100)throw Error('Invalid crop');
 const text=name.startsWith('fields')?(locale==='es'?'Requerido':'Required'):name==='completion'?(locale==='es'?'¡Gracias por tu interés!':'Thanks for your interest!'):(locale==='es'?'Novedades de Tienda Ejemplo':'News from Example Store');
 const output=out+'/'+name+'-'+locale+'.png';
 const native=JSON.parse(run('node',['script/capture_isolated_chrome.mjs','--port=9460','--profile=/private/tmp/hellotext-forms-ui-refresh-headless-9460','--email=design-system@example.test','--identity-url=http://127.0.0.1:3192/hellotext/journeys/new','--url='+url,'--title='+state.title,'--locale='+locale,'--text='+text,'--viewport=1280,1100','--clip='+clip.join(','),'--output='+output]));
 images.push({name,locale,display,state,clip,native}); console.log(locale+' '+name+' '+clip[2]+'x'+clip[3]+' CSS');
 }
 }
}finally{const restored=fixture('restore');const postflight=JSON.parse(run('python3',['/private/tmp/hellotext-forms-refresh-runner.py',helpers+'preflight.rb']));writeFileSync(out+'/batch.json',JSON.stringify({preflight,images,restored,postflight},null,2))}
