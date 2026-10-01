Connect Fenicio to bring customer, product, and order data into Hellotext and relate it to storefront activity.

Complete three separate checks: account details saved in Hellotext, API access authorized by Fenicio, and tracking installed on the published store. **Account connected** in the wizard or the disappearance of a pending label does not prove that every import has finished or that the site records activity.

## What the integration syncs

The integration processes what the store returns and what tracking records:

- **Profiles:** available name, email, valid phone, gender, and identification document data. The Fenicio identity helps find the profile; email or phone can also relate it to an existing profile. Review matches before treating it as a new customer.
- **Optional customer history:** the current import obtains buyers from orders available through the Fenicio API. It does not necessarily include every registered store user. Skipping it does not prevent later orders or identifications from creating or updating profiles.
- **Catalog:** Fenicio products and presentations, represented as variants in Hellotext, with received references, prices, currency, images, categories, and availability. Price is not stock. Imported availability depends on presentation stock; availability lookups can query Fenicio again and depend on its response.
- **Orders and signals:** depending on the received state, Hellotext can record an order as placed, confirmed, shipped, delivered, or canceled. Delivery mode is a separate field. Importing a final state does not necessarily reconstruct every intermediate step.
- **Browsing:** requires installed and configured tracking code, separately from API imports. Signals can inform segments, playbooks, journeys, reports, and attribution when their rules are met; seeing an object does not prove a recorded purchase or attributed sale.

Importing a buyer or receiving an email/phone does not establish permission to message them. Review consent for each channel, destination, and message type; **Unconfirmed** or **Subscribed** and profile reachability are separate from that permission. New profiles from the Fenicio import do not receive guaranteed marketing subscription because they purchased.

## Before you connect

Confirm that:

- You are an **Owner** or **Administrator** of the intended Hellotext business and have a valid subscription.
- You have the public store domain and the **Business ID assigned to that store by Fenicio**. Ask Fenicio if you do not know it.
- You can coordinate access authorization and tracking installation on the published site with Fenicio support.
- You have chosen the historical import scope and how to review identity matches and contact permission.

The Fenicio form’s **Business ID** field asks for the Fenicio reference. It differs from the **public Hellotext Business ID** used for tracking and from a private API token. Do not create or paste a Hellotext token into that field or the public site.

Find the public Hellotext Business ID in **Settings > General**, beside the business name. The figure shows the fictional business **Enterprise**, public ID **4ONLdN32**; its name does not indicate the subscribed plan, and this heading does not demonstrate a Fenicio connection.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual General heading with fictional name Enterprise and public Hellotext Business ID 4ONLdN32.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Actual General heading with fictional name Enterprise and public Hellotext Business ID 4ONLdN32." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Approved UI source; the fictional state is explained in the preceding text.</figcaption>
</figure>

## Connect your Fenicio account

The following figure shows the actual two fields with **shop.example.test** and ID **1234567890**, fictional unsaved details. They do not represent a connected store.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual Fenicio Domain and Business ID fields with fictional unsaved values.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 550px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/connect-fenicio/account-en-mobile.png 2x" width="764" height="408" />
        <img src="/images/integrations/connect-fenicio/account-en.png" srcset="/images/integrations/connect-fenicio/account-en.png 2x" style="width: auto; margin: 0 auto;" width="1064" height="408" loading="lazy" decoding="async" alt="Actual Fenicio Domain and Business ID fields with fictional unsaved values." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Approved UI source; the fictional state is explained in the preceding text.</figcaption>
</figure>

1. In Hellotext, go to **Settings > Integrations > Explore integrations** and open **Fenicio**.
2. Enter the **Domain**, without a product or checkout path, and the **Fenicio Business ID** for that same store.
3. Review the details before selecting **Next**. This step checks that the domain responds and, if validation succeeds, saves the account and its integration in Hellotext. It does not authorize the API or install tracking.
4. Choose **Yes, import my existing customers into Hellotext** or **Not now. I’ll do this later**, then advance. This choice saves configuration and leaves the account pending; accepting the import does not mean profiles have already been processed.
5. Read **Account connected**, finish leaving the wizard, and continue with Fenicio authorization. The heading describes initial registration, not complete site validation.

If you skipped customer import, its option can be available after activation. If you accepted it but profiles are missing, review the result with support before repeating it: an option marked as imported does not prove every row completed successfully.

## Request authorization from Fenicio

After saving configuration:

1. Ask Hellotext support for the current access details Fenicio must authorize, including the source IP if an allowlist is required. Use that current confirmation for your store.
2. Open a Fenicio support ticket with the domain and Fenicio ID. Request access to query catalog and orders, and Hellotext tracking installation on the published site.
3. Confirm that tracking uses the public ID of the intended Hellotext business. If the team installs Hellotext.js **2.6.0**, it must await asynchronous initialization and explicitly record one `page.viewed` per real navigation, avoiding a duplicate first view. Follow [Tracking events]({% link _developers/tracking-events.md %}) for that contract.
4. Wait for Fenicio confirmation and return to **Settings > Integrations**. Open the pending account’s menu and select **Check Integration**.
5. Check the result and imported records separately. The check queries the orders API; a successful response activates the account and starts import work. It does not check that site code is installed or a visit was recorded.

### Email template for Fenicio

Complete this template with confirmed details. Review recipients and send it through your store’s authorized support channel:

> **Subject:** Authorize the integration between Fenicio and Hellotext
>
> Hello Fenicio support team,
>
> We need to authorize our store’s integration with Hellotext. Please:
>
> - Enable Hellotext access to catalog and orders using the current authorization details confirmed by Hellotext: `[ACCESS DETAILS / CONFIRMED IP, IF APPLICABLE]`.
> - Install and configure Hellotext tracking on the published site for public Hellotext ID `[PUBLIC HELLOTEXT BUSINESS ID]` and confirm the installed version.
>
> **Store details:**
>
> - Domain: `[STORE DOMAIN]`
> - Fenicio Business ID: `[FENICIO BUSINESS ID]`
>
> Please confirm API access and tracking installation separately.
>
> Thank you,
>
> `[NAME]`

Activation schedules product and order imports; buyer history depends on the chosen option. Jobs and periodic queries depend on queues, subscription, and Fenicio responses. There is no guaranteed few-minute deadline for each record or change. Check progress, errors, and specific data before launching an automation.

## Verify synchronized data

Start with existing records you know in Fenicio, without creating purchases to fill a report:

**1. Profile:** compare the Fenicio identity, contact details, and document against the source buyer. Review the existing profile and its permissions; an association does not guarantee all browsing history has been attributed to it.

**2. Product/presentation:** in **Settings > Objects > Products**, open **Edit** and compare name, reference, source, SKU, price, and currency against Fenicio. The parent uses its product code and presentations use their Fenicio SKU; keep that distinction when looking up a variant. Also review images and availability of the presentation you need.

The identity figure shows **Agenda semanal**, reference **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER**, and source **custom_store**, in draft with no events. It shows where to inspect editor fields; it is not a Fenicio import or proof of current stock or catalog publication. The money control labeled **Amount** in this editor represents an amount, not available units.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual fictional Agenda semanal product editor with reference, SKU, and custom_store source.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/products-and-inventory-with-api/identity-en-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-en.png" srcset="/images/developers/products-and-inventory-with-api/identity-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Actual fictional Agenda semanal product editor with reference, SKU, and custom_store source." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Approved UI source; the fictional state is explained in the preceding text.</figcaption>
</figure>

**3. Order:** in **Settings > Objects > Orders**, open **Edit** and compare reference, items, quantities, amounts, currency, and mode against the source order. A Fenicio order ID and its displayed number can differ. Find the corresponding signal in profile activity; do not infer shipping, delivery, or attribution from order fields alone.

The next example is **Order #1001**, reference **ORDER-1001**, source **custom_store**, **USD 89.90**, in draft with no events. **Order ID** displays the object reference, not its public Hellotext ID. **Deliver** is a delivery mode, not proof of shipment. This fictional order is reused to show where to inspect details; it does not demonstrate Fenicio synchronization.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual fictional ORDER-1001 order editor with custom_store source and USD 89.90 amount.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-en-mobile.png 2x" width="778" height="914" />
        <img src="/images/developers/orders-with-api/details-en.png" srcset="/images/developers/orders-with-api/details-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Actual fictional ORDER-1001 order editor with custom_store source and USD 89.90 amount." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Approved UI source; the fictional state is explained in the preceding text.</figcaption>
</figure>


**4. Tracking:** after confirming installation on the published site, verify the session, business, and actual activity of an authorized flow. An event acceptance response does not guarantee processing, profile association, or effects in a playbook or report.

**5. Isolated validation:** if a flow still needs checking, agree on an authorized fictional account and environment, with test data separated from real sales and no customer messages. Record source, time, identity, and expected result. Review permission, channel, and the active approved template version before enabling any send; a draft is not a delivered test.

Before enabling playbooks or journeys that depend on this data, follow the guide to [verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Troubleshoot the connection

- **Domain cannot be verified:** confirm domain and reference for the same store, HTTPS, and availability with Fenicio. The first step checks the site, not API access. Correct invalid details before repeating it.
- **Account stays pending:** confirm API access with Fenicio and current authorization details with Hellotext. **Check Integration** can activate the account and schedule imports; inspect the state first if an earlier attempt had an uncertain outcome. Installing tracking does not replace API access.
- **Active account, missing profiles:** check whether you accepted history, whether buyers appear in orders exposed by Fenicio, and whether the process has errors. Also look for existing profiles related by identity/email/phone. Do not disconnect or reimport blindly.
- **Missing product, variant, or order:** compare reference and source, confirm store ownership and API availability, and review progress/errors. A service or shipping line without a product SKU is not a catalog item. The editor or a previous response can differ from the latest source data.
- **Different stock or state:** distinguish price, presentation availability, item quantity, and delivery state. Queries depend on Fenicio; an active account does not guarantee a complete immediate copy of every change.
- **Missing browsing or attribution:** review published code, public Hellotext ID, version, explicit view, session, and eligible identity with Fenicio. The orders query does not diagnose tracking. Preserve source, dates, and report windows; a click is not an attributed purchase.

For a transient read failure, use bounded waits; do not continuously repeat data or permission errors. If you do not know the outcome of an action that could save or activate something, query its state before repeating it. Give Hellotext support the domain, Fenicio ID, public Hellotext ID, record reference/source, time and time zone, step, and error. Share focused screenshots without tokens, passwords, or unnecessary personal data.

## Related guides

- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Product catalog sync]({% link _integrations/product-catalog-sync.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How customer profiles work]({% link _audience/customer-profiles.md %})
