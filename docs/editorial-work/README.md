# Editorial work register

The shared workflow is in `../editorial/workflow.md`. This directory contains Help-specific evidence and pending work. Jekyll excludes it from the public site.

- `inventory.csv`: 153 paired article bodies plus the separate `_developers/api.md` redirect stub, their public routes and observed HTTP status on 2026-09-25, and original source hashes for translated bodies. The redirect points to the external API reference and has no translated body.
- `progress.csv`: one row per inventory key tracking local editorial work independently of public publication. Initially, 152 article pairs were `pending`, the Segments pilot was `local_verified` at commit `0623597`, and the redirect stub was `out_of_scope`.
- `originals/<article>/`: byte-for-byte snapshots of translated bodies and the shared guide stub before each batch.
- Article work records such as `segments-pilot.md` and `analytics-overview.md`: plans, source and UI checks, preview status, and publication distinction.

The inventory's `published_original` state describes the pages currently live; it does not imply local editorial changes have been deployed. All 308 guide routes, including the external-reference redirect stub in two locales, responded with HTTP 200 during the inventory audit. HTTP response alone does not prove a local edit has reached production.

Update `progress.csv` after each article batch. Use `in_progress` while preparing it, `blocked` when a specific check or input prevents completion, and `local_verified` only after the article, build, and browser checks pass. Record the verifying commit and article-specific work record. Keep `inventory.csv` publication values tied to actual public state; a local commit does not change them.
