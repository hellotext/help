"""Verify the reviewed screenshot sources survive both Jekyll locale builds."""
from pathlib import Path
import hashlib
import json
import struct
import subprocess

ROOT = Path(__file__).resolve().parent
HELP = ROOT.parents[3]
images = sorted((HELP/'images/editorial/inbox-filter-search').glob('*.png'))
assert images, 'No accepted screenshot sources'
checks = []
for image in images:
    data = image.read_bytes()
    assert data[:8] == b'\x89PNG\r\n\x1a\n', image
    pixels = struct.unpack('>II',data[16:24])
    profile = subprocess.check_output(['sips','-g','profile',str(image)],text=True)
    assert 'profile: Display P3' in profile, image
    relative = image.relative_to(HELP)
    for prefix in [HELP/'_site', HELP/'_site/es']:
        assert (prefix/relative).read_bytes() == data, prefix/relative
    checks.append({'source':str(relative),'pixels':list(pixels),'icc':'Display P3','sha256':hashlib.sha256(data).hexdigest(),'built_copies_equal':2})
for js in ['editorial_visuals.js','editorial_tabs.js']:
    relative=Path('assets/editorial')/js
    for prefix in [HELP/'_site',HELP/'_site/es']:
        assert (prefix/relative).read_bytes() == (HELP/relative).read_bytes(), prefix/relative
for prefix in [HELP/'_site',HELP/'_site/es']:
    assert not (prefix/'docs').exists() and not (prefix/'AGENTS.md').exists()
result={'image_count':len(checks),'image_byte_comparisons':2*len(checks),'images':checks,'javascript_byte_comparisons':4,'editorial_work_excluded':True}
(ROOT/'build-verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'images':len(checks),'byte_comparisons':2*len(checks),'result':'passed'}))
