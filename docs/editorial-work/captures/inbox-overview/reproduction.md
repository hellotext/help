# Reproducing the local Inbox overview evidence

The two Ruby files in this directory extend the existing, isolated fictional
fixture. They are not a database bootstrap from an empty schema. Do not run
them against another database or an account with messageable contacts.

Use a separate snapshot of application revision
`6dc36367bdd8f1b0ac9daea26660a6af4dbb1b31`, the owned synthetic database
`hellotext_help_inbox_task8_20261007`, and the safeguards retained in the sibling
[filter capture directory](../inbox-filter-search/). These prerequisites are
shared intentionally; no product source or configuration is changed in the
Help repository.

| Retained dependency | Purpose and required placement |
| --- | --- |
| [`verify_safety.rb`](../inbox-filter-search/verify_safety.rb) | Copy to `Rails.root/tmp/verify_safety.rb`; both overview helpers load it before touching fixture records. It checks the isolated database and zero external connections. |
| [`help_editorial_batch.rb`](../inbox-filter-search/help_editorial_batch.rb) | The owned runtime's guard, retained for inspection. Its placement is `config/initializers/help_editorial_batch.rb` in that isolated runtime. It requires development, the dedicated database/Redis, TestAdapter and disabled mail delivery. |
| [`prepare_inbox_fixture.rb`](../inbox-filter-search/prepare_inbox_fixture.rb) | Earlier assignment/state/label fixture used by these views. |
| [`source-ui-hashes.json`](../inbox-filter-search/source-ui-hashes.json) | Records 4,473 UI source files verified against the immutable application revision, with zero differences. The imported manifest points here. |
| [`browser.mjs`](../inbox-filter-search/browser.mjs) and [`capture.mjs`](../inbox-filter-search/capture.mjs) | Existing native browser/compositor capture helpers; require Node, `ws`, `lsof`, `sips` and the dedicated isolated Chrome profile. |
| [`review-browser.mjs`](../inbox-filter-search/review-browser.mjs) | Guarded final Help-page browser helper used by `review-guide.py`; restricts navigation to `http://127.0.0.1:4298`, validates the owned Chrome process/profile at port 9488, and checks screenshot viewport/density/profile. |

The baseline contains business `5`, conversations and non-messageable contacts
`11` and `13`, fictional user `1`, `design-system@example.test`, and 53 prior
synthetic message records. There must be no existing `inbox-overview-task8`
fixture: `prepare_overview_fixture.rb` aborts if it finds one. It adds two
received messages and one internal note using the actual Message, Note and
Event models. It does not call Message::Recorder or a provider delivery API.

`localize_overview_fixture.rb` accepts only `es` or `en`; it updates the owned
fixture bodies and the fictional user's locale. Its safeguards run first. The
captured routes and crop bounds for each locale are in the manifest and eight
individual JSON files. Read the runtime safety output before capturing; do not
start workers, enable integrations or connect real providers to fill a gap.

The retained helpers deliberately exclude the private runtime environment JSON,
secrets, database dumps, session cookies and Chrome profile. Recreating the
baseline requires a separately provisioned equivalent fictitious dataset and
local application environment. These files make the capture transformations
auditable; they do not promise a standalone one-command runtime installation.

For the final Help review, build and serve this checkout on loopback port 4298
using the repository's documented local workflow. The parent task owns the
already isolated review browser. Then run from the Help checkout:

```sh
python3 docs/editorial-work/captures/inbox-overview/verify-build.py
python3 docs/editorial-work/captures/inbox-overview/review-guide.py
```

The build verifier checks exactly eight image names against the manifest,
hashes, P3 profiles, native density and both locale output copies. The page
review checks both article routes with two figures at desktop, narrow and
mobile widths, then saves local review screenshots. Inspect those saved pixels
before claiming visual completion; passing DOM assertions alone is insufficient.
