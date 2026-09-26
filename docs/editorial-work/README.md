# Editorial work register

The shared workflow is in `../editorial/workflow.md`. This directory contains Help-specific evidence and pending work. Jekyll excludes it from the public site.

- `inventory.csv`: 153 paired article bodies plus the separate `_developers/api.md` redirect stub, their public routes and observed HTTP status on 2026-09-25, and original source hashes for translated bodies. The redirect points to the external API reference and has no translated body.
- `progress.csv`: one row per inventory key tracking local editorial work independently of public publication. The 152 unreviewed article pairs start as `pending`; the Segments pilot is `local_verified` at commit `0623597`; the redirect stub is `out_of_scope`.
- `originals/segments/`: byte-for-byte snapshots of the Spanish and English segments body and shared guide stub before the pilot.
- `segments-pilot.md`: article plan, source and UI checks, capture and preview status, and publication distinction.

The inventory's `published_original` state describes the pages currently live; it does not imply local editorial changes have been deployed. All 308 guide routes, including the external-reference redirect stub in two locales, responded with HTTP 200 during the inventory audit. HTTP response alone does not prove a local edit has reached production.

Update `progress.csv` after each article batch. Use `in_progress` while preparing it, `blocked` when a specific check or input prevents completion, and `local_verified` only after the article, build, and browser checks pass. Record the verifying commit and article-specific work record. Keep `inventory.csv` publication values tied to actual public state; a local commit does not change them.
