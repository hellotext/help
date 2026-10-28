Connect your Magento store to bring its catalog, customers and orders into Hellotext, record what shoppers do in the store, and show your popups, webchat and WhatsApp widget.

The connection has two parts: install the Hellotext module on the Magento server, then confirm the store in Hellotext. When the screen says **Magento is connected**, Hellotext has verified the store and configured the module; then check the customer import and the activity to confirm everything arrives as expected.

## What the integration syncs

- **Catalog:** the store's simple and configurable products, with their variants. Bundle, grouped, downloadable and virtual products are not imported.
- **Customers, optional:** the customers of the connected website, with name, email and newsletter status. Addresses, phone numbers, passwords and payment details are not imported.
- **Orders:** past orders are read when the connection completes; then each new order and each change arrives: confirmation when it is invoiced, shipment when Magento marks it complete, cancellation and refunds, including partial ones. Each order is attached to the customer who placed it.
- **Storefront activity:** page views, product views, cart changes, checkout started and order placed. A signed-in shopper is identified by their Magento customer ID, which Hellotext verifies with the store.
- **Widgets:** the popups, webchat and WhatsApp widget you install in Hellotext with **Automatic Installation on Magento** appear in the store without adding code.

Importing a customer or receiving their email does not grant permission to message them. Review the consent for each channel before including them in campaigns.

## Before you connect

Confirm that:

- You are an **Owner** or **Administrator** of the Hellotext business that will receive the store's activity. A business connects one Magento website.
- The store runs **Magento Open Source 2.4** (tested on 2.4.7) with **PHP 8.2, 8.3 or 8.4**. Magento Inventory (MSI) is optional.
- The store is published on its own domain with **HTTPS** and a valid certificate, and its `/rest` API responds from the internet. Hellotext does not connect to IP addresses, `localhost` or internal domains.
- Someone can run commands from the Magento root (`composer` and `bin/magento`) following the store's usual change process: a backup and a maintenance window in production.
- The server can make outbound HTTPS connections to Hellotext.

## Install the module and link the store

1. In Hellotext, open **Settings > Integrations** and choose **Browse integrations**.
2. Choose **Magento**. The **Connect your Magento store** screen shows the exact commands for your server.
3. Copy the command block and run it from the Magento root:

   ```bash
   composer require hellotext/magento
   bin/magento module:enable Hellotext_Tracking
   bin/magento setup:upgrade
   bin/magento setup:di:compile
   bin/magento setup:static-content:deploy -f
   bin/magento cache:flush
   bin/magento hellotext:connect '<link code>'
   ```

   The last command carries your business's link code. It works once and expires after one hour; if it expired, reload the Hellotext page to get a new one. Do not share it.
4. When it finishes, Magento replies `Store linked. Go back to Hellotext to confirm the connection.` The Hellotext page detects the store by itself.

If the module came from the Adobe Commerce Marketplace, or the server cannot run the last command, connect from Magento Admin: open **System > Extensions > Integrations**, choose **Activate** on the **Hellotext** integration, then **Allow**, and confirm in the Hellotext window that Magento opens.

## Confirm the connection

1. In **Confirm the connection**, check that the address is your store's and choose **Confirm connection**. Only confirm a connection you started yourself: the store will send its activity to this business.
2. If the website has several store views, choose the one Hellotext uses for product names and links. The connection covers the whole website.
3. Hellotext shows **Verifying Magento** while it configures the module and verifies the store. The page updates by itself.
4. When it finishes you see **Magento is connected**. **Status** shows the last verification, the module version, the Magento and PHP versions, and the imported products.

## Import your existing customers

1. Choose **Next**. In **Do you want to import your existing customers?**, choose **Yes, import my existing customers into Hellotext** or **Not now. I'll do this later.**
2. If you import, in **Organize your customers** choose the lists for the new customers and whether to update their existing properties, then choose **Save & Start import**.
3. The import keeps running if you close the page. It can take a few minutes to start depending on Hellotext's load. When it finishes you see how many customers were imported.

Each import creates a **Magento import** list with the customers it brought in.

## Show your widgets in the store

Once the store is connected, each widget offers to install itself on Magento:

- **Popup:** in the popup's install step, choose **Automatic Installation on Magento** and publish it.
- **Webchat or WhatsApp widget:** in its installation settings, choose **Automatic Installation on Magento** and install it.

The module loads Hellotext.js on every store page, so the widget appears without adding code. Installing another popup automatically replaces the previous one.

## Check that everything works

- **In the store:** open a product and add it to the cart. A shopper who signs in is identified by their Magento account.
- **In Hellotext:** open **Audience**, find the customer and review their **Activity**: their orders appear with their Magento reference and total, followed by their confirmation, shipment, cancellation or refund.
- **On the server:** run `bin/magento hellotext:diagnose --store=<store-view-code>`. It shows the module version, the active integration, whether the installation key and Business ID are configured, the Hellotext API, and whether identification is on. Add `--ping` to check that the server reaches the Hellotext API.

A storefront order is recorded when the shopper reaches the confirmation page. If they close the browser first, it is recorded with its next status change; an order waiting for payment may not appear until it changes.

## Disconnect or uninstall

To disconnect, open **Settings > Integrations**, open the Magento store's menu, choose **Remove** and confirm with **Delete**. Hellotext turns the module off in the store and deletes its credentials: the store stops sending activity and the widgets stop showing. To connect it again, repeat the installation with a new code.

To remove the module from the store, run from the Magento root:

```bash
bin/magento module:uninstall Hellotext_Tracking --remove-data
```

From module version 1.0.2, this command also removes the Hellotext integration from Magento, its access token and the module configuration. With version 1.0.1 or earlier, also delete the **Hellotext** integration in **System > Extensions > Integrations**.

## Troubleshoot the connection

- **"The configured Magento URL is not allowed."** The store must use a public domain with HTTPS on port 443. Fix Magento's base URL and connect again.
- **"Magento could not be reached right now."** Check that the store responds over HTTPS and that no firewall, WAF or CDN blocks requests to `/rest`. Then choose **Apply settings again** or **Verify connection**.
- **"Magento rejected the authorization credentials."** Hellotext's access was revoked in Magento. Link the store again: run the last command from the Magento screen with a new code, or choose **Reauthorize** on the Hellotext integration in Magento Admin. The connection keeps its installation key.
- **The link code expired or was refused.** Reload the Hellotext page and run the new last command.
- **The store records no activity.** Run `bin/magento hellotext:diagnose` and check that the Business ID is configured. Deploy static content and clear the cache after installing or updating the module. If you use Cookie Restriction Mode, activity starts once the visitor accepts cookies.
- **The customer import does not progress.** It runs in the background and can wait a few minutes in the queue. If it does not finish, give support the time and the business.

When you contact Hellotext support, share the output of `bin/magento hellotext:diagnose --store=<store-view-code>`, the Magento and module versions, the time of the problem and the exact message. Do not share tokens, passwords or the link code.

## Related guides

- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Product catalog sync]({% link _integrations/product-catalog-sync.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How customer profiles work]({% link _audience/customer-profiles.md %})
