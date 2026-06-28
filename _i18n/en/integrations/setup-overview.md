Use this guide to decide what to connect first when you are setting up Hellotext.

Setup works best when you connect data sources before you launch captures, playbooks, routes, or campaigns. That way Hellotext can build customer profiles, turn activity into signals, and attribute results from the beginning.

## Recommended setup order

### 1. Confirm your access

Before you start, make sure you have admin access to the store, marketplace, Meta Business account, and Hellotext business you want to connect.

For commerce integrations, keep API keys, tokens, or plugin access ready. For WhatsApp, confirm that you can receive SMS or voice calls on the phone number you want to connect.

If the business owner needs to change, complete that account-access task before making broader setup changes. Keep reading: [Transfer business ownership]({% link _integrations/transferring-ownership.md %}).

### 2. Connect your commerce platform

Connect the platform where your customers, products, carts, orders, and purchase activity live.

Choose the guide that matches your store:

- [Connect Wix]({% link _integrations/connect-wix.md %})
- [Connect WooCommerce]({% link _integrations/connect-woo.md %})
- [Connect VTEX]({% link _integrations/connect-vtex.md %})
- [Connect Mercado Libre]({% link _integrations/connect-mercado-libre.md %})

After connecting, check that customers, orders, and recent activity are appearing in Hellotext before you build playbooks, routes, or campaigns from that data.

### 3. Connect WhatsApp if you will use it

Connect WhatsApp before you create WhatsApp captures, playbooks, routes, or campaigns.

If you sell through WhatsApp, connect the commerce platform first and then connect your product catalog to WhatsApp.

Keep reading:

- [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})

### 4. Add capture and checkout tools

Once your data source and messaging channel are ready, add the capture tools customers will use to subscribe.

Start with the places where customers already interact with your brand: your site, checkout, packaging, store, ads, social profiles, or events.

Keep reading: [Capture tools overview]({% link _captures/capture-overview.md %}).

### 5. Verify the setup before launch

Before sending messages broadly, run a small end-to-end test:

- Create or identify a test customer.
- Confirm that the customer appears in Audience.
- Trigger a tracked activity, such as a product view, cart update, order, or marketplace sale.
- Confirm that the activity appears on the customer profile.
- Send a test message through the channel you connected.
- Check that links, captures, and replies behave as expected.

## Troubleshooting checklist

If an integration does not behave as expected, review the basics first:

- The connected account is the correct store, site, marketplace, or Meta Business account.
- The Hellotext business is the right one.
- API keys, tokens, plugin configuration, or app permissions are still valid.
- Storefront domains and checkout scripts match the active store.
- Browser popups are allowed during WhatsApp setup.
- The integration has had enough time to sync after the first connection.

If the setup still does not look right, contact support with the business name, the integration you connected, and the step where the issue appears.
