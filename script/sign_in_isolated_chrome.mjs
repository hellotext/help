#!/usr/bin/env node

// Authenticate only the fictional account in a dedicated local Chrome profile.
// The password is read from a mode-0600 local file and never logged.
import { execFileSync } from 'node:child_process';
import { readFile, stat } from 'node:fs/promises';
import { resolve } from 'node:path';
import WebSocket from 'ws';

const options = Object.fromEntries(process.argv.slice(2).map((arg) => {
  const separator = arg.indexOf('=');
  if (!arg.startsWith('--') || separator < 3) throw new Error(`Invalid option: ${arg}`);
  return [arg.slice(2, separator), arg.slice(separator + 1)];
}));
for (const key of ['port', 'profile', 'url', 'email', 'password-file']) {
  if (!options[key]) throw new Error(`Missing --${key}`);
}
const port = Number(options.port);
const profile = resolve(options.profile);
const destination = new URL(options.url);
const identityUrl = options['identity-url'] && new URL(options['identity-url']);
if (!Number.isInteger(port) || port < 1024 || port > 65535) throw new Error('Invalid port');
if (!profile.startsWith('/private/tmp/hellotext-')) throw new Error('Use a dedicated temporary profile');
if (destination.protocol !== 'http:' || destination.hostname !== '127.0.0.1') throw new Error('Use only a loopback demo URL');
if (identityUrl && (identityUrl.origin !== destination.origin || identityUrl.pathname !== '/hellotext/journeys/new')) {
  throw new Error('Identity check must use the local demo playbook catalog');
}
if (!options.email.endsWith('@example.test')) throw new Error('Use only a fictional account');

const listener = execFileSync('lsof', ['-nP', `-iTCP:${port}`, '-sTCP:LISTEN', '-Fpcn'], { encoding: 'utf8' });
const pids = [...listener.matchAll(/^p(\d+)$/gm)].map((match) => Number(match[1]));
if (pids.length !== 1 || !/^cGoogle/m.test(listener) || !listener.includes(`n127.0.0.1:${port}`)) {
  throw new Error('The debugging port is not owned by one local Chrome process');
}
const files = execFileSync('lsof', ['-nP', '-p', String(pids[0]), '-Fn'], { encoding: 'utf8' });
if (!files.split('\n').some((line) => line.startsWith(`n${profile}/`))) {
  throw new Error('Chrome does not own the dedicated profile');
}

const targets = await (await fetch(`http://127.0.0.1:${port}/json/list`)).json();
const pages = targets.filter((target) => target.type === 'page');
if (pages.length !== 1 || new URL(pages[0].url).origin !== destination.origin) {
  throw new Error('Isolated Chrome must contain exactly one matching local page');
}
const socket = new WebSocket(pages[0].webSocketDebuggerUrl);
await new Promise((resolveOpen, rejectOpen) => {
  socket.addEventListener('open', resolveOpen, { once: true });
  socket.addEventListener('error', rejectOpen, { once: true });
});
let sequence = 0;
const pending = new Map();
socket.addEventListener('message', ({ data }) => {
  const response = JSON.parse(data);
  const waiting = pending.get(response.id);
  if (!waiting) return;
  pending.delete(response.id);
  response.error ? waiting.reject(new Error(response.error.message)) : waiting.resolve(response.result);
});
function call(method, params = {}) {
  return new Promise((resolveCall, rejectCall) => {
    const id = ++sequence;
    pending.set(id, { resolve: resolveCall, reject: rejectCall });
    socket.send(JSON.stringify({ id, method, params }));
  });
}
async function evaluate(expression) {
  const response = await call('Runtime.evaluate', { expression, returnByValue: true, awaitPromise: true });
  if (response.exceptionDetails) throw new Error('Demo page evaluation failed');
  return response.result.value;
}
async function waitFor(predicate, label) {
  for (let attempt = 0; attempt < 50; attempt += 1) {
    try { if (await predicate()) return; } catch { /* Navigation may replace the JS context. */ }
    await new Promise((resolveDelay) => setTimeout(resolveDelay, 200));
  }
  throw new Error(`${label} did not appear in the isolated app`);
}
const accountExpression = `(async () => {
  if ([...document.querySelectorAll('h2')].some(e => e.textContent.trim() === ${JSON.stringify(options.email)})) return true;
  if (!${JSON.stringify(identityUrl?.href ?? null)}) return false;
  const response = await fetch(${JSON.stringify(identityUrl?.href ?? null)}, { credentials: 'same-origin' });
  if (!response.ok || response.url !== ${JSON.stringify(identityUrl?.href ?? null)}) return false;
  const identityPage = new DOMParser().parseFromString(await response.text(), 'text/html');
  return [...identityPage.querySelectorAll('h2')].some(e => e.textContent.trim() === ${JSON.stringify(options.email)});
})()`;

try {
  if (!(await evaluate(accountExpression))) {
    await call('Page.navigate', { url: `${destination.origin}/login` });
    await waitFor(() => evaluate('!!document.querySelector("input[name=\\"user[email]\\"]")'), 'Login form');
    await evaluate(`(() => {
      const input = document.querySelector('input[name="user[email]"]');
      const setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, 'value').set;
      setter.call(input, ${JSON.stringify(options.email)});
      input.dispatchEvent(new Event('input', { bubbles: true }));
      input.form.requestSubmit();
      return true;
    })()`);
    await waitFor(() => evaluate('!!document.querySelector("input[type=password]")'), 'Password form');
    const file = resolve(options['password-file']);
    const metadata = await stat(file);
    if ((metadata.mode & 0o077) !== 0) throw new Error('Fixture password file must be mode 0600');
    const password = (await readFile(file, 'utf8')).trim();
    if (!password) throw new Error('Fixture password file is empty');
    await evaluate(`(() => {
      const input = document.querySelector('input[type=password]');
      const setter = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, 'value').set;
      setter.call(input, ${JSON.stringify(password)});
      input.dispatchEvent(new Event('input', { bubbles: true }));
      input.form.requestSubmit();
      return true;
    })()`);
    await waitFor(() => evaluate(accountExpression), 'Fictional account');
  }
  await call('Page.navigate', { url: destination.href });
  await waitFor(() => evaluate(`location.href === ${JSON.stringify(destination.href)} && ${accountExpression}`), 'Requested demo page');
  console.log(JSON.stringify({ authenticated: true, account: options.email, url: destination.href, profile }));
} catch (error) {
  console.error(error.message);
  process.exitCode = 1;
} finally {
  socket.close();
}
