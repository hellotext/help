import { execFileSync } from 'node:child_process';
import { mkdirSync, writeFileSync } from 'node:fs';
const repo = '/Users/pel/.codex/worktrees/campaign-reporting-visuals/hellotext-help';
const dir = process.argv[2] ?? '/private/tmp/hellotext-webchat-preview-recapture';
const url = 'http://127.0.0.1:3192/hellotext/playbooks/RbQxgZdE/edit?pp=disable';
const run = (cmd, args) => execFileSync(cmd, args, { cwd: repo, encoding: 'utf8', maxBuffer: 1024 * 1024 });
const prepare = (width, height) => JSON.parse(run('node', [`${repo}/docs/editorial-work/captures/webchat-widget/preview-follow-up/prepare.mjs`, url, String(width), String(height), 'overview']));
const union = (rects, margin) => {
  const x = Math.floor(Math.min(...rects.map(r => r[0])) - margin);
  const y = Math.floor(Math.min(...rects.map(r => r[1])) - margin);
  return [x, y, Math.ceil(Math.max(...rects.map(r => r[0] + r[2])) + margin) - x, Math.ceil(Math.max(...rects.map(r => r[1] + r[3])) + margin) - y];
};
mkdirSync(dir, { recursive: true });
const preflight = JSON.parse(run('python3', ['/private/tmp/hellotext-forms-refresh-runner.py', `${repo}/docs/editorial-work/captures/webchat-widget/preview-follow-up/preflight.rb`]));
const captures = [];
try {
  for (const locale of ['es', 'en']) {
    const fixture = JSON.parse(run('python3', ['/private/tmp/hellotext-forms-refresh-runner.py', `${repo}/docs/editorial-work/captures/webchat-widget/display-state.rb`, locale]));
    const wide = prepare(1280, 1000);
    if (wide.locale !== locale || wide.cards.length !== 5 || wide.cards.some(c => !c.visible) || wide.form !== null) throw Error('Incomplete editor overview');
    for (const [name, state, clip] of [
      ['overview', wide, union([...wide.cards.map(c => c.rect), wide.preview, wide.launcher], 16)],
      ['preview', wide, union([wide.preview, wide.launcher], 12)],
      ['overview-mobile', null, null],
    ]) {
      const prepared = state ?? prepare(1000, 1120);
      const bounds = clip ?? union(prepared.cards.map(c => c.rect), 16);
      if (bounds[0] < 0 || bounds[1] < 0 || bounds[0] + bounds[2] > prepared.viewport[0] || bounds[1] + bounds[3] > prepared.viewport[1]) throw Error('Incomplete crop');
      const output = `${dir}/${name}-${locale}.png`;
      writeFileSync(`${dir}/${name}-${locale}-state.json`,JSON.stringify(prepared,null,2));
      const native = JSON.parse(run('node', ['script/capture_isolated_chrome.mjs', '--port=9460', '--profile=/private/tmp/hellotext-forms-ui-refresh-headless-9460', '--email=design-system@example.test', '--identity-url=http://127.0.0.1:3192/hellotext/journeys/new', `--url=${url}`, `--title=${prepared.title}`, `--locale=${locale}`, `--text=${locale === 'es' ? 'Podemos ayudarte con tu pedido' : 'We can help with your order'}`, `--viewport=${prepared.viewport.join(',')}`, `--clip=${bounds.join(',')}`, `--output=${output}`]));
      captures.push({ name, locale, fixture, prepared, clip: bounds, native });
      console.log(`${locale} ${name} ${bounds[2]}x${bounds[3]} CSS`);
    }
  }
} finally {
  const restored = JSON.parse(run('python3', ['/private/tmp/hellotext-forms-refresh-runner.py', `${repo}/docs/editorial-work/captures/webchat-widget/display-state.rb`, 'restore']));
  const postflight = JSON.parse(run('python3', ['/private/tmp/hellotext-forms-refresh-runner.py', `${repo}/docs/editorial-work/captures/webchat-widget/preview-follow-up/preflight.rb`]));
  writeFileSync(`${dir}/batch.json`, JSON.stringify({ preflight, captures, restored, postflight }, null, 2));
}
