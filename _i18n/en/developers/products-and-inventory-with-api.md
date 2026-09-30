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

The token, products, and variants must belong to the same business. Creation and updates require an active subscription. Keep the secret only on your backend; the public business ID used by Hellotext.js does not replace the token.

To prepare authorization, open **Settings → Authorizations → Create a new token**. The figure shows only a fictional draft name, without creating or revealing a secret.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional authorization token name for a custom store, unsaved and without showing a secret.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-en-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-en.png" srcset="/images/developers/custom-store-integration/token-spacing/token-en.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Fictional authorization token name for a custom store, unsaved and without showing a secret." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Actual draft in a fictional business: it does not create or reveal a token. Keep the secret only on your backend.</figcaption>
</figure>

## 1. Choose stable product identity

Use these fields consistently:

- `source`: the system that owns the catalog, such as `custom_store`.
- `reference`: the permanent product or variant identifier in that source.
- `sku`: the commerce SKU when one exists.

Do not use a product name, URL, price, or position in an import as its identity. Those values can change.

Hellotext can retrieve and update products by ID, reference, or SKU. Store the returned public Hellotext ID anyway; it is the safest identifier for later events and order items. `reference` identifies the product in your system; it is not that public ID.

A reference can recur across different sources. Retrieval and update endpoints do not include a `source` selector to resolve that ambiguity: use the stored ID and check the source in the response. Keep SKUs unique in your integration; do not distinguish references or SKUs only by capitalization.

In **Settings → Objects → Products → Edit**, compare name, reference, SKU, and source. The fictional “Agenda semanal” product in the figure has reference `PRODUCT-GUIDE-1001` and SKU `GUIDE-PLANNER`; these are catalog data, without proving stock or customer activity.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual editor of fictional Agenda semanal product with PRODUCT-GUIDE-1001 reference, GUIDE-PLANNER SKU, and custom_store source.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/identity-en-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-en.png" srcset="/images/developers/products-and-inventory-with-api/identity-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Actual editor of fictional Agenda semanal product with PRODUCT-GUIDE-1001 reference, GUIDE-PLANNER SKU, and custom_store source." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Catalog data of the existing fictional draft product with no events. Reference and SKU are not the public product ID or an inventory signal.</figcaption>
</figure>

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

The product `name` is required. Use a publicly accessible image URL because Hellotext needs to download the image. The example's `shop.example.com` URLs are placeholders: replace them with real URLs before using it.

Successful product creation returns HTTP 201 and the object; failed validation returns HTTP 422 with errors. Saving the product does not record a customer view, purchase, or consent. Check the response and retrieve `GET /v1/attribution/products/:id` before continuing.

The response's `variants` collection can start with a default-variant representation of the parent product itself. Keep the parent and variant IDs without recreating that first record. To add a variant later, use `POST /products/:product_id/variants` under `/v1/attribution`; retrieve, update, or delete an existing variant through `/v1/attribution/variants/:id`.

Save the returned product and variant IDs. See [Create a product](https://www.hellotext.com/api#create_a_product) for every supported field.

## 3. Update the existing record when catalog data changes

Do not create a new product because its price, name, image, URL, categories, or tags changed.

Prefer updating the existing product by its stored public ID. In the following URL, `PRODUCT_ID` is a placeholder to replace with that ID:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/attribution/products/PRODUCT_ID \
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

When updating the parent, omit `variants` if you want to keep its variants unchanged. **Sending `variants: []` removes existing variants from the catalog**; it is not a neutral list that leaves everything as it was. Do not assume resending the original list updates every existing variant: use its endpoint and ID.

`price.amount` is a decimal monetary amount, not cents or stock units; specify `price.currency`. Retrieve the product or variant again to check the amount and, where relevant, `converted_amount` and `converted_currency`. Do not assume a new price applies to every variant or corrects previously recorded orders.

The editor's **Amount** and **Converted amount** fields represent money here. The figure preserves USD 44.95 and its USD 44.95 equivalent; opening the control does not save a price change or report how many units are available.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actual USD 44.95 amount control and USD 44.95 converted amount for a fictional product.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/price-en-mobile.png 2x" width="714" height="300" />
        <img src="/images/developers/products-and-inventory-with-api/price-en.png" srcset="/images/developers/products-and-inventory-with-api/price-en.png 2x" style="width: auto; margin: 0 auto;" width="942" height="300" loading="lazy" decoding="async" alt="Actual USD 44.95 amount control and USD 44.95 converted amount for a fictional product." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Amount represents money in this interface. The control was opened without saving; it does not represent stock units or a price change.</figcaption>
</figure>

See [Update a product](https://www.hellotext.com/api#update_a_product) and [Product variants](https://www.hellotext.com/api#product_variants).

## 4. Understand the inventory boundary

The public Products API currently does not include a supported field for:

- Current stock quantity.
- Available-to-sell quantity.
- In-stock or out-of-stock state.
- Inventory location balances.

Do not add values such as `stock`, `quantity`, or `available` to `metadata` or custom properties and assume that Hellotext will use them for inventory-aware playbooks. Metadata does not become a supported inventory signal automatically.

A default availability value for a custom catalog does not prove real stock either. Verify availability against the system that manages inventory.

Compatible commerce and ERP integrations can let Hellotext check availability directly from the source. If a custom store needs Back-in-Stock Pounce, low-stock urgency, or another workflow that depends on live availability, connect a compatible inventory source or confirm the supported ingestion path with Hellotext before launch.

Do not delete a product merely because it is temporarily out of stock. Deletion is for a product that should no longer remain in the active Hellotext catalog.

## 5. Track product activity with the product ID

In the published `@hellotext/hellotext` 2.6.0 SDK, initialization is asynchronous and does not automatically send `page.viewed`. Wait for it to finish, record each navigation once, and send `product.viewed` with the correct product. The SDK includes URL and session context; it cannot infer which catalog product that page represents.

If your integration already initializes Hellotext.js and records the navigation, do not repeat those calls; add only the product view. `PUBLIC_BUSINESS_ID` and `PRODUCT_ID` are placeholders for IDs from the same business:

The example uses `await` inside a JavaScript module or an `async` function.

```javascript
await Hellotext.initialize('PUBLIC_BUSINESS_ID')
await Hellotext.track('page.viewed')
await Hellotext.track('product.viewed', {
  object: 'PRODUCT_ID',
})
```

Use the variant ID when the customer selected a specific variant and that detail matters to the event.

For carts and orders, reuse the same product or variant IDs. Do not create separate product records for browser activity, cart items, and order items.

For backend tracking, send the profile or session from the same business; when sending both, the session must already be associated with that profile. A browser session does not imply messaging consent. Preserve the event's actual date with `tracked_at` when needed: Unix seconds or ISO 8601 with a time zone, not milliseconds.

The tracking response `status: received` confirms receipt; it does not return a new product ID or prove processing, appearance in a report, or playbook execution. Verify the event and its object afterward in the correct profile's activity. Do not send the same view from both the browser and backend.

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

For large catalogs, process bounded batches and preserve the cursor or checkpoint from the paginated list. Reconcile `source`, `reference`, SKU, and stored IDs in your system; do not assume an undocumented source filter in the list endpoint.

The API does not expose a general idempotency key. When creation times out or its response is lost, the result is uncertain: retrieve or reconcile before repeating the `POST`. A failed batch should resume without recreating the products that already succeeded. Correct validation errors before retrying and avoid parallel calls that try to create the same identity.

## 7. Verify catalog quality

Test a parent product with at least one variant in an isolated test business with fictional data and inactive playbooks. Retrieve the parent and each variant through the API and compare the visible data in **Settings → Objects → Products → Edit**:

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
