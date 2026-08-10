Connect Fenicio so Hellotext can bring in customer profiles, the product catalog, availability, orders, and storefront activity.

The connection has two parts. First, you enter the store details in Hellotext. Then Fenicio must authorize Hellotext access and install the tracking code on your site. The integration is not fully active until Fenicio confirms that second step.

## What the integration syncs

Once active, the integration lets Hellotext:

- Create and update customer profiles with the data available in Fenicio, such as name, email, phone number, gender, and identification document.
- Import existing customers if you choose to do so during setup.
- Import products and variants with prices, images, categories, and availability state.
- Import orders and update states such as confirmed, shipped, delivered, or canceled.
- Receive storefront activity through the tracking code installed by Fenicio.
- Use this data as signals for segments, playbooks, journeys, reports, and attribution.

The historical customer import is optional. Even if you skip it, Hellotext can create or update customer profiles from new orders and activity received after the integration becomes active.

## Before you connect

Confirm that:

- You are an owner or administrator of the business in Hellotext.
- Your Hellotext subscription is active.
- You have the store domain, for example `mystore.com`.
- You have the **Business ID** assigned to your store by Fenicio.
- You can open a support ticket with Fenicio to authorize Hellotext.
- You have decided whether to import existing customers during setup.

If you do not know the Business ID, request it from Fenicio before you begin.

## Connect your Fenicio account

1. In Hellotext, go to **Settings**.
2. Select **Integrations**, then **Explore integrations**.
3. Find **Fenicio** and open the integration.
4. Enter the store domain and **Business ID**.
5. Select **Continue**.
6. Choose whether to import existing Fenicio customers. You can skip this import and run it later.
7. Finish the initial setup in Hellotext.

The integration remains pending while Fenicio authorizes access.

## Request authorization from Fenicio

After completing the steps in Hellotext:

1. Open a support ticket with Fenicio.
2. Ask Fenicio to authorize Hellotext access to your store.
3. Ask Fenicio to install the Hellotext tracking code on the site.
4. Wait for confirmation from Fenicio.
5. In Hellotext, return to **Settings > Integrations**.
6. On the Fenicio integration, select **Check integration**.

When Hellotext can connect successfully, the integration becomes active and starts the configured import. Products and orders are imported automatically; existing customers are imported if you accepted that option.

The initial import can take time depending on the catalog size and store history. New orders are checked periodically, so they may take a few minutes to appear.

## Verify synchronized data

After the integration appears as active:

1. Open a few customer profiles and confirm that they contain the Fenicio identity and expected data.
2. Review the catalog and confirm that products, variants, prices, and inventory match the store.
3. Find a few existing orders and verify their products, amounts, and states.
4. Place a test order and confirm that it appears in Hellotext after a few minutes.
5. Browse the store and confirm that Hellotext receives activity after Fenicio installs the tracking code.

Before enabling playbooks or journeys that depend on this data, follow the guide to [verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Troubleshoot the connection

If Hellotext cannot verify the integration:

1. Confirm that the domain and Business ID belong to the same Fenicio store.
2. Verify with Fenicio that Hellotext access has been authorized.
3. Confirm that Fenicio installed the correct tracking code.
4. Return to **Settings > Integrations** and select **Check integration**.

If the integration is active but data is missing:

- Wait for the initial import to finish.
- Allow a few minutes for recent orders or changes to synchronize.
- Confirm in Fenicio that the missing order, customer, or product belongs to the connected store.
- For missing browsing activity, confirm with Fenicio that the tracking code is installed and active.

If the problem continues, contact Hellotext support with the store domain, Business ID, and, when relevant, the ID of a missing order or product.

## Related guides

- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Product catalog sync]({% link _integrations/product-catalog-sync.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How customer profiles work]({% link _audience/customer-profiles.md %})
