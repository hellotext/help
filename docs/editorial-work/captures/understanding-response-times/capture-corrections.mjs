import{execFileSync}from'node:child_process';import{readFileSync,writeFileSync}from'node:fs';
const dir='/private/tmp/hellotext-response-times-editorial-20261001',root='/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help',results=JSON.parse(readFileSync(dir+'/capture-results.json'));
try{for(const locale of ['es','en']){execFileSync('python3',['/private/tmp/hellotext-forms-refresh-runner.py','/private/tmp/hellotext-custom-store-guide/locale.rb',locale]);for(const concept of ['default','channel','technology','hours','weekday'])for(const mobile of [false,true]){
 if(!((mobile&&['default','channel','weekday'].includes(concept))||concept==='technology'))continue;
 const name=`${concept}-${locale}${mobile?'-mobile':''}`,viewport=[mobile?430:1400,1600];
 const ui=JSON.parse(execFileSync(process.execPath,[dir+'/prepare.mjs',concept,...viewport.map(String)],{encoding:'utf8'}));let clip;
 if(concept==='hours'){
 const a=ui.controls.find(x=>x.id==='sla-response-time');if(!a||!a.text.includes(locale==='es'?'Domingo':'Sunday'))throw Error('Incomplete week');clip=[Math.floor(a.rect[0]-8),Math.floor(a.rect[1]-8),Math.ceil(a.rect[2]+16),Math.ceil(a.rect[3]+16)];
 }else{
 const pane=ui.controls.find(x=>x.tag==='X-PANE'),head=ui.controls.find(x=>x.tag==='H6');if(!pane||!head)throw Error('Missing real form');
 let bottom;if(concept==='technology'){const p=ui.controls.find(x=>x.tag==='SECTION'&&x.id.endsWith('_popover')&&x.text.includes('Messenger'));if(!p)throw Error('Missing native complete picker');bottom=p.rect[1]+p.rect[3]+8;}
 else {const ss=ui.controls.filter(x=>x.inPane&&x.tag==='SECTION'&&x.rect[0]>=pane.rect[0]&&x.text.trim()&&x.rect[1]>head.rect[1]);bottom=Math.max(...ss.map(x=>x.rect[1]+x.rect[3]))+8;}
 clip=[Math.ceil(pane.rect[0]+9),Math.floor(head.rect[1]-8),Math.floor(pane.rect[2]-18),Math.ceil(bottom)-Math.floor(head.rect[1]-8)];
 }
 if(concept==='technology'){const p=ui.controls.find(x=>x.tag==='SECTION'&&x.id.endsWith('_popover')&&x.text.includes('Messenger'));clip=[Math.floor(p.rect[0]),Math.floor(p.rect[1]),Math.ceil(p.rect[2]),Math.ceil(p.rect[3])];}
 if(clip.some(x=>x<0)||clip[0]+clip[2]>viewport[0]||clip[1]+clip[3]>viewport[1]||ui.locale!==locale||ui.dpr!==2||ui.zoom!==1)throw Error('Invalid guard/bounds');
 const text=concept==='hours'?(locale==='es'?'Horario comercial':'Business hours'):concept==='weekday'?(locale==='es'?'Lunes':'Monday'):concept==='default'?(locale==='es'?'Política de respuesta predeterminada':'Default response policy'):(locale==='es'?'Nueva regla de respuesta':'New response rule');
 const native=JSON.parse(execFileSync(process.execPath,[root+'/script/capture_isolated_chrome.mjs','--port=9460','--profile=/private/tmp/hellotext-forms-ui-refresh-headless-9460','--url='+ui.url,'--title='+ui.title,'--locale='+locale,'--email=design-system@example.test','--identity-url=http://127.0.0.1:3192/hellotext/journeys/new','--text='+text,'--clip='+clip.join(','),'--viewport='+viewport.join(','),'--output='+dir+'/native/'+name+'-original.png'],{encoding:'utf8'}));
 writeFileSync(dir+'/'+name+'-ui.json',JSON.stringify(ui,null,2)+'\n');writeFileSync(dir+'/'+name+'-native.json',JSON.stringify(native,null,2)+'\n');const previous=results.findIndex(x=>x.name===name);if(previous<0)throw Error('Missing rejected candidate');results[previous]={name,concept,locale,mobile,clip,ui,native};writeFileSync(dir+'/capture-results.json',JSON.stringify(results,null,2)+'\n');console.log(JSON.stringify({name,clip,pixels:native.pixelSize,icc:native.icc}));
}}}finally{execFileSync('python3',['/private/tmp/hellotext-forms-refresh-runner.py','/private/tmp/hellotext-custom-store-guide/locale.rb','es']);}
