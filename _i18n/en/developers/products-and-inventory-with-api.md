Products and variants give Hellotext the catalog context it needs to understand product views, carts, orders, recommendations, and product-related playbooks.

The public Products API synchronizes catalog records. Live stock quantity and availability are a separate concern: the current public product endpoint does not expose a dedicated inventory quantity or availability field.

Use the [API reference](https://www.hellotext.com/api#products) for the complete product and variant contracts. This guide explains how to keep identity stable and how inventory availability differs from catalog synchronization.

## Before you start

Prepare:

- A private API authorization token stored on your backend.
- A stable source name, such as `custom_store`.
- Permanent product and variant references from your commerce system.
- Unique SKUs where your catalog uses them.
- Public product URLs and image URLs.
- Prices and ISO 4217 currency codes.
- Categories, collections, tags, brand, and descriptions useful for discovery and recommendations.

Decide which record is the parent product and which records are purchasable variants before the first sync. Do not change that model between imports.

## 1. Choose stable product identity

Use these fields consistently:

- `source`: the system that owns the catalog, such as `custom_store`.
- `reference`: the permanent product or variant identifier in that source.
- `sku`: the commerce SKU when one exists.

Do not use a product name, URL, price, or position in an import as its identity. Those values can change.

Hellotext can retrieve and update products by ID, reference, or SKU. Store the returned Hellotext ID anyway; it is the safest identifier for later events and order items.

## 2. Create a product and its variants

Create the parent product with the variants known at that time:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/products \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Everyday Sneakers",
    "reference": "product-100",
    "source": "custom_store",
    "brand": "Acme",
    "url": "https://shop.example.com/products/everyday-sneakers",
    "image_url": "https://shop.example.com/images/everyday-sneakers.jpg",
    "price": {
      "amount": 89.90,
      "currency": "USD"
    },
    "categories": ["Shoes"],
    "collection": ["Everyday"],
    "tags": ["Comfort"],
    "variants": [
      {
        "name": "Everyday Sneakers / Black / 42",
        "reference": "variant-100-black-42",
        "sku": "SKU-100-BLK-42",
        "price": {
          "amount": 89.90,
          "currency": "USD"
        }
      }
    ]
  }'
```

The product `name` is required. Use a publicly accessible image URL because Hellotext needs to download the image.

Save the returned product and variant IDs. See [Create a product](https://www.hellotext.com/api#create_a_product) for every supported field.

## 3. Update the existing record when catalog data changes

Do not create a new product because its price, name, image, URL, categories, or tags changed.

Update the existing product by its Hellotext ID, reference, or SKU:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/attribution/products/product-100 \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "price": {
      "amount": 79.90,
      "currency": "USD"
    },
    "tags": ["Comfort", "Sale"]
  }'
```

Keep the original `source` and `reference`. Use the dedicated variant endpoints to create or update individual variants rather than recreating the parent product.

See [Update a product](https://www.hellotext.com/api#update_a_product) and [Product variants](https://www.hellotext.com/api#product_variants).

## 4. Understand the inventory boundary

The public Products API currently does not include a supported field for:

- Current stock quantity.
- Available-to-sell quantity.
- In-stock or out-of-stock state.
- Inventory location balances.

Do not add values such as `stock`, `quantity`, or `available` to `metadata` or custom properties and assume that Hellotext will use them for inventory-aware playbooks. Metadata does not become a supported inventory signal automatically.

Compatible commerce and ERP integrations can let Hellotext check availability directly from the source. If a custom store needs Back-in-Stock Pounce, low-stock urgency, or another workflow that depends on live availability, connect a compatible inventory source or confirm the supported ingestion path with Hellotext before launch.

Do not delete a product merely because it is temporarily out of stock. Deletion is for a product that should no longer remain in the active Hellotext catalog.

## 5. Track product activity with the product ID

Hellotext.js automatically records the page URL, but it cannot infer which catalog product the page represents. Send `product.viewed` explicitly:

```javascript
await Hellotext.track('product.viewed', {
  object: 'PRODUCT_ID',
})
```

Use the variant ID when the customer selected a specific variant and that detail matters to the event.

For carts and orders, reuse the same product or variant IDs. Do not create separate product records for browser activity, cart items, and order items.

See [Tracking events]({% link _developers/tracking-events.md %}) and the [product event reference](https://www.hellotext.com/api#track_product_events).

## 6. Design a safe catalog synchronization

A reliable sync should:

1. Read changed products from the source system.
2. Match them through the stored Hellotext ID or stable source reference.
3. Create only products that do not exist.
4. Patch changed fields on existing products.
5. Create or update variants independently.
6. Retain a mapping between source IDs and Hellotext IDs.
7. Log validation errors without logging the authorization token.

For large catalogs, process bounded batches and preserve your cursor or checkpoint. A failed batch should resume without recreating the products that already succeeded.

## 7. Verify catalog quality

Test a parent product with at least one variant:

- The source and reference match your commerce system.
- SKUs are unique and assigned to the correct variants.
- The name, URL, image, brand, categories, collection, and tags are useful.
- Price and currency match the storefront.
- A product view resolves to the same product.
- A test order uses the same product or variant ID.
- An inventory-dependent playbook is not enabled until live availability has a supported source.

If duplicates or validation errors appear, use [Troubleshoot a custom integration]({% link _developers/troubleshoot-custom-integration.md %}).

## Related guides

- [Product catalog synchronization]({% link _integrations/product-catalog-sync.md %})
- [Integrate a custom store with Hellotext]({% link _developers/custom-store-integration.md %})
- [Create and track orders with the API]({% link _developers/orders-with-api.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %})
