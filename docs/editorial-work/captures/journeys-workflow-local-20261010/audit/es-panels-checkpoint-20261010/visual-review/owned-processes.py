from pathlib import Path
from datetime import datetime,timezone
import json,os,signal,socket,subprocess,sys,tempfile,threading,time,urllib.request
HERE=Path(__file__).resolve().parent
HELP=next(p for p in HERE.parents if (p/'_config.yml').exists())
stop=threading.Event()
for port in (4306,9494):
    with socket.socket() as probe:
        probe.bind(('127.0.0.1',port))
profile=Path(tempfile.mkdtemp(prefix='hellotext-journeys-partial-review-20261010-')).resolve()
children=[];logs=[]
record={'started_at':datetime.now(timezone.utc).isoformat(),'server_port':4306,'browser_port':9494,'profile':str(profile),'site':str(HELP/'_site'),'status':'starting'}
try:
    log=(HERE/'server.log').open('w');logs.append(log)
    server=subprocess.Popen([sys.executable,'-u','-m','http.server','4306','--bind','127.0.0.1','--directory',str(HELP/'_site')],stdout=log,stderr=subprocess.STDOUT,start_new_session=True);children.append(server)
    log=(HERE/'chrome.log').open('w');logs.append(log)
    flags=['/Applications/Google Chrome.app/Contents/MacOS/Google Chrome','--headless=new','--remote-debugging-address=127.0.0.1','--remote-debugging-port=9494',f'--user-data-dir={profile}','--force-color-profile=display-p3-d65','--force-device-scale-factor=2','--window-size=1440,1000','--no-first-run','--no-default-browser-check','--disable-background-networking','--disable-component-update','--disable-sync','--disable-default-apps','--metrics-recording-only','--password-store=basic','--use-mock-keychain','--disable-features=Translate,MediaRouter,OptimizationHints','--host-resolver-rules=MAP * ~NOTFOUND, EXCLUDE 127.0.0.1','about:blank']
    chrome=subprocess.Popen(flags,stdout=log,stderr=subprocess.STDOUT,start_new_session=True);children.append(chrome)
    record.update(server_pid=server.pid,browser_pid=chrome.pid)
    for _ in range(80):
        assert all(p.poll() is None for p in children),'An owned process exited before readiness'
        try:
            tabs=json.load(urllib.request.urlopen('http://127.0.0.1:9494/json/list',timeout=.3))
            pages=[t for t in tabs if t['type']=='page']
            assert len(pages)==1 and pages[0]['url']=='about:blank'
            urllib.request.urlopen('http://127.0.0.1:4306/getting-started-with-journeys.html',timeout=.3).close()
            break
        except (OSError,TimeoutError):time.sleep(.2)
    else:raise RuntimeError('Owned review processes did not become ready')
    record['status']='ready';(HERE/'processes.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps({'status':'ready','server_pid':server.pid,'browser_pid':chrome.pid,'server_port':4306,'browser_port':9494,'profile':str(profile)}),flush=True)
    for sig in (signal.SIGTERM,signal.SIGINT):signal.signal(sig,lambda *_:stop.set())
    while not stop.wait(.5):
        if any(p.poll() is not None for p in children):raise RuntimeError('Owned process ended unexpectedly')
finally:
    for child in reversed(children):
        if child.poll() is None:
            os.killpg(child.pid,signal.SIGTERM)
            try:child.wait(timeout=10)
            except subprocess.TimeoutExpired:os.killpg(child.pid,signal.SIGKILL);child.wait(timeout=5)
    for log in logs:log.close()
    record.update(status='stopped',stopped_at=datetime.now(timezone.utc).isoformat(),exit_codes=[p.returncode for p in children],only_owned_process_groups_terminated=True)
    (HERE/'processes.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps({'status':'stopped','pids':[p.pid for p in children]}),flush=True)
