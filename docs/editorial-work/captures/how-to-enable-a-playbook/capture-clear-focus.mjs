#!/usr/bin/env node

// Capture the compositor of a dedicated, locally debugged Chrome profile.
// This deliberately has no way to discover macOS windows or other browsers.
import { createHash } from 'node:crypto';
import { execFileSync } from 'node:child_process';
import { rename, rm, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import WebSocket from 'ws';

const options = Object.fromEntries(process.argv.slice(2).map((arg) => {
  const separator = arg.indexOf('=');
  if (!arg.startsWith('--') || separator < 3) throw new Error(`Invalid option: ${arg}`);
  return [arg.slice(2, separator), arg.slice(separator + 1)];
}));

const required = ['port', 'profile', 'url', 'title', 'email', 'text', 'clip', 'output'];
for (const key of required) if (!options[key]) throw new Error(`Missing --${key}`);
const port = Number(options.port);
if (!Number.isInteger(port) || port < 1024 || port > 65535) throw new Error('Invalid port');
const expectedUrl = new URL(options.url);
if (expectedUrl.hostname !== '127.0.0.1' || expectedUrl.protocol !== 'http:') {
  throw new Error('Capture URL must use the loopback demo server');
}
const identityUrl = options['identity-url'] && new URL(options['identity-url']);
if (identityUrl && (identityUrl.origin !== expectedUrl.origin || identityUrl.pathname !== '/hellotext/journeys/new')) {
  throw new Error('Identity check must use the local demo playbook catalog');
}
if (!options.email.endsWith('@example.test')) throw new Error('Expected a fictional account');
let clip = options.clip.split(',').map(Number);
if (clip.length !== 4 || clip.some((value) => !Number.isInteger(value) || value < 0) || clip[2] < 1 || clip[3] < 1) {
  throw new Error('Clip must be x,y,width,height in CSS pixels');
}
const scale = Number(options.scale ?? '1');
if (![1, 2].includes(scale)) throw new Error('Scale must be 1 or 2');
const viewport = options.viewport?.split(',').map(Number);
if (viewport && (viewport.length !== 2 || viewport.some((value) => !Number.isInteger(value) || value < 320))) {
  throw new Error('Viewport must be width,height in CSS pixels');
}
const scroll = options.scroll?.split(',').map(Number);
if (scroll && (scroll.length !== 2 || scroll.some((value) => !Number.isInteger(value) || value < 0))) {
  throw new Error('Scroll must be x,y in CSS pixels');
}
const output = resolve(options.output);
const temporary = `${output}.partial`;
const profile = resolve(options.profile);
const popover = options.popover?.split(',');
if (popover && (popover.length !== 2 || popover.some((id) => !/^[a-zA-Z][a-zA-Z0-9_-]*$/.test(id)))) {
  throw new Error('Popover must name an existing trigger ID and popover ID');
}

// Inspect only the process listening on the specified local debugging port.
// Its open files must belong to the dedicated profile, not the editor's Chrome.
const listener = execFileSync('lsof', ['-nP', `-iTCP:${port}`, '-sTCP:LISTEN', '-Fpcn'], { encoding: 'utf8' });
const pids = [...listener.matchAll(/^p(\d+)$/gm)].map((match) => Number(match[1]));
if (pids.length !== 1 || !/^cGoogle/m.test(listener) || !listener.includes(`n127.0.0.1:${port}`)) {
  throw new Error('The debugging port is not owned by one local Chrome process');
}
const openFiles = execFileSync('lsof', ['-nP', '-p', String(pids[0]), '-Fn'], { encoding: 'utf8' });
if (!openFiles.split('\n').some((line) => line.startsWith(`n${profile}/`))) {
  throw new Error('Chrome does not own the dedicated profile');
}

function delay(ms) { return new Promise((resolveDelay) => setTimeout(resolveDelay, ms)); }

async function connect(targetUrl) {
  const socket = new WebSocket(targetUrl);
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
  return {
    call(method, params = {}) {
      return new Promise((resolveCall, rejectCall) => {
        const id = ++sequence;
        pending.set(id, { resolve: resolveCall, reject: rejectCall });
        socket.send(JSON.stringify({ id, method, params }));
      });
    },
    close() { socket.close(); },
  };
}

async function state(connection) {
  const result = await connection.call('Runtime.evaluate', {
    expression: `(async () => {
      let account = [...document.querySelectorAll('h2')].some(e => e.textContent.trim() === ${JSON.stringify(options.email)});
      if (!account && ${JSON.stringify(identityUrl?.href ?? null)}) {
        const response = await fetch(${JSON.stringify(identityUrl?.href ?? null)}, { credentials: 'same-origin' });
        if (response.ok && response.url === ${JSON.stringify(identityUrl?.href ?? null)}) {
          const identityPage = new DOMParser().parseFromString(await response.text(), 'text/html');
          account = [...identityPage.querySelectorAll('h2')].some(e => e.textContent.trim() === ${JSON.stringify(options.email)});
        }
      }
      return JSON.stringify({url: location.href, title: document.title,
        locale: document.documentElement.lang, width: innerWidth, height: innerHeight,
        dpr: devicePixelRatio, zoom: visualViewport.scale,
        scrollX, scrollY, account,
        target: document.body.innerText.includes(${JSON.stringify(options.text)})});
    })()`,
    returnByValue: true,
    awaitPromise: true,
  });
  if (result.exceptionDetails || typeof result.result.value !== 'string') throw new Error('Page state unavailable');
  return JSON.parse(result.result.value);
}

function verifyState(actual) {
  if (actual.url !== expectedUrl.href || actual.title !== options.title) throw new Error('Unexpected demo page');
  if (options.locale && actual.locale !== options.locale) throw new Error('Unexpected UI locale');
  if (!actual.account || !actual.target) throw new Error('Fictional account or target control not present');
  if (actual.zoom !== 1 || actual.dpr < 2) throw new Error('Zoom or device pixel ratio does not meet capture standard');
  if (![actual.scrollX, actual.scrollY].every((value) => Number.isFinite(value) && value >= 0)) {
    throw new Error('Page scroll offset is unavailable');
  }
  if (clip[0] + clip[2] > actual.width || clip[1] + clip[3] > actual.height) {
    throw new Error('Clip exceeds the real CSS viewport');
  }
}

let connection;
try {
  const listing = await (await fetch(`http://127.0.0.1:${port}/json/list`)).json();
  const pages = listing.filter((target) => target.type === 'page');
  if (pages.length !== 1 || pages[0].url !== expectedUrl.href) {
    throw new Error('Isolated Chrome must contain exactly one matching demo tab');
  }
  connection = await connect(pages[0].webSocketDebuggerUrl);
  if (viewport) {
    await connection.call('Emulation.setDeviceMetricsOverride', {
      width: viewport[0], height: viewport[1], deviceScaleFactor: 2, mobile: false,
    });
  }
  if (popover) {
    const preOpen = await state(connection);
    verifyState(preOpen);
    const opened = await connection.call('Runtime.evaluate', {
      expression: `(() => {
        const trigger = document.getElementById(${JSON.stringify(popover[0])});
        const panel = document.getElementById(${JSON.stringify(popover[1])});
        if (!trigger || !panel || !panel.hasAttribute('popover')) return false;
        if (!panel.matches(':popover-open')) trigger.click();
        return true;
      })()`,
      returnByValue: true,
    });
    if (opened.exceptionDetails || opened.result.value !== true) throw new Error('Expected local popover not found');
    await delay(350);
    const visible = await connection.call('Runtime.evaluate', {
      expression: `document.getElementById(${JSON.stringify(popover[1])}).matches(':popover-open')`,
      returnByValue: true,
    });
    if (visible.result.value !== true) throw new Error('Expected local popover did not open');
    if (options.popoverClip === 'true') {
      const bounds = await connection.call('Runtime.evaluate', {
        expression: `(() => { const rect = document.getElementById(${JSON.stringify(popover[1])}).getBoundingClientRect();
          return [Math.floor(rect.x), Math.floor(rect.y), Math.ceil(rect.width), Math.ceil(rect.height)]; })()`,
        returnByValue: true,
      });
      clip = bounds.result.value;
      if (clip.length !== 4 || clip.some((value) => !Number.isInteger(value) || value < 0)) {
        throw new Error('Popover bounds unavailable');
      }
    }
  }
  if (scroll) {
    await connection.call('Runtime.evaluate', {
      expression: `window.scrollTo(${scroll[0]}, ${scroll[1]})`,
    });
  }
  if (options['clear-focus'] === 'true') {
    verifyState(await state(connection));
    const target = await connection.call('Runtime.evaluate', {
      expression: `(() => { const element = document.querySelector('#empty p');
        if (!element || element.closest('a,button,input,textarea,[contenteditable=true]')) throw Error('expected inert empty chat text');
        const rect = element.getBoundingClientRect(); if (!rect.width || !rect.height) throw Error('empty chat not visible');
        return [rect.x + rect.width / 2, rect.y + rect.height / 2]; })()`,
      returnByValue: true,
    });
    if (target.exceptionDetails || !Array.isArray(target.result.value)) throw Error('inert focus target unavailable');
    const [x, y] = target.result.value;
    await connection.call('Input.dispatchMouseEvent', { type: 'mousePressed', x, y, button: 'left', clickCount: 1 });
    await connection.call('Input.dispatchMouseEvent', { type: 'mouseReleased', x, y, button: 'left', clickCount: 1 });
    await delay(350);
  }
  const before = await state(connection);
  verifyState(before);
  if (scroll && (before.scrollX !== scroll[0] || before.scrollY !== scroll[1])) {
    throw new Error('Requested scroll position was not reached');
  }
  await delay(250);
  const capture = await connection.call('Page.captureScreenshot', {
    format: 'png', fromSurface: true, captureBeyondViewport: false,
    // The CLI clip is viewport-relative; CDP expects document coordinates.
    clip: { x: before.scrollX + clip[0], y: before.scrollY + clip[1], width: clip[2], height: clip[3], scale },
  });
  const after = await state(connection);
  verifyState(after);
  if (JSON.stringify(before) !== JSON.stringify(after)) throw new Error('Page changed during capture');
  if (popover) {
    const visible = await connection.call('Runtime.evaluate', {
      expression: `document.getElementById(${JSON.stringify(popover[1])}).matches(':popover-open')`,
      returnByValue: true,
    });
    if (visible.result.value !== true) throw new Error('Local popover closed during capture');
  }
  const png = Buffer.from(capture.data, 'base64');
  if (png.subarray(0, 8).toString('hex') !== '89504e470d0a1a0a') throw new Error('Chrome did not emit PNG');
  const pixelWidth = png.readUInt32BE(16);
  const pixelHeight = png.readUInt32BE(20);
  if (pixelWidth < clip[2] * 2 || pixelHeight < clip[3] * 2) throw new Error('PNG density below 2x');
  await writeFile(temporary, png, { flag: 'wx' });
  const metadata = execFileSync('sips', ['-g', 'profile', temporary], { encoding: 'utf8' });
  if (!/profile: Display P3/.test(metadata)) throw new Error('PNG lacks an embedded Display P3 profile');
  await rename(temporary, output);
  const digest = createHash('sha256').update(png).digest('hex');
  console.log(JSON.stringify({ output, sha256: digest, url: before.url, locale: before.locale,
    cssViewport: [before.width, before.height], browserDpr: before.dpr,
    clip, pageScroll: [before.scrollX, before.scrollY], pixelSize: [pixelWidth, pixelHeight], sourceDensity: pixelWidth / clip[2],
    icc: 'Display P3', route: 'isolated Chrome compositor via CDP' }));
} catch (error) {
  await rm(temporary, { force: true });
  console.error(error.message);
  process.exitCode = 1;
} finally {
  connection?.close();
}
