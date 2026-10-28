# Connect Magento bilingual guide

## Scope

New guide: `_integrations/connect-magento.md` (`connect-magento` / `conecta-magento`), Spanish written first and English aligned. The setup overview lists it under commerce platforms in both languages. Status: text ready for review; figures pending (see below).

## Sources

- End-to-end evidence recording of 2026-10-27 against the Hellotext production business **Magento Test**: Magento Open Source 2.4.7-p10, module `hellotext/magento` 1.0.1 from Packagist. It covers install, link, confirmation, catalog and customer import, storefront events, signed-in identification, order placement, invoice, shipment, partial refund, cancellation, revoked token, reconnection, disconnection and uninstall. The video is a source for the steps only; it is not embedded (Help articles do not embed video) and its frames are 1×, JPEG-compressed and not usable as figures.
- Interface labels from Rails `config/locales/views/magento/{en,es}.yml`, `captures` and `playbooks/webchats` locales at `hellotext/hellotext` master `2e434e2d91`.
- Module behavior from `hellotext/magento` main `12639bdaa2` (README, CHANGELOG, `hellotext:diagnose`, `Setup/Uninstall.php`).
- Pending upstream changes the text already describes:
  - Widget installation for Magento: `hellotext/hellotext#6664` (**Automatic Installation on Magento** for popups, webchat and WhatsApp). Publish the guide after it is deployed, or remove the widget section.
  - Uninstall cleanup in module 1.0.2: `hellotext/magento#4`. The guide tells 1.0.1 users to delete the integration by hand.

## Section plan

| Section | Reader question and figure decision |
| --- | --- |
| What the integration syncs | Conceptual scope and consent; prose only. |
| Before you connect | Requirements checklist; prose only. |
| Install the module and link the store | Pending figure: the **Connect your Magento store** commands block with the link code blurred, to show where the commands come from. The terminal output is quoted as text. |
| Confirm the connection | Pending figure: **Magento is connected** with its Status panel (installation key blurred), the state the reader must verify. **Confirm the connection** is explained in prose. |
| Import your existing customers | The two radio choices are self-explanatory; prose only. Optional pending figure: the completion screen. |
| Show your widgets in the store | Pending figure (after #6664 is deployed): the popup install step with **Automatic Installation on Magento** selected. |
| Check that everything works | Pending figure: a demonstration profile's **Activity** with order placed, confirmed, shipped and refunded entries. |
| Disconnect or uninstall | Trivial menu action; prose only. |
| Troubleshoot | Messages quoted from the locales; prose only. |

## Pending capture work

The figures above need native captures per `docs/editorial/screenshots.md`: an isolated headless Chrome on the fictional local app, Display P3, DPR 2, with a fictional Magento store connected to a demonstration business, both locales and desktop/mobile sources. Do not capture the production **Magento Test** business: its audience includes a real owner profile. Record provenance with `docs/editorial/templates/capture-record.json` when captured.

## Verification

- Pending: `yarn build` with Ruby 3.3.6 (not available in the authoring environment), and ES/EN desktop and mobile review of the rendered pages.
