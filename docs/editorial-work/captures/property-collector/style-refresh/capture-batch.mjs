import {execFileSync} from 'node:child_process';
import {writeFileSync,mkdirSync} from 'node:fs';
const root='/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help',dir=new URL('.',import.meta.url).pathname;
mkdirSync(dir+'native',{recursive:true});
const locale=l=>JSON.parse(execFileSync('python3',['/private/tmp/hellotext-forms-refresh-runner.py',dir+'locale.rb',l],{encoding:'utf8'}).trim());
const results=[];
try{for(const l of ['es','en']){const safety=locale(l);for(const concept of ['prerequisite','fields'])for(const mobile of [false,true]){
 const viewport=mobile?[390,1100]:[1440,1200];
 const url='http://127.0.0.1:3192/hellotext/playbooks/'+(concept==='fields'?'property-collector':'subscriber-booster')+'/new?component=property_collection';
 const j=JSON.parse(execFileSync(process.execPath,[dir+'prepare.mjs',url,...viewport.map(String),concept],{encoding:'utf8'}));
 if(j.locale!==l||j.dpr!==2||j.zoom!==1||j.rows.length!==(concept==='fields'?2:3)||j.rows[0].important!==true||j.rows.slice(1).some(r=>r.important)|| (concept==='prerequisite'&&!j.notice))throw Error('Wrong UI state');
 const clip=[Math.floor(j.form[0]-12),Math.floor(j.titleBounds[0].rect[1]-16),Math.ceil(j.form[2]+24),Math.ceil(j.rows.at(-1).rect[1]+j.rows.at(-1).rect[3]+16-(j.titleBounds[0].rect[1]-16))];
 const name=concept+'-'+l+(mobile?'-mobile':'');
 const native=JSON.parse(execFileSync(process.execPath,[root+'/script/capture_isolated_chrome.mjs','--port=9460','--profile=/private/tmp/hellotext-forms-ui-refresh-headless-9460','--email=design-system@example.test','--identity-url=http://127.0.0.1:3192/hellotext/journeys/new',`--url=${url}`,`--title=${j.title}`,`--locale=${l}`,`--text=${l==='es'?'Propiedades a recopilar':'Properties to collect'}`,`--viewport=${viewport}`,`--clip=${clip}`,`--output=${dir}native/${name}.png`],{cwd:root,encoding:'utf8'}));
 delete j.html;writeFileSync(dir+name+'-ui.json',JSON.stringify(j,null,2)+'\n');
 results.push({name,locale:l,concept,mobile,css_clip:clip,viewport,safety,ui:j,native});
 console.log(JSON.stringify({name,clip,native}));
}}}finally{locale('es')}
writeFileSync(dir+'capture-results.json',JSON.stringify(results,null,2)+'\n');
