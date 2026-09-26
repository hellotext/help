# Editorial work register

The shared workflow is in `../editorial/workflow.md`. This directory contains Help-specific evidence and pending work. Jekyll excludes it from the public site.

- `inventory.csv`: 153 paired article bodies plus the separate `_developers/api.md` redirect stub, their public routes and observed HTTP status on 2026-09-25, and original source hashes for translated bodies. The redirect points to the external API reference and has no translated body.
- `originals/segments/`: byte-for-byte snapshots of the Spanish and English segments body and shared guide stub before the pilot.
- `segments-pilot.md`: article plan, source and UI checks, capture and preview status, and publication distinction.

The inventory's `published_original` state describes the pages currently live; it does not imply local editorial changes have been deployed. All 308 guide routes, including the external-reference redirect stub in two locales, responded with HTTP 200 during the inventory audit. HTTP response alone does not prove a local edit has reached production.
