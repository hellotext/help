#!/usr/bin/env python3
"""Read-only validation of the NPS image/prose contract; never starts a browser."""
import argparse,hashlib,html.parser,json,re,struct,subprocess,zlib
from pathlib import Path
CAP=Path(__file__).resolve().parent
ROOT=CAP.parents[3]
def digest(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def load(name): return json.loads((CAP/name).read_text())
def require(condition,message):
    if not condition: raise RuntimeError(message)
def png(p,record):
    b=p.read_bytes();require(b[:8]==b'\x89PNG\r\n\x1a\n',str(p)+' is not PNG');i=8;size=None;icc=None;ended=False
    while i<len(b):
        n=struct.unpack('>I',b[i:i+4])[0];typ=b[i+4:i+8];data=b[i+8:i+8+n]
        require(zlib.crc32(typ+data)&0xffffffff==struct.unpack('>I',b[i+8+n:i+12+n])[0],'CRC '+str(p))
        if typ==b'IHDR':size=list(struct.unpack('>II',data[:8]))
        if typ==b'iCCP':icc=zlib.decompress(data[data.index(b'\0')+2:])
        if typ==b'IEND':ended=True
        i+=n+12
    require(ended and i==len(b),'PNG framing '+str(p));require(size==record['pixelSize'],'dimensions '+str(p))
    require(icc is not None and hashlib.sha256(icc).hexdigest()==record['icc_sha256'],'ICC '+str(p))
    require(record['icc']=='Display P3' and record['nativeDensity']==2,'native P3/2x contract')
    require(size==[v*2 for v in record['logicalSize']],'logical size '+str(p))
    require(record['clip'][2:]==record['logicalSize'],'clip '+str(p))
class Figures(html.parser.HTMLParser):
    def __init__(self):super().__init__(convert_charrefs=True);self.figures=[];self.active=None
    def handle_starttag(self,tag,attrs):
        attrs=dict(attrs)
        if tag=='figure':
            require(self.active is None,'nested figure');self.active={'attrs':attrs,'tags':[]};self.figures.append(self.active)
        if self.active is not None:self.active['tags'].append((tag,attrs))
    def handle_startendtag(self,tag,attrs):self.handle_starttag(tag,attrs)
    def handle_endtag(self,tag):
        if tag=='figure':self.active=None

def run(sources_only=False):
    man=load('manifest.json');plan=load('figure-plan.json');dec=load('text-decisions.json');orig=load('originals.json');rec=load('integration-record.json')
    for name,key in [('manifest.json','manifest_sha256'),('figure-plan.json','figure_plan_sha256'),('text-decisions.json','text_decisions_sha256'),('originals.json','originals_sha256')]:require(digest(CAP/name)==rec[key],'binding '+name)
    require(len(man['records'])==20 and man['new_captures']==0,'twenty retained sources')
    mapping={(a['id'],a['locale'],a['layout']):a for a in man['records']};require(len(mapping)==20,'unique scene keys')
    assets={a['asset']:a for a in man['records']};require(len(assets)==20,'unique assets')
    built_count=0
    for path,a in assets.items():
        require(not Path(path).is_absolute() and '..' not in Path(path).parts,'portable asset path')
        require(digest(ROOT/path)==a['sha256'],'source byte hash '+path);png(ROOT/path,a)
        if not sources_only:
            for prefix in ['', 'es/']:
                bp=ROOT/'_site'/prefix/path;require(bp.is_file(),'missing built '+str(bp));require(digest(bp)==a['sha256'],'built bytes '+str(bp));built_count+=1
    original_by={r['path']:r for r in orig['records']}
    for entry in rec['articles']:
        path=entry['path'];locale=path.split('/')[1];o=original_by[path];original=(CAP/o['file']).read_text();require(digest(CAP/o['file'])==o['sha256'],'original '+path)
        expected=original
        ops=next(x['operations'] for x in dec['applied'] if x['path']==path)
        for op in ops:
            require(expected.count(op['before'])==1,'exact correction anchor '+op['id']);expected=expected.replace(op['before'],op['after'],1)
        actual=(ROOT/path).read_text();require(actual==expected,'complete text transformation '+path);require(digest(ROOT/path)==entry['sha256'],'article binding '+path)
        require(re.findall(r'^## .+$',actual,re.M)==re.findall(r'^## .+$',original,re.M),'headings preserved')
        require(re.findall(r'\{% link .*? %\}',actual)==re.findall(r'\{% link .*? %\}',original),'ordered links preserved')
        require(len(re.findall(r'^## ',actual,re.M))==13,'thirteen headings');require(len(re.findall(r'\{% link .*? %\}',actual))==18,'eighteen links')
        # The two entire sections must remain current main, including absence of a report and all future tests.
        for heading in (['Entiende los datos NPS disponibles','Cómo probarla','Qué revisar después del lanzamiento'] if locale=='es' else ['Understand the available NPS data','How to test it','What to review after launch']):
            section=lambda t:t.split('## '+heading+'\n',1)[1].split('\n## ',1)[0]
            require(section(actual)==section(original),'unchanged section '+heading)
        parser=Figures();parser.feed(actual);require(parser.active is None,'closed figure')
        require([f['attrs'].get('data-nps-figure') for f in parser.figures]==plan['selected'],'five ordered figures')
        for f in parser.figures:
            id=f['attrs']['data-nps-figure'];require(f['attrs']['class']=='ht-editorial-visual ht-editorial-visual--screenshot','figure class');require(f['attrs']['aria-label']==plan['copy']['alt'][locale][id],'aria label')
            tags=f['tags'];require(not any(t in ['a','button','script','iframe'] for t,a in tags),'static no links/open controls')
            require(sum(t=='picture' for t,a in tags)==1,'one picture');require(sum(t=='source' for t,a in tags)==1,'one source');require(sum(t=='img' for t,a in tags)==1,'one img')
            d=mapping[(id,locale,'desktop')];m=mapping[(id,locale,'mobile')];img=next(a for t,a in tags if t=='img');source=next(a for t,a in tags if t=='source')
            require(img['src']=='/'+d['asset'] and img['srcset']=='/'+d['asset']+' 2x','desktop source');require(source['srcset']=='/'+m['asset']+' 2x' and source['media']=='(max-width: 600px)','mobile source')
            for el,r in [(img,d),(source,m)]:require([int(el['width']),int(el['height'])]==r['pixelSize'],'exact dimensions')
            require(img['style']=='width: auto; margin: 0 auto;' and img['alt']==plan['copy']['alt'][locale][id],'native image/alt')
            frame=next(a for t,a in tags if a.get('class')=='ht-editorial-visual__image-frame');require(frame['style']==f"max-width: {int(d['logicalSize'][0]+18)}px; width: fit-content; margin: 0 auto;",'native frame cap')
        if not sources_only:
            built=ROOT/'_site'/('es/pulso-nps.html' if locale=='es' else 'nps-pulse-playbook.html');require(built.is_file(),'built page');p=Figures();p.feed(built.read_text());actual_figs=[f for f in p.figures if 'data-nps-figure' in f['attrs']];require(len(actual_figs)==5,'built five figures')
    for original in orig['records']:
        if original['path'].startswith('_journeys/'):require(digest(ROOT/original['path'])==original['sha256'],'stub unchanged')
    if orig['progress_sha256'] is not None:require(digest(ROOT/'docs/editorial-work/progress.csv')==orig['progress_sha256'],'CSV unchanged')
    # Global renderer, config and gitlink stay at the original base; inspection is local/read-only.
    for path in ['assets/editorial/editorial_visuals.css','assets/editorial/editorial_visuals.js','assets/editorial/editorial_tabs.js','_config.yml','netlify.toml']:
        base=subprocess.check_output(['git','-C',str(ROOT),'show',rec['base']+':'+path]);require((ROOT/path).read_bytes()==base,'global file unchanged '+path)
    pin=subprocess.check_output(['git','-C',str(ROOT/'docs/editorial'),'rev-parse','HEAD'],text=True).strip();require(pin=='d5319b02e1c6a85f3a6294f11763b9be8dd58a43','editorial pin unchanged')
    return {'status':'passed','mode':'sources-only' if sources_only else 'sources-and-built','articles':2,'figures':10,'original_PNGs':20,'new_PNGs':0,'built_PNG_copies':built_count,'main_prose_outside_exact_decisions_preserved':True,'headings_links_stub_CSV_globals_preserved':True,'browser_QA':'not performed by this verifier'}
if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--sources-only',action='store_true');args=parser.parse_args();print(json.dumps(run(args.sources_only),indent=2))
