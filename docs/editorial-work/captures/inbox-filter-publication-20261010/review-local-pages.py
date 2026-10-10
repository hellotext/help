#!/usr/bin/env python3
"""Review only the ES/EN filter guides on the root-owned local Help preview.

No browser/server launch. --plan reads configuration only. All review PNGs stay
outside the repository; compact JSON links exact build and PNG hashes. Geometry
passing never implies that a person inspected the captured pixels.
"""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import hashlib
import json
import math
import struct
import subprocess

HERE = Path(__file__).resolve().parent
HELP = HERE.parents[3]
CONFIG_PATH = HERE / 'revision-config.json'
BROWSER = HERE / 'review-browser.mjs'
ORIGIN = 'http://127.0.0.1:4301'
EXTERNAL_RELATIVE = 'audit/filter-publication-20261010/page-review'
EXTERNAL_OUTPUT = HELP.parent / EXTERNAL_RELATIVE
ROUTES = {'es': 'es/filtrar-buscar-conversaciones-inbox.html', 'en': 'filter-and-search-inbox.html'}
VIEWPORTS = [('desktop', 1440), ('narrow', 580), ('mobile', 390)]
ASSETS = 'images/editorial/inbox-filters-20261010'
SEARCH = 'images/editorial/inbox-filter-context'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_json(path):
    return json.loads(path.read_text())


def evidence_path(relative, boundary=HELP):
    path = Path(relative)
    require(not path.is_absolute() and '..' not in path.parts, 'Expected relative evidence')
    resolved = (boundary / path).resolve()
    require(resolved.is_relative_to(boundary), 'Evidence escaped its scoped directory')
    return resolved


def compact_json(path, data):
    with path.open('x') as handle:
        json.dump(data, handle, ensure_ascii=False, separators=(',', ':'))
        handle.write('\n')


def browser(**args):
    result = subprocess.run(['node', str(BROWSER), json.dumps(args)], text=True, capture_output=True, timeout=90)
    require(result.returncode == 0, f'Browser review failed: {result.stderr.strip()}')
    return json.loads(result.stdout)


def verify_inputs(config):
    integration_path = HERE / 'integration-record.json'
    build_path = HERE / 'build-verification.json'
    integration, build = read_json(integration_path), read_json(build_path)
    require(build.get('result') == 'passed' or build.get('status') in ['passed', 'verified'], 'Build verification has not passed')
    require(build['integration_sha256'] == sha(integration_path), 'Build verified another integration')
    manifest_path = evidence_path(integration['manifest'])
    acceptance_path = evidence_path(integration['acceptance'])
    require(build['manifest_sha256'] == sha(manifest_path), 'Manifest changed after build verification')
    require(build['acceptance_sha256'] == sha(acceptance_path), 'Acceptance changed after build verification')
    require(build['revision_config_sha256'] == sha(CONFIG_PATH), 'Revision config changed after build verification')
    require(build['verifier_sha256'] == sha(HERE / 'verify-build.py'), 'Build verifier changed after verification')
    require(build['support_sha256'] == sha(HERE / 'revision_support.py'), 'Build support changed after verification')
    source_review_path = evidence_path(integration['source_review'])
    require(source_review_path.is_relative_to(HERE), 'Source review escaped this revision')
    require(build['source_review_sha256'] == sha(source_review_path), 'Source review changed after build verification')
    source_evidence = read_json(source_review_path)['evidence_files']
    require(isinstance(source_evidence, list) and source_evidence, 'Missing reviewed source evidence')
    for item in source_evidence:
        require(sha(evidence_path(item['path'], HERE)) == item['sha256'], f'Reviewed evidence changed: {item["path"]}')
    source_articles = {r['path']: r for r in integration['articles']}
    articles = {r['locale']: r for r in build['articles']}
    require(set(articles) == set(ROUTES), 'Expected exactly the two filter articles')
    for locale, route in ROUTES.items():
        article = articles[locale]
        path = f'_i18n/{locale}/team/filter-and-search-inbox.md'
        require(article['path'] == path and article['route'] == route, 'Unexpected article/route')
        require(article['figures'] == 3 and article['new_figure_ids'] == ['team', 'labels'], 'Unexpected figure contract')
        require(article['sha256'] == source_articles[path]['sha256'] == sha(HELP / path), 'Article changed after integration/build')
        require(article['built_html_sha256'] == sha(HELP / '_site' / route), 'Built HTML changed after verification')
    expected = {f'{ASSETS}/{kind}-{locale}-{layout}.png' for kind in ['team', 'labels'] for locale in ROUTES for layout in ['desktop', 'mobile']}
    expected |= {f'{SEARCH}/search-{locale}-{layout}.png' for locale in ROUTES for layout in ['desktop', 'mobile']}
    images = {r['source'].lstrip('/'): r for r in build['images']}
    require(len(build['images']) == 12 and set(images) == expected, 'Expected eight new and four retained Search PNGs')
    manifest = read_json(manifest_path)
    records = {r['file']: r for r in manifest['records']}
    require(len(manifest['records']) == 8 and set(records) == {Path(p).name for p in expected if p.startswith(ASSETS + '/')}, 'Expected eight exact new source records')
    for relative, record in images.items():
        data = (HELP / relative).read_bytes()
        require(data[:8] == b'\x89PNG\r\n\x1a\n', 'Source is not PNG')
        pixels = list(struct.unpack('>II', data[16:24]))
        require(pixels == record['pixels'], 'Source dimensions changed')
        require(record['native_css_size'] == [p / 4 for p in pixels], 'Source native size/density mismatch')
        require('Display P3' in record['profile'], 'Source profile is not verified P3')
        for prefix in [HELP, HELP / '_site', HELP / '_site/es']:
            require(sha(prefix / relative) == record['sha256'], f'Source/build image mismatch: {relative}')
        if relative.startswith(ASSETS + '/'):
            source = records[Path(relative).name]
            require(source['file'] == f"{source['id']}-{source['locale']}-{source['layout']}.png", 'Manifest identity mismatch')
            clip = source['clip']
            size = clip[2:] if isinstance(clip, list) else [clip['width'], clip['height']]
            require(source['sha256'] == record['sha256'] and source['pixelSize'] == pixels, 'Manifest/source mismatch')
            require(source['nativeDensity'] == 4 and size == record['native_css_size'], 'Manifest native dimensions mismatch')
            require('Display P3' in source['icc'], 'Manifest lacks P3')
    return articles, images, {'integration_sha256': sha(integration_path), 'build_verification_sha256': sha(build_path),
                             'manifest_sha256': sha(manifest_path), 'acceptance_sha256': sha(acceptance_path),
                             'support_sha256': sha(HERE / 'revision_support.py'), 'source_review_sha256': sha(source_review_path),
                             'source_evidence_sha256': {item['path']: item['sha256'] for item in source_evidence},
                             'revision_config_sha256': sha(CONFIG_PATH), 'reviewer_sha256': sha(Path(__file__)),
                             'browser_helper_sha256': sha(BROWSER)}


def check_geometry(state, locale, width, article, images):
    url = f'{ORIGIN}/{ROUTES[locale]}'
    require(state['url'] == url and state['locale'] == locale and state['viewport'] == [width, 1000], 'Wrong review route/viewport')
    require(state['servedHtmlSha256'] == article['built_html_sha256'], 'Preview serves a different build')
    require(state['dpr'] == 2 and state['zoom'] == 1 and state['fonts'] == 'loaded', 'Review readiness mismatch')
    require(not state['overflow'] and len(state['figures']) == 3, 'Page overflow or unexpected figure count')
    layout = 'mobile' if width <= 600 else 'desktop'
    for kind, item in zip(['search', 'team', 'labels'], state['figures']):
        require(item['id'] == kind or (kind == 'search' and item['id'] is None), 'Wrong figure order/identity')
        directory = SEARCH if kind == 'search' else ASSETS
        relative = f'{directory}/{kind}-{locale}-{layout}.png'
        require(item['src'] == f'{ORIGIN}/{relative}', 'Wrong responsive source')
        source = images[relative]
        require(state['servedImageHashes'][item['src']] == source['sha256'], 'Preview serves a different source PNG')
        image, frame, stage, figure = [item[name] for name in ['image', 'frame', 'stage', 'figure']]
        native_width, native_height = source['native_css_size']
        require(item['complete'] and image['width'] > 0 and image['height'] > 0, 'Undecoded or invisible image')
        require(image['width'] <= native_width + 0.1, 'Image enlarged beyond native logical width')
        require(abs(item['naturalWidth'] - native_width) <= 1 and abs(item['naturalHeight'] - native_height) <= 1, 'Expected native 4x srcset')
        require(source['pixels'][0] / image['width'] >= 2, 'Insufficient displayed density')
        require(abs(image['width']/image['height'] - native_width/native_height) < 0.005, 'Distorted aspect ratio')
        require(item['links'] == 0 and item['openControls'] == 0, 'Screenshot has an open/link control')
        require(item['alt'] and item['ariaLabel'] and item['captionText'], 'Missing accessible figure copy')
        require(item['caption']['width'] <= 1 and item['caption']['height'] <= 1 and item['captionClip'] != 'none', 'Caption became visible')
        require(item['captionDisplay'] != 'none' and item['captionVisibility'] != 'hidden' and item['captionAriaHidden'] != 'true', 'Accessible caption hidden from assistive technology')
        require(item['border'] != '0px' and item['borderRadius'] != '0px' and item['stageBackground'] != 'rgba(0, 0, 0, 0)', 'Stage styling missing')
        require(all(p >= 4 for p in item['stagePadding'] + item['framePadding']), 'Required insets missing')
        require(abs(stage['width'] - figure['width']) < 1 and figure['width'] <= 811, 'Stage escaped the article column')
        require(all(abs(figure[key] - state['column'][key]) < 1 for key in ['x', 'right', 'width']), 'Figure does not span the actual article column')
        for outer, inner, inset in [(stage, frame, 4), (frame, image, 4)]:
            gaps = [inner['x']-outer['x'], inner['y']-outer['y'], outer['right']-inner['right'], outer['bottom']-inner['bottom']]
            require(all(gap >= inset - 0.5 for gap in gaps), 'Image/frame margin clipped')
        require(figure['x'] >= 0 and figure['right'] <= width + 1, 'Figure extends beyond viewport')
        require(not item['previous'] or item['previous']['bottom'] <= figure['y'] + 1, 'Previous prose overlaps figure')
        require(not item['next'] or item['next']['y'] >= figure['bottom'] - 1, 'Following prose overlaps figure')
        item.update(nativeCssSize=source['native_css_size'], pixelSize=source['pixels'], sourceSha256=source['sha256'],
                    displayToNativeRatio=image['width']/native_width, sourcePixelsPerDisplayedCssPixel=source['pixels'][0]/image['width'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plan', action='store_true', help='Print the offline review contract only')
    parser.add_argument('--json-output-directory', type=Path, help='Override compact JSON output within this revision or the external audit directory')
    args = parser.parse_args()
    config = read_json(CONFIG_PATH)
    require(config['preview_origin'] == ORIGIN and config['browser_port'] == 9488, 'Unexpected review origin/port')
    require(config['asset_directory'] == ASSETS and config['figure_ids'] == ['team', 'labels'], 'Unexpected figure scope')
    require(config['page_review_output_directory'] == EXTERNAL_RELATIVE, 'Expected the parent-relative external PNG directory')
    require(EXTERNAL_OUTPUT.resolve() == EXTERNAL_OUTPUT and not EXTERNAL_OUTPUT.is_relative_to(HELP), 'PNG output must remain outside the repository without symlink redirection')
    require(config['page_review_json_directory'] == str((HERE / 'page-review').relative_to(HELP)), 'Expected the Help-relative revision JSON directory')
    require(isinstance(config['bootstrap_urls'], list), 'Explicit bootstrap URLs required')
    json_root = (args.json_output_directory or HELP / config['page_review_json_directory']).resolve()
    require(json_root.is_relative_to(HERE) or json_root.is_relative_to(EXTERNAL_OUTPUT), 'JSON output escaped the review scope')
    if args.plan:
        print(json.dumps({'status':'not_run', 'origin':ORIGIN, 'routes':ROUTES, 'viewports':VIEWPORTS,
                          'browser_port':9488, 'png_output_directory':str(EXTERNAL_OUTPUT), 'json_output_directory':str(json_root),
                          'source_images':12, 'new_images':8, 'retained_search_images':4,
                          'captures':'complete-page tiles and all three figures at every viewport; whole native 1000px viewports with explicit requested regions and actual scroll clips; consecutive page tiles and numbered figure parts cover all content, with overlap at the clamped tail', 'capture_density':4,
                          'pixel_review':'required after capture'}, indent=2))
        return
    articles, images, bindings = verify_inputs(config)
    run_id = datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')
    png_run, json_run = EXTERNAL_OUTPUT / run_id, json_root / run_id
    png_run.mkdir(parents=True, exist_ok=False)
    if json_run != png_run:
        json_run.mkdir(parents=True, exist_ok=False)
    checks = []
    for locale, route in ROUTES.items():
        url = f'{ORIGIN}/{route}'
        for layout, width in VIEWPORTS:
            prefix = f'filters-{locale}-{layout}'
            state = browser(operation='measure', url=url, viewport=[width, 1000])
            check_geometry(state, locale, width, articles[locale], images)
            expected_figures = []
            for item in state['figures']:
                expected = {'id': item['id'], 'src': item['src']}
                for part in ['figure', 'image', 'frame', 'stage']:
                    key = 'rect' if part == 'figure' else part + 'Rect'
                    expected[key] = [item[part][axis] for axis in ['x', 'y', 'width', 'height']]
                expected_figures.append(expected)
            captures = []
            height = state['height']
            # Every capture fits entirely inside the real viewport after native scroll.
            clips = [(f'page-{part}', [0,top,width,min(1000,height-top)])
                     for part, top in enumerate(range(0,height,1000),1)]
            for index, item in enumerate(state['figures'],1):
                top = max(0, math.floor(item['figure']['y']) - 32)
                bottom = min(height, math.ceil(item['figure']['bottom']) + 32)
                pieces = list(range(top, bottom, 1000))
                for part, tile_top in enumerate(pieces, 1):
                    suffix = f'figure-{index}' if len(pieces) == 1 else f'figure-{index}-part-{part}'
                    clips.append((suffix, [0,tile_top,width,min(1000,bottom-tile_top)]))
            for suffix, clip in clips:
                record = browser(operation='capture', url=url, viewport=[width,1000],
                                 screenshot=str(png_run / f'{prefix}-{suffix}.png'), clip=clip, expectedFigures=expected_figures)
                require(record['requestedClip'] == clip, 'Capture request binding changed')
                require(record['clip'] == record['before']['scroll'] + record['before']['viewport'], 'Capture is not the exact native viewport')
                require(record['before']['contentBottom'] == state['contentBottom'], 'Native content bottom changed')
                require(record['before']['height'] == height, 'Page height changed between measurement and capture')
                require(len(record['before']['figures']) == 3, 'Figure count changed before capture')
                for measured, captured in zip(state['figures'], record['before']['figures']):
                    require(measured['src'] == captured['src'], 'Responsive source changed before capture')
                    for part in ['figure', 'image', 'frame', 'stage']:
                        key = 'rect' if part == 'figure' else part + 'Rect'
                        require([measured[part][axis] for axis in ['x', 'y', 'width', 'height']] == captured[key], f'{part} geometry changed before capture')
                require(record['sha256'] == sha(Path(record['file'])), 'Review PNG changed after capture')
                record['review_part'] = suffix
                captures.append(record)
            # Prove coverage of the browser-reported scrollable extent; retain exact
            # DOM box bottoms separately (they may extend subpixels beyond it).
            regions = [('page-', 0, state['height'])]
            regions += [(f'figure-{index}', max(0, math.floor(item['figure']['y']) - 32),
                         min(state['height'], math.ceil(item['figure']['bottom']) + 32))
                        for index, item in enumerate(state['figures'], 1)]
            for region_prefix, start, end in regions:
                cursor = start
                for record in sorted((r for r in captures if r['review_part'].startswith(region_prefix)), key=lambda r:r['clip'][1]):
                    y, extent = record['clip'][1], record['clip'][3]
                    require(y <= cursor, 'Native viewport coverage has a gap')
                    cursor = max(cursor, y + extent)
                require(cursor >= end, 'Native viewport coverage misses the requested tail')
            compact_json(json_run / f'{prefix}.json', {**state, 'captures':captures, **bindings, 'pixel_review':'pending'})
            check = {'locale':locale, 'layout':layout, 'viewport':[width,1000], 'figures':3, 'screenshots':len(captures),
                     'geometry':'passed', 'pixel_review':'pending', 'record':str(json_run / f'{prefix}.json')}
            checks.append(check)
            print(json.dumps(check), flush=True)
    _, _, final_bindings = verify_inputs(config)
    require(bindings == final_bindings, 'Build or helpers changed during the review')
    summary = {'recorded_at':datetime.now(timezone.utc).isoformat(), 'status':'geometry_checked_pixels_pending',
               **bindings, 'checks':checks, 'png_directory':str(png_run), 'json_directory':str(json_run),
               'publication':'not_performed', 'search_result_coverage':'unchanged_unverified'}
    compact_json(json_run / 'summary-filters.json', summary)
    print(json.dumps({'summary':str(json_run / 'summary-filters.json'), 'status':summary['status']}))


if __name__ == '__main__':
    main()
