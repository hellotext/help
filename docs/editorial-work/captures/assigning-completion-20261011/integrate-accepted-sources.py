#!/usr/bin/env python3
"""Integrate only a fully reviewed, byte-bound sixteen-source Assigning batch."""
import argparse
import hashlib
import html
import json
import re
import shutil
import struct
import subprocess
import zlib
from datetime import datetime, timezone
from pathlib import Path

if not __debug__:
    raise RuntimeError('Optimized Python is unsupported: integration validation must remain enabled.')

CAP = Path(__file__).resolve().parent
HELP = CAP.parents[3]
IDS = ['claim-before', 'claim-after', 'ai-chooser', 'bulk-chooser']
MATRIX = {(i, l, v) for i in IDS for l in ['es', 'en'] for v in ['desktop', 'mobile']}

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def read(path):
    return json.loads(path.read_text())

def write(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + '\n')

def check_png(path, record):
    data = path.read_bytes()
    assert sha(path) == record['sha256'], path.name
    assert data[:8] == b'\x89PNG\r\n\x1a\n'
    size = list(struct.unpack('>II', data[16:24]))
    assert size == record['pixelSize']
    assert record['nativeDensity'] == 4 and record['icc'] == 'Display P3'
    clip = record['clip']
    assert len(clip) == 4 and size == [round(clip[2] * 4), round(clip[3] * 4)]
    offset, profile = 8, None
    while offset < len(data):
        length = struct.unpack('>I', data[offset:offset + 4])[0]
        kind = data[offset + 4:offset + 8]
        body = data[offset + 8:offset + 8 + length]
        crc = struct.unpack('>I', data[offset + 8 + length:offset + 12 + length])[0]
        assert zlib.crc32(kind + body) & 0xffffffff == crc
        assert kind not in [b'tEXt', b'zTXt', b'iTXt', b'eXIf']
        if kind == b'iCCP':
            _, compressed = body.split(b'\0', 1)
            assert compressed[0] == 0
            profile = zlib.decompress(compressed[1:])
        offset += length + 12
    assert profile is not None
    assert 'profile: Display P3' in subprocess.check_output(
        ['/usr/bin/sips', '-g', 'profile', str(path)], text=True)
    return hashlib.sha256(profile).hexdigest()

def preserved_structure(before, after):
    assert re.findall(r'^#{2,3} .+$', before, re.M) == re.findall(r'^#{2,3} .+$', after, re.M)
    assert re.findall(r'{% link .*? %}', before) == re.findall(r'{% link .*? %}', after)

def block_pattern(ident):
    return re.compile(r'<!-- inbox-actions:' + re.escape(ident) + r':start -->.*?<!-- inbox-actions:' + re.escape(ident) + r':end -->', re.S)

def legacy_mobile_block(block, asset):
    assert asset['layout'] == 'mobile' and asset['pixel_size'][0] / asset['native_density'] == 390
    path = '/' + asset['path']
    block = block.replace('max-width: 1618px', 'max-width: 408px')
    def image_tag(match):
        tag = re.sub(r'\bsrc="[^"]+"', 'src="' + path + '"', match[0])
        tag = re.sub(r'\bsrcset="[^"]+"', 'srcset="' + path + ' 4x"', tag)
        tag = re.sub(r'\bwidth="\d+"', 'width="1560"', tag)
        tag = re.sub(r'\bheight="\d+"', 'height="4000"', tag)
        return tag
    return re.sub(r'<(?:source|img)\b[^>]+>', image_tag, block)

def figure(ident, locale, by_key, plan, asset_dir):
    desktop, mobile = (by_key[(ident, locale, layout)] for layout in ['desktop', 'mobile'])
    copy = dict(next(x for x in plan['figures'] if x['id'] == ident)[locale])
    if ident == 'ai-chooser':
        for key in copy:
            copy[key] = copy[key].replace('Agentes de IA', 'Agentes IA').replace('AI agents group', 'AI Agents group')
    e = lambda text: html.escape(text, quote=True)
    dp = '/' + asset_dir + '/' + desktop['file']
    mp = '/' + asset_dir + '/' + mobile['file']
    cap = desktop['clip'][2] + 18
    dw, dh = desktop['pixelSize']
    mw, mh = mobile['pixelSize']
    return f'''<!-- inbox-actions:{ident}:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="{ident}" aria-label="{e(copy['aria_label'])}">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: {cap:g}px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="{mp} 4x" width="{mw}" height="{mh}" />
        <img class="ht-editorial-visual__image" src="{dp}" srcset="{dp} 4x" width="{dw}" height="{dh}" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="{e(copy['alt'])}" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">{e(copy['caption'])}</figcaption>
</figure>
<!-- inbox-actions:{ident}:end -->'''

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plan', action='store_true', help='Read-only validation of current copy, anchors and legacy selection; needs no new PNG.')
    parser.add_argument('--raw-dir', type=Path)
    parser.add_argument('--manifest', type=Path)
    parser.add_argument('--acceptance', type=Path)
    parser.add_argument('--apply', action='store_true', help='Apply accepted complete batch; default without --plan is read-only validation.')
    args = parser.parse_args()
    inputs = read(CAP / 'integration-inputs.json')
    plan = read(CAP / 'insertion-plan.json')
    assert sha(CAP / 'insertion-plan.json') == inputs['insertion_plan_sha256']
    assert sha(CAP / 'retained-source-pixel-review.json') == inputs['retained_pixel_review_sha256']
    retained_review = read(CAP / 'retained-source-pixel-review.json')
    assert sha(CAP / 'retained-source-register.json') == retained_review['retained_source_register_sha256']
    originals = read(CAP / 'retained-source-register.json')
    legacy_matrix = {(i, l, v) for i in ['assignment-menu', 'assignment-result'] for l in ['es', 'en'] for v in ['desktop', 'mobile']}
    assert len(originals['assets']) == 8
    assert {(x['id'], x['locale'], x['layout']) for x in originals['assets']} == legacy_matrix
    for asset in originals['assets']:
        assert sha(HELP / asset['path']) == asset['sha256']
    done = CAP / 'integration-record.json'
    if done.exists():
        prior = read(done)
        assert args.manifest and args.acceptance
        assert sha(args.manifest) == prior['raw_manifest_sha256']
        assert sha(args.acceptance) == prior['acceptance_sha256']
        assert sha(CAP / 'integration-inputs.json') == prior['integration_inputs_sha256']
        assert sha(CAP / 'source-register.json') == prior['source_register_sha256']
        for review in prior['source_pixel_reviews'].values():
            assert sha(CAP / review['file']) == review['sha256']
        for article in prior['articles']:
            assert sha(HELP / article['path']) == article['after_sha256']
        for asset in read(CAP / 'source-register.json')['assets']:
            assert sha(HELP / asset['path']) == asset['sha256']
        print(json.dumps({'status': 'already_integrated_byte_exact_no_changes'}))
        return
    bodies = {}
    for locale, info in inputs['articles'].items():
        path = HELP / info['path']
        assert sha(path) == info['sha256'], 'Article changed; review updated copy first.'
        bodies[locale] = path.read_text()
        for anchor in info['anchors'].values():
            assert bodies[locale].count(anchor) == 1
        for ident in ['assignment-menu', 'assignment-result']:
            assert len(block_pattern(ident).findall(bodies[locale])) == 1
    if args.plan:
        assert not args.apply
        print(json.dumps({'status': 'preparation_structure_passed', 'new_assets_loaded': 0, 'article_changes': 0, 'expected_new_sources': 16, 'retained_sources': 8, 'final_inline_QA': 'pending'}))
        return
    assert args.raw_dir and args.manifest and args.acceptance, 'Real complete source manifest and root acceptance required.'
    manifest, acceptance = read(args.manifest), read(args.acceptance)
    assert acceptance['status'] == 'passed'
    assert acceptance['manifest_sha256'] == sha(args.manifest)
    assert acceptance['integration_inputs_sha256'] == sha(CAP / 'integration-inputs.json')
    assert acceptance['labels_verified'] == {'es': 'Agentes IA', 'en': 'AI Agents'}
    proof = acceptance['native_claim_semantic_review']
    assert proof['status'] == 'passed' and proof['completed_native_claim_count'] == 1
    proof_path = args.acceptance.parent / proof['file']
    assert sha(proof_path) == proof['sha256']
    reviews = {(x['file'], x['sha256']) for x in acceptance['records'] if x['status'] == 'passed'}
    records = manifest['records']
    assert len(records) == 16 and len(reviews) == 16
    by_key = {(x['id'], x['locale'], x['layout']): x for x in records}
    assert set(by_key) == MATRIX
    pixel_reviews = acceptance['pixel_reviews']
    assert set(pixel_reviews) == {'es', 'en'}
    pixel_review_paths, pixel_review_bindings = {}, {}
    for locale, binding in pixel_reviews.items():
        path = (args.acceptance.parent / binding['file']).resolve()
        assert path.name not in {'accepted-source-manifest.json', 'integration-record.json', 'source-register.json'}, 'Pixel receipt basename collides with an integration output.'
        assert sha(path) == binding['sha256']
        review = read(path)
        assert review['status'] == 'passed' and review['locale'] == locale
        assert len(review['records']) == 8
        assert all(x['status'] == 'passed' and x['locale'] == locale for x in review['records'])
        reviewed = {(x['id'], x['locale'], x['layout'], x['file'], x['sha256']) for x in review['records']}
        expected = {(x['id'], x['locale'], x['layout'], x['file'], x['sha256']) for x in records if x['locale'] == locale}
        assert reviewed == expected, 'Pixel review does not match the exact locale source matrix.'
        if (CAP / path.name).exists():
            assert sha(CAP / path.name) == binding['sha256'], 'Existing receipt differs; never overwrite it.'
        pixel_review_paths[locale] = path
        pixel_review_bindings[locale] = {'file': path.name, 'sha256': binding['sha256']}
    assert len({x['file'] for x in pixel_review_bindings.values()}) == 2
    register = []
    for asset in originals['assets']:
        a = dict(asset)
        a['selected'] = a['layout'] == 'mobile'
        a['help_viewports'] = ['desktop', 'mobile'] if a['selected'] else []
        a['status'] = 'selected_raw_source_inline_QA_pending' if a['selected'] else 'preserved_reference_not_selected_inline'
        register.append(a)
    compact = []
    for rec in records:
        assert rec['file'] == f"{rec['id']}-{rec['locale']}-{rec['layout']}.png"
        assert (rec['file'], rec['sha256']) in reviews
        profile_hash = check_png(args.raw_dir / rec['file'], rec)
        target = inputs['target_asset_directory'] + '/' + rec['file']
        if (HELP / target).exists():
            assert sha(HELP / target) == rec['sha256']
        register.append({'path': target, 'sha256': rec['sha256'], 'pixel_size': rec['pixelSize'], 'native_density': 4, 'icc': 'Display P3', 'icc_sha256': profile_hash, 'native_logical_size': rec['clip'][2:], 'id': rec['id'], 'locale': rec['locale'], 'layout': rec['layout'], 'selected': True, 'help_viewports': [rec['layout']], 'status': 'accepted_raw_source_inline_QA_pending', 'pixel_review': 'pass', 'transformations': [], 'pixel_review_record': pixel_review_bindings[rec['locale']]})
        compact.append({k: rec[k] for k in ['id', 'file', 'locale', 'layout', 'clip', 'pixelSize', 'nativeDensity', 'icc', 'sha256']})
    result = {}
    for locale, before in bodies.items():
        after = before
        for ident in ['assignment-menu', 'assignment-result']:
            asset = next(x for x in register if x['id'] == ident and x['locale'] == locale and x['layout'] == 'mobile')
            after = block_pattern(ident).sub(lambda m: legacy_mobile_block(m[0], asset), after)
        figures = {ident: figure(ident, locale, by_key, plan, inputs['target_asset_directory']) for ident in IDS}
        anchors = inputs['articles'][locale]['anchors']
        after = after.replace(anchors['claim'], anchors['claim'] + '\n\n' + figures['claim-before'] + '\n\n' + figures['claim-after'])
        label = inputs['labels_to_apply_only_after_accepted_pixels'][locale]
        ai = anchors['ai'].replace(label['before'], label['after'])
        assert ai != anchors['ai']
        after = after.replace(anchors['ai'], ai + '\n\n' + figures['ai-chooser'])
        after = after.replace(anchors['bulk'], anchors['bulk'] + '\n\n' + figures['bulk-chooser'])
        preserved_structure(before, after)
        assert after.count('<figure ') == 6
        result[locale] = after
    assert len(register) == 24 and sum(x['selected'] for x in register) == 20
    if not args.apply:
        print(json.dumps({'status': 'accepted_batch_validation_passed_no_changes', 'sources': 24, 'selected': 20, 'figures_per_locale': 6, 'build_and_page_QA': 'pending'}))
        return
    history = CAP / 'integration-before'
    history.mkdir(exist_ok=True)
    for locale, before in bodies.items():
        snapshot = history / f'{locale}.md'
        if snapshot.exists():
            assert snapshot.read_text() == before
        else:
            snapshot.write_text(before)
    (HELP / inputs['target_asset_directory']).mkdir(parents=True, exist_ok=True)
    for rec in records:
        shutil.copyfile(args.raw_dir / rec['file'], HELP / inputs['target_asset_directory'] / rec['file'])
    for locale, path in pixel_review_paths.items():
        if path != (CAP / path.name).resolve():
            shutil.copyfile(path, CAP / path.name)
        assert sha(CAP / path.name) == pixel_review_bindings[locale]['sha256']
    for locale, after in result.items():
        (HELP / inputs['articles'][locale]['path']).write_text(after)
    write(CAP / 'accepted-source-manifest.json', {'status': 'raw_sources_accepted_inline_QA_pending', 'raw_manifest_sha256': sha(args.manifest), 'raw_acceptance_sha256': sha(args.acceptance), 'native_claim_semantic_review_sha256': proof['sha256'], 'source_pixel_reviews': pixel_review_bindings, 'records': compact})
    write(CAP / 'source-register.json', {'status': '24_preserved_sources_20_selected_pending_build_and_page_QA', 'assets': register})
    write(done, {'status': 'integrated_locally_pending_build_and_page_QA', 'at': datetime.now(timezone.utc).isoformat(), 'raw_manifest_sha256': sha(args.manifest), 'acceptance_sha256': sha(args.acceptance), 'source_pixel_reviews': pixel_review_bindings, 'integration_inputs_sha256': sha(CAP / 'integration-inputs.json'), 'source_register_sha256': sha(CAP / 'source-register.json'), 'articles': [{'path': inputs['articles'][l]['path'], 'before_sha256': inputs['articles'][l]['sha256'], 'after_sha256': sha(HELP / inputs['articles'][l]['path']), 'figures': 6} for l in ['es', 'en']], 'preserved_sources': 24, 'selected_sources': 20, 'new_sources': 16, 'inventory_changed': False, 'publication': False})
    print(json.dumps({'status': 'integrated_locally', 'new_sources': 16, 'preserved_sources': 24, 'selected_sources': 20, 'figures_per_locale': 6, 'build_and_page_QA': 'pending'}))

if __name__ == '__main__':
    main()
