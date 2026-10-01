Your product catalog gives Hellotext the context it needs to understand what customers view, add to carts, buy, ask about, and may want next.

When the catalog is synchronized correctly, Hellotext can connect customer activity with the right products and use current product information in conversations, recommendations, and playbooks.

## What catalog synchronization does

Catalog synchronization creates a consistent product record in Hellotext for each product and variant from your source system.

Depending on the connected platform and the data it provides, a product can include:

- A stable product and variant reference.
- Name, description, brand, SKU, and product URL.
- Price and currency.
- Images.
- Categories, collections, and tags.
- Variants and their individual prices or images.
- Whether the product is currently available when the integration supports availability.

A name is required when creating a product through the API, but other supported fields may be incomplete. Do not assume every integration imports the same information or that seeing a product in Hellotext proves its image, URL, variants, or inventory are current.

## Why the catalog matters

Hellotext combines the catalog with customer signals. A product view, cart update, or order is most useful when it resolves to the same product and variant that Hellotext already knows.

This connection supports experiences such as:

- [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) and sales agents that search for relevant products.
- [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) and [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}), which use the products a customer considered.
- [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) and [Complete-the-Look]({% link _journeys/complete-the-look-playbook.md %}), which look for useful product relationships.
- [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}) and [Price-Drop Pouncer]({% link _journeys/price-drop-pouncer.md %}), which depend on changes in availability or price.
- [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}), which combines product and purchase history to estimate the next useful moment.

A connected catalog also gives teammates and AI agents better product context when they help a customer in the Inbox.

The catalog does not record a visit, cart, or purchase by itself. Those facts need their real signal and the correct customer context. Having a product does not guarantee a playbook will trigger or send: its requirements, permission, availability, and configuration still apply.

## Choose the source of truth

Use the system where your business manages products as the source of truth.

For Shopify, Wix, WooCommerce, and VTEX, connect the native store integration. Hellotext imports supported product information and keeps it updated as the platform sends changes or the integration refreshes it.

For a custom store, synchronize products and variants with the API. Browser and server-side events must reuse those product identities. The public Products API does not currently provide a dedicated live inventory field, so confirm a supported inventory source before enabling a playbook that depends on availability.

If you connect a catalog to WhatsApp, your store remains the source of the products. Hellotext prepares eligible products for the selected Meta catalog through separate synchronization and publication processes. A product saved in Hellotext does not guarantee Meta has accepted it or that it appears in WhatsApp. The Meta catalog is a destination for commerce in WhatsApp, not a replacement for connecting the store or confirmation that a payment completed.

Do not maintain the same product independently in several systems unless one source clearly owns it. Conflicting references, prices, or availability can create duplicates or stale product context.

Availability requires a supported, verified source. Shopify and VTEX include specific lookups; other importers may provide catalog data without an equivalent stock lookup. Do not interpret an internal active state, price, or custom property as proof of sellable units. Do not assume the lookup is instant either: caching and delays may apply.

## Keep product identity consistent

The most important catalog rule is to keep product and variant references stable.

Use the same product or variant identity in:

- The synchronized catalog.
- Product-view events.
- Cart items.
- Order items.
- Server-side events or custom integrations.

Names, URLs, prices, and positions in an import can change and should not be used as identifiers. Keep a mapping between the store identity and the Hellotext public ID for each product or variant.

| Field | What it identifies |
| --- | --- |
| **Hellotext public ID** | The specific record returned by the API; retain each product and variant ID. |
| **Reference** | The identifier supplied by the source system. |
| **Source** | The platform or integration that gives that reference its context. |
| **SKU** | A commercial code useful for comparison; it may be missing, change, or match another record. |

In **Settings > Objects > Products**, open **Edit** to inspect name, reference, SKU, and source. This view shows the fictional draft product **Agenda semanal**, reference **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER**, and source **custom_store**. These values are not its public ID or proof of an import from a connected store.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real editor for the fictional Agenda semanal product with reference, SKU, and source.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/identity-en-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-en.png" srcset="/images/developers/products-and-inventory-with-api/identity-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Real editor for the fictional Agenda semanal product with reference, SKU, and source." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing draft with no events reused unchanged. Reference and SKU are not the public ID or an inventory signal.</figcaption>
</figure>

If an event uses a different reference from the catalog, Hellotext may receive the request but fail to connect it with the product the playbook needs. This can cause missing images, incomplete cart context, duplicate products, or recommendations that omit the item.

Do not rely on an ambiguous SKU or reference: some lookups also accept these values and compare them without case sensitivity. Reuse the verified public ID from the correct business and retain the source. Do not change capitalization alone to try to create a different identity.

## Which fields should you review?

Start with the fields that affect every product experience:

- **Identity:** stable product and variant references, plus SKU when your store uses it.
- **Display:** name, public product URL, and at least one accessible image.
- **Commerce:** current price and currency.
- **Availability:** active, unavailable, or out-of-stock state when the source supports it.
- **Structure:** parent product and purchasable variants.

Then improve discovery and recommendation quality with brand, description, category, collection, tags, color, size, material, or other useful attributes supplied by the source.

Use product-level data for information shared by the whole family and variant-level data for differences such as size, color, SKU, price, image, or availability. Confirm which fields and relationships your integration maintains; an API variants list also includes the default representation of the product and does not prove additional commercial variants exist.

To inspect the price in the Products editor, open **Amount** and check the decimal value and currency. **Amount** is money, not stock units; **Converted amount** is the value for the business reporting currency. This demonstration retains **USD 44.95**, without saving an edit. The draft has no photo, URL, or additional variants, so it does not represent a catalog ready to launch.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real USD 44.95 amount control and USD 44.95 converted amount for a fictional product.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/price-en-mobile.png 2x" width="714" height="300" />
        <img src="/images/developers/products-and-inventory-with-api/price-en.png" srcset="/images/developers/products-and-inventory-with-api/price-en.png 2x" style="width: auto; margin: 0 auto;" width="942" height="300" loading="lazy" decoding="async" alt="Real USD 44.95 amount control and USD 44.95 converted amount for a fictional product." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Monetary control opened without saving; not stock, a store-synchronized price change, or proof of synchronization.</figcaption>
</figure>

## How updates reach Hellotext

The initial import starts after you connect a compatible store. Large catalogs can take longer to finish, so allow the first synchronization to complete before evaluating recommendations or inventory-dependent playbooks.

After that, Hellotext updates supported fields when the commerce platform reports a product change or when the integration performs its own refresh. The exact delay can vary by platform and catalog size.

Make price, image, category, variant, and availability corrections in the source of truth. Then allow the integration to synchronize them. Avoid creating a second product in Hellotext to work around an outdated record.

For custom stores, your integration is responsible for updating the existing API product whenever supported catalog data changes. Retain its public ID and check the result by retrieving it again, including its variants. Sending an empty variants list in a product update can retire existing variants: use documented individual variant operations when appropriate.

Catalog changes may start other processes, such as Meta publication or evaluation of price and availability changes. Do not use them to manufacture test results. If a write loses its response, inspect the existing record before repeating it; there is no general guarantee that every retry is idempotent.

## Verify the catalog before launch

Use an authorized isolated environment, fictional profiles, and permitted test destinations. First define what purchases, events, recommendations, or sends your actions could produce. Do not make purchases or enable playbooks in a real store just to fill this checklist. Test a parent product with at least one real variant from that environment when possible.

1. Confirm that the name, price, currency, image, URL, and availability match the store.
2. Confirm that variants belong to the correct parent and show the expected SKU, price, and image.
3. In a correctly identified test session, view the product and confirm the real event on the intended profile, with its product, timestamp, and source. Catalog synchronization or a `received` response does not by itself confirm the event was recorded.
4. If the environment supports it, add the product to a cart and place an authorized test order, avoiding unintended real charges, deliveries, or communications. If no safe environment is available, leave this check pending.
5. Compare catalog identifiers with the event, cart, and order-item identifiers; do not rely on the name alone. Check quantity, amount, and currency against that integration contract.
6. Change a supported field only in the test source, allow processing, and retrieve the existing product again. Retain its ID and confirm no duplicate appeared.
7. Inspect the playbook preview or playground after validating the data. A simulation does not confirm a real send; any delivery test requires authorization and isolated destinations.

In **Settings > Objects > Orders**, open **Edit** and inspect the item. This line belongs to an existing fictional **custom_store** draft order: **Weekly planner**, quantity **2**, and unit amount **USD 44.95**, totaling **USD 89.90**. The earlier catalog view retains the same demonstration product under the display name **Agenda semanal**; resolve it by its recorded identity, not a translated label. An order amount is separate from the current catalog price. This view does not expose the IDs or prove a purchase or event; verify those relationships in your identity mapping and order readback.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real item control for a fictional order: Weekly planner, quantity 2, and USD 44.95 unit amount.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/items-en-mobile.png 2x" width="714" height="572" />
        <img src="/images/developers/orders-with-api/items-en.png" srcset="/images/developers/orders-with-api/items-en.png 2x" style="width: auto; margin: 0 auto;" width="942" height="572" loading="lazy" decoding="async" alt="Real item control for a fictional order: Weekly planner, quantity 2, and USD 44.95 unit amount." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing draft with no events; custom_store quantity 2 times USD 44.95 totals USD 89.90. Not a real purchase or delivery.</figcaption>
</figure>

Keep reading: [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Troubleshoot common catalog problems

### A product is missing

Confirm the product meets that platform’s import conditions, the integration and its permissions remain valid, and the first import has finished. Check the source identity and whether the item is a variant under a parent product. Missing from WhatsApp does not mean missing from Hellotext: inspect Meta catalog eligibility and publication separately.

### Price, image, or availability is outdated

Check the source value first and whether the connector synchronizes that field. If it is correct there, allow processing and retrieve the same product or variant again. Retain reference, source, public ID, and change time for comparison. Do not reconnect a working integration to force an update: if later changes also fail to arrive, ask support to inspect the connector and its permissions.

### A product appears more than once

Compare source, product reference, variant reference, SKU, and public IDs. Distinguish the parent from a legitimate variant and the default representation in the API response. A custom integration should update the existing record; do not delete records with history or repeat an uncertain creation to try to fix a duplicate.

### Activity appears without the expected product

Compare the product reference used by the event, cart, or order with the synchronized catalog. For custom tracking, make sure the storefront and backend reuse the same Hellotext product or variant ID.

### An inventory-dependent playbook cannot use the product

Confirm the connected source supplies and checks supported availability for the correct product or variant. The public Products API does not accept stock, sellable quantity, or inventory state fields. Names, prices, metadata, a default active state, or an internal availability response without a verified source do not establish real stock. Keep an inventory-dependent playbook disabled until that capability is confirmed.

If the underlying activity is also missing, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Setup overview]({% link _integrations/setup-overview.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
