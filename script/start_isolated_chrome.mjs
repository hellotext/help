#!/usr/bin/env node

// Start or reuse a headless Chrome that cannot see the editor's personal tabs.
import { execFileSync, spawn } from 'node:child_process';
import { resolve } from 'node:path';

const options = Object.fromEntries(process.argv.slice(2).map((arg) => {
  const separator = arg.indexOf('=');
  if (!arg.startsWith('--') || separator < 3) throw new Error(`Invalid option: ${arg}`);
  return [arg.slice(2, separator), arg.slice(separator + 1)];
}));
for (const key of ['port', 'profile', 'url']) if (!options[key]) throw new Error(`Missing --${key}`);
const port = Number(options.port);
const profile = resolve(options.profile);
const url = new URL(options.url);
if (!Number.isInteger(port) || port < 1024 || port > 65535) throw new Error('Invalid port');
if (!profile.startsWith('/private/tmp/hellotext-')) throw new Error('Use a dedicated temporary profile');
if (url.protocol !== 'http:' || url.hostname !== '127.0.0.1') throw new Error('Use only a loopback demo URL');

function owner() {
  let listener;
  try {
    listener = execFileSync('lsof', ['-nP', `-iTCP:${port}`, '-sTCP:LISTEN', '-Fpcn'], { encoding: 'utf8' });
  } catch { return null; }
  const pids = [...listener.matchAll(/^p(\d+)$/gm)].map((match) => Number(match[1]));
  if (pids.length !== 1 || !/^cGoogle/m.test(listener) || !listener.includes(`n127.0.0.1:${port}`)) {
    throw new Error('Port is owned by another process');
  }
  const files = execFileSync('lsof', ['-nP', '-p', String(pids[0]), '-Fn'], { encoding: 'utf8' });
  if (!files.split('\n').some((line) => line.startsWith(`n${profile}/`))) {
    throw new Error('Port is owned by a different Chrome profile');
  }
  return pids[0];
}

let pid = owner();
if (!pid) {
  const chrome = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
  const child = spawn(chrome, [
    '--headless=new', `--user-data-dir=${profile}`,
    '--remote-debugging-address=127.0.0.1', `--remote-debugging-port=${port}`,
    '--no-first-run', '--no-default-browser-check', '--disable-sync',
    '--disable-background-networking', '--disable-extensions',
    '--disable-crash-reporter', '--force-color-profile=display-p3-d65',
    '--force-device-scale-factor=2', '--window-size=1200,1000', url.href,
  ], { detached: true, stdio: 'ignore' });
  child.unref();
  for (let attempt = 0; attempt < 50 && !pid; attempt += 1) {
    await new Promise((resolveDelay) => setTimeout(resolveDelay, 200));
    pid = owner();
  }
  if (!pid) throw new Error('Isolated Chrome did not start');
}

const targets = await (await fetch(`http://127.0.0.1:${port}/json/list`)).json();
const pages = targets.filter((target) => target.type === 'page');
if (pages.length !== 1 || new URL(pages[0].url).origin !== url.origin) {
  throw new Error('Isolated Chrome must contain exactly one local demo tab');
}
console.log(JSON.stringify({ pid, port, profile, page: pages[0].url, headless: true }));
