#!/usr/bin/env python3
"""Integrate a frozen, individually reviewed Customize source matrix locally."""
import argparse
import hashlib
import html
import json
import re
import shutil
import struct
import subprocess
import zlib
from datetime import datetime, timezone
from pathlib import Path

if not __debug__:
    raise RuntimeError("Validation requires normal Python, without -O.")

CAP = Path(__file__).resolve().parent
HELP = CAP.parents[3]
LOCALES = ("es", "en")
LAYOUTS = ("desktop", "mobile")
FIGURE = re.compile(r"<figure\b.*?</figure>", re.S)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def digest(text):
    return hashlib.sha256(text.encode()).hexdigest()


def read(path):
    return json.loads(path.read_text())


def write(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")


def bound(binding, directory=CAP):
    path = (directory / binding["file"]).resolve()
    assert path.is_file() and sha(path) == binding["sha256"], binding
    return path


def preserve(path, data):
    if path.exists():
        assert path.read_bytes() == data, f"Existing evidence differs: {path}"
    else:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)


def clip_size(clip):
    if isinstance(clip, dict):
        assert set(clip) == {"x", "y", "width", "height"}
        values = [clip[k] for k in ("x", "y", "width", "height")]
    else:
        assert isinstance(clip, list) and len(clip) == 4
        values = clip
    assert all(type(v) in (int, float) for v in values)
    assert min(values[:2]) >= 0 and min(values[2:]) > 0
    return values[2:]


def check_png(path, record):
    data = path.read_bytes()
    assert sha(path) == record["sha256"] and data[:8] == b"\x89PNG\r\n\x1a\n"
    dimensions = list(struct.unpack(">II", data[16:24]))
    assert dimensions == record["pixelSize"]
    assert record["nativeDensity"] == 4 and record["icc"] == "Display P3"
    assert dimensions == [round(v * 4) for v in clip_size(record["clip"])]
    offset, profile, kinds = 8, None, []
    while offset < len(data):
        length = struct.unpack(">I", data[offset:offset + 4])[0]
        assert offset + length + 12 <= len(data)
        kind = data[offset + 4:offset + 8]
        body = data[offset + 8:offset + 8 + length]
        crc = struct.unpack(">I", data[offset + 8 + length:offset + 12 + length])[0]
        assert zlib.crc32(kind + body) & 0xffffffff == crc
        assert kind not in (b"tEXt", b"zTXt", b"iTXt", b"eXIf")
        if kind == b"iCCP":
            _, compressed = body.split(b"\0", 1)
            assert compressed[0] == 0 and profile is None
            profile = zlib.decompress(compressed[1:])
        kinds.append(kind)
        offset += length + 12
    assert offset == len(data) and kinds[-1] == b"IEND" and profile
    actual_profile = subprocess.check_output(["/usr/bin/sips", "-g", "profile", str(path)], text=True)
    assert "profile: Display P3 Gamut with sRGB Transfer" in actual_profile
    profile_hash = hashlib.sha256(profile).hexdigest()
    assert profile_hash == "6e72ac49fd45d1275f29daca1038a0b9af5befd0e891af9267f47ab066a5dffb"
    return {"profile": "Display P3", "sha256": profile_hash, "bytes": len(profile)}


def verify_structure(original, result):
    assert re.findall(r"^#{1,6} .+$", original, re.M) == re.findall(r"^#{1,6} .+$", result, re.M)
    assert re.findall(r"{% link .*? %}", original) == re.findall(r"{% link .*? %}", result)
    assert len(re.findall(r"^## ", result, re.M)) == 16
    assert len(re.findall(r"{% link .*? %}", result)) == 29


def load_preparation(inputs):
    for field, name in (("preserved_inputs_sha256", "preserved-inputs.json"),
                        ("retained_source_register_sha256", "retained-source-register.json"),
                        ("retained_figure_plan_sha256", "retained-figure-plan.json")):
        assert sha(CAP / name) == inputs[field]
    baseline = read(CAP / "preserved-inputs.json")
    retained = read(CAP / "retained-source-register.json")
    legacy_plan = read(CAP / "retained-figure-plan.json")
    assert baseline["base"] == retained["base"] == inputs["base"]
    assert len(retained["assets"]) == 40 and sum(r["selected"] for r in retained["assets"]) == 38
    for source in retained["assets"]:
        assert sha(HELP / source["path"]) == source["sha256"]
    for info in (baseline["stub"], baseline["inventory"], baseline["shared_work_record"]):
        assert sha(HELP / info["path"]) == info["sha256"], info["path"]
    for path, expected in baseline["rules"].items():
        assert sha(HELP / path) == expected
    assert inputs["markup_attribute"] == "data-customize-figure"
    assert inputs["target_asset_directory"] == "images/editorial/customize-safely-completion-20261011"
    copy_path = bound(inputs["proposed_copy_plan"])
    copy = read(copy_path)
    originals, proposed = {}, {}
    for locale in LOCALES:
        info = baseline["articles"][locale]
        original_path = CAP / info["original"]
        assert sha(original_path) == info["sha256"] == inputs["articles"][locale]["sha256"]
        assert info["path"] == inputs["articles"][locale]["path"]
        originals[locale] = original_path.read_text()
        proposed[locale] = originals[locale]
        for correction in copy["corrections"]:
            if correction["locale"] == locale:
                assert proposed[locale].count(correction["before"]) == 1
                proposed[locale] = proposed[locale].replace(correction["before"], correction["after"])
        verify_structure(originals[locale], proposed[locale])
    return baseline, retained, legacy_plan, copy, originals, proposed


def legacy_block(block, record, assets):
    assert digest(block) == record["original_block_sha256"]
    assert "data-customize-figure=" not in block
    block = block.replace("<figure ", f'<figure data-customize-figure="{record["id"]}" ', 1)
    if record["id"] != "discount-percent":
        return block
    source_path = record["planned_sources"]["desktop"]
    assert source_path == record["planned_sources"]["mobile"]
    source = assets[source_path]
    assert source["actual_capture_layout"] == "desktop_detail" and source["native_density"] == 2
    cap = source["maximum_image_width_css"]
    assert cap == (245 if record["locale"] == "es" else 330)
    block = re.sub(r"max-width: \d+px", f"max-width: {cap + 18}px", block, count=1)
    def tag(match):
        value = re.sub(r'\bsrc="[^"]+"', f'src="/{source_path}"', match[0])
        value = re.sub(r'\bsrcset="[^"]+"', f'srcset="/{source_path} 2x"', value)
        value = re.sub(r'\bwidth="\d+"', f'width="{source["pixel_size"][0]}"', value)
        return re.sub(r'\bheight="\d+"', f'height="{source["pixel_size"][1]}"', value)
    return re.sub(r"<(?:source|img)\b[^>]+>", tag, block)


def figure(plan, locale, sources, directory):
    ident = plan["id"]
    desktop, mobile = (sources[(ident, locale, layout)] for layout in LAYOUTS)
    copy = plan[locale]
    for key in ("alt", "caption"):
        assert isinstance(copy[key], str) and copy[key].strip()
    cap = clip_size(desktop["clip"])[0] + 18
    dp, mp = ("/" + directory + "/" + r["file"] for r in (desktop, mobile))
    dw, dh = desktop["pixelSize"]
    mw, mh = mobile["pixelSize"]
    e = lambda text: html.escape(text, quote=True)
    return f'''<!-- customize:{ident}:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-customize-figure="{ident}" aria-label="{e(copy['alt'])}">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: {cap:g}px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="{mp} 4x" width="{mw}" height="{mh}" />
        <img class="ht-editorial-visual__image" src="{dp}" srcset="{dp} 4x" width="{dw}" height="{dh}" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="{e(copy['alt'])}" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">{e(copy['caption'])}</figcaption>
</figure>
<!-- customize:{ident}:end -->'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true", help="Validate preparation only; never admit pending sources.")
    parser.add_argument("--raw-dir", type=Path)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--acceptance", type=Path)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    inputs = read(CAP / "integration-inputs.json")
    baseline, retained, legacy_plan, copy, originals, proposed = load_preparation(inputs)
    if args.plan:
        assert not args.apply
        for locale, info in inputs["articles"].items():
            assert sha(HELP / info["path"]) == info["sha256"]
        plan = read(bound(inputs["proposed_figure_plan"]))
        for entry in plan["new_concepts"]:
            for locale in LOCALES:
                assert proposed[locale].count(entry["insert_after_exact_paragraph"][locale]) == 1
        print(json.dumps({"status": "preparation_validated_no_changes", "retained": 40,
                          "retained_selected": 38, "new_sources_admitted": 0,
                          "provisional_concepts": len(plan["new_concepts"]),
                          "final_matrix": "pending", "articles_changed": 0}))
        return
    assert inputs["status"] == "ready_for_source_admission", "Exact source/copy plan is still pending."
    assert inputs["integrator_sha256"] == sha(Path(__file__))
    assert args.raw_dir and args.manifest and args.acceptance, "Real manifest and root admission are required."
    figure_plan = read(bound(inputs["new_figure_plan"]))
    assert figure_plan["status"] == "ready_for_source_admission"
    figures = figure_plan["figures"]
    ids = [r["id"] for r in figures]
    assert ids and len(ids) == len(set(ids))
    assert all(re.fullmatch(r"[a-z][a-z0-9-]*", ident) for ident in ids)
    assert not set(ids) & set(legacy_plan["ids_in_article_order"])
    matrix = {(ident, locale, layout) for ident in ids for locale in LOCALES for layout in LAYOUTS}
    declared = inputs["exact_new_source_matrix"]
    assert len(declared) == len(matrix) and {(r["id"], r["locale"], r["layout"]) for r in declared} == matrix
    assert inputs["approved_copy_replacements"] == [{"id": r["id"], "locale": r["locale"]} for r in copy["corrections"]]
    manifest, admission = read(args.manifest), read(args.acceptance)
    assert admission["status"] == "passed"
    assert admission["manifest_sha256"] == sha(args.manifest)
    assert admission["integration_inputs_sha256"] == sha(CAP / "integration-inputs.json")
    if (CAP / "source-admission.json").exists():
        assert sha(CAP / "source-admission.json") == sha(args.acceptance), "Existing source admission differs."
    records = manifest["records"]
    sources = {(r["id"], r["locale"], r["layout"]): r for r in records}
    assert len(records) == len(sources) == len(matrix) and set(sources) == matrix
    assert len({r["file"] for r in records}) == len(records)
    approved = admission["records"]
    assert len(approved) == len(records) and all(r["status"] == "passed" for r in approved)
    assert {(r["file"], r["sha256"]) for r in approved} == {(r["file"], r["sha256"]) for r in records}
    evidence_paths, evidence_bindings = {}, {}
    assert set(admission["pixel_reviews"]) == set(LOCALES)
    reserved = {"source-register.json", "integration-record.json", "accepted-source-manifest.json",
                "integration-inputs.json", "source-admission.json", "preserved-inputs.json",
                "retained-source-register.json", "retained-figure-plan.json", "new-figure-plan.json",
                "proposed-copy-plan.json", "proposed-figure-plan.json"}
    for locale, binding in admission["pixel_reviews"].items():
        path = bound(binding, args.acceptance.parent)
        assert path.name not in reserved
        if (CAP / path.name).exists():
            assert sha(CAP / path.name) == sha(path), "Existing pixel review differs."
        review = read(path)
        assert review["status"] == "passed" and review["locale"] == locale
        entries = review["records"]
        assert all(r["status"] == "passed" and r["locale"] == locale for r in entries)
        fields = ("id", "locale", "layout", "file", "sha256")
        expected = {tuple(r[k] for k in fields) for r in records if r["locale"] == locale}
        assert len(entries) == len(expected) and {tuple(r[k] for k in fields) for r in entries} == expected
        evidence_paths[locale] = path
        evidence_bindings[locale] = {"file": path.name, "sha256": sha(path)}
    assert len({p.name for p in evidence_paths.values()}) == 2
    for name in ("capture_closure", "runtime_closure", "source_currency"):
        path = bound(admission[name], args.acceptance.parent)
        assert admission[name]["status"] == "passed"
        assert (CAP / path.name).is_file() and sha(CAP / path.name) == sha(path), "Root must curate closure evidence into CAP first."
    done = CAP / "integration-record.json"
    if done.exists():
        prior = read(done)
        assert prior["integration_inputs_sha256"] == sha(CAP / "integration-inputs.json")
        assert prior["raw_manifest_sha256"] == sha(args.manifest) and prior["acceptance_sha256"] == sha(args.acceptance)
        for row in prior["articles"]:
            assert sha(HELP / row["path"]) == row["after_sha256"]
        assert sha(CAP / "source-register.json") == prior["source_register_sha256"]
        assert sha(CAP / "accepted-source-manifest.json") == prior["accepted_source_manifest_sha256"]
        for row in read(CAP / "source-register.json")["assets"]:
            assert sha(HELP / row["path"]) == row["sha256"]
        for binding in prior["source_pixel_reviews"].values():
            bound(binding)
        print(json.dumps({"status": "already_integrated_byte_exact_no_changes"}))
        return
    register = []
    for original in retained["assets"]:
        row = dict(original)
        row["selected_scope"] = "accepted integration; rendered Help QA pending" if row["selected"] else "historical reference only"
        register.append(row)
    compact = []
    directory = inputs["target_asset_directory"]
    for row in records:
        assert row["file"] == f"{row['id']}-{row['locale']}-{row['layout']}.png"
        metadata = check_png(args.raw_dir / row["file"], row)
        target = directory + "/" + row["file"]
        if (HELP / target).exists():
            assert sha(HELP / target) == row["sha256"]
        register.append({"path": target, "sha256": row["sha256"], "pixel_size": row["pixelSize"],
                         "native_density": row["nativeDensity"], "icc": metadata,
                         "native_logical_size_css": clip_size(row["clip"]), "id": row["id"],
                         "locale": row["locale"], "layout": row["layout"], "actual_capture_layout": row["layout"],
                         "selected": True, "help_viewports": [row["layout"]],
                         "maximum_image_width_css": clip_size(row["clip"])[0],
                         "pixel_review": "pass", "transformations": [],
                         "pixel_review_record": evidence_bindings[row["locale"]], "preserved": True})
        compact.append({k: row[k] for k in ("id", "locale", "layout", "file", "sha256", "pixelSize", "nativeDensity", "icc", "clip")})
    result = {}
    for locale in LOCALES:
        assert sha(HELP / inputs["articles"][locale]["path"]) == inputs["articles"][locale]["sha256"]
        after = proposed[locale]
        legacy = [r for r in legacy_plan["figures"] if r["locale"] == locale]
        assert len(legacy) == 10
        blocks = FIGURE.findall(after)
        assert len(blocks) == len(legacy)
        for block, plan in zip(blocks, legacy):
            assert after.count(block) == 1
            after = after.replace(block, legacy_block(block, plan, {r["path"]: r for r in retained["assets"]}))
        anchors = [entry[locale]["anchor"] for entry in figures]
        assert len(set(anchors)) == len(anchors), "Use a reviewed grouped insertion if concepts share an anchor."
        for entry in figures:
            content = entry[locale]
            anchor = content["anchor"]
            assert after.count(anchor) == 1
            lead = content.get("lead")
            assert lead is None or isinstance(lead, str)
            inserted = (lead + "\n\n" if lead else "") + figure(entry, locale, sources, directory)
            after = after.replace(anchor, anchor + "\n\n" + inserted)
        verify_structure(originals[locale], after)
        assert len(FIGURE.findall(after)) == 10 + len(figures)
        assert len(re.findall(r'data-customize-figure="([^"]+)"', after)) == 10 + len(figures)
        result[locale] = after
    total, selected = len(register), sum(r["selected"] for r in register)
    assert total == 40 + len(records) and selected == 38 + len(records)
    summary = {"sources": total, "selected": selected, "new_sources": len(records),
               "figures_per_locale": 10 + len(figures), "build_and_page_QA": "pending"}
    if not args.apply:
        print(json.dumps({"status": "accepted_batch_validated_no_changes", **summary}))
        return
    for binding in evidence_bindings.values():
        target = CAP / binding["file"]
        if target.exists():
            assert sha(target) == binding["sha256"]
    for row in records:
        preserve(HELP / directory / row["file"], (args.raw_dir / row["file"]).read_bytes())
    for locale, path in evidence_paths.items():
        preserve(CAP / path.name, path.read_bytes())
    preserve(CAP / "source-admission.json", args.acceptance.read_bytes())
    for locale, after in result.items():
        (HELP / inputs["articles"][locale]["path"]).write_text(after)
    write(CAP / "accepted-source-manifest.json", {"status": "accepted_raw_sources_pending_rendered_help_qa",
         "raw_manifest_sha256": sha(args.manifest), "source_admission_sha256": sha(args.acceptance),
         "source_pixel_reviews": evidence_bindings, "records": compact})
    write(CAP / "source-register.json", {"status": "integrated_sources_pending_rendered_help_qa", "assets": register})
    write(done, {"status": "integrated_locally_pending_build_and_page_qa", "at": datetime.now(timezone.utc).isoformat(),
         "base": inputs["base"], "raw_manifest_sha256": sha(args.manifest), "acceptance_sha256": sha(args.acceptance),
         "integration_inputs_sha256": sha(CAP / "integration-inputs.json"),
         "source_register_sha256": sha(CAP / "source-register.json"),
         "accepted_source_manifest_sha256": sha(CAP / "accepted-source-manifest.json"),
         "source_pixel_reviews": evidence_bindings, "articles": [
             {"path": inputs["articles"][locale]["path"], "before_sha256": inputs["articles"][locale]["sha256"],
              "after_sha256": sha(HELP / inputs["articles"][locale]["path"]), "figures": 10 + len(figures)} for locale in LOCALES],
         **summary, "inventory_changed": False, "publication": False})
    print(json.dumps({"status": "integrated_locally", **summary}))


if __name__ == "__main__":
    main()
