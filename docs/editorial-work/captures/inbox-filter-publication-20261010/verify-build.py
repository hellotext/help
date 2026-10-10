#!/usr/bin/env python3
"""Validate an existing Help build. Never writes a site or starts services.

Default is read-only. --write-record saves compact JSON after every check passes.
--plan verifies only baseline/scope, without requiring accepted sources or _site.
Full verification uses the installed Jekyll renderer in memory for the two
article bodies, without layout, Site.process/generate/write or disk cache.
"""
import argparse
import csv
from datetime import datetime, timezone
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import subprocess
import sys
sys.dont_write_bytecode = True
from revision_support import (HERE, HELP, CONFIG, CONFIG_PATH, ASSET_DIRECTORY, ARTICLES, IDS,
                              require, sha, digest, load, inside, originals, check_scope,
                              check_preserved, accepted, compose, structure, Figures, verify_png)


JEKYLL_ARTICLE_RENDER = r'''
require 'json'
require 'stringio'
ENV['BUNDLE_GEMFILE'] = File.join(Dir.pwd, 'Gemfile')
require 'bundler/setup'
require 'jekyll'
raise 'Expected project Ruby 3.3.6' unless RUBY_VERSION == '3.3.6'
ENV['JEKYLL_ENV'] = 'production'
original_stdout = $stdout
$stdout = StringIO.new
result = {}
begin
  ['es', 'en'].each do |locale|
    config = Jekyll.configuration('source' => Dir.pwd, 'quiet' => true,
                                  'disable_disk_cache' => true)
    raise 'Unexpected locale configuration' unless config['languages'] == ['en', 'es']
    root_url = config['baseurl'].to_s
    config['default_lang'] = 'en'
    config['lang'] = locale
    config['baseurl_root'] = root_url
    config['baseurl'] = locale == 'en' ? root_url : root_url + '/es'
    config['default_locale_in_subfolder'] ||= false
    site = Jekyll::Site.new(config)
    site.parsed_translations = {}
    site.config['translations'] = site.parsed_translations
    site.read
    payload = site.site_payload
    Jekyll::Hooks.trigger :site, :pre_render, site, payload
    documents = site.collections.fetch('team').docs.select do |document|
      document.relative_path == '_team/filter-and-search-inbox.md'
    end
    raise 'Expected one filter guide document' unless documents.length == 1
    document = documents.first
    # The existing guide layout emits this rendered body as {{ content }}.
    # Only suppress that outer layout in this in-memory verification object.
    document.data['layout'] = nil
    result[locale] = Jekyll::Renderer.new(site, document, payload).run
  end
ensure
  $stdout = original_stdout
end
puts JSON.generate('engine' => "Jekyll #{Jekyll::VERSION}", 'articles' => result)
'''


class ArticleContent(HTMLParser):
    """Compare all body markup/text while ignoring minifier whitespace only."""
    VOID = {'area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link',
            'meta', 'param', 'source', 'track', 'wbr'}

    def __init__(self, body, fragment=False):
        super().__init__(convert_charrefs=True)
        self.fragment, self.active = fragment, fragment
        self.matches, self.depth, self.tokens = 0, 0, []
        self.feed(body)
        require(fragment or (self.matches == 1 and not self.active), 'Expected one complete guide-content article')

    def handle_starttag(self, tag, attrs):
        values = dict(attrs)
        if not self.fragment and tag == 'article' and 'guide-content' in values.get('class', '').split():
            require(not self.active, 'Nested guide-content article')
            self.matches += 1
            self.active, self.depth = True, 1
            return
        if self.active:
            if not self.fragment and tag == 'article':
                self.depth += 1
            self.tokens.append(('start', tag, sorted((k, v if v is not None else '') for k, v in attrs)))

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)
        if tag not in self.VOID:
            self.handle_endtag(tag)

    def handle_endtag(self, tag):
        if not self.active:
            return
        if not self.fragment and tag == 'article':
            self.depth -= 1
            if self.depth == 0:
                self.active = False
                return
        if tag not in self.VOID:
            self.tokens.append(('end', tag))

    def handle_data(self, data):
        if self.active and data.strip():
            self.tokens.append(('text', ' '.join(data.split())))


def current_article_bodies():
    ruby = Path.home() / '.rbenv/versions/3.3.6/bin/ruby'
    require(ruby.is_file(), 'Use the installed project Ruby 3.3.6')
    process = subprocess.run([str(ruby), '-e', JEKYLL_ARTICLE_RENDER], cwd=HELP,
                             text=True, capture_output=True, timeout=120)
    require(process.returncode == 0, 'In-memory Jekyll body verification failed: ' + process.stderr.strip())
    result = json.loads(process.stdout)
    require(set(result['articles']) == {'es', 'en'}, 'Missing freshly rendered article body')
    return result


def verify():
    baseline = originals()
    pin = check_scope()
    integration_path = HERE / 'integration-record.json'
    integration = load(integration_path)
    require(integration['status'] == 'integrated_locally_pending_build_and_page_review', 'Missing completed integration')
    require(integration['baseline'] == CONFIG['baseline_revision'] and integration['figure_ids'] == IDS, 'Integration scope differs')
    require(integration['revision_config_sha256'] == sha(CONFIG_PATH), 'Configuration changed after integration')
    manifest_path = inside(integration['manifest'], HELP)
    acceptance_path = inside(integration['acceptance'], HELP)
    require(sha(manifest_path) == integration['manifest_sha256'] and sha(acceptance_path) == integration['acceptance_sha256'], 'Accepted evidence changed')
    records, source_review = accepted(manifest_path, acceptance_path)
    require(str(source_review.relative_to(HELP)) == integration['source_review'] and sha(source_review) == integration['source_review_sha256'], 'Source review differs from integration')
    require(len(integration['articles']) == 2 and {r['path'] for r in integration['articles']} == set(ARTICLES), 'Integrated article scope differs')
    require(len(integration['assets']) == 8 and {r['file']: r for r in integration['assets']} == records, 'Integrated native assets differ')
    integrated = {r['path']: r for r in integration['articles']}
    routes = dict(re.findall(r'^(permalink(?:_es)?):\s*(\S+)\s*$', baseline['_team/filter-and-search-inbox.md'], re.M))
    preservation = check_preserved()
    preserved_images = {r['path']: r['sha256'] for r in preservation['prior_article_images']}
    rendered = current_article_bodies()
    images, articles = {}, []
    for path in ARTICLES:
        locale = path.split('/')[1]
        body = (HELP / path).read_text()
        expected = compose(locale, baseline[path], records)
        require(body == expected, 'Article contains an unaccepted figure, Search or prose change')
        require(sha(HELP / path) == integrated[path]['sha256'], 'Article changed after integration')
        require(len(structure(body)['headings']) == 15 and len(structure(body)['links']) == 6, 'Article structure differs')
        figures = Figures(body).figures
        require(len(figures) == integrated[path]['figures'] == 3, 'Expected three figures')
        for index, tokens in enumerate(figures):
            attrs = dict(tokens[0][2])
            kind = ('search', 'team', 'labels')[index]
            if index:
                require(attrs.get('data-inbox-figure') == kind, 'New figure order differs')
            imgs = [dict(t[2]) for t in tokens if t[0] == 'start' and t[1] == 'img']
            sources = [dict(t[2]) for t in tokens if t[0] == 'start' and t[1] == 'source']
            require(len(imgs) == len(sources) == 1, 'Expected one responsive picture per figure')
            require(sources[0].get('media') == '(max-width: 600px)', 'Responsive source breakpoint differs')
            require(imgs[0].get('alt') and 'width: auto;' in imgs[0].get('style', ''), 'Missing alt/native width behavior')
            for layout, image in (('desktop', imgs[0]), ('mobile', sources[0])):
                match = re.fullmatch(r'(/images/editorial/[^\s,]+\.png) 4x', image.get('srcset', ''))
                require(match is not None, 'Expected one genuine 4x source')
                relative = match[1].lstrip('/')
                require(relative.endswith(f'-{locale}-{layout}.png'), 'Incorrect source locale/layout')
                if layout == 'desktop':
                    require(image.get('src') == match[1], 'Fallback image differs')
                image_path = inside(relative, HELP)
                data, pixels = verify_png(image_path)
                require([int(image['width']), int(image['height'])] == pixels, 'Markup dimensions differ from PNG')
                if index:
                    record = records[f'{kind}-{locale}-{layout}.png']
                    require(relative == str(ASSET_DIRECTORY / record['file']), 'Unexpected new asset path')
                    native = [record['nativeWidth'], record['nativeHeight']]
                    origin = 'new_accepted_native_capture'
                else:
                    require(digest(data) == preserved_images[relative], 'Published Search source changed')
                    native = [v / 4 for v in pixels]
                    origin = 'retained_published_search'
                for prefix in (HELP / '_site', HELP / '_site/es'):
                    require((prefix / relative).read_bytes() == data, 'Built image bytes differ')
                images[relative] = {'source': '/' + relative, 'sha256': digest(data), 'pixels': pixels,
                                    'native_css_size': native, 'density': 4, 'profile': 'Display P3',
                                    'origin': origin, 'built_copies_equal': 2}
        route = (f'es/{routes["permalink_es"]}' if locale == 'es' else routes['permalink']) + '.html'
        built_path = HELP / '_site' / route
        built_body = built_path.read_text()
        require(Figures(built_body).figures == figures, 'Built figure markup differs from accepted article')
        expected_content = ArticleContent(rendered['articles'][locale], fragment=True).tokens
        actual_content = ArticleContent(built_body).tokens
        require(actual_content == expected_content, 'Built article prose, headings, links or markup differs from the current Jekyll-rendered source')
        articles.append({'path': path, 'locale': locale, 'route': route, 'sha256': sha(HELP / path),
                         'built_html_sha256': sha(built_path), 'figures': 3, 'new_figure_ids': IDS,
                         'headings': 15, 'links': 6, 'full_article_content_matches': True,
                         'article_content_tokens_sha256': digest(json.dumps(actual_content, ensure_ascii=False).encode())})
    require(len(images) == 12, 'Expected eight new and four retained Search sources')
    # Existing overview sources and markup must remain intact in the same build.
    overview_stub = (HELP / '_team/inbox-overview.md').read_text()
    overview_routes = dict(re.findall(r'^(permalink(?:_es)?):\s*(\S+)\s*$', overview_stub, re.M))
    overview_checked = []
    for locale in ('es', 'en'):
        path = f'_i18n/{locale}/team/inbox-overview.md'
        body = (HELP / path).read_text()
        route = (f'es/{overview_routes["permalink_es"]}' if locale == 'es' else overview_routes['permalink']) + '.html'
        require(Figures((HELP / '_site' / route).read_text()).figures == Figures(body).figures, 'Retained overview built figures changed')
        overview_checked.append({'path': path, 'sha256': sha(HELP / path), 'route': route})
    for item in preservation['prior_article_images']:
        for prefix in (HELP / '_site', HELP / '_site/es'):
            require(sha(prefix / item['path']) == item['sha256'], 'Retained article PNG changed during build')
    for name in ('editorial_visuals.js', 'editorial_tabs.js'):
        relative = Path('assets/editorial') / name
        for prefix in (HELP / '_site', HELP / '_site/es'):
            require((prefix / relative).read_bytes() == (HELP / relative).read_bytes(), 'Exported JS was altered by build')
    for prefix in (HELP / '_site', HELP / '_site/es'):
        require(not (prefix / 'docs').exists() and not (prefix / 'AGENTS.md').exists(), 'Editorial evidence exposed in build')
    with (HELP / 'docs/editorial-work/progress.csv').open(newline='') as stream:
        ledger = list(csv.DictReader(stream))
    target = [r for r in ledger if r['article_key'] == 'team/filter-and-search-inbox.md']
    require(len(target) == 1 and target[0]['editorial_status'] == 'visual_pending', 'Search-result gap was incorrectly closed')
    pending = sum(r['editorial_status'] in ('pending', 'in_progress', 'visual_pending') for r in ledger)
    return {'status': 'passed', 'result': 'passed', 'verified_at': datetime.now(timezone.utc).isoformat(),
            'integration_sha256': sha(integration_path), 'manifest_sha256': sha(manifest_path),
            'acceptance_sha256': sha(acceptance_path), 'source_review_sha256': sha(source_review),
            'revision_config_sha256': sha(CONFIG_PATH), 'verifier_sha256': sha(Path(__file__)),
            'support_sha256': sha(HERE / 'revision_support.py'), 'editorial_pin': pin,
            'article_renderer': rendered['engine'], 'full_article_render_comparisons': 2,
            'articles': articles, 'images': list(images.values()), 'new_native_images': 8,
            'retained_search_images': 4, 'source_images_referenced': 12, 'filter_image_byte_comparisons': 24,
            'preserved_prior_article_images': len(preservation['prior_article_images']),
            'prior_article_image_byte_comparisons': 2 * len(preservation['prior_article_images']),
            'preserved_overview': overview_checked, 'javascript_byte_comparisons': 4,
            'editorial_work_excluded': True, 'inventory_unresolved_pairs': pending,
            'search_result_coverage': 'unchanged_visual_pending', 'browser_and_pixels': 'not_checked_by_this_helper',
            'publication': 'not_performed'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plan', action='store_true')
    parser.add_argument('--write-record', action='store_true')
    args = parser.parse_args()
    if args.plan:
        require(not args.write_record, '--plan never writes')
        originals()
        print(json.dumps({'status': 'planned_no_writes', 'target_articles': ARTICLES,
                          'source_images': 12, 'new_images': 8, 'checks_existing_site_only': True,
                          'build': 'not_run', 'browser': 'not_run'}))
        return
    result = verify()
    if args.write_record:
        (HERE / 'build-verification.json').write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n')
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
