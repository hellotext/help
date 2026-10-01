Push notifications let your store reach subscribed visitors through notifications displayed by their browser or device. Selecting a notification takes the visitor to the destination you included, such as a product or promotion.

Push is available on the **Pro** and **Enterprise** plans.

> **Shopify and VTEX install Push automatically.** Connect your store through the Hellotext integration and complete its storefront installation. You do not need to upload a service-worker file or initialize Hellotext.js yourself. Continue with the subscription controls and verification below.

## 1. Choose your setup path

| Your storefront | What to do |
| --- | --- |
| **Shopify** | Complete [Connect Shopify]({% link _integrations/connect-shopify.md %}). The integration handles Push installation. |
| **VTEX** | Complete [Connect VTEX]({% link _integrations/connect-vtex.md %}), including the Hellotext pixel installation. The integration handles Push installation. |
| **A custom storefront or another platform** | Ask your developer to follow [Set up Push with Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}). |

Use the Hellotext business connected to the store you want visitors to subscribe to. Test on the published HTTPS storefront customers actually visit, rather than a theme editor or preview window.

## 2. Complete automatic installation on Shopify or VTEX

1. Open the correct business in Hellotext.
2. Go to **Settings > Integrations** and check whether your store is already connected.
3. If it is not connected, follow the [Shopify connection guide]({% link _integrations/connect-shopify.md %}) or the [VTEX connection guide]({% link _integrations/connect-vtex.md %}). Complete all storefront installation steps in that guide.
4. If your store was connected before Push became available, make sure the installed Hellotext app or pixel is up to date. You do not need to remove and reconnect a working integration.
5. Open the live storefront and reload it after the updated integration is available.

The integration supplies the notification worker and configures Hellotext.js to use it. Later updates to that installation are handled through the integration and the browser's worker-update process.

There is no separate Push credential to create or paste into the integration. If an updated app or pixel has not reached the live storefront yet, allow the platform update to finish before testing. See [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) if setup is still unavailable.

## 3. Set up a custom storefront

Skip this section if you use the automatic Shopify or VTEX installation.

1. Confirm with Hellotext support that Push is enabled for the business you are connecting.
2. Give your developer the [Hellotext.js Push setup guide]({% link _developers/setup-push-with-hellotext-js.md %}).
3. Have them publish the notification worker on your website, configure the existing Hellotext.js initialization, and add the subscription controls.
4. Test on the live storefront after those changes are published.

If your store is not yet connected to Hellotext at all, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}).

## 4. Give visitors a way to subscribe and unsubscribe

Your website needs a visible subscription action, such as **Subscribe to notifications**, and a way to unsubscribe. If these controls are not yet present, ask your developer to connect them using the [Subscribe and Unsubscribe steps]({% link _developers/setup-push-with-hellotext-js.md %}). This also applies to stores with automatic installation.

A visitor selects the subscription action and allows notifications when the browser asks. The website should confirm success only after the subscription finishes. Installing the integration does not subscribe visitors by itself.

A subscription belongs to the browser and device where the visitor created it. Test each browser or device separately; allowing notifications on one does not subscribe another.

## 5. Verify the setup

Use a browser and device where you can receive notifications:

1. Open the published store and select its notification subscription action.
2. Allow notifications if the browser asks, then wait for the website's successful subscription confirmation.
3. Keep track of the storefront URL, browser, device, and approximate time of the test.
4. Contact Hellotext support to arrange a test notification to that subscription. Share those details so the team can identify your test.
5. Confirm that the notification appears and that selecting it opens the expected page.
6. Use the website's unsubscribe action and wait for its confirmation. If you need to test again, subscribe again from the same page.

Start with a simple text notification. Images and buttons can display differently across browsers and operating systems, so a missing image does not by itself mean delivery failed.

If the subscription or delivery test fails, follow [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}).

## Related guides

- [Set up Push with Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %})
- [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %})
- [Connect Shopify]({% link _integrations/connect-shopify.md %})
- [Connect VTEX]({% link _integrations/connect-vtex.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Contact Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %})
