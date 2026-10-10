"""Filter-only local contracts. No app, browser, build or network operations."""
from pathlib import Path
from html.parser import HTMLParser
import hashlib
import html
import json
import re
import struct
import subprocess

HERE = Path(__file__).resolve().parent
HELP = HERE.parents[3]
CONFIG_PATH = HERE / 'revision-config.json'
CONFIG = json.loads(CONFIG_PATH.read_text())
PREVIEW_ORIGIN = CONFIG['preview_origin']
ASSET_DIRECTORY = Path('images/editorial/inbox-filters-20261010')
ARTICLES = [f'_i18n/{locale}/team/filter-and-search-inbox.md' for locale in ('es', 'en')]
IDS = ['team', 'labels']
EXPECTED = {f'{kind}-{locale}-{layout}.png' for kind in IDS for locale in ('es', 'en') for layout in ('desktop', 'mobile')}
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


def inside(relative, boundary=HERE):
    relative = Path(relative)
    require(not relative.is_absolute() and '..' not in relative.parts, 'Expected safe relative evidence path')
    result = (boundary / relative).resolve()
    require(result.is_relative_to(boundary.resolve()), 'Path escapes evidence boundary')
    return result


def git(*args):
    return subprocess.check_output(['git', *args], cwd=HELP)


def check_scope():
    require(CONFIG['baseline_revision'] == '570208d5a3fe900811572be6014136e06aa33c3f', 'Unexpected Help baseline')
    require(CONFIG['asset_directory'] == ASSET_DIRECTORY.as_posix() and CONFIG['figure_ids'] == IDS, 'Changed task scope')
    require(CONFIG['new_image_count'] == 8 and CONFIG['source_image_count'] == 12, 'Changed capture matrix')
    require(CONFIG['preview_origin'] == 'http://127.0.0.1:4301' and CONFIG['browser_port'] == 9488, 'Changed Help preview contract')
    require(CONFIG['work_record'] == 'docs/editorial-work/inbox-filter-publication.md', 'Changed work-record scope')
    pin = CONFIG['allowed_pinned_guide_revision']
    require(re.fullmatch(r'[0-9a-f]{40}', pin) is not None, 'Explicit full editorial SHA required')
    actual = subprocess.check_output(['git', '-C', str(HELP / 'docs/editorial'), 'rev-parse', 'HEAD'], text=True).strip()
    require(actual == pin, 'Checked-out editorial guide differs from the exact configured SHA')
    indexed = git('ls-files', '--stage', 'docs/editorial').decode().split()
    require(len(indexed) == 4 and indexed[0] == '160000' and indexed[2] == '0', 'Editorial path is not one unconflicted gitlink')
    require(indexed[1] in {CONFIG['baseline_pinned_guide_revision'], pin}, 'Unexpected staged editorial gitlink')
    prefix = HERE.relative_to(HELP).as_posix() + '/'
    allowed = set(ARTICLES + [CONFIG['work_record'], 'docs/editorial'])
    changed = git('diff', '--name-only', '-z', CONFIG['baseline_revision'], '--').decode().split('\0')
    untracked = git('ls-files', '--others', '--exclude-standard', '-z').decode().split('\0')
    for path in filter(None, changed + untracked):
        require(path in allowed or path.startswith(prefix) or path in {str(ASSET_DIRECTORY / name) for name in EXPECTED}, f'Out-of-scope worktree path: {path}')
    require(not list(HERE.rglob('*.png')), 'Keep native PNGs only under images; page QA PNGs must remain outside the repo')
    destination = HELP / ASSET_DIRECTORY
    if destination.exists():
        require(all(p.is_file() and p.name in EXPECTED and not p.is_symlink() for p in destination.iterdir()), 'Unexpected asset directory entry')
    return {'checked_out': actual, 'indexed': indexed[1], 'allowed': pin,
            'staging_pending': indexed[1] != pin}


def check_preserved():
    record = load(HERE / 'preservation-baseline.json')
    require(record['baseline'] == CONFIG['baseline_revision'], 'Preservation baseline changed')
    for item in record['protected'] + record['prior_article_images']:
        path = inside(item['path'], HELP)
        require(sha(path) == item['sha256'], f'Preserved file changed: {item["path"]}')
        require(digest(git('show', f'{CONFIG["baseline_revision"]}:{item["path"]}')) == item['sha256'], 'Preservation receipt differs from immutable base')
    return record


def originals():
    check_scope()
    check_preserved()
    baseline = load(HERE / 'originals/baseline.json')
    require(baseline['main'] == CONFIG['baseline_revision'], 'Original baseline changed')
    expected = set(ARTICLES + ['_team/filter-and-search-inbox.md'])
    require(len(baseline['records']) == 3 and {r['path'] for r in baseline['records']} == expected, 'Original matrix differs')
    result = {}
    for record in baseline['records']:
        saved = inside(record['original'], HELP)
        require(saved.is_relative_to(HERE / 'originals'), 'Original outside snapshot folder')
        data = saved.read_bytes()
        require(digest(data) == record['sha256'], 'Original hash changed')
        require(data == git('show', f'{baseline["main"]}:{record["path"]}'), 'Original differs from immutable base')
        result[record['path']] = data.decode()
    return result


def normalized(body):
    figures = FIGURE_RE.findall(body)
    require(len(figures) == 3, 'Expected Search, Team, Labels figures')
    return body.replace(figures[1], '<TEAM>', 1).replace(figures[2], '<LABELS>', 1)


def structure(body):
    return {'headings': re.findall(r'^#{1,6} .+$', body, re.M),
            'links': re.findall(r'\[[^\]]+\]\([^\n]+?\)', body)}


def verify_png(path):
    require(path.is_file() and not path.is_symlink(), 'Native PNG must be a regular file')
    data = path.read_bytes()
    require(data[:8] == b'\x89PNG\r\n\x1a\n' and data[12:16] == b'IHDR', 'Not a PNG source')
    pixels = list(struct.unpack('>II', data[16:24]))
    require(all(v > 0 for v in pixels), 'Invalid PNG size')
    profile = subprocess.check_output(['sips', '-g', 'profile', str(path)], text=True)
    require('profile: Display P3' in profile, 'Native PNG lacks Display P3 profile')
    return data, pixels


def accepted(manifest_path, acceptance_path):
    for path in (manifest_path, acceptance_path):
        require(path.resolve().is_relative_to(HERE), 'Manifest and acceptance must be in this revision folder')
    manifest, acceptance = load(manifest_path), load(acceptance_path)
    require(acceptance['status'] == 'accepted_for_local_preview', 'Root raw-pixel acceptance pending')
    require(acceptance['reviewer'] and acceptance['reviewed_at'] and acceptance['copy_reviewed'] is True, 'Missing actual reviewer or copy acceptance')
    require(acceptance['figure_ids'] == IDS, 'Acceptance is not filter-only')
    require(acceptance['manifest_sha256'] == sha(manifest_path), 'Unreviewed manifest')
    require(acceptance['figure_copy_sha256'] == sha(HERE / 'proposed-figure-copy.json'), 'Unreviewed accessible copy')
    require(acceptance['revision_config_sha256'] == sha(CONFIG_PATH), 'Unreviewed revision or guide pin')
    review_path = inside(acceptance['source_review'])
    require(sha(review_path) == acceptance['source_review_sha256'], 'Source review changed')
    review = load(review_path)
    require(review['status'] == 'verified' and review['scope'] == 'new_filter_captures_only', 'Source review unresolved or unscoped')
    require(review['reviewer'] and review['reviewed_at'] and review['production_equivalence_scope'], 'Missing source review provenance/limits')
    require(re.fullmatch(r'[0-9a-f]{40}', review['source_revision']) is not None, 'Immutable app source required')
    if review.get('comparison_revision') is not None:
        require(re.fullmatch(r'[0-9a-f]{40}', review['comparison_revision']) is not None, 'Invalid app comparison SHA')
    for field in ('authentic_application_state', 'isolated_fictional_data', 'menu_and_chooser_complete',
                  'inbox_context_visible', 'development_controls_absent', 'impersonation_controls_absent',
                  'no_dom_or_pixel_fabrication', 'no_messages_sent'):
        require(review[field] is True, f'Source gate unresolved: {field}')
    require(review['evidence_files'], 'Missing reviewed source/capture evidence')
    for item in review['evidence_files']:
        require(sha(inside(item['path'])) == item['sha256'], 'Reviewed source evidence changed')
    records = manifest['records']
    require(len(records) == 8 and {r['file'] for r in records} == EXPECTED, 'Manifest must contain exactly eight distinct filter captures')
    require(set(acceptance['accepted_files']) == EXPECTED, 'Acceptance matrix differs')
    result = {}
    for record in records:
        name = record['file']
        kind, locale, layout = name[:-4].rsplit('-', 2)
        require([record['id'], record['locale'], record['layout']] == [kind, locale, layout], 'Manifest identity differs')
        path = HELP / ASSET_DIRECTORY / name
        data, pixels = verify_png(path)
        require(digest(data) == record['sha256'] == acceptance['accepted_files'][name], 'PNG differs from accepted pixels')
        require(pixels == record['pixelSize'], 'PNG dimensions differ from manifest')
        require(record['nativeDensity'] == 4 and 'Display P3' in record['icc'], 'Expected genuine 4x/P3 capture')
        require(record.get('transformations', 'none') in ('none', [], None), 'Unexpected transformation')
        clip = record['clip']
        native = [clip['width'], clip['height']] if isinstance(clip, dict) else clip[2:4]
        require(len(native) == 2 and all(v > 0 for v in native), 'Invalid logical crop')
        require(all(abs(p - n * 4) <= 1 for p, n in zip(pixels, native)), 'Raster does not match the 4x logical crop')
        result[name] = {'file': name, 'id': kind, 'locale': locale, 'layout': layout,
                        'sha256': digest(data), 'pixelSize': pixels, 'nativeWidth': native[0],
                        'nativeHeight': native[1], 'source': str(ASSET_DIRECTORY / name)}
    return result, review_path


def figure(kind, locale, records):
    desktop, mobile = [records[f'{kind}-{locale}-{layout}.png'] for layout in ('desktop', 'mobile')]
    copy = load(HERE / 'proposed-figure-copy.json')['locales']
    require(set(copy) == {'es', 'en'} and all(set(v) == set(IDS) for v in copy.values()), 'Accessible copy contains out-of-scope figures')
    values = copy[locale][kind]
    require(len(values) == 3 and all(isinstance(v, str) and v.strip() for v in values), 'Missing accessible copy')
    label, alt, caption = [html.escape(v, quote=True) for v in values]
    cap = max(desktop['nativeWidth'], mobile['nativeWidth']) + 18
    return f'''<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="{kind}" aria-label="{label}">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: {cap:g}px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/{mobile['source']} 4x" width="{mobile['pixelSize'][0]}" height="{mobile['pixelSize'][1]}" />
        <img class="ht-editorial-visual__image" src="/{desktop['source']}" srcset="/{desktop['source']} 4x" width="{desktop['pixelSize'][0]}" height="{desktop['pixelSize'][1]}" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="{alt}" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">{caption}</figcaption>
</figure>'''


def compose(locale, body, records):
    before = FIGURE_RE.findall(body)
    require(len(before) == 3, 'Original figure count differs')
    result = body.replace(before[1], figure('team', locale, records), 1)
    result = result.replace(before[2], figure('labels', locale, records), 1)
    require(normalized(result) == normalized(body), 'Search or non-target prose changed')
    require(structure(result) == structure(body), 'Headings/links changed')
    return result


class Figures(HTMLParser):
    """Semantic figure tokens for source/built equality; whitespace is ignored."""
    def __init__(self, body):
        super().__init__(convert_charrefs=True)
        self.figures, self.current = [], None
        self.feed(body)
        require(self.current is None, 'Unclosed figure')

    def handle_starttag(self, tag, attrs):
        if tag == 'figure':
            require(self.current is None, 'Nested figure')
            self.current = []
        if self.current is not None:
            require(tag not in ('a', 'button', 'script', 'iframe', 'form', 'input'), 'Interactive screenshot')
            require(not any(k.startswith('on') for k, _ in attrs), 'Inline handler in screenshot')
            self.current.append(('start', tag, sorted(attrs)))

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)

    def handle_endtag(self, tag):
        if self.current is not None and tag not in ('source', 'img'):
            self.current.append(('end', tag))
            if tag == 'figure':
                self.figures.append(self.current)
                self.current = None

    def handle_data(self, data):
        if self.current is not None and data.strip():
            self.current.append(('text', ' '.join(data.split())))
