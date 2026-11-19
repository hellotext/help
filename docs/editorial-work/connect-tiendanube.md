# Connect Tiendanube bilingual guide

## Scope

New guide: `_integrations/connect-tiendanube.md` (`connect-tiendanube` / `conecta-tiendanube`), Spanish written first and English aligned. The setup overview lists it under commerce platforms in both languages. Status: text ready for review; figures pending (see below).

## Sources

- End-to-end production tests of 2026-10-28, 2026-11-03 and 2026-11-04 against the Hellotext business **Tiendanube Demo** and the demo store `hellotexttiendademo` (app 48942): connection from Settings and from the App Store link, customer import, storefront and checkout events, checkout identification, orders by webhook, abandoned carts, uninstall and reinstall. The tutorial recording is a source for the steps only; Help does not embed video.
- Interface labels from Rails `config/locales/views/{settings/integrations,imports,onboarding}/{en,es}.yml` and `config/locales/actions/{en,es}.yml` at `hellotext/hellotext` master.
- Behavior from `app/integrations/tiendanube/`, `app/controllers/tiendanube/oauth_controller.rb` and `app/models/tiendanube/store.rb` on master (catalog import and webhooks, order lifecycle, suspension, disconnect).
- The OAuth error messages are not localized in Rails; the guide quotes them in English in both languages.
- The settings card and the integration catalog spell the platform **Tiendanube**; the import list name and the error messages say **Tienda Nube**. The guide quotes each as the interface shows it.

## Section plan

| Section | Reader question and figure decision |
| --- | --- |
| What the integration syncs | Conceptual scope and consent; prose only. |
| Before you connect | Requirements checklist; prose only. |
| Connect from Hellotext | Pending figure: the **Tiendanube** card in **Browse integrations**. The Tiendanube permission screen belongs to Tiendanube and is described in prose. |
| Connect from the App Store | Pending figure: **Where to install your shop?** with a demonstration business, the only Hellotext choice in this path. |
| Import your existing customers | Same screen as the other platforms; prose only. |
| Check that everything works | Pending figure: a demonstration profile's **Activity** with cart, checkout started and placed order entries. |
| Disconnect or uninstall | Trivial menu action; prose only. |
| Troubleshoot | Messages quoted from the code; prose only. Optional pending figure: the **Suspended** label on the settings card. |

## Pending capture work

The figures above need native captures per `docs/editorial/screenshots.md`: an isolated headless Chrome on the fictional local app, Display P3, DPR 2, with a fictional Tiendanube store connected to a demonstration business, both locales and desktop/mobile sources. Do not capture the production **Tiendanube Demo** business: its audience holds test profiles from the end-to-end runs. Record provenance with `docs/editorial/templates/capture-record.json` when captured.

## Publication dependencies

- The App Store path assumes the app is published in the Tiendanube App Store (homologation of app 48942). Until then, publish the guide without that section or keep it unpublished.

## Verification

- Pending: `yarn build` with Ruby 3.3.6 and ES/EN desktop and mobile review of the rendered pages.
