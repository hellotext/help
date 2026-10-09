"""Local revision configuration and exact source-evidence binding; no I/O to apps."""
from pathlib import Path
import hashlib
import json
import re
from urllib.parse import urlparse

HERE = Path(__file__).resolve().parent
HELP = HERE.parents[3]
CONFIG_PATH = HERE / 'revision-config.json'
CONFIG = json.loads(CONFIG_PATH.read_text())
ASSET_DIRECTORY = Path(CONFIG['asset_directory'])
assert not ASSET_DIRECTORY.is_absolute() and ASSET_DIRECTORY.parts[:2] == ('images', 'editorial')
assert '..' not in ASSET_DIRECTORY.parts
assert ASSET_DIRECTORY != Path('images/editorial/inbox-full-context-20261009')
RAW_ASSET_DIRECTORY = Path(CONFIG['raw_asset_directory'])
assert RAW_ASSET_DIRECTORY == ASSET_DIRECTORY, 'Keep a single byte-exact native source per published PNG'
PREVIEW_ORIGIN = CONFIG['preview_origin']
origin = urlparse(PREVIEW_ORIGIN)
assert origin.scheme == 'http' and origin.hostname == '127.0.0.1' and origin.port
assert not origin.username and not origin.password and not origin.path and not origin.query and not origin.fragment


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_preserved():
    record = json.loads((HERE / 'preservation-baseline.json').read_text())
    assert record['baseline'] == CONFIG['baseline_revision']
    for item in record['images']:
        assert sha(HELP / item['path']) == item['sha256'], 'Previous source PNG changed'
    assert sha(HELP / 'docs/editorial-work/progress.csv') == record['ledger_sha256'], 'Editorial ledger changed'
    return record


def checked_evidence(acceptance):
    """Require the real source review and its exact files, never infer WhatsApp."""
    assert acceptance['revision_config_sha256'] == sha(CONFIG_PATH), 'Revision config was not reviewed'
    relative = Path(acceptance['source_review'])
    assert not relative.is_absolute()
    path = (HERE / relative).resolve()
    assert path.is_relative_to(HERE), 'Source evidence must stay in this revision folder'
    assert acceptance['source_review_sha256'] == sha(path), 'Source review changed'
    evidence = json.loads(path.read_text())
    assert evidence['status'] == 'verified' and evidence['channel'] == 'whatsapp', 'WhatsApp source is unverified'
    assert evidence['scope'] == 'newly_accepted_captures_only', 'Do not declare retained filter images corrected'
    assert re.fullmatch(r'[0-9a-f]{40}', evidence['source_revision']), 'Immutable source revision required'
    assert evidence['reviewer'] and evidence['reviewed_at']
    for field in ['authentic_application_state', 'development_controls_absent',
                  'impersonation_controls_absent', 'no_dom_or_pixel_fabrication', 'no_messages_sent']:
        assert evidence[field] is True, f'Source requirement unresolved: {field}'
    assert evidence['evidence_files'], 'Provide reviewed source/runtime/capture evidence'
    for record in evidence['evidence_files']:
        relative = Path(record['path'])
        assert not relative.is_absolute()
        item = (HERE / relative).resolve()
        assert item.is_relative_to(HERE) and item.is_file(), 'Evidence file missing or outside revision'
        assert sha(item) == record['sha256'], f'Evidence changed: {relative}'
    return path, evidence
