#!/usr/bin/env python3
"""Root-run review of accepted, integrated Inbox candidates at the configured local preview origin.

Does not start browsers or servers. The dedicated root-owned browser must be
idle; its only page may initially be the previous local preview on port 4298.
Requires integration-record.json and a successful local build verification.
"""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import hashlib
import json
import struct
import subprocess
import sys
sys.dont_write_bytecode = True
from revision_support import CONFIG, CONFIG_PATH, PREVIEW_ORIGIN, checked_evidence

HERE = Path(__file__).resolve().parent
HELP = HERE.parents[3]
BROWSER = HERE / 'review-browser.mjs'
OUT = HERE / 'page-review'
ROUTES = [
    ('overview', 'es', 'es/resumen-inbox-conversaciones.html'),
    ('overview', 'en', 'inbox-conversations-overview.html'),
    ('filters', 'es', 'es/filtrar-buscar-conversaciones-inbox.html'),
    ('filters', 'en', 'filter-and-search-inbox.html'),
]


def browser(**args):
    result = subprocess.check_output(['node', str(BROWSER), json.dumps(args)], text=True)
    return json.loads(result.splitlines()[0])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--guide', choices=['all', 'overview', 'filters'], default='all')
    parser.add_argument('--plan', action='store_true', help='Print expected review only; no browser')
    args = parser.parse_args()
    routes = [r for r in ROUTES if args.guide in ['all', r[0]]]
    if args.plan:
        print(json.dumps({'status': 'not_run', 'origin': PREVIEW_ORIGIN,
                          'routes': routes, 'viewports': [1440, 580, 390],
                          'browser_port': CONFIG['browser_port'], 'raw_and_rendered_pixel_review': 'required'}, indent=2))
        return
    integration = json.loads((HERE / 'integration-record.json').read_text())
    assert integration['status'] == 'integrated_locally_pending_build_and_page_review'
    # The independent verifier owns the content of this record. Its presence is
    # not taken as evidence here: current article/image hashes are checked below.
    build_path = HERE / 'build-verification.json'
    assert build_path.exists(), 'Run verify-build.py after the local production build'
    build = json.loads(build_path.read_text())
    assert build.get('result') == 'passed' or build.get('status') in ['passed', 'verified'], 'Build verification has not passed'
    assert build['integration_sha256'] == hashlib.sha256((HERE / 'integration-record.json').read_bytes()).hexdigest(), 'Build verified another integration'
    assert build['verifier_sha256'] == hashlib.sha256((HERE / 'verify-build.py').read_bytes()).hexdigest(), 'Build verifier changed'
    for key, path in [('manifest_sha256', HELP / integration['manifest']),
                      ('acceptance_sha256', HELP / integration['acceptance']),
                      ('figure_copy_sha256', HERE / 'proposed-figure-copy.json'),
                      ('baseline_sha256', HERE / 'originals/baseline.json')]:
        assert build[key] == hashlib.sha256(path.read_bytes()).hexdigest(), f'Build evidence changed: {key}'
    acceptance = json.loads((HELP / integration['acceptance']).read_text())
    source_review_path, _ = checked_evidence(acceptance)
    assert build['revision_config_sha256'] == hashlib.sha256(CONFIG_PATH.read_bytes()).hexdigest(), 'Config changed after build'
    assert build['source_review_sha256'] == hashlib.sha256(source_review_path.read_bytes()).hexdigest(), 'Source review changed after build'
    assert build['source_images_referenced'] == 28 and build['image_byte_comparisons'] == 56
    articles = {r['path']: r for r in integration['articles']}
    for path, record in articles.items():
        assert hashlib.sha256((HELP / path).read_bytes()).hexdigest() == record['sha256'], 'Article changed after integration'
    built_articles = {r['route']: r for r in build['articles']}
    for route, record in built_articles.items():
        assert record['sha256'] == articles[record['path']]['sha256'], 'Build verified another article revision'
        assert hashlib.sha256((HELP / '_site' / route).read_bytes()).hexdigest() == record['built_html_sha256'], 'Built HTML changed after verification'
    built_images = {r['source'].lstrip('/'): r for r in build['images']}
    for relative, record in built_images.items():
        for prefix in [HELP, HELP / '_site', HELP / '_site/es']:
            assert hashlib.sha256((prefix / relative).read_bytes()).hexdigest() == record['sha256'], f'Image changed after build verification: {relative}'
    OUT.mkdir(exist_ok=True)
    checks = []
    for guide, locale, route in routes:
        slug = 'inbox-overview' if guide == 'overview' else 'filter-and-search-inbox'
        article = articles[f'_i18n/{locale}/team/{slug}.md']
        url = f'{PREVIEW_ORIGIN}/{route}'
        for layout, width in [('desktop', 1440), ('narrow', 580), ('mobile', 390)]:
            state = browser(url=url, viewport=[width, 1000], expression='''(async()=>{
              for(const image of document.querySelectorAll('figure img')){
                image.scrollIntoView({behavior:'instant',block:'center'});
                await new Promise(r=>setTimeout(r,160));await image.decode();
              }
              window.scrollTo({top:0,behavior:'instant'});
              const response=await fetch(location.href,{cache:'no-store'});
              if(!response.ok)throw Error('Preview HTML request failed');
              const bytes=await response.arrayBuffer();
              const servedHtmlSha256=[...new Uint8Array(await crypto.subtle.digest('SHA-256',bytes))].map(v=>v.toString(16).padStart(2,'0')).join('');
              return {url:location.href,title:document.title,locale:document.documentElement.lang,
                servedHtmlSha256,
                viewport:[innerWidth,innerHeight],dpr:devicePixelRatio,zoom:visualViewport.scale,
                height:document.documentElement.scrollHeight,fonts:document.fonts.status,
                overflow:document.documentElement.scrollWidth>innerWidth,
                figures:[...document.querySelectorAll('figure')].map(f=>{
                  const i=f.querySelector('img'),s=f.querySelector('.ht-editorial-visual__stage'),
                    frame=f.querySelector('.ht-editorial-visual__image-frame'),c=f.querySelector('figcaption');
                  const ir=i.getBoundingClientRect(),sr=s.getBoundingClientRect(),fr=f.getBoundingClientRect();
                  return {id:f.dataset.inboxFigure||null,src:i.currentSrc,alt:i.alt,
                    ariaLabel:f.getAttribute('aria-label'),width:ir.width,height:ir.height,
                    naturalWidth:i.naturalWidth,complete:i.complete,
                    links:f.querySelectorAll('a').length,stage:sr.toJSON(),figure:fr.toJSON(),
                    frame:frame.getBoundingClientRect().toJSON(),stageBackground:getComputedStyle(s).backgroundColor,
                    border:getComputedStyle(s).borderWidth,borderColor:getComputedStyle(s).borderColor,
                    borderRadius:getComputedStyle(s).borderRadius,stagePadding:getComputedStyle(s).padding,
                    framePadding:getComputedStyle(frame).padding,
                    captionText:c.textContent.trim(),captionWidth:c.getBoundingClientRect().width,
                    captionClip:getComputedStyle(c).clipPath};
                })};})()''')
            assert state['url'] == url and state['viewport'] == [width, 1000]
            assert state['servedHtmlSha256'] == built_articles[route]['built_html_sha256'], 'Preview serves different HTML from the verified build'
            assert state['dpr'] >= 2 and state['zoom'] == 1 and state['fonts'] == 'loaded'
            assert not state['overflow'] and len(state['figures']) == article['figures'], state
            assert [f['id'] for f in state['figures'] if f['id'] in CONFIG['figure_ids']] == article['new_figure_ids']
            assert [f['id'] for f in state['figures'] if f['id']] == article['all_figure_ids']
            for item in state['figures']:
                expected_layout = 'mobile' if width <= 600 else 'desktop'
                assert item['src'].startswith(PREVIEW_ORIGIN + '/images/editorial/'), item
                assert f'-{locale}-{expected_layout}.png' in item['src'], item
                relative = item['src'].split(PREVIEW_ORIGIN + '/', 1)[1]
                data = (HELP / relative).read_bytes()
                assert relative in built_images and hashlib.sha256(data).hexdigest() == built_images[relative]['sha256'], 'Unverified figure image'
                assert (HELP / '_site' / relative).read_bytes() == data, 'Stale built image'
                pixels = struct.unpack('>II', data[16:24])
                item['pixelSize'] = list(pixels)
                item['nativeCssWidth'] = pixels[0] / 4
                item['displayToNativeRatio'] = item['width'] / item['nativeCssWidth']
                item['sourcePixelsPerDisplayedCssPixel'] = pixels[0] / item['width']
                assert item['width'] <= item['nativeCssWidth'] + 0.1, item
                assert item['sourcePixelsPerDisplayedCssPixel'] >= 2 and item['complete']
                assert item['links'] == 0 and item['alt'] and item['ariaLabel'] and item['captionText']
                assert item['captionWidth'] <= 1 and item['captionClip'] != 'none'
                assert item['border'] != '0px' and item['borderRadius'] != '0px'
                assert item['stageBackground'] != 'rgba(0, 0, 0, 0)'
                assert abs(item['stage']['width'] - item['figure']['width']) < 1
                assert item['frame']['width'] > item['width'] and item['stage']['width'] > item['frame']['width']
                assert abs(item['width']/item['height'] - pixels[0]/pixels[1]) < 0.005
            (OUT / f'{guide}-{locale}-{layout}.json').write_text(json.dumps(state, ensure_ascii=False, indent=2) + '\n')
            if layout != 'narrow':
                for part, top in enumerate(range(0, state['height'], 2500), 1):
                    browser(viewport=[width, 1000], expectedUrl=url,
                            screenshot=str(OUT / f'{guide}-{locale}-{layout}-page-{part}.png'),
                            tile=[top, min(2500, state['height'] - top)], expression='({url:location.href})')
                for index, item in enumerate(state['figures'], 1):
                    top = max(0, int(item['figure']['y']) - 40)
                    height = min(int(item['figure']['height']) + 80, state['height'] - top)
                    browser(viewport=[width, 1000], expectedUrl=url,
                            screenshot=str(OUT / f'{guide}-{locale}-{layout}-figure-{index}.png'),
                            clip=[0, top, width, height], expression='({url:location.href})')
            check = {'guide': guide, 'locale': locale, 'layout': layout, 'width': width,
                     'figures': len(state['figures']), 'geometry': 'passed', 'pixel_review': 'pending'}
            checks.append(check)
            print(json.dumps(check), flush=True)
    result = {'recorded_at': datetime.now(timezone.utc).isoformat(), 'status': 'geometry_checked_pixels_pending',
              'integration_sha256': hashlib.sha256((HERE / 'integration-record.json').read_bytes()).hexdigest(),
              'build_verification_sha256': hashlib.sha256(build_path.read_bytes()).hexdigest(),
              'checks': checks, 'publication': 'not_performed', 'retained_filter_limit': CONFIG['retained_filter_limit'],
              'deferred_figure_ids': CONFIG['deferred_figure_ids']}
    (OUT / f'summary-{args.guide}.json').write_text(json.dumps(result, indent=2) + '\n')


if __name__ == '__main__':
    main()
