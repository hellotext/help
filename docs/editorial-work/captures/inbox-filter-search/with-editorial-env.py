"""Launch an owned editorial Rails snapshot with an explicit private environment.

Place this file in that snapshot's tmp directory. The private JSON is deliberately
not part of the capture archive. Review its dummy values before using this helper.
"""
import json
import os
from pathlib import Path
import sys

root = Path(__file__).resolve().parent.parent
if not (root / 'bin/rails').is_file() or len(sys.argv) < 2:
    raise SystemExit('Place the launcher in the owned Rails tmp directory and supply a command')

inherited = {'PATH', 'HOME', 'USER', 'LOGNAME', 'SHELL', 'LANG', 'LC_ALL', 'TMPDIR', 'RBENV_ROOT', 'RBENV_VERSION'}
env = {key: value for key, value in os.environ.items() if key in inherited}
private = json.loads((root / 'tmp/editorial-batch-env.json').read_text())
if not isinstance(private, dict) or not all(isinstance(key, str) and isinstance(value, str) for key, value in private.items()):
    raise SystemExit('Private environment must be a mapping of strings')
required = {
    'RAILS_ENV': 'development',
    'HELP_EDITORIAL_BATCH': 'task8-inbox-20261007',
    'DATABASE_URL': 'postgresql:///hellotext_help_inbox_task8_20261007',
    'REDIS_URL': 'redis://127.0.0.1:6418/0',
}
if any(private.get(key) != value for key, value in required.items()):
    raise SystemExit('Private environment does not target the owned editorial runtime')
if not (root / 'config/initializers/help_editorial_batch.rb').is_file():
    raise SystemExit('Owned editorial safety initializer is missing')
env.update(private)
os.chdir(root)
os.execvpe(sys.argv[1], sys.argv[1:], env)
