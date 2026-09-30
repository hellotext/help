import {execFileSync} from 'node:child_process';
import {writeFileSync,mkdirSync} from 'node:fs';
const root='/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help';
const dir=new URL('.',import.meta.url).pathname;mkdirSync(dir+'native',{recursive:true});
const url='http://127.0.0.1:3192/hellotext/capture/popup/e9Z2LN51/assign-coupon';
const locale=l=>JSON.parse(execFileSync('python3',['/private/tmp/hellotext-forms-refresh-runner.py',dir+'locale.rb',l],{encoding:'utf8'}).trim());
const captures=[];
try {
for(const l of ['es','en']) {
 const safety=locale(l);
 const j=JSON.parse(execFileSync(process.execPath,[dir+'prepare.mjs',url,'1440','1200','assignment'],{encoding:'utf8'}));
 if(j.locale!==l||j.dpr!==2||j.zoom!==1||!j.text.includes('GUIA-QR-10')||j.labels.length!==2)throw Error('Unexpected assignment state');
 const rects=[...j.labels.map(x=>x.rect),...j.panels.filter(x=>['coupons-dropdown','journeys-dropdown'].includes(x.target)).map(x=>x.rect)];
 const x=Math.floor(Math.min(...rects.map(r=>r[0]))-12),y=Math.floor(Math.min(...rects.map(r=>r[1]))-12);
 const w=Math.ceil(Math.max(...rects.map(r=>r[0]+r[2]))+12-x),h=Math.ceil(Math.max(...rects.map(r=>r[1]+r[3]))+12-y);
 const record=JSON.parse(execFileSync(process.execPath,[root+'/script/capture_isolated_chrome.mjs','--port=9460','--profile=/private/tmp/hellotext-forms-ui-refresh-headless-9460','--email=design-system@example.test','--identity-url=http://127.0.0.1:3192/hellotext/journeys/new',`--url=${url}`,`--title=${j.title}`,`--locale=${l}`,'--text=GUIA-QR-10','--viewport=1440,1200',`--clip=${[x,y,w,h]}`,`--output=${dir}native/assignment-${l}.png`],{cwd:root,encoding:'utf8'}));
 captures.push({locale:l,labels:j.labels,css_clip:[x,y,w,h],safety,native:record});
 writeFileSync(dir+l+'-ui.json',JSON.stringify(j,null,2)+'\n');
 console.log(JSON.stringify({locale:l,css_clip:[x,y,w,h],labels:j.labels.map(x=>({text:x.text,fontSize:x.fontSize,lineHeight:x.lineHeight})),native:record}));
}
} finally {locale('es')}
writeFileSync(dir+'capture-results.json',JSON.stringify(captures,null,2)+'\n');
