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

Not every field is required for a product to appear. Complete, current data gives recommendations and product messages better context.

## Why the catalog matters

Hellotext combines the catalog with customer signals. A product view, cart update, or order is most useful when it resolves to the same product and variant that Hellotext already knows.

This connection supports experiences such as:

- [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) and sales agents that search for relevant products.
- [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) and [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}), which use the products a customer considered.
- [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) and [Complete-the-Look]({% link _journeys/complete-the-look-playbook.md %}), which look for useful product relationships.
- [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}) and [Price-Drop Pouncer]({% link _journeys/price-drop-pouncer.md %}), which depend on changes in availability or price.
- [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}), which combines product and purchase history to estimate the next useful moment.

A connected catalog also gives teammates and AI agents better product context when they help a customer in the Inbox.

## Choose the source of truth

Use the system where your business manages products as the source of truth.

For Shopify, Wix, WooCommerce, and VTEX, connect the native store integration. Hellotext imports supported product information and keeps it updated as the platform sends changes or the integration refreshes it.

For a custom store, synchronize products and variants with the API. Browser and server-side events must reuse those product identities. The public Products API does not currently provide a dedicated live inventory field, so confirm a supported inventory source before enabling a playbook that depends on availability.

If you connect a catalog to WhatsApp, your store remains the source of the products. Hellotext then publishes the synchronized products to the Meta catalog you selected. The Meta catalog is a destination for commerce in WhatsApp, not a replacement for connecting the store.

Do not maintain the same product independently in several systems unless one source clearly owns it. Conflicting references, prices, or availability can create duplicates or stale product context.

## Keep product identity consistent

The most important catalog rule is to keep product and variant references stable.

Use the same product or variant identity in:

- The synchronized catalog.
- Product-view events.
- Cart items.
- Order items.
- Server-side events or custom integrations.

Names, URLs, prices, and positions in an import can change and should not be used as identifiers.

If an event uses a different reference from the catalog, Hellotext may receive the activity but fail to connect it with the product the playbook needs. This can cause missing images, incomplete cart context, duplicate products, or recommendations that omit the item.

## Which fields should you review?

Start with the fields that affect every product experience:

- **Identity:** stable product and variant references, plus SKU when your store uses it.
- **Display:** name, public product URL, and at least one accessible image.
- **Commerce:** current price and currency.
- **Availability:** active, unavailable, or out-of-stock state when the source supports it.
- **Structure:** parent product and purchasable variants.

Then improve discovery and recommendation quality with brand, description, category, collection, tags, color, size, material, or other useful attributes supplied by the source.

Use product-level data for information shared by the whole family and variant-level data for differences such as size, color, SKU, price, image, or availability.

## How updates reach Hellotext

The initial import starts after you connect a compatible store. Large catalogs can take longer to finish, so allow the first synchronization to complete before evaluating recommendations or inventory-dependent playbooks.

After that, Hellotext updates supported fields when the commerce platform reports a product change or when the integration performs its own refresh. The exact delay can vary by platform and catalog size.

Make price, image, category, variant, and availability corrections in the source of truth. Then allow the integration to synchronize them. Avoid creating a second product in Hellotext to work around an outdated record.

For custom stores, your integration is responsible for updating the existing API product whenever supported catalog data changes.

## Verify the catalog before launch

Test one parent product with at least one variant when possible.

1. Confirm that the name, price, currency, image, URL, and availability match the store.
2. Confirm that variants belong to the correct parent and show the expected SKU, price, and image.
3. View that product on the storefront and confirm the activity appears on the right customer profile.
4. Add the product to a cart and place a test order.
5. Confirm that the view, cart, and order all resolve to the same product or variant.
6. Change a supported field in the source, allow time for synchronization, and confirm the existing product updates without creating a duplicate.
7. Test the relevant playbook or its playground only after the underlying product data looks correct.

Keep reading: [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Troubleshoot common catalog problems

### A product is missing

Confirm that the product is active or published in the connected store, that the integration is still connected, and that the first import has finished. Check whether the item is a variant that should appear under a parent product.

### Price, image, or availability is outdated

Check the value in the source of truth first. If it is correct there, allow time for the integration to process the update. Reconnect or contact support only after confirming that later changes are also not arriving.

### A product appears more than once

Compare the source, product reference, variant reference, and SKU. A custom integration should update the existing record instead of creating a new product for each import or price change.

### Activity appears without the expected product

Compare the product reference used by the event, cart, or order with the synchronized catalog. For custom tracking, make sure the storefront and backend reuse the same Hellotext product or variant ID.

### An inventory-dependent playbook cannot use the product

Confirm that the connected source provides supported availability data. Product names, prices, and custom metadata alone do not create a live inventory signal.

If the underlying activity is also missing, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Related guides

- [Setup overview]({% link _integrations/setup-overview.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Sync products and understand inventory availability]({% link _developers/products-and-inventory-with-api.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
