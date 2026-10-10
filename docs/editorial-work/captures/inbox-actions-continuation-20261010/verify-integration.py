#!/usr/bin/env python3
"""Verify the frozen combined local batch; never build, browse, mutate, or publish.

Install beside continuation figure-plan.json, manifest.json, preparation-record.json
and integration-record.json. For audit use, pass --root and --capture-dir explicitly.
The historical first-phase verifier and its evidence remain unchanged.
"""
import argparse
import csv
import hashlib
from html.parser import HTMLParser
import io
import json
from pathlib import Path
import re
import struct
import subprocess
import sys
import zlib

CAP = Path(__file__).resolve().parent
ROOT = None
OLD_DIR = "images/editorial/inbox-actions-20261010"
NEW_DIR = "images/editorial/inbox-actions-continuation-20261010"
OLD_CAP_NAME = "docs/editorial-work/captures/inbox-actions-20261010"
NEW_CAP_NAME = "docs/editorial-work/captures/inbox-actions-continuation-20261010"
ARTICLE = {
    "assignment-menu": "team/assigning-conversations.md",
    "assignment-result": "team/assigning-conversations.md",
    "snooze-options": "team/conversation-lifecycle.md",
    "snoozed-result": "team/conversation-lifecycle.md",
    "closed-result": "team/conversation-lifecycle.md",
    "reopened-result": "team/conversation-lifecycle.md",
}
RESULTS = {"assignment-result", "snoozed-result", "closed-result", "reopened-result"}
BLOCK = re.compile(r"\n\n<!-- inbox-actions:([a-z0-9-]+):start -->\n(.*?)\n<!-- inbox-actions:\1:end -->", re.S)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def text_bytes(path):
    return path.read_bytes().decode("utf-8")


def inside(base, name):
    require(isinstance(name, str) and not Path(name).is_absolute(), f"Not a relative path: {name}")
    path = (base / name).resolve()
    require(path.is_relative_to(base.resolve()), f"Path escapes its root: {name}")
    return path


def load(name):
    return json.loads((CAP / name).read_text())


def indexed(items, key, description):
    result = {key(item): item for item in items}
    require(len(result) == len(items), f"Duplicate {description}")
    return result


def logical_size(record):
    clip = record["clip"]
    return [clip["width"], clip["height"]] if isinstance(clip, dict) else clip[2:4]


def style(attributes):
    pairs = [part.split(":", 1) for part in attributes.get("style", "").split(";") if part.strip()]
    require(all(len(pair) == 2 for pair in pairs), "Malformed inline style")
    result = {key.strip(): " ".join(value.split()) for key, value in pairs}
    require(len(result) == len(pairs), "Duplicate inline style property")
    return result


def png(path):
    """Inspect real bytes, CRCs, dimensions and ICC P3 primaries, not a label."""
    data = path.read_bytes()
    require(data[:8] == b"\x89PNG\r\n\x1a\n", f"Not PNG: {path.name}")
    offset, chunks, profile, size = 8, [], None, None
    while offset < len(data):
        require(offset + 12 <= len(data), f"Truncated PNG: {path.name}")
        length = struct.unpack_from(">I", data, offset)[0]
        kind = data[offset + 4:offset + 8]
        end = offset + 12 + length
        require(end <= len(data), f"Truncated PNG chunk: {path.name}")
        payload = data[offset + 8:end - 4]
        checksum = struct.unpack_from(">I", data, end - 4)[0]
        require(zlib.crc32(kind + payload) & 0xffffffff == checksum, f"PNG CRC mismatch: {path.name}")
        chunks.append(kind)
        if kind == b"IHDR":
            require(length == 13, "Invalid IHDR")
            size = list(struct.unpack_from(">II", payload))
        if kind == b"iCCP":
            require(profile is None, "Duplicate ICC profile")
            _, compressed = payload.split(b"\0", 1)
            require(compressed[:1] == b"\0", "Unsupported ICC compression")
            profile = zlib.decompress(compressed[1:])
        offset = end
        if kind == b"IEND":
            break
    require(offset == len(data) and chunks[0] == b"IHDR" and chunks[-1] == b"IEND", "Invalid PNG structure")
    require(chunks.count(b"IHDR") == 1 and b"IDAT" in chunks, "Missing/duplicate PNG image header or data")
    require(profile is not None and len(profile) >= 132, f"Missing ICC profile: {path.name}")
    require(profile[36:40] == b"acsp" and profile[16:24] == b"RGB XYZ ", "Expected RGB ICC with XYZ PCS")
    count = struct.unpack_from(">I", profile, 128)[0]
    require(132 + count * 12 <= len(profile), "Truncated ICC tag table")
    tags = {}
    for i in range(count):
        name, start, length = struct.unpack_from(">4sII", profile, 132 + i * 12)
        require(start + length <= len(profile), "Truncated ICC tag")
        tags[name] = profile[start:start + length]
    # Display P3 colorants after adaptation to the ICC D50 connection space.
    expected = {b"rXYZ": (.5151, .2412, -.0011), b"gXYZ": (.2920, .6922, .0419), b"bXYZ": (.1572, .0666, .7844)}
    for name, values in expected.items():
        tag = tags.get(name, b"")
        require(len(tag) >= 20 and tag[:4] == b"XYZ ", f"Missing ICC colorant {name!r}")
        actual = [n / 65536 for n in struct.unpack_from(">iii", tag, 8)]
        require(all(abs(a - b) < .003 for a, b in zip(actual, values)), f"ICC is not Display P3: {path.name}")
    return size


class Figure(HTMLParser):
    def __init__(self, text):
        super().__init__(convert_charrefs=True)
        self.nodes, self.stack, self.caption = [], [], []
        self.feed(text)
        self.close()
        require(not self.stack, "Unclosed figure markup")

    def handle_starttag(self, tag, attributes):
        require(tag in {"figure", "div", "picture", "source", "img", "figcaption"}, f"Unexpected/interactive figure element: {tag}")
        parent = self.stack[-1] if self.stack else None
        parents = {"figure": {None}, "div": {"figure", "div"}, "picture": {"div"}, "source": {"picture"}, "img": {"picture"}, "figcaption": {"figure"}}
        require(parent in parents[tag], f"Wrong figure ancestry: {tag} inside {parent}")
        if tag == "picture":
            require(self.stack == ["figure", "div", "div"], "Picture must be inside stage and frame")
        if tag == "source":
            require(not any(name == "img" for name, _ in self.nodes), "Mobile source must precede img")
        if tag == "img":
            require(any(name == "source" for name, _ in self.nodes), "Missing mobile source before img")
        attrs = dict(attributes)
        require(len(attrs) == len(attributes), "Duplicate HTML attribute")
        require(not any(k in {"href", "target", "srcdoc"} or k.startswith("on") for k in attrs), "Interactive figure attribute")
        self.nodes.append((tag, attrs))
        if tag not in {"img", "source"}:
            self.stack.append(tag)

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)
        if tag not in {"img", "source"}:
            self.handle_endtag(tag)

    def handle_endtag(self, tag):
        require(bool(self.stack) and self.stack.pop() == tag, f"Mismatched closing tag: {tag}")

    def handle_data(self, text):
        if "figcaption" in self.stack:
            self.caption.append(text)
        else:
            require(not text.strip(), "Unexpected text outside figure caption")

    def one(self, tag):
        matches = [attrs for name, attrs in self.nodes if name == tag]
        require(len(matches) == 1, f"Expected exactly one {tag}")
        return matches[0]


def sha_text(text):
    return hashlib.sha256(text.encode()).hexdigest()


def record_key(record):
    return record["id"], record["locale"], record["layout"]


def expected_variants(ids):
    return {(fid, locale, layout) for fid in ids for locale in ("es", "en") for layout in ("desktop", "mobile")}


def check_figure(markup, fid, locale, spec, records):
    """Validate only the static source markup; rendered sizing is a browser check."""
    copy = spec["locales"][locale]
    dom = Figure(markup)
    allowed = {
        "figure": {"class", "data-inbox-figure", "aria-label"},
        "picture": set(),
        "source": {"media", "srcset", "width", "height"},
        "img": {"class", "src", "srcset", "width", "height", "style", "loading", "decoding", "alt"},
        "figcaption": {"class"},
    }
    for tag, attrs in dom.nodes:
        if tag != "div":
            require(set(attrs) == allowed[tag], f"Unexpected/missing static attributes: {tag}")
    figure = dom.one("figure")
    require(figure["data-inbox-figure"] == fid and figure["aria-label"] == copy["label"], "Figure identity/label mismatch")
    require(set(figure["class"].split()) == {"ht-editorial-visual", "ht-editorial-visual--screenshot"}, "Wrong figure classes")
    dom.one("picture")
    require(dom.one("figcaption")["class"] == "ht-editorial-visual__caption", "Missing accessible hidden-caption class")
    require("".join(dom.caption) == copy["caption"], f"Caption mismatch: {fid}/{locale}")
    divs = [attrs for tag, attrs in dom.nodes if tag == "div"]
    require([attrs.get("class") for attrs in divs] == ["ht-editorial-visual__stage", "ht-editorial-visual__image-frame"], "Wrong stage/frame structure")
    require(set(divs[0]) == {"class"} and set(divs[1]) == {"class", "style"}, "Unexpected stage/frame attributes")
    width = max(logical_size(records[fid, locale, layout])[0] for layout in ("desktop", "mobile"))
    require(style(divs[1]) == {"max-width": f"{width + 18:g}px", "width": "fit-content", "margin": "0 auto"}, "Wrong frame native-size contract")
    img = dom.one("img")
    require(img["class"] == "ht-editorial-visual__image" and style(img) == {"width": "auto", "margin": "0 auto"}, "Wrong image class/size contract")
    require(img["loading"] == "lazy" and img["decoding"] == "async", "Wrong image loading contract")
    for layout, tag in (("desktop", "img"), ("mobile", "source")):
        record, attrs = records[fid, locale, layout], dom.one(tag)
        url = "/" + record["asset"]
        require(attrs["srcset"] == url + " 4x", f"Responsive source mismatch: {fid}/{locale}/{layout}")
        require([int(attrs["width"]), int(attrs["height"])] == record["pixelSize"], "HTML source dimensions mismatch")
        if tag == "img":
            require(attrs["src"] == url and attrs["alt"] == copy["alt"], "Desktop URL/alt mismatch")
        else:
            require(attrs["media"] == "(max-width: 600px)", "Wrong mobile breakpoint")


def verify(sources_only=False):
    previous = inside(ROOT, OLD_CAP_NAME)
    require(CAP.resolve() == inside(ROOT, NEW_CAP_NAME), "Capture directory must be this Help worktree's continuation directory")
    plan, manifest, prep, integrated = (load(name) for name in ("figure-plan.json", "manifest.json", "preparation-record.json", "integration-record.json"))
    historical = lambda name: json.loads((previous / name).read_text())
    baseline, correction, prior = (historical(name) for name in ("preservation-baseline.json", "manual-reopen-correction.json", "integration-record.json"))
    old_manifest, old_plan = historical("manifest.json"), historical("figure-plan.json")
    bindings = {
        "manifest_sha256": CAP / "manifest.json",
        "plan_sha256": CAP / "figure-plan.json",
        "preparation_record_sha256": CAP / "preparation-record.json",
        "original_baseline_sha256": previous / "preservation-baseline.json",
        "manual_correction_sha256": previous / "manual-reopen-correction.json",
        "prior_integration_sha256": previous / "integration-record.json",
    }
    for key, path in bindings.items():
        require(integrated[key] == sha(path), f"Stale combined binding: {key}")
    for key, name in {
        "manifest_sha256": "manifest.json", "plan_sha256": "figure-plan.json",
        "original_baseline_sha256": "preservation-baseline.json",
        "manual_correction_sha256": "manual-reopen-correction.json",
        "capture_boundary_sha256": "capture-boundary.json",
    }.items():
        require(prior[key] == sha(previous / name), f"Historical first-phase evidence changed: {key}")
    require(integrated.get("publication") is False and manifest.get("publication") is False, "Local-only publication boundary absent")
    require(prep.get("publication") is False and prep.get("help_written") is False and prep.get("assets_copied") is False, "Invalid frozen pre-integration boundary")
    selected = prep["selected_ids"]
    require(isinstance(selected, list) and len(selected) == len(set(selected)), "Duplicate selected figure")
    require("assignment-menu" in selected and set(selected) <= set(ARTICLE), "Wrong selected concept scope")
    require(prep["new_ids"] == [fid for fid in selected if fid != "assignment-menu"], "Wrong new figure set")
    require(set(prep.get("deferred", {})) == set(ARTICLE) - set(selected), "Incomplete deferred concept accounting")
    figures = indexed(plan["figures"], lambda item: item["id"], "figure ID")
    require(list(figures) == selected, "Plan order differs from the frozen preparation")
    require(all(item["article_key"] == ARTICLE[fid] and set(item["locales"]) == {"es", "en"} for fid, item in figures.items()), "Wrong article/locale mapping")
    require(plan["desktop_viewport"] == [1600, 1000], "Wrong landscape desktop contract")
    require(old_plan["figures"] == [figures["assignment-menu"]], "Historical assignment-menu copy changed")
    require(old_plan["asset_directory"] == OLD_DIR, "Wrong historical source directory")
    records = indexed(manifest["records"], record_key, "source tuple")
    prepared = indexed(prep["sources"], record_key, "prepared source tuple")
    expected = expected_variants(selected)
    require(set(records) == set(prepared) == expected and 4 <= len(records) <= 24, "Incomplete/extra combined source set")
    old_records = indexed(old_manifest["records"], record_key, "historical source tuple")
    require(set(old_records) == expected_variants(["assignment-menu"]), "Wrong historical source set")
    assets = indexed(integrated["assets"], lambda item: item["path"], "combined asset")
    old_assets = indexed(prior["assets"], lambda item: item["path"], "historical asset")
    paths = set()
    for key, record in records.items():
        fid, locale, layout = key
        filename = "-".join(key) + ".png"
        directory = OLD_DIR if fid == "assignment-menu" else NEW_DIR
        name = directory + "/" + filename
        require(record["file"] == filename and record["asset"] == name, "Noncanonical combined asset path")
        require(name not in paths, "Source path reused by different tuples")
        paths.add(name)
        source = inside(ROOT, name)
        require(sha(source) == record["sha256"] and png(source) == record["pixelSize"], f"Source bytes/PNG metadata mismatch: {name}")
        logical = logical_size(record)
        require(record["nativeDensity"] == 4 and record["pixelSize"] == [value * 4 for value in logical], f"Incorrect declared native density: {name}")
        clip = record["clip"]
        origin = [clip["x"], clip["y"]] if isinstance(clip, dict) else clip[:2]
        require(origin == [0, 0], f"Expected native full-viewport origin: {name}")
        require(record["viewport"] == logical, f"Expected uncropped native viewport: {name}")
        require(logical == ([1600, 1000] if layout == "desktop" else [390, 1000]), f"Wrong source layout: {name}")
        require("p3" in record["icc"].lower().replace(" ", ""), "Wrong ICC declaration")
        require(all(prepared[key][field] == record[field] for field in ("id", "locale", "layout", "file", "asset", "sha256", "pixelSize")), f"Frozen source binding mismatch: {name}")
        item = assets[name]
        require(all(item[field] == record[field] for field in ("id", "locale", "layout", "sha256", "pixelSize", "nativeDensity")), f"Integrated asset record mismatch: {name}")
        if fid == "assignment-menu":
            require(all(old_records[key][field] == record[field] for field in ("file", "sha256", "pixelSize", "nativeDensity", "icc", "clip", "viewport")), "Historical assignment source metadata changed")
            require(old_assets[name]["sha256"] == record["sha256"], "Historical assignment source changed")
        if not sources_only:
            for prefix in ("_site", "_site/es"):
                require(sha(inside(ROOT, prefix + "/" + name)) == record["sha256"], f"Built PNG differs: {prefix}/{name}")
    require(set(assets) == paths, "Extra asset in integration record")
    for directory in (OLD_DIR, NEW_DIR):
        folder = inside(ROOT, directory)
        actual = {str(path.relative_to(ROOT)) for path in folder.rglob("*") if path.is_file()}
        require(actual == {name for name in paths if name.startswith(directory + "/")}, f"Unexpected asset file: {directory}")
    result_ids = set(selected) & RESULTS
    proofs, prepared_proofs = manifest.get("postcondition_proofs", {}), prep.get("postcondition_proofs", {})
    require(set(proofs) == set(prepared_proofs) == result_ids, "Missing/extra result proof binding")
    for fid in result_ids:
        proof, original_proof = proofs[fid], prepared_proofs[fid]
        require(proof["status"] == original_proof["status"] == "passed", f"Result proof not accepted: {fid}")
        require(proof["evidence_sha256"] == original_proof["evidence_sha256"], f"Result proof changed since preparation: {fid}")
        proof_path = inside(CAP, proof["evidence_file"])
        require(sha(proof_path) == proof["evidence_sha256"], f"Result proof file hash mismatch: {fid}")
        json.loads(proof_path.read_text())  # Hash validation is not semantic/postcondition review.
    keys = set(ARTICLE.values())
    bodies = {f"_i18n/{locale}/{key}" for key in keys for locale in ("es", "en")}
    stubs = {"_" + key for key in keys}
    saved = indexed(baseline["records"], lambda item: item["path"], "preserved original")
    current_articles = indexed(integrated["articles"], lambda item: item["path"], "integrated article")
    prepared_articles = indexed(prep["articles"], lambda item: item["path"], "prepared article")
    old_articles = indexed(prior["articles"], lambda item: item["path"], "historical article")
    require(set(saved) == bodies | stubs and set(current_articles) == set(prepared_articles) == set(old_articles) == bodies, "Wrong article/original set")
    require(set(correction["corrections"]) == {"es", "en"}, "Wrong correction locale set")
    for name, preserved in saved.items():
        original_path = inside(previous, preserved["original"])
        require(sha(original_path) == preserved["sha256"], f"Original changed: {name}")
        original, current = text_bytes(original_path), text_bytes(inside(ROOT, name))
        if name in stubs:
            require(current == original, f"Stub changed: {name}")
            continue
        _, locale, *parts = name.split("/")
        article_key = "/".join(parts)
        approved = original
        if article_key == "team/conversation-lifecycle.md":
            edit = correction["corrections"][locale]
            require(edit["article"] == name and original.count(edit["original_paragraph"]) == 1, "Correction target mismatch")
            approved = original.replace(edit["original_paragraph"], edit["replacement_paragraph"], 1)
            require(sha_text(approved) == edit["article_sha256_after_correction"], "Approved correction changed")
        require(BLOCK.sub("", current) == approved, f"Unapproved prose or block formatting: {name}")
        headings = lambda text: re.findall(r"^#{1,6} .+$", text, re.M)
        require(headings(current) == headings(original) and len(headings(current)) == preserved["heading_count"], f"Headings changed: {name}")
        require(re.findall(r"{% link .*? %}", current) == preserved["ordered_links"], f"Links changed: {name}")
        expected_ids = [fid for fid, figure in figures.items() if figure["article_key"] == article_key]
        require(all(approved.count(figures[fid]["locales"][locale]["anchor"]) == 1 for fid in expected_ids), f"Insertion anchor is missing or ambiguous: {name}")
        expected_ids.sort(key=lambda fid: approved.index(figures[fid]["locales"][locale]["anchor"]))
        blocks = list(BLOCK.finditer(current))
        require([match[1] for match in blocks] == expected_ids and len(re.findall(r"<figure\b", current)) == len(expected_ids), f"Wrong figure order/count: {name}")
        restored_first_phase = BLOCK.sub(lambda match: match[0] if match[1] == "assignment-menu" else "", current)
        require(sha_text(restored_first_phase) == old_articles[name]["sha256"], f"Historical assignment block/prose changed: {name}")
        for match in blocks:
            fid, markup = match[1], match[2]
            copy = figures[fid]["locales"][locale]
            require(approved.count(copy["anchor"]) == 1 and current[:match.start()].endswith(copy["anchor"]), f"Wrong insertion anchor: {fid}/{locale}")
            check_figure(markup, fid, locale, figures[fid], records)
        item, prepared_item = current_articles[name], prepared_articles[name]
        require(item["sha256"] == sha_text(current) == prepared_item["proposed_sha256"] and item["figures"] == expected_ids, f"Stale integrated article: {name}")
        require(prepared_item["current_help_sha256"] == old_articles[name]["sha256"], f"Frozen article used another baseline: {name}")
    ledger = "docs/editorial-work/progress.csv"
    old_csv = subprocess.check_output(["git", "show", f"{baseline['help_revision']}:{ledger}"], cwd=ROOT)
    require(hashlib.sha256(old_csv).hexdigest() == baseline["ledger_sha256"], "Ledger baseline hash mismatch")
    old_rows = indexed(list(csv.DictReader(io.StringIO(old_csv.decode()))), lambda row: row["article_key"], "baseline ledger row")
    with inside(ROOT, ledger).open() as stream:
        rows = indexed(list(csv.DictReader(stream)), lambda row: row["article_key"], "ledger row")
    require(set(rows) == set(old_rows) and len(rows) == 154, "Ledger article set changed")
    for key, row in rows.items():
        if key in keys:
            expected_row = dict(old_rows[key], editorial_status="in_progress", local_verified_commit="", work_record="docs/editorial-work/" + Path(key).name)
            require(row == expected_row, f"Incorrect partial ledger row: {key}")
        else:
            require(row == old_rows[key], f"Unrelated ledger row changed: {key}")
    unresolved = sum(row["editorial_status"] not in {"local_verified", "out_of_scope"} for row in rows.values())
    require(unresolved == baseline["unresolved_pairs_before"] == integrated["unresolved_pairs"] == 45, "Unresolved total changed")
    if not sources_only:
        for prefix in ("_site", "_site/es"):
            require(not (ROOT / prefix / "docs").exists() and not (ROOT / prefix / "AGENTS.md").exists(), "Private authoring files leaked into build")
    return {
        "status": "combined_saved_integration_verified",
        "mode": "sources_only" if sources_only else "sources_and_built_assets",
        "preserved_originals": 6, "articles": 4, "figure_concepts": selected,
        "figures": len(figures) * 2, "source_pngs": len(records),
        "historical_pngs_unchanged": 4, "new_pngs": len(records) - 4,
        "built_png_copies": 0 if sources_only else len(records) * 2,
        "result_proof_hash_bindings": len(result_ids), "unresolved_pairs": unresolved,
        "pixel_or_page_review_performed": False, "result_postconditions_reviewed": False,
        "build_executed": False, "publication_performed": False,
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, help="Help worktree root; inferred only when installed in its continuation capture directory")
    parser.add_argument("--capture-dir", type=Path, help="Continuation capture directory; defaults to this script's directory")
    parser.add_argument("--sources-only", action="store_true", help="Skip existing _site asset copies and docs-exclusion checks")
    args = parser.parse_args()
    try:
        CAP = (args.capture_dir or CAP).resolve()
        if args.root is None:
            require(CAP.parts[-4:] == tuple(Path(NEW_CAP_NAME).parts), "Audit helper requires --root and --capture-dir")
            ROOT = CAP.parents[3]
        else:
            ROOT = args.root.resolve()
        print(json.dumps(verify(args.sources_only), indent=2))
    except (ValueError, KeyError, OSError, TypeError, IndexError, struct.error, zlib.error, subprocess.CalledProcessError) as error:
        print(json.dumps({"status": "failed", "error": str(error)}), file=sys.stderr)
        sys.exit(1)
