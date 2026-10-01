Use this guide when a customer cannot subscribe to your store's Push notifications, a notification does not arrive, or its appearance differs between browsers.

For alerts about conversations received by your team in Hellotext, use [Inbox browser notifications]({% link _team/inbox-browser-notifications.md %}).

## Before you start

Use one test device and browser first. Note the store URL, browser and operating system versions, and the time of the problem. If a notification arrived, keep a screenshot before dismissing it.

With an active channel configured for the store origin, you can collect and manage subscriptions on any plan. **Sending** notifications requires **Pro or Enterprise**, alongside the sending conditions and limits. Creating a custom channel or configuring Smart Alert in the interface also depends on your plan and permissions.

Shopify and VTEX provide the components through their integrations: check that the current installation has been applied to the live store. Merchants using those integrations do not need to publish a service-worker file or initialize Hellotext.js manually. For the complete setup path, see [Set up Push notifications]({% link _integrations/setup-push-notifications.md %}).

## 1. A notification does not arrive

Work through these checks in order:

1. **Open the live store on the device you are testing.** Use the same browser profile and exact store address where you subscribed. A subscription in one browser or device does not subscribe your other browsers or devices.
2. **Confirm that you completed the store's notification opt-in.** A browser showing notifications as allowed is only one part of setup: the store must also finish subscribing that browser to Hellotext. If the opt-in showed an error or never confirmed success, ask for the Hellotext registration and local state to be checked before repeating it.
3. **Check the site's notification setting.** If you previously blocked notifications, change that setting in the browser before using the store's opt-in again. The store cannot override a blocked permission.
4. **Check your device's notification settings.** Allow notifications for the browser or installed web app. Check Focus, Do Not Disturb, and the notification center: a notification may have arrived without showing a banner.
5. **Check recent browser changes.** If you cleared site data, removed the installed web app, or switched browser profiles, open the store and complete its opt-in again. Use a regular browser window for testing.
6. **Confirm the delivery test.** Ask [Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) to check the subscription and arrange a controlled test to that browser. Record the test time and whether it appears in the notification center.

Keep three checks separate: **browser permission**, **that browser’s subscription registered with Hellotext**, and **the notification arriving on the device**. A visible invitation, an Activate alerts click, granted permission, or the invitation disappearing does not confirm all three. Hellotext’s delivery information indicates that the Push service accepted the request; it does not prove that the operating system displayed a notification or that the customer read it.

If you use **Smart Alert** and the invitation is missing, check that the playbook is saved and enabled and that the page’s section is enabled and requested by the installation. In a custom integration, the SDK does not automatically detect a collection or product page. The invitation is also hidden when permission is denied or a local subscription already exists. **Not now** postpones the invitation for seven days after the first dismissal and thirty after later dismissals; when history cannot be stored, that cooldown lasts only for the current page. Do not clear data or repeatedly request permission to bypass the visitor’s decision.

This real **collection** template preview is an independent demonstration, without saving or activation. It shows the complete **Activate alerts** and **Not now** controls; it is not browser permission, a registered subscription, or a delivered notification, and does not demonstrate automatic stock tracking.

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

If subscription returned an uncertain result, ask for the server registration and local state to be checked before repeating operations. A local subscription can exist even when its Hellotext registration fails. An expired subscription or one rejected by the Push service is no longer a usable destination; changing permission alone does not repair that registration.

On **iPhone and iPad**, Web Push requires iOS or iPadOS 16.4 or later and a web app added to the Home Screen. Open the store from its Home Screen icon and complete its opt-in there. If it opens as a normal browser tab, ask your developer to check the store's web app setup. See [WebKit's Home Screen requirements](https://webkit.org/blog/13878/web-push-for-web-apps-on-ios-and-ipados/).

## 2. Setup fails or a service-worker warning appears

A service worker is the small background script that receives notifications for your store. A warning such as `Push service worker is not available` means the browser could not obtain an active worker for Push.

### Shopify or VTEX

1. Confirm that the store is connected to the correct Hellotext business.
2. Confirm that the current Hellotext integration is installed and enabled on the live storefront.
3. After an integration update, reopen or reload the live store before retrying the opt-in.
4. If the warning persists, send Support the store URL and the exact warning text.

The integration manages the worker. Do not replace the platform's worker or add a second manual installation to fix this warning.

### A custom website using Hellotext.js

Ask your developer to follow [Set up Push with Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}) and check:

1. The live site uses HTTPS.
2. The configured worker URL serves the JavaScript file on the same origin as the storefront, without a login page or an error response.
3. The worker has become active and includes the Hellotext notification handlers.
4. The page initializes Hellotext.js with the intended worker URL and waits for initialization before offering the opt-in.

Include the exact error rather than repeatedly reinstalling the integration or clearing browser data.

Compare the channel’s configured **origin** with the live store: protocol, domain, and port. A theme editor, preview, or another subdomain can have different permissions and subscriptions. The **worker URL** is a separate detail: it includes the JavaScript file path on that same origin and needs the appropriate scope for the page.

The form below shows **https://shop.example.test**, a fictional origin entered without saving in Connect your store to Push. Its hint separates the origin from a particular page. No channel was created and no worker was published or registered for this demonstration; do not recreate an existing channel to investigate a failure.

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

Waiting for Hellotext.js initialization does not guarantee that the worker has finished activating: preparation continues in the background and subscription must wait for its result. If a worker already exists, integrate compatible handlers; do not blindly replace a subscription belonging to another application. Worker-unavailable, installation-failed, and different-application subscription warnings identify different steps. Share the exact text and follow the developer guide.

## 3. The notification arrives without an image or buttons

The browser and operating system control the appearance of a notification. Receiving the text without every visual element does not, by itself, mean delivery failed.

| Where you are testing | What to expect |
| --- | --- |
| Safari | Large notification images and custom action buttons are not supported. |
| Chrome and other Chromium browsers using native macOS notifications | Large images are ignored. Actions may be behind the notification's hover or **More** menu. |
| Other browser and device combinations | Appearance and the number of visible actions vary. Expand the notification and test the actual browser and device your customers use. |

See [Safari's notification options](https://github.com/WebKit/WebKit/blob/main/Source/WebCore/Modules/notifications/NotificationOptions.idl) and [Chrome's macOS notification behavior](https://developer.chrome.com/blog/native-mac-os-notifications).

If an image is missing in a browser that supports it, ask your developer to confirm that its URL loads without signing in. Keep the message understandable from its title and body, and check that clicking the notification opens the expected page.

## 4. Two notifications appear for one message

One notification with the complete content and another with only the title can mean the store displays the same delivery twice. This can happen when two notification handlers process one message.

1. Note whether both notifications arrive at the same time and have the same title.
2. Take a screenshot of both, including any difference in text or buttons.
3. For Shopify or VTEX, confirm the current integration is installed, then reopen the live store and repeat one controlled test.
4. If it continues, contact Support. For a custom site, ask your developer to check that a Hellotext message is displayed only once, following [the developer setup guide]({% link _developers/setup-push-with-hellotext-js.md %}).

Also establish whether one delivery was displayed twice or two separate messages were sent. The current integration worker recognizes Hellotext messages and stops subsequent handlers for that delivery; a handler that already ran earlier may have displayed another notification. Your developer should review handler order and compatibility. A title alone does not identify a delivery.

Do not remove other store services or overwrite the platform worker to troubleshoot duplicates.

## 5. Clicking the notification opens the wrong page

Record the destination you expected and the URL that actually opened. Check whether the same happens when clicking the notification itself and, where available, an action button.

For a custom implementation, ask your developer to review the notification's destination and click handler. For an integrated store, send the example to Support. Displaying a custom action button does not automatically give it a different destination. A destination must be associated with that action; the general click uses the main destination. The current worker can focus a window already open at that URL or open another. Without a usable destination, it can open the site’s home page. Check link redirects too, and retain both destinations for investigation instead of inferring the result from a visible button.

## When to contact Support

Include:

- Your Hellotext business and live store URL.
- Whether you use Shopify, VTEX, or a custom installation.
- The browser, operating system, and device used for the test.
- The approximate time and time zone.
- Whether the opt-in completed and whether any notification arrived.
- The exact warning, screenshot, or unexpected destination.
- Any recent integration update, domain change, or browser data reset.

Share the public Business ID, failed step, and differences between permission, registration, and receipt. Hide private tokens, subscription endpoints, and keys in screenshots or logs; they are not needed for the initial summary.

See [Contact Hellotext Support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) for contact details.

## Related guides

- [Set up Push notifications]({% link _integrations/setup-push-notifications.md %})
- [Set up Push with Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %})
- [Inbox browser notifications]({% link _team/inbox-browser-notifications.md %})
