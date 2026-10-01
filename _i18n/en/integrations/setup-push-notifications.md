Push notifications let your store reach subscribed visitors through notifications displayed by their browser or device. Selecting a notification takes the visitor to the destination you included, such as a product or promotion.

Separate **collecting subscriptions** from **sending notifications**. With an active channel configured for your website origin, you can collect, refresh, and manage subscriptions on any plan. Sending requires **Pro** or **Enterprise** and is subject to platform availability and limits. Creating a custom channel and setting up Smart Alert in the interface also depend on your plan and permissions; confirm setup with Support if they are unavailable. Technical installation alone does not enable sending.

> **Shopify and VTEX install Push through their integrations.** Connect your store to Hellotext and complete installation on the published site. You do not need to upload a service-worker file or initialize Hellotext.js yourself. Continue with the subscription controls and verification below.

## 1. Choose your setup path

| Your storefront | What to do |
| --- | --- |
| **Shopify** | Complete [Connect Shopify]({% link _integrations/connect-shopify.md %}). The integration supplies Push configuration; also check its activation in the published theme. |
| **VTEX** | Complete [Connect VTEX]({% link _integrations/connect-vtex.md %}), including the Hellotext pixel installation and storefront domain. |
| **A custom storefront or another platform** | Ask your developer to follow [Set up Push with Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}). |

Use the business connected to the store where visitors will subscribe. In **Settings > General**, check its name and **Business ID**. This header belongs to the fictional business named **Enterprise**, with public ID **4ONLdN32**; the name does not indicate its plan. The public ID identifies the business for Hellotext.js and is not a private API token.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual General header for fictional business Enterprise and public ID 4ONLdN32.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Actual General header for fictional business Enterprise and public ID 4ONLdN32." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Demonstration business identity; not a confirmed Push installation or subscription.</figcaption>
</figure>

Check the published HTTPS origin visitors will use: scheme, domain, and port when applicable. A preview, theme editor, or another subdomain may have a different origin with separate permissions and subscriptions. Perform checks that create state only in an authorized environment with permitted test participants.

## 2. Complete automatic installation on Shopify or VTEX

1. Open the correct business in Hellotext.
2. Go to **Settings > Integrations** and check whether your store is already connected.
3. If it is not connected, follow the [Shopify connection guide]({% link _integrations/connect-shopify.md %}) or the [VTEX connection guide]({% link _integrations/connect-vtex.md %}). Complete the storefront installation steps in that guide.
4. Check that the app or pixel is current. On Shopify, the integration menu offers **Enable Push notifications**, opening the app configuration in the theme editor: check activation in the published theme. On VTEX, check the selected domain and installed pixel. Do not remove and reconnect a working integration to try to update it.
5. Open the live storefront and reload it after the updated configuration is available.

The integration supplies the notification worker and configures Hellotext.js to use it. The browser must be able to load and activate that worker before subscribing; a visible connection in Hellotext does not prove those steps completed on the site.

There is no separate Push credential to create or paste into the integration. If an update has not reached the live storefront yet, allow the platform update to finish before testing. See [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) if setup is still unavailable.

## 3. Set up a custom storefront

Skip this section if you use the automatic Shopify or VTEX installation.

1. Confirm with Support that the business has the required channel and permissions. If a configuration already exists for this origin, review its instructions before creating another.
2. For a new channel allowed by your plan and role, open **Settings > Integrations**, the integrations catalog, and **Push notification**. In **Connect your storefront to Push**, enter the **Storefront URL** with HTTPS and no path, query, fragment, or credentials. **Continue** saves the channel for that origin and opens instructions; it does not install the worker on your site.
3. Share those instructions and the [Hellotext.js Push setup guide]({% link _developers/setup-push-with-hellotext-js.md %}) with your developer. They must publish the worker on the same HTTPS origin, serve it as JavaScript, and check its scope. If a worker or another application's subscription already exists, they should integrate compatible handlers without blindly replacing the existing configuration.
4. Merge Push options into the existing Hellotext.js initialization, using the public Business ID and appropriate channel when specified. Awaiting SDK initialization and checking worker readiness are distinct steps. The public file does not need a private API token. Add subscription and cancellation controls, and verify published changes before inviting visitors.

The following form shows **https://shop.example.test**, a fictional origin entered without saving. No channel was created and no worker was published or registered for this demonstration.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual Storefront URL field with fictional HTTPS origin and complete format hint.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 550px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/setup-push-notifications/origin-en-mobile.png 2x" width="764" height="332" />
        <img src="/images/integrations/setup-push-notifications/origin-en.png" srcset="/images/integrations/setup-push-notifications/origin-en.png 2x" style="width: auto; margin: 0 auto;" width="1064" height="292" loading="lazy" decoding="async" alt="Actual Storefront URL field with fictional HTTPS origin and complete format hint." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved draft; Continue would create the channel, not a subscription or delivery.</figcaption>
</figure>

If your store is not yet connected to Hellotext at all, start with [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}).

## 4. Give visitors a way to subscribe and unsubscribe

Your website needs a visible invitation and a way to unsubscribe. You can configure **Smart Alert** when enabled for your business, or ask your developer for custom controls following the [Subscribe and Unsubscribe steps]({% link _developers/setup-push-with-hellotext-js.md %}). This also applies to stores with automatic installation.

In Smart Alert, review **Appearance** and **Personalization**, with content for home, collection, and product detail pages. Enable the sections you will use and follow installation instructions: saving or viewing a preview does not confirm display on the storefront. In a custom integration, the SDK does not automatically detect page type; the developer must request the appropriate enabled section according to the [current Push and Smart Alert reference](https://github.com/hellotext/hellotext.js/blob/main/docs/push.md).

This actual unsaved, inactive template preview shows the **collection** invitation. **Activate alerts** expresses an intention to subscribe; **Not now** declines the invitation. The preview is not a browser permission request or delivered notification, and does not demonstrate automatic stock or collection tracking.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual Smart Alert collection preview with complete Activate alerts and Not now controls.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 514px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/setup-push-notifications/alert-en-mobile.png 2x" width="732" height="632" />
        <img src="/images/integrations/setup-push-notifications/alert-en.png" srcset="/images/integrations/setup-push-notifications/alert-en.png 2x" style="width: auto; margin: 0 auto;" width="992" height="520" loading="lazy" decoding="async" alt="Actual Smart Alert collection preview with complete Activate alerts and Not now controls." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved, inactive template; no permission request, subscription, or delivery performed.</figcaption>
</figure>

On the installed site, the visitor's click starts the permission request when needed and subscription registration. Respect their choice: do not repeatedly ask after permission was denied. Smart Alert does not display for a disabled section, an existing subscription, or denied permission. **Not now** postpones the invitation for seven days after the first dismissal and thirty after subsequent dismissals, using browser history for that business and site; when storage is unavailable, that postponement lasts only on the current page.

Confirm success after checking registration with Hellotext, rather than just a click, granted permission, a dismissed invitation, or a local subscription. Smart Alert acceptance occurs before permission and registration results. If network or readiness fails, the site should show the actual state and allow resolution without announcing success.

A subscription belongs to the browser, device, and origin where it was created. During cancellation, the SDK first disables the Hellotext record and then removes the local subscription; if the server request fails, it retains the subscription for retry. Confirmed cancellation does not revoke browser permission, cancel other devices, or remove notifications already delivered. Disabling Push in a page's configuration also does not unsubscribe an existing visitor.

## 5. Verify the setup

Prepare authorized, isolated verification with a supported browser and device. Agree on a permitted destination and scope before creating a subscription or sending; do not use the entire audience for testing.

1. Check the business, HTTPS origin, published installation, and active worker. Separately check whether the invitation or subscription control appears where intended; its presence does not prove permission or registration.
2. With the authorized test participant, use the subscription action. Check browser permission and wait for registration acknowledgement from Hellotext. Installing the integration does not automatically subscribe visitors.
3. Record the URL, browser, device, date, time, and time zone. Keep these separate from real customers and results.
4. Coordinate with Support a test notification limited to that subscription, only if sending is plan enabled and authorized. Collecting a subscription on a plan without sending does not allow this delivery test.
5. Check request acceptance, notification receipt, and the destination opened on selection separately. An accepted request does not guarantee the device displayed it; also check browser and operating system settings.
6. Use the website's unsubscribe action and wait for acknowledgement. Check the result before repeating an operation with an uncertain response. If subscribing again, do so with authorization on the same origin and browser, respecting its current permission.

Start with a simple text notification. Images and buttons can display differently across browsers and operating systems, so a missing image does not by itself mean delivery failed.

If the subscription or delivery test fails, follow [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}). Share the public Business ID, origin, step, exact warning, and test time with Support, without private tokens or subscription endpoints or keys.

## Related guides

- [Set up Push with Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %})
- [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %})
- [Connect Shopify]({% link _integrations/connect-shopify.md %})
- [Connect VTEX]({% link _integrations/connect-vtex.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Contact Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %})
