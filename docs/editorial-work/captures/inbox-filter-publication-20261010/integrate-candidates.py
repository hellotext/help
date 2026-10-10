#!/usr/bin/env python3
"""Replace only the two filter figures after exact root pixel acceptance.

--plan verifies the baseline with no candidates or writes. Without --apply,
the accepted-candidate path is a dry run. Native PNGs are imported separately
after root acceptance; this helper never writes images, config or other guides.
"""
import argparse
from datetime import datetime, timezone
import json
from pathlib import Path
import sys
sys.dont_write_bytecode = True
from revision_support import (HERE, HELP, CONFIG, CONFIG_PATH, ARTICLES, IDS, FIGURE_RE,
                              require, sha, digest, load, originals, structure, accepted, compose)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plan', action='store_true')
    parser.add_argument('--manifest', type=Path)
    parser.add_argument('--acceptance', type=Path)
    parser.add_argument('--apply', action='store_true')
    args = parser.parse_args()
    baseline = originals()
    if args.plan:
        require(not args.apply and args.manifest is None and args.acceptance is None, '--plan cannot integrate')
        for path in ARTICLES:
            require((HELP / path).read_text() == baseline[path], 'Plan expects pristine target articles')
        print(json.dumps({'status': 'planned_no_writes', 'baseline': CONFIG['baseline_revision'],
                          'articles': ARTICLES, 'figure_ids': IDS, 'new_native_sources': 8,
                          'structure': {p: structure(baseline[p]) for p in ARTICLES},
                          'source_acceptance': 'pending', 'build': 'not_run', 'browser': 'not_run'}))
        return
    require(args.manifest is not None and args.acceptance is not None, 'Provide reviewed manifest and acceptance')
    manifest_path, acceptance_path = args.manifest.resolve(), args.acceptance.resolve()
    records, source_review = accepted(manifest_path, acceptance_path)
    prior_path = HERE / 'integration-record.json'
    prior = load(prior_path) if prior_path.exists() else None
    prior_hashes = {r['path']: r['sha256'] for r in prior['articles']} if prior else {}
    expected = {}
    for path in ARTICLES:
        require(sha(HELP / path) in {digest(baseline[path].encode()), prior_hashes.get(path)}, 'Concurrent target article change')
        locale = path.split('/')[1]
        expected[path] = compose(locale, baseline[path], records)
    result = {'status': 'integrated_locally_pending_build_and_page_review' if args.apply else 'validated_no_writes',
              'recorded_at': datetime.now(timezone.utc).isoformat(), 'baseline': CONFIG['baseline_revision'],
              'revision_config_sha256': sha(CONFIG_PATH), 'figure_ids': IDS,
              'manifest': str(manifest_path.relative_to(HELP)), 'manifest_sha256': sha(manifest_path),
              'acceptance': str(acceptance_path.relative_to(HELP)), 'acceptance_sha256': sha(acceptance_path),
              'source_review': str(source_review.relative_to(HELP)), 'source_review_sha256': sha(source_review),
              'assets': list(records.values()),
              'articles': [{'path': p, 'locale': p.split('/')[1], 'sha256': digest(body.encode()),
                            'figures': len(FIGURE_RE.findall(body)), 'new_figure_ids': IDS,
                            'headings': len(structure(body)['headings']), 'links': len(structure(body)['links'])}
                           for p, body in expected.items()],
              'preserved_search_and_nonfigure_bytes': True, 'overview_unchanged': True,
              'search_result_coverage': 'unchanged_visual_pending', 'publication': 'not_performed'}
    if args.apply:
        for path, body in expected.items():
            if (HELP / path).read_text() != body:
                (HELP / path).write_text(body)
        prior_path.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps({'status': result['status'], 'new_sources': len(records), 'articles': result['articles']}))


if __name__ == '__main__':
    main()
