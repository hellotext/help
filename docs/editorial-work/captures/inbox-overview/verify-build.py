"""Verify the reviewed screenshot sources survive both Jekyll locale builds."""
from pathlib import Path
import hashlib
import json
import struct
import subprocess

ROOT = Path(__file__).resolve().parent
HELP = ROOT.parents[3]
images = sorted((HELP/'images/editorial/inbox-overview').glob('*.png'))
manifest = {record['file']: record for record in json.loads((ROOT/'manifest.json').read_text())['records']}
assert len(images) == len(manifest) == 8, 'Expected eight accepted screenshot sources'
assert {image.name for image in images} == set(manifest), 'Unexpected screenshot file set'
checks = []
for image in images:
    data = image.read_bytes()
    assert data[:8] == b'\x89PNG\r\n\x1a\n', image
    pixels = struct.unpack('>II',data[16:24])
    source = manifest[image.name]
    assert list(pixels) == source['pixelSize'], image
    assert hashlib.sha256(data).hexdigest() == source['sha256'], image
    assert source['sourceDensity'] == 4, image
    assert list(pixels) == [size*4 for size in source['nativeCssSize']], image
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
for route in ['inbox-conversations-overview.html', 'es/resumen-inbox-conversaciones.html']:
    body=(HELP/'_site'/route).read_text()
    assert body.count('<figure ') == 2, route
    assert '/images/editorial/inbox-overview/' in body, route
result={'image_count':len(checks),'image_byte_comparisons':2*len(checks),'images':checks,'javascript_byte_comparisons':4,'editorial_work_excluded':True}
(ROOT/'build-verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'images':len(checks),'byte_comparisons':2*len(checks),'result':'passed'}))
