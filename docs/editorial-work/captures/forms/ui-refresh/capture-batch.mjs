import{execFileSync}from'node:child_process';import{mkdirSync,writeFileSync,appendFileSync}from'node:fs';
const locale=process.argv[2];if(!['es','en'].includes(locale))throw Error('Locale required');
const root=new URL('../../../../../',import.meta.url).pathname.replace(/\/$/,''),out='/private/tmp/hellotext-forms-refresh-sources';mkdirSync(out,{recursive:true});
const base='http://127.0.0.1:3192/hellotext/captures/forms/3oDXBQG4';
const shared=['--port=9460','--profile=/private/tmp/hellotext-forms-ui-refresh-headless-9460','--email=design-system@example.test','--identity-url=http://127.0.0.1:3192/hellotext/journeys/new'];
const plans=[['preview','/edit','inspect'],['fields','/edit','fields'],['fields-mobile','/edit','fields'],['optional','/coupon','inspect'],['embed','','inspect'],['embed-mobile','','inspect']];
for(const[name,route,mode]of plans){
 if(process.argv[3]&&!process.argv[3].split(',').includes(name))continue;
 const viewport=[1400,1100],url=base+route;
 const j=JSON.parse(execFileSync(process.execPath,[new URL('./prepare.mjs',import.meta.url).pathname,url,...viewport.map(String),mode],{encoding:'utf8'}));
 if(j.locale!==locale||j.dpr!==2||j.zoom!==1||!j.title.includes('Hellotext'))throw Error('Unexpected state');
 const panel=t=>{const p=j.panels.find(e=>e.target===t);if(!p)throw Error(`Missing ${t}`);return p.rect};
 let r,text;
 const pad=(b,n)=>[b[0]-n,b[1]-n,b[2]+2*n,b[3]+2*n];
 if(name==='preview'){r=pad(panel('bodies'),12);text=locale==='es'?'Recibe novedades de Editorial Demo.':'Get updates.'}
 else if(name.startsWith('fields')){const menu=j.menus.find(e=>e.target.includes('dropdown-container')).rect;
 if(name.endsWith('mobile')){r=[menu[0]+14,menu[1]+14,menu[2]-28,Math.min(menu[3]-28,316)]}else{const b=panel('bodies'),n=j.panels.find(e=>e.target.includes('bg-blush')).rect;const x=Math.min(b[0],n[0]),y=b[1];r=[x-12,y-12,Math.max(menu[0]+menu[2],n[0]+n[2])+16-x+12,Math.max(menu[1]+menu[3],b[1]+b[3],n[1]+n[3])+16-y+12]}
 text=locale==='es'?'Requerido':'Required'}
 else if(name==='optional'){const c=panel('coupons-dropdown'),d=panel('journeys-dropdown');const top=c[1]-(locale==='en'?40:68);r=[c[0]-12,top,c[2]+24,d[1]+d[3]+12-top];text=locale==='es'?'Elige una ruta':'Select a journey'}
 else if(name==='embed'){const b=j.panels.filter(e=>e.target.includes('border-lavender')).at(-1);if(!b)throw Error('Embed card missing');r=pad(b.rect,12);text=locale==='es'?'Agregar el formulario en tu sitio':j.text.match(/Add[^\n]*form[^\n]*website/i)?.[0] || 'data-form-header'}
 else {const b=j.panels.find(e=>e.target.includes('bg-lavender-light')).rect;r=pad(b,12);text='data-form-header'}
 r=r.map(Math.round);if(r[0]<0||r[1]<0||r[0]+r[2]>viewport[0]||r[1]+r[3]>viewport[1])throw Error(`Invalid clip ${name} ${r}`);
 const output=execFileSync(process.execPath,[`${root}/script/capture_isolated_chrome.mjs`,...shared,`--url=${url}`,`--title=${j.title}`,`--locale=${locale}`,`--text=${text}`,`--viewport=${viewport}`,`--clip=${r}`,`--output=${out}/${name}-${locale}.png`],{cwd:root,encoding:'utf8'});
 appendFileSync(`${out}/capture-results.jsonl`,output);writeFileSync(`${out}/${name}-${locale}-ui.json`,JSON.stringify(j,null,2));console.log(output.trim());
}
