Use this guide to decide what to connect first when you are setting up Hellotext.

Setup works best when you connect data sources before you launch captures, playbooks, routes, or campaigns. This lets you check the profiles, objects, and signals your integration provides before using them. Connection alone does not guarantee a complete historical import, every activity event, or sales attribution: those depend on supported data and events, customer identity, and attribution rules.

## Recommended setup order

### 1. Confirm your access

Before you start, confirm the permissions each integration requires in the relevant store, marketplace, or Meta account, and in the Hellotext business. Access to a business does not necessarily allow you to change its integrations.

In **Settings > General**, check the name and **Business ID** before authorizing a connection. This header belongs to the fictional business named **Enterprise**, with public ID **4ONLdN32**; the name does not indicate its plan. This ID identifies the business and can be used in Hellotext.js, but does not replace a private API token or administrator permissions.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual General header for fictional business Enterprise, public ID 4ONLdN32, and Edit business.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Actual General header for fictional business Enterprise, public ID 4ONLdN32, and Edit business." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Approved business identity source; no external authorization or ownership change shown.</figcaption>
</figure>

For commerce integrations, keep the API keys, tokens, or plugin access requested by that platform’s guide ready. Do not share secrets in screenshots or place them in public storefront code. For WhatsApp, confirm that you can receive SMS or voice calls on the phone number you want to connect.

If the business owner needs to change, complete that account-access task before making broader setup changes. Keep reading: [Transfer business ownership]({% link _integrations/transferring-ownership.md %}).

### 2. Connect your commerce platform

Connect the platform where your customers, products, carts, orders, and purchase activity live.

Choose the guide that matches your store:

- [Connect Shopify]({% link _integrations/connect-shopify.md %})
- [Connect Wix]({% link _integrations/connect-wix.md %})
- [Connect WooCommerce]({% link _integrations/connect-woo.md %})
- [Connect VTEX]({% link _integrations/connect-vtex.md %})
- [Connect Mercado Libre]({% link _integrations/connect-mercado-libre.md %})

After connecting, choose a known source record and check its data in Hellotext before building playbooks, routes, or campaigns from it. Check the profile, object, and actual event separately: a saved order does not confirm a recorded purchase or attributed sale. Initial scope and processing vary by platform.

To inspect an order, go to **Settings > Objects > Orders** and open **Edit**. Compare reference, source, amount, and currency against the source. This demonstration retains **Order #1001**, reference **ORDER-1001**, source **custom_store**, and amount **USD 89.90**, in draft with no events. The **Order ID** field displays the reference, distinct from the public API ID. **Deliver** is a delivery mode, not a shipment status.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual fictional order editor with reference ORDER-1001, source custom_store, and amount USD 89.90.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-en-mobile.png 2x" width="778" height="914" />
        <img src="/images/developers/orders-with-api/details-en.png" srcset="/images/developers/orders-with-api/details-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Actual fictional order editor with reference ORDER-1001, source custom_store, and amount USD 89.90." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing draft order with no events; not a confirmed import, purchase, delivery, or attribution.</figcaption>
</figure>

Also check which products, variants, prices, images, URLs, and availability your connector supports and your first playbook needs. Seeing a product or price does not prove current stock or Meta publication. Resolve any required missing data in a supported source before launch.

Keep reading:

- [Product catalog synchronization]({% link _integrations/product-catalog-sync.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})

### 3. Connect the messaging channels you will use

Connect WhatsApp before creating WhatsApp captures, playbooks, routes, or campaigns. Check the intended number and business, recipient permission for the channel and message type, and the active approved template version when required. A draft or visible connection does not confirm approval or delivery.

If you sell through WhatsApp, connect the commerce platform first and then connect your product catalog to WhatsApp.

Connect Instagram when customers should be able to start direct-message conversations that reach your Inbox, playbooks, routes, or AI agents. Instagram uses its own direct login and is separate from Facebook Messenger.

Connect Messenger when customers should be able to message your Facebook Page and reach your Inbox, routes, or compatible playbooks. Messenger uses Facebook login and requires access to the intended Page and Meta Business account.

To send emails from your business domain, confirm that your plan enables the email channel, add a sender, and publish its DNS verification records. Check that the sender is active after verification; adding it or publishing DNS does not guarantee delivery or permission to contact each recipient.

Keep reading:

- [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Connect Instagram DM]({% link _integrations/connect-instagram-dm.md %})
- [Instagram DM fundamentals]({% link _numbers/instagram-dm-fundamentals.md %})
- [Connect Facebook Messenger]({% link _integrations/connect-facebook-messenger.md %})
- [Facebook Messenger fundamentals]({% link _numbers/facebook-messenger-fundamentals.md %})
- [Set up email sending]({% link _integrations/set-up-email-sending.md %})

For Push, separate **collecting subscriptions** from **sending notifications**. An active channel configured for the website origin allows subscription collection and management on any plan; sending requires Pro or Enterprise and is subject to platform availability and limits. If the channel is missing, confirm setup with Support: creating a custom channel in the interface may be plan restricted.

Shopify and VTEX provide installation through their integrations; complete installation on the published site and check that the app or pixel is current. Custom storefronts use Hellotext.js and a compatible worker on the same HTTPS origin. Browser readiness, visitor permission, and subscription acknowledgement are separate checks. Follow [Set up Push notifications]({% link _integrations/setup-push-notifications.md %}) to choose an installation path; for custom storefronts use the current contracts in [Set up Push with Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}). The general Push guide still has earlier plan wording: apply the collection-versus-sending distinction here.

### 4. Add capture and checkout tools

Once your data source and messaging channel are ready, add the capture tools customers will use. Define the requested data, permission channel and purpose, and installation location. A phone number or Subscribed profile does not demonstrate permission for every message or channel.

Start with the places where customers already interact with your brand: your site, checkout, packaging, store, ads, social profiles, or events.

In **Capture > Forms**, review the preview before installation. This fictional form has a phone field and an SMS-specific notice, with a centered heading. It remains a draft with no submissions, coupon, or assigned route; it does not prove an active website installation or a subscription. Also verify installation, capture state, and behavior in the authorized environment.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual fictional form preview with phone field and SMS consent.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 490px; margin: 0 auto;">
      <img src="/images/captures/forms/ui-refresh/en/preview.png" srcset="/images/captures/forms/ui-refresh/en/preview.png 2x" style="width: auto; margin: 0 auto;" width="944" height="692" loading="lazy" decoding="async" alt="Actual fictional form preview with phone field and SMS consent." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing draft form with no submissions or route; the same complete source is used on desktop and mobile.</figcaption>
</figure>

Keep reading: [Capture tools overview]({% link _captures/capture-overview.md %}).

### 5. Verify the setup before launch

Before sending broadly, prepare authorized validation in an isolated environment with permitted test destinations. Define which actions could create events, purchases, charges, deliveries, or messages, and keep automations inactive until that scope is approved. If no safe environment exists, leave the dependent test pending.

- Use a coherent fictional profile and confirm it appears in **Audience** for the intended business; reachability and subscription do not replace channel permission.
- Compare a known record and supported events against the source: correctly associated customer or session, reference and IDs, source, date, amount, and currency where applicable. Distinguish test records from actual sales.
- On a custom storefront, await Hellotext.js initialization and explicitly record `page.viewed` once per actual view. Duplicate calls alter the data.
- Check the actual activity on the correct profile after processing. A `received` response does not guarantee the event was recorded or its effects occurred.
- First review the template, personalization, final URL, opt-out, and reply handling. Test delivery only when authorized, with permission and isolated destinations; a draft or accepted request does not prove receipt.
- Check capture behavior and, for Push, browser permission and subscription separately. Confirm response ownership and capacity before enabling playbooks, routes, or campaigns.

For a fuller checklist, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Troubleshooting checklist

If an integration does not behave as expected, review the basics first:

- The connected account is the correct store, site, marketplace, or Meta Business account.
- The Hellotext business is the right one.
- API keys, tokens, plugin configuration, or app permissions are still valid.
- Storefront domains and checkout scripts match the active store.
- Browser popups and authorization redirects are allowed during channel setup.
- The integration completed installation and is processing supported data. Compare a known record and timestamp rather than waiting for a universal delay. If a write has an uncertain response, inspect the record before retrying. Do not remove and reconnect a working integration without investigating the cause.

If setup still does not look right, contact Support with the business name and public ID, integration, domain, step, date and time zone, record reference, and exact warning. Explain expected and observed behavior; redact private tokens, passwords, and customer data from logs or screenshots.
