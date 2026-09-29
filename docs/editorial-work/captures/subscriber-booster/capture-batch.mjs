import { execFileSync } from 'node:child_process';
import { mkdirSync, appendFileSync } from 'node:fs';
const locale=process.argv[2];
if(!['es','en'].includes(locale))throw Error('Expected ES or EN');
const root=process.cwd();
const out='/private/tmp/hellotext-subscriber-sources';mkdirSync(out,{recursive:true});
const base='http://127.0.0.1:3191/hellotext/playbooks/subscriber-booster/new';
const title=locale==='es'?'Nueva misión Impulsor de Suscriptores | Hellotext':'New Subscriber Booster playbook | Hellotext';
const shared=['--port=9447','--profile=/private/tmp/hellotext-qr-guide-headless-9447','--email=design-system@example.test','--identity-url=http://127.0.0.1:3191/hellotext/journeys/new'];
const plans=[
 ['invitation','',locale==='es'?'Sí, quiero':'Yes, please','1200,1000',locale==='es'?'640,105,550,270':'640,105,550,246'],
 ['invitation-mobile','',locale==='es'?'Sí, quiero':'Yes, please','810,1000','453,113,341,310'],
 ['discount','?component=discount','10%','1200,1000',locale==='es'?'50,350,530,410':'50,285,530,386'],
 ['discount-mobile','?component=discount','10%','1200,1000',locale==='es'?'160,610,245,118':'160,522,330,118'],
 ['webchat-options','?component=subscriber-booster--webchat-options',locale==='es'?'Mostrar mensaje teaser':'Show teaser','1200,1000','45,100,580,330'],
 ['webchat-options-mobile','?component=subscriber-booster--webchat-options',locale==='es'?'Mostrar mensaje teaser':'Show teaser','810,1400','45,100,345,360'],
 ['teaser','?component=subscriber-booster--webchat-options','10%','1200,1000','760,800,430,200'],
];
for(const[name,suffix,text,viewport,clip]of plans){
 if(process.argv[3]&&!process.argv[3].split(',').includes(name))continue;
 const url=base+suffix;
 execFileSync(process.execPath,[`${root}/script/sign_in_isolated_chrome.mjs`,...shared,`--url=${url}`,'--password-file=/private/tmp/hellotext-editorial-capture-password'],{cwd:root,stdio:'pipe'});
 const result=execFileSync(process.execPath,[`${root}/script/capture_isolated_chrome.mjs`,...shared,`--url=${url}`,`--title=${title}`,`--locale=${locale}`,`--text=${text}`,`--viewport=${viewport}`,`--clip=${clip}`,`--output=${out}/${name}-${locale}.png`],{cwd:root,encoding:'utf8'});
 appendFileSync(`${out}/capture-results.jsonl`,result);
 console.log(`${name}-${locale}: ${result.trim()}`);
}
