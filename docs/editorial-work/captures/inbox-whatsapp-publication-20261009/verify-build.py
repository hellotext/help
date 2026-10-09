#!/usr/bin/env python3
"""Verify an already-built local Inbox revision; never builds or accesses network.

Requires integrated candidates, exact raw-pixel acceptance and saved originals.
Checks all new and retained figures, native PNGs and both Jekyll image copies.
Writes build-verification.json only after every check passes. Browser/pixel QA
and publication remain separate; this helper does not close the search gap.
"""
from datetime import datetime, timezone
from html.parser import HTMLParser
from pathlib import Path
import csv
import hashlib
import json
import re
import struct
import subprocess
import sys
sys.dont_write_bytecode = True
from revision_support import CONFIG, CONFIG_PATH, ASSET_DIRECTORY, checked_evidence, check_preserved, RAW_ASSET_DIRECTORY

HERE = Path(__file__).resolve().parent
HELP = HERE.parents[3]
ASSETS = ASSET_DIRECTORY
GUIDES = {
    'overview': {'slug': 'inbox-overview', 'ids': ['context', 'profile', 'composer'], 'headings': 7, 'links': 21},
    'filters': {'slug': 'filter-and-search-inbox', 'ids': [], 'headings': 15, 'links': 6},
}
FIGURE_RE = re.compile(r'<figure\b[\s\S]*?</figure>')


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def sha(path):
    return digest(path.read_bytes())


def load(path):
    return json.loads(path.read_text())


def inside(relative, boundary=HELP):
    require(not Path(relative).is_absolute(), f'Expected relative path: {relative}')
    result = (HELP / relative).resolve()
    require(result.is_relative_to(boundary.resolve()), f'Path escapes allowed directory: {relative}')
    return result


def structure(body):
    return {
        'headings': re.findall(r'^#{1,6} .+$', body, re.M),
        'links': re.findall(r'\[[^\]]+\]\([^\n]+?\)', body),
        'liquid_links': re.findall(r'\{%\s*link\s+([^%]+?)\s*%\}', body),
    }


class Figures(HTMLParser):
    def __init__(self, body):
        super().__init__(convert_charrefs=True)
        self.figures, self.current, self.in_caption = [], None, False
        self.feed(body)
        require(self.current is None, 'Unclosed figure')

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == 'figure':
            require(self.current is None, 'Nested figure')
            self.current = {'attrs': attrs, 'images': [], 'sources': [], 'divs': [],
                            'caption': '', 'caption_attrs': None, 'interactive': []}
        if self.current is None:
            return
        if tag == 'img':
            self.current['images'].append(attrs)
        elif tag == 'source':
            self.current['sources'].append(attrs)
        elif tag == 'div':
            self.current['divs'].append(attrs)
        elif tag == 'figcaption':
            require(self.current['caption_attrs'] is None, 'Multiple captions')
            self.current['caption_attrs'] = attrs
            self.in_caption = True
        if tag in ('a', 'button', 'input', 'script', 'iframe', 'video', 'audio', 'form') or any(k.startswith('on') for k in attrs):
            self.current['interactive'].append(tag)

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)

    def handle_endtag(self, tag):
        if tag == 'figcaption':
            self.in_caption = False
        elif tag == 'figure' and self.current is not None:
            self.current['caption'] = ' '.join(self.current['caption'].split())
            self.figures.append(self.current)
            self.current = None

    def handle_data(self, data):
        if self.current is not None and self.in_caption:
            self.current['caption'] += data


def original_records(baseline):
    records = baseline['records']
    expected = {f'_i18n/{locale}/team/{v["slug"]}.md' for v in GUIDES.values() for locale in ('es', 'en')}
    expected |= {f'_team/{v["slug"]}.md' for v in GUIDES.values()}
    require(len(records) == 6 and {r['path'] for r in records} == expected, 'Original article/stub matrix differs')
    result = {}
    for item in records:
        saved = inside(item['original'], HERE / 'originals')
        require(sha(saved) == item['sha256'], f'Original snapshot changed: {saved}')
        baseline_bytes = subprocess.check_output(['git', 'show', f'{baseline["main"]}:{item["path"]}'], cwd=HELP)
        require(baseline_bytes == saved.read_bytes(), f'Original differs from immutable baseline: {saved}')
        result[item['path']] = saved.read_text()
        if item['path'].startswith('_team/'):
            require(inside(item['path']).read_bytes() == baseline_bytes, f'Route stub changed: {item["path"]}')
    return result


def verify_png(path):
    data = path.read_bytes()
    require(data[:8] == b'\x89PNG\r\n\x1a\n' and data[12:16] == b'IHDR', f'Not PNG: {path}')
    pixels = list(struct.unpack('>II', data[16:24]))
    require(all(v > 0 for v in pixels), f'Invalid dimensions: {path}')
    profile_output = subprocess.check_output(['sips', '-g', 'profile', str(path)], text=True)
    require('profile: Display P3' in profile_output, f'Missing Display P3: {path}')
    return data, pixels, profile_output.split('profile: ', 1)[1].strip()


def verify():
    integration_path = HERE / 'integration-record.json'
    preservation = check_preserved()
    integration = load(integration_path)
    require(integration['status'] == 'integrated_locally_pending_build_and_page_review', 'Candidates not integrated')
    baseline_path = HERE / 'originals/baseline.json'
    baseline = load(baseline_path)
    require(integration['baseline'] == baseline['main'], 'Integration baseline differs')
    originals = original_records(baseline)
    manifest_path = inside(integration['manifest'], HERE)
    acceptance_path = inside(integration['acceptance'], HERE)
    require(sha(manifest_path) == integration['manifest_sha256'], 'Manifest changed after integration')
    require(sha(acceptance_path) == integration['acceptance_sha256'], 'Pixel acceptance changed after integration')
    manifest, acceptance = load(manifest_path), load(acceptance_path)
    copy_path = HERE / 'proposed-figure-copy.json'
    copy = load(copy_path)['locales']
    require(acceptance['status'] == 'accepted_for_local_preview' and acceptance['copy_reviewed'] is True,
            'Exact raw pixels and copy have not been accepted')
    require(acceptance['reviewer'] and acceptance['reviewed_at'], 'Incomplete raw-pixel acceptance')
    require(acceptance['figure_copy_sha256'] == sha(copy_path), 'Figure copy changed after acceptance')
    require(acceptance['manifest_sha256'] == sha(manifest_path), 'Acceptance covers another manifest')
    source_review_path, source_review = checked_evidence(acceptance)
    require(integration['revision_config_sha256'] == sha(CONFIG_PATH), 'Revision configuration changed')
    require(integration['source_review_sha256'] == sha(source_review_path), 'Verified source changed')
    require(integration['source_review'] == str(source_review_path.relative_to(HELP)), 'Source review path differs')
    require(integration['verified_example_channel'] == source_review['channel'] == 'whatsapp', 'Channel changed')
    ids = integration['figure_ids']
    require(ids == CONFIG['figure_ids'], 'Expected the configured recapture matrix')
    allowed_ids = {i for guide in GUIDES.values() for i in guide['ids']}
    require(ids and len(ids) == len(set(ids)) and set(ids) <= allowed_ids, 'Invalid or empty accepted figure coverage')
    require(ids == acceptance['figure_ids'], 'Integrated and accepted figure IDs differ')
    expected_files = {f'{kind}-{locale}-{layout}.png' for kind in ids for locale in ('es', 'en') for layout in ('desktop', 'mobile')}
    source_records = manifest['records']
    require(len({r['file'] for r in source_records}) == len(source_records) == len(expected_files), 'Manifest includes duplicate or out-of-scope files')
    require(set(acceptance['accepted_files']) == expected_files, 'Acceptance file scope differs')
    manifest_by_name = {r['file']: r for r in source_records}
    assets = integration['assets']
    require(len(assets) == len(expected_files) and {a['file'] for a in assets} == expected_files, 'Integrated asset matrix differs')
    require(len({a['destination'] for a in assets}) == len(assets), 'Duplicate asset destinations')
    verified_new = {}
    for asset in assets:
        name = asset['file']
        require(Path(name).name == name and name in manifest_by_name, f'Invalid or missing source: {name}')
        record = manifest_by_name[name]
        kind, locale, layout = name[:-4].rsplit('-', 2)
        require(record['id'] == kind and record['locale'] == locale and record['layout'] == layout, f'Manifest identity differs: {name}')
        source = inside(asset['source'], HELP / RAW_ASSET_DIRECTORY)
        destination = inside(asset['destination'], HELP / ASSETS)
        require(source == (HELP / RAW_ASSET_DIRECTORY / name).resolve(), f'Incorrect raw source path: {name}')
        require(asset['destination'] == str(ASSETS / name), f'Incorrect published asset path: {name}')
        data, pixels, profile = verify_png(source)
        require(destination.read_bytes() == data, f'Published PNG differs from native source: {name}')
        require(digest(data) == record['sha256'] == asset['sha256'] == acceptance['accepted_files'].get(name), f'Accepted native hash differs: {name}')
        require(pixels == record['pixelSize'] == asset['pixelSize'], f'Pixel metadata differs: {name}')
        require(record['nativeDensity'] == 4 and 'Display P3' in record['icc'], f'Native density/profile differs: {name}')
        require(record.get('transformations', 'none') in ('none', None, []), f'Unexpected image transformation: {name}')
        clip = record['clip']
        native = [clip['width'], clip['height']] if isinstance(clip, dict) else clip[2:4]
        require(len(native) == 2 and all(abs(p - n * 4) <= 1 for p, n in zip(pixels, native)), f'Native 4x crop differs: {name}')
        require(native == [asset['nativeWidth'], asset['nativeHeight']], f'Native logical size differs: {name}')
        verified_new[asset['destination']] = {'raw_source': asset['source'], 'native_css_size': native,
                                            'clip': clip, 'profile': profile, 'origin': 'new_native_manifest'}

    article_records = integration['articles']
    expected_articles = {p for p in originals if p.startswith('_i18n/')}
    require(len(article_records) == 4 and {a['path'] for a in article_records} == expected_articles, 'Integrated article matrix differs')
    integrated_articles = {a['path']: a for a in article_records}
    all_images, checked_articles, stubs, retained_git_bytes = {}, [], [], {}
    for guide, spec in GUIDES.items():
        slug = spec['slug']
        stub_path = f'_team/{slug}.md'
        routes = dict(re.findall(r'^(permalink(?:_es)?):\s*(\S+)\s*$', originals[stub_path], re.M))
        stubs.append({'path': stub_path, 'sha256': sha(inside(stub_path)), 'preserved': True})
        locale_ids = []
        for locale in ('es', 'en'):
            path = f'_i18n/{locale}/team/{slug}.md'
            article_path = inside(path)
            body = article_path.read_text()
            integrated = integrated_articles[path]
            require(sha(article_path) == integrated['sha256'], f'Article changed after integration: {path}')
            expected_prose = FIGURE_RE.sub('', originals[path])
            if guide == 'overview':
                prose = load(copy_path)['prose'][locale]
                for key in ['intro_old', 'profile_anchor', 'composer_anchor']:
                    require(expected_prose.count(prose[key]) == 1, 'Published prose anchor differs')
                expected_prose = expected_prose.replace(prose['intro_old'], prose['intro_new'], 1)
                expected_prose = expected_prose.replace(prose['profile_anchor'], prose['profile_anchor'] + '\n\n' + prose['profile_paragraph'], 1)
                expected_prose = expected_prose.replace(prose['composer_anchor'], prose['composer_anchor'] + '\n\n' + prose['composer_paragraph'] + '\n\n', 1)
            else:
                require(body == originals[path], f'Published filter article changed: {path}')
            require(FIGURE_RE.sub('', body) == expected_prose, f'Unscoped prose change: {path}')
            before_structure, now_structure = structure(originals[path]), structure(body)
            require(now_structure == before_structure, f'Original headings or links changed: {path}')
            require(len(now_structure['headings']) == spec['headings'] == integrated['headings'], f'Heading count differs: {path}')
            require(len(now_structure['links']) == spec['links'] == integrated['links'], f'Link count differs: {path}')
            figures = Figures(body).figures
            original_figures = Figures(originals[path]).figures
            new_ids = [f['attrs'].get('data-inbox-figure') for f in figures if f['attrs'].get('data-inbox-figure') in ids]
            expected_ids = [kind for kind in spec['ids'] if kind in ids]
            require(new_ids == expected_ids == integrated['new_figure_ids'], f'Accepted figure order differs: {path}')
            expected_count = 4 if guide == 'overview' else 3
            require(len(figures) == expected_count == integrated['figures'], f'Figure count differs: {path}')
            locale_ids.append(new_ids)
            # Replaced indices are fixed by the saved baseline; all other figures,
            # especially the search limitation and ownership state, remain exact.
            replaced = {'overview': {'context': 0, 'profile': 1}, 'filters': {}}[guide]
            expected_retained = [f for n, f in enumerate(original_figures) if n not in {index for kind, index in replaced.items() if kind in ids}]
            require([f for f in figures if f['attrs'].get('data-inbox-figure') not in ids] == expected_retained, f'Retained figure/copy changed: {path}')
            figure_checks = []
            for index, figure in enumerate(figures, 1):
                kind = figure['attrs'].get('data-inbox-figure')
                if kind not in ids:
                    kind = None
                require(not figure['interactive'], f'Interactive screenshot: {path}/{index}')
                require(figure['attrs'].get('aria-label', '').strip() and figure['caption'], f'Missing figure name/caption: {path}/{index}')
                require('ht-editorial-visual--screenshot' in figure['attrs'].get('class', '').split(), f'Missing screenshot class: {path}/{index}')
                require('ht-editorial-visual__caption' in (figure['caption_attrs'] or {}).get('class', '').split(), f'Missing hidden-caption class: {path}/{index}')
                require(any('ht-editorial-visual__stage' in d.get('class', '').split() for d in figure['divs']), f'Missing full-column stage: {path}/{index}')
                frames = [d for d in figure['divs'] if 'ht-editorial-visual__image-frame' in d.get('class', '').split()]
                require(len(frames) == 1, f'Missing image frame: {path}/{index}')
                require(len(figure['images']) == len(figure['sources']) == 1, f'Expected desktop/mobile picture: {path}/{index}')
                img, mobile = figure['images'][0], figure['sources'][0]
                require(img.get('alt', '').strip() and img.get('loading') == 'lazy', f'Missing image alternative/lazy load: {path}/{index}')
                require(mobile.get('media') == '(max-width: 600px)', f'Incorrect responsive breakpoint: {path}/{index}')
                require('width: auto;' in img.get('style', ''), f'Missing native-size image cap: {path}/{index}')
                if kind:
                    label, alt, caption = copy[locale][guide][kind]
                    require([figure['attrs']['aria-label'], img['alt'], figure['caption']] == [label, alt, ' '.join(caption.split())], f'Accepted figure copy differs: {path}/{kind}')
                sources = {}
                for layout, attrs in [('desktop', img), ('mobile', mobile)]:
                    match = re.fullmatch(r'(/images/editorial/[^\s,]+\.png) 4x', attrs.get('srcset', ''))
                    require(match is not None, f'Expected single 4x PNG source: {path}/{index}/{layout}')
                    relative = match[1].lstrip('/')
                    require(relative.endswith(f'-{locale}-{layout}.png'), f'Incorrect locale/layout source: {relative}')
                    if layout == 'desktop':
                        require(img.get('src') == '/' + relative, f'Fallback source differs: {relative}')
                    image_path = inside(relative, HELP / 'images/editorial')
                    data, pixels, profile = verify_png(image_path)
                    require([int(attrs['width']), int(attrs['height'])] == pixels, f'HTML PNG dimensions differ: {relative}')
                    if kind:
                        require(relative == str(ASSETS / f'{kind}-{locale}-{layout}.png') and relative in verified_new, f'Unaccepted new figure image: {relative}')
                        origin = verified_new[relative]
                    else:
                        if relative not in retained_git_bytes:
                            retained_git_bytes[relative] = subprocess.check_output(['git', 'show', f'{baseline["main"]}:{relative}'], cwd=HELP)
                        require(data == retained_git_bytes[relative], f'Retained published image changed: {relative}')
                        origin = {'origin': 'retained_published_baseline', 'baseline_revision': baseline['main'], 'native_css_size': [v / 4 for v in pixels], 'profile': profile}
                    for prefix in (HELP / '_site', HELP / '_site/es'):
                        require((prefix / relative).read_bytes() == data, f'Built PNG differs: {prefix / relative}')
                    image_record = {'source': '/' + relative, 'sha256': digest(data), 'pixels': pixels,
                                    'density': 4, 'built_copies_equal': 2, **origin}
                    all_images[relative] = image_record
                    sources[layout] = image_record
                if kind:
                    frame_cap = max(sources[l]['native_css_size'][0] for l in ('desktop', 'mobile')) + 18
                    require(f'max-width: {frame_cap:g}px;' in frames[0].get('style', ''), f'Incorrect frame native-width cap: {path}/{kind}')
                figure_checks.append({'id': kind, 'index': index, 'alt': img['alt'], 'caption': figure['caption'], 'sources': sources})
            route = (f'es/{routes["permalink_es"]}' if locale == 'es' else routes['permalink']) + '.html'
            built = HELP / '_site' / route
            require(Figures(built.read_text()).figures == figures, f'Built figure markup differs: {route}')
            checked_articles.append({'path': path, 'sha256': sha(article_path), 'guide': guide, 'locale': locale,
                                     'route': route, 'built_html_sha256': sha(built), 'headings_preserved': spec['headings'],
                                     'links_preserved': spec['links'], 'figures': figure_checks})
        require(locale_ids[0] == locale_ids[1], f'Bilingual coverage differs: {guide}')
    require(set(verified_new) <= set(all_images), 'Integrated native asset is not referenced')
    require(len(verified_new) == CONFIG['new_image_count'] == 4 * len(ids), 'New native image count differs from configured scope')
    require(len(all_images) == CONFIG['source_image_count'] == 28, 'Expected 28 referenced sources')
    require(len(all_images) - len(verified_new) == CONFIG['retained_image_count'], 'Retained source count differs')
    require(2 * len(all_images) == CONFIG['image_byte_comparisons'] == 56, 'Expected56builtbytecomparisons')
    for name in ('editorial_visuals.js', 'editorial_tabs.js'):
        relative = Path('assets/editorial') / name
        for prefix in (HELP / '_site', HELP / '_site/es'):
            require((prefix / relative).read_bytes() == (HELP / relative).read_bytes(), f'Exported JS differs: {prefix / relative}')
    for prefix in (HELP / '_site', HELP / '_site/es'):
        require(not (prefix / 'docs').exists() and not (prefix / 'AGENTS.md').exists(), f'Editorial evidence exposed: {prefix}')
    ledger_path = HELP / 'docs/editorial-work/progress.csv'
    with ledger_path.open(newline='') as source:
        ledger = list(csv.DictReader(source))
    pending = [r for r in ledger if r['editorial_status'] in ('pending', 'in_progress', 'visual_pending')]
    require(len(pending) == 45, 'Unresolved inventory count changed; reconcile before review')
    search = [r for r in ledger if r['article_key'] == 'team/filter-and-search-inbox.md']
    require(len(search) == 1 and search[0]['editorial_status'] == 'visual_pending', 'Unverified search-result coverage was closed')
    return {
        'verified_at': datetime.now(timezone.utc).isoformat(), 'status': 'passed', 'result': 'passed',
        'verifier_sha256': sha(Path(__file__)), 'integration_sha256': sha(integration_path),
        'revision_config_sha256': sha(CONFIG_PATH),
        'source_review_sha256': sha(source_review_path), 'source_review': str(source_review_path.relative_to(HELP)),
        'verified_example_channel': 'whatsapp',
        'manifest_sha256': sha(manifest_path), 'acceptance_sha256': sha(acceptance_path),
        'figure_copy_sha256': sha(copy_path), 'baseline_sha256': sha(baseline_path),
        'preservation_baseline_sha256': sha(HERE / 'preservation-baseline.json'),
        'old_image_assets_preserved': len(preservation['images']),
        'deferred_figure_ids': CONFIG['deferred_figure_ids'],
        'retained_filter_limit': CONFIG['retained_filter_limit'],
        'accepted_figure_ids': ids, 'new_native_images': len(verified_new),
        'retained_images': len(all_images) - len(verified_new), 'source_images_referenced': len(all_images),
        'image_byte_comparisons': 2 * len(all_images), 'javascript_byte_comparisons': 4,
        'articles': checked_articles, 'stubs': stubs, 'images': list(all_images.values()),
        'editorial_work_excluded': True, 'headings_links_stubs_preserved': True,
        'rendered_geometry_and_pixels': 'not_verified_by_this_build_check',
        'search_result_coverage': 'unchanged_visual_pending',
        'inventory': {'unresolved_pairs': len(pending), 'ledger_sha256': sha(ledger_path),
                      'search_status': search[0]['editorial_status'], 'modified_by_helper': False},
        'publication': 'not_performed',
    }


if __name__ == '__main__':
    result = verify()
    (HERE / 'build-verification.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'result': result['result'], 'images': result['source_images_referenced'],
                      'new_native_images': result['new_native_images'], 'byte_comparisons': result['image_byte_comparisons']}))
