Use this guide to add Push subscription controls to your storefront with Hellotext.js. The examples cover installing the notification service worker, connecting your buttons, and checking that subscribing and unsubscribing work.

> **Using Shopify or VTEX?** Connecting your store to Hellotext automatically installs the notification service worker and initializes Hellotext.js with it. Skip steps 1 and 2. Start at step 3 if you are building your own subscription buttons. See [Set up Push notifications]({% link _integrations/setup-push-notifications.md %}) for the platform setup paths.

## Before you start

You need:

- A **Pro or Enterprise** plan with Push available for your business. For a custom store, confirm with Hellotext that Push is enabled before testing; publishing the worker alone does not complete business setup.
- Access to your storefront code and hosting, including the ability to publish a JavaScript file on your store's HTTPS domain.
- Hellotext.js installed and your public Business ID. Follow [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %}) if you have not installed it yet.
- A browser that supports Web Push. See [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) for device requirements and browser differences.

You do not need to generate or configure VAPID keys, provide a private API token, or build subscription API requests. Hellotext.js receives the public configuration it needs and manages the subscription requests for you.

## 1. Publish the notification service worker

A service worker is a JavaScript file that the browser uses to receive and display notifications. It must be available as its own file on your store, even when you load Hellotext.js from a CDN.

1. Create a file named `hellotext-sw.js` in the public root of your storefront.
2. Copy the following code into it.
3. Deploy it so that `https://store.example.com/hellotext-sw.js` serves the file. Replace `store.example.com` with the exact domain visitors use.

```javascript
self.addEventListener('install', event => {
  event.waitUntil(self.skipWaiting())
})

self.addEventListener('push', event => {
  if (!event.data) return

  let payload

  try {
    payload = event.data.json()
  } catch (error) {
    return
  }

  if (
    !payload ||
    payload.source !== 'hellotext' ||
    typeof payload.title !== 'string' ||
    !payload.title
  ) {
    return
  }

  event.stopImmediatePropagation()

  const options = payload.options || {}

  event.waitUntil(
    self.registration.showNotification(payload.title, {
      ...options,
      data: { ...options.data, source: 'hellotext' },
    }),
  )
})

self.addEventListener('notificationclick', event => {
  const { data } = event.notification

  if (!data || data.source !== 'hellotext') return

  event.notification.close()

  let url

  try {
    url = new URL(data.url || '/', self.location.origin)
  } catch (error) {
    return
  }

  if (url.protocol !== 'https:' && url.protocol !== 'http:') return

  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clients => {
      const client = clients.find(windowClient => windowClient.url === url.href)

      return client ? client.focus() : self.clients.openWindow(url.href)
    }),
  )
})
```

The worker displays a notification and opens its destination when clicked. Keep the `install` handler: it allows an updated version to activate while visitors still have your store open, instead of waiting for them to close every tab. See [how `skipWaiting()` works](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/skipWaiting) for details.

### Check the published URL

Open the worker URL directly in your browser. Confirm that:

- It returns the JavaScript above with an HTTP `200` response.
- Its `Content-Type` is a JavaScript type, such as `text/javascript`.
- It uses the same origin as the storefront: the same scheme, hostname, and port. For a page on `https://www.example.com`, publish the worker on `https://www.example.com`, not `https://example.com` or a separate CDN domain.
- It does not redirect to a login page or return your storefront's HTML fallback.

Putting the file at the public root, as shown above, gives it a default scope covering the storefront. If your framework uses a `public` directory, check the deployed URL: the URL should be `/hellotext-sw.js`, not `/public/hellotext-sw.js`. These requirements come from [service worker registration](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register).

### If you already have a service worker

Add these handlers to the worker you already maintain and use that file's URL in step 2. Preserve its existing caching and other behavior.

Place the Hellotext `push` handler **before any generic push handler**, including before code that imports one. Its `event.stopImmediatePropagation()` call applies only to Hellotext messages and prevents a later generic handler from displaying the same notification again. Include the Hellotext handlers only once in the final worker file.

## 2. Pass the worker URL when initializing Hellotext

Find your existing `Hellotext.initialize()` call. Add the `push` option to that call and keep your other settings. Do not add a second initialization just for Push.

The minimal initialization looks like this:

```javascript
await Hellotext.initialize('BUSINESS_ID', {
  push: {
    serviceWorkerUrl: '/hellotext-sw.js',
  },
})
```

Replace `BUSINESS_ID` with your public Hellotext Business ID and the worker URL with the file you published. An absolute URL is also valid if it is on the same origin as the page.

Run the button setup in the next steps after initialization has finished and the button elements exist in the page. If Shopify or VTEX handles initialization, use its existing initialized Hellotext instance.

If your storefront already registers and activates the worker for the current page, you can omit `serviceWorkerUrl`. In that case, your existing registration code is responsible for updating and activating the worker.

You can also pass `push.channelId` if Hellotext has given you a specific Push channel ID to use. Otherwise, leave it out.

## 3. Add a Subscribe button

Add the following elements where visitors manage notifications:

```html
<button id="push-subscribe" type="button" disabled>Subscribe to notifications</button>
<button id="push-unsubscribe" type="button" disabled>Unsubscribe from notifications</button>
<p id="push-status" role="status"></p>
```

After Hellotext initialization, connect the Subscribe button:

```javascript
const subscribeButton = document.querySelector('#push-subscribe')
const unsubscribeButton = document.querySelector('#push-unsubscribe')
const pushStatus = document.querySelector('#push-status')

subscribeButton.disabled = !Hellotext.push
unsubscribeButton.disabled = !Hellotext.push

subscribeButton.addEventListener('click', async () => {
  if (!Hellotext.push) return

  try {
    const response = await Hellotext.push.subscribe()

    if (response?.succeeded) {
      pushStatus.textContent = 'You are subscribed to notifications.'
    } else if (response?.failed) {
      pushStatus.textContent = 'We could not complete your subscription. Please try again.'
    }
  } catch (error) {
    pushStatus.textContent = 'Subscription was not completed. Check notification permissions and try again.'
  }
})
```

Call `Hellotext.push.subscribe()` directly from the click handler. Do not wait for another asynchronous operation before calling it; the browser may require the visitor's click to show its permission prompt. The method also works when permission has already been granted and reuses an existing Hellotext subscription when one is present.

Show the subscribed confirmation only when `response.succeeded` is true. The presence of `Hellotext.push`, a granted browser permission, or a browser subscription alone does not confirm that registration with Hellotext succeeded. If no response is returned, do not show a success message.

When `Hellotext.push` is unavailable, keep these controls disabled or hide them. Push can be unavailable because the browser does not support it, the page disables it, or the required configuration is unavailable.

## 4. Add the Unsubscribe action

Add this handler alongside the Subscribe handler. It uses the same button and status elements from step 3:

```javascript
unsubscribeButton.addEventListener('click', async () => {
  if (!Hellotext.push) return

  try {
    const response = await Hellotext.push.unsubscribe()

    if (response === null || response?.succeeded) {
      pushStatus.textContent = 'You are unsubscribed from notifications.'
    } else if (response?.failed) {
      pushStatus.textContent = 'We could not unsubscribe you. Please try again.'
    }
  } catch (error) {
    pushStatus.textContent = 'We could not unsubscribe you. Please try again.'
  }
})
```

A `null` result means there was no subscription to remove, so it is safe to confirm that the visitor is already unsubscribed. A failed response or a rejected request should leave the action available for another attempt. A missing response is not a success result.

Unsubscribing applies to the current browser subscription. It does not revoke the site's browser permission or remove subscriptions from the visitor's other browsers or devices.

## 5. Verify the complete flow

1. Open your deployed storefront in a supported browser.
2. Select **Subscribe to notifications** and complete the browser prompt if one appears.
3. Confirm that your page displays the success message from `response.succeeded`.
4. Reload the page and confirm that initialization does not report a worker error. Existing Hellotext subscriptions are restored automatically.
5. Select **Unsubscribe from notifications** and wait for its confirmation.
6. Select **Subscribe to notifications** again to verify that visitors can subscribe again.

These steps verify subscription setup. To test delivery as well, ask Hellotext to arrange a test notification for your browser. Check that it appears once and that clicking it opens the intended page. Image and action-button support depends on the browser and operating system; use [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) if the result differs between devices.

## Disable Push on a particular page

Set `push: false` in that page's existing initialization options:

```javascript
await Hellotext.initialize('BUSINESS_ID', { push: false })
```

Keep any other initialization options your page uses. This makes `Hellotext.push` unavailable on the page. It does not unsubscribe previous visitors; use `Hellotext.push.unsubscribe()` while Push is enabled to remove the current browser subscription.

## Related guides

- [Set up Push notifications]({% link _integrations/setup-push-notifications.md %})
- [Troubleshoot Push notifications]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %})
- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Hellotext.js Push reference](https://github.com/hellotext/hellotext.js/blob/main/docs/push.md)
