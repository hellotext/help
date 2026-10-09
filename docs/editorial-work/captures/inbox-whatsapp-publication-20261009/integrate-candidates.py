#!/usr/bin/env python3
"""Integrate byte-exact, raw-reviewed candidates locally; no network or build.

--plan checks the saved originals without requiring any captures.
--manifest PATH --acceptance PATH validates candidates; --apply also writes.
The acceptance record is the root's raw-pixel review, not publication approval.
"""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import hashlib
import html
import json
import re
import struct
import subprocess
import sys
sys.dont_write_bytecode = True
from revision_support import CONFIG, CONFIG_PATH, ASSET_DIRECTORY, checked_evidence, check_preserved, RAW_ASSET_DIRECTORY

HERE = Path(__file__).resolve().parent
HELP = HERE.parents[3]
DEST = HELP / ASSET_DIRECTORY
FIGURES = {'overview': ['context', 'profile', 'composer'], 'filters': []}
ARTICLES = {'overview': 'inbox-overview', 'filters': 'filter-and-search-inbox'}
FIGURE_RE = re.compile(r'<figure\b[\s\S]*?</figure>')
COPY_DOCUMENT = json.loads((HERE / 'proposed-figure-copy.json').read_text())
COPY = COPY_DOCUMENT['locales']
PROSE = COPY_DOCUMENT['prose']
BASELINE = json.loads((HERE / 'originals/baseline.json').read_text())


def sha(data):
    return hashlib.sha256(data).hexdigest()


def structure(body):
    return {
        'headings': re.findall(r'^#{1,6} .+$', body, re.M),
        'links': re.findall(r'\[[^\]]+\]\([^\n]+?\)', body),
    }


def originals():
    assert BASELINE['main'] == CONFIG['baseline_revision']
    check_preserved()
    out = {}
    for record in BASELINE['records']:
        source = HELP / record['original']
        assert sha(source.read_bytes()) == record['sha256'], f'Original changed: {source}'
        out[record['path']] = source.read_text()
        if record['path'].startswith('_team/'):
            assert (HELP / record['path']).read_bytes() == source.read_bytes(), 'Route stub changed'
    return out


def candidate(record, directory):
    name = record['file']
    assert Path(name).name == name, 'Manifest file must be a basename'
    source = directory / name
    data = source.read_bytes()
    assert data[:8] == b'\x89PNG\r\n\x1a\n', name
    pixels = list(struct.unpack('>II', data[16:24]))
    assert pixels == record['pixelSize'], f'Incorrect pixelSize: {name}'
    assert sha(data) == record['sha256'], f'Hash mismatch: {name}'
    assert record['nativeDensity'] == 4, f'Expected genuine 4x: {name}'
    clip = record['clip']
    width, height = (clip['width'], clip['height']) if isinstance(clip, dict) else clip[2:4]
    assert abs(pixels[0] - width * 4) <= 1 and abs(pixels[1] - height * 4) <= 1, name
    profile = subprocess.check_output(['sips', '-g', 'profile', str(source)], text=True)
    assert 'profile: Display P3' in profile, f'Missing Display P3: {name}'
    assert record.get('transformations', 'none') in ['none', [], None], f'Unexpected transform: {name}'
    return {**record, 'nativeWidth': width, 'nativeHeight': height, 'source': source,
            'destination': DEST / name, 'profile_verified': 'Display P3'}


def figure(guide, kind, locale, records):
    desktop, mobile = [records[f'{kind}-{locale}-{layout}.png'] for layout in ['desktop', 'mobile']]
    label, alt, caption = [html.escape(value, quote=True) for value in COPY[locale][guide][kind]]
    frame_width = max(desktop['nativeWidth'], mobile['nativeWidth']) + 18
    return f'''<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="{kind}" aria-label="{label}">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: {frame_width:g}px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/{ASSET_DIRECTORY.as_posix()}/{mobile['file']} 4x" width="{mobile['pixelSize'][0]}" height="{mobile['pixelSize'][1]}" />
        <img class="ht-editorial-visual__image" src="/{ASSET_DIRECTORY.as_posix()}/{desktop['file']}" srcset="/{ASSET_DIRECTORY.as_posix()}/{desktop['file']} 4x" width="{desktop['pixelSize'][0]}" height="{desktop['pixelSize'][1]}" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="{alt}" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">{caption}</figcaption>
</figure>'''


def compose(guide, locale, body, ids, records):
    previous = FIGURE_RE.findall(body)
    assert len(previous) == 3, f'Unexpected baseline figures: {guide}/{locale}'
    if guide == 'filters':
        return body
    assert ids == ['context', 'profile', 'composer'], 'This branch is overview-only'
    prose = PROSE[locale]
    for key in ['intro_old', 'profile_anchor', 'composer_anchor']:
        assert body.count(prose[key]) == 1, f'Published prose anchor changed: {locale}/{key}'
    body = body.replace(prose['intro_old'], prose['intro_new'], 1)
    body = body.replace(previous[0], figure(guide, 'context', locale, records), 1)
    body = body.replace(previous[1], figure(guide, 'profile', locale, records), 1)
    body = body.replace(prose['profile_anchor'], prose['profile_anchor'] + '\n\n' + prose['profile_paragraph'], 1)
    body = body.replace(prose['composer_anchor'], prose['composer_anchor'] + '\n\n' + prose['composer_paragraph'] + '\n\n' + figure(guide, 'composer', locale, records), 1)
    assert previous[2] in body, 'Published ownership figure changed'
    return body


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plan', action='store_true')
    parser.add_argument('--manifest', type=Path)
    parser.add_argument('--acceptance', type=Path)
    parser.add_argument('--apply', action='store_true')
    args = parser.parse_args()
    baseline = originals()
    if args.plan:
        assert not args.apply
        print(json.dumps({'status': 'preparation_only', 'capture_validation': 'not_run',
                          'planned_figures': CONFIG['figure_ids'], 'deferred_figures': CONFIG['deferred_figure_ids'], 'originals_verified': len(baseline),
                          'structure': {p: structure(b) for p, b in baseline.items() if p.startswith('_i18n/')},
                          'writes': 0}, ensure_ascii=False, indent=2))
        return
    assert args.manifest and args.acceptance, 'Provide the candidate manifest and actual raw-pixel review'
    manifest_path, acceptance_path = args.manifest.resolve(), args.acceptance.resolve()
    assert manifest_path.is_relative_to(HERE) and acceptance_path.is_relative_to(HERE), 'Keep evidence in this revision folder'
    manifest = json.loads(manifest_path.read_text())
    acceptance = json.loads(acceptance_path.read_text())
    assert acceptance['status'] == 'accepted_for_local_preview', 'Raw-candidate review not complete'
    assert acceptance['copy_reviewed'] is True and acceptance['reviewer'] and acceptance['reviewed_at']
    assert acceptance['figure_copy_sha256'] == sha((HERE / 'proposed-figure-copy.json').read_bytes()), 'Review the exact alt/caption copy'
    assert acceptance['manifest_sha256'] == sha(manifest_path.read_bytes()), 'Review the exact manifest'
    source_review_path, source_review = checked_evidence(acceptance)
    ids = acceptance['figure_ids']
    assert ids == CONFIG['figure_ids'], 'Accepted IDs differ from the configured local revision scope'
    accepted_hashes = acceptance['accepted_files']
    expected = {f'{kind}-{locale}-{layout}.png' for kind in ids for locale in ['es', 'en'] for layout in ['desktop', 'mobile']}
    source_records = manifest['records']
    assert len({r['file'] for r in source_records}) == len(source_records), 'Duplicate manifest files'
    records = {}
    for record in source_records:
        if record['file'] in expected:
            name = record['file']
            assert accepted_hashes.get(name) == record['sha256'], f'PNG not raw-reviewed: {name}'
            assert record['id'] + '-' + record['locale'] + '-' + record['layout'] + '.png' == name
            records[name] = candidate(record, HELP / RAW_ASSET_DIRECTORY)
    assert set(records) == expected, 'Missing locale/layout candidate'
    assert len(source_records) == len(expected), 'Manifest includes out-of-scope captures'
    assert set(accepted_hashes) == expected, 'Acceptance includes out-of-scope captures'

    prior_path = HERE / 'integration-record.json'
    prior = json.loads(prior_path.read_text()) if prior_path.exists() else None
    if prior:
        assert set(prior['figure_ids']) <= set(ids), 'Keep previously integrated IDs in the combined acceptance record'
    prior_by_path = {r['path']: r['sha256'] for r in prior['articles']} if prior else {}
    changed = {}
    for guide, article in ARTICLES.items():
        for locale in ['es', 'en']:
            path = f'_i18n/{locale}/team/{article}.md'
            original = baseline[path]
            current = (HELP / path).read_bytes()
            assert sha(current) in [sha(original.encode()), prior_by_path.get(path)], f'Concurrent article edit: {path}'
            result = compose(guide, locale, original, ids, records)
            assert structure(result) == structure(original), f'Headings or links changed: {path}'
            changed[path] = result
    assets = []
    for record in records.values():
        destination = record['destination']
        if destination.exists():
            assert sha(destination.read_bytes()) == record['sha256'], f'Existing asset differs: {destination}'
        assets.append({key: value for key, value in record.items() if key not in ['source', 'destination']} |
                      {'source': str(record['source'].relative_to(HELP)),
                       'destination': str(destination.relative_to(HELP))})
    result = {'status': 'integrated_locally_pending_build_and_page_review' if args.apply else 'validated_no_writes',
              'recorded_at': datetime.now(timezone.utc).isoformat(), 'baseline': BASELINE['main'],
              'manifest': str(manifest_path.relative_to(HELP)), 'manifest_sha256': sha(manifest_path.read_bytes()),
              'acceptance': str(acceptance_path.relative_to(HELP)), 'acceptance_sha256': sha(acceptance_path.read_bytes()),
              'revision_config_sha256': sha(CONFIG_PATH.read_bytes()),
              'source_review': str(source_review_path.relative_to(HELP)),
              'source_review_sha256': sha(source_review_path.read_bytes()),
              'verified_example_channel': source_review['channel'],
              'figure_ids': ids, 'assets': assets,
              'articles': [{'path': path, 'sha256': sha(body.encode()), 'figures': len(FIGURE_RE.findall(body)),
                            'new_figure_ids': [kind for kind in re.findall(r'data-inbox-figure="([^"]+)"', body) if kind in ids],
                            'all_figure_ids': re.findall(r'data-inbox-figure="([^"]+)"', body),
                            'headings': len(structure(body)['headings']), 'links': len(structure(body)['links'])}
                           for path, body in changed.items()],
              'headings_links_stubs_preserved': True, 'old_image_assets_changed': False,
              'deferred_figure_ids': CONFIG['deferred_figure_ids'],
              'retained_filter_limit': CONFIG['retained_filter_limit'],
              'build': 'not_run', 'page_review': 'not_run', 'publication': 'not_requested_by_this_helper'}
    if args.apply:
        DEST.mkdir(parents=True, exist_ok=True)
        for record in records.values():
            if not record['destination'].exists():
                with record['destination'].open('xb') as output:
                    output.write(record['source'].read_bytes())
        for path, body in changed.items():
            if (HELP / path).read_text() != body:
                (HELP / path).write_text(body)
        prior_path.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': result['status'], 'assets': len(assets), 'figure_ids': ids,
                      'articles': result['articles']}, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
