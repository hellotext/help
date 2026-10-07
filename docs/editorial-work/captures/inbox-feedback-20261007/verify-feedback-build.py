"""Verify source images and exported modules for the revised four-page batch."""
from pathlib import Path
import hashlib
import json
import re
import struct
import subprocess

ROOT = Path(__file__).resolve().parent
HELP = ROOT.parents[3]
images = set()
for locale in ['es', 'en']:
    for article in ['inbox-overview', 'filter-and-search-inbox']:
        body = (HELP / f'_i18n/{locale}/team/{article}.md').read_text()
        assert body.count('<figure ') == 3, article
        images.update(re.findall(r'/images/editorial/[^"\s]+\.png', body))
checks = []
for relative in sorted(images):
    image = HELP / relative.lstrip('/')
    data = image.read_bytes()
    assert data[:8] == b'\x89PNG\r\n\x1a\n', image
    pixels = struct.unpack('>II', data[16:24])
    profile = subprocess.check_output(['sips', '-g', 'profile', str(image)], text=True)
    assert 'profile: Display P3' in profile, image
    for prefix in [HELP / '_site', HELP / '_site/es']:
        assert (prefix / relative.lstrip('/')).read_bytes() == data, image
    checks.append({'source': relative, 'pixels': list(pixels), 'profile': profile.split('profile: ', 1)[1].strip(),
                   'sha256': hashlib.sha256(data).hexdigest(), 'built_copies_equal': 2})
for name in ['editorial_visuals.js', 'editorial_tabs.js']:
    path = Path('assets/editorial') / name
    for prefix in [HELP / '_site', HELP / '_site/es']:
        assert (prefix / path).read_bytes() == (HELP / path).read_bytes(), path
for prefix in [HELP / '_site', HELP / '_site/es']:
    assert not (prefix / 'docs').exists() and not (prefix / 'AGENTS.md').exists()
result = {'source_images_referenced': len(checks), 'image_byte_comparisons': 2 * len(checks),
          'images': checks, 'javascript_byte_comparisons': 4, 'editorial_work_excluded': True}
(ROOT / 'build-verification.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({'images': len(checks), 'byte_comparisons': 2 * len(checks), 'result': 'passed'}))
