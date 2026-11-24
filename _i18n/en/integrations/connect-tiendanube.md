Connect your Tiendanube store to bring its catalog, customers and orders into Hellotext, record what shoppers do in the store and at checkout, and see which carts were abandoned.

Start in **Settings > Integrations** in Hellotext. The app adds tracking to your store and checkout without theme changes or code to paste.

## What the integration syncs

- **Catalog:** every product in the store is imported when you connect, with each variant as its own product under its parent. Products then update on their own when you create, edit or delete them. An unpublished or deleted product is archived, and a variant with no stock, when you manage stock, is marked out of stock.
- **Customers, optional:** you can import the customers you already have in Tiendanube when the connection finishes.
- **Orders:** each new order arrives with its products, its total and its shipping address, and is linked to the customer who placed it by email or phone. Hellotext also records when the order is paid, shipped, delivered or cancelled, and full refunds. Orders placed before the connection are not imported.
- **Storefront activity:** page views, product views with their variant, cart changes and cart views.
- **Checkout activity:** the checkout start, and the shopper's identification when they type their email. From then on, what they browsed before is on their profile.
- **Abandoned carts:** when a shopper starts checkout and doesn't buy, Hellotext records the abandoned cart with its products and the link to resume the purchase.

Importing a customer or receiving their email does not grant permission to message them. Check consent for each channel before including them in campaigns.

This integration tracks shopper activity. It does not install Hellotext popups, webchat or the WhatsApp widget.

## Before you connect

Make sure that:

- You have access to **Settings > Integrations** in the Hellotext business that will receive the store's activity. A business connects to a single Tiendanube store, and a store to a single business.
- You can sign in to the store's Tiendanube admin with permission to install apps.
- The Hellotext business has an active subscription.

## Connect from Hellotext

1. In Hellotext, open **Settings > Integrations** and choose **Browse integrations**.
2. Choose **Tiendanube**. Tiendanube opens.
3. If asked, sign in to your store's admin. Tiendanube shows the permissions Hellotext requests: accept them to install the app.
4. Tiendanube sends you back to Hellotext with the store connected and the question about importing your customers.

After connecting, check that visits and orders reach Hellotext using the test below.

## Connect with an installation link

1. If the Hellotext team gave you an installation link, open it while signed in to the Tiendanube store you want to connect. Review and accept the requested permissions.
2. Tiendanube takes you to Hellotext:
   - If you're already signed in to Hellotext, in **Where to install your shop?** choose the business and then **Install**, or choose **Install on a new business**.
   - If you don't have an account, create your account and your business. The store is connected to that business.

## Import your existing customers

1. In **Do you want to import your existing customers?**, choose **Yes, import my existing customers into Hellotext.** or **Not now. I’ll do this later.** and then **Continue**.
2. If you import, choose the lists for new customers and whether to update their existing properties, then choose **Save & Start import**.
3. The import keeps running if you close the page. When it finishes, you'll see how many customers were imported.

Each import creates a **Tienda Nube import #1** list (the number goes up with each import) with the customers it brought in. If you choose **Not now**, you can import them later from **Settings > Integrations**: open the store's menu and choose **Import Customers**.

## Check that everything works

1. In **Settings > Integrations**, confirm that your store appears by name.
2. In your store, open a product, add it to the cart, start checkout and enter a test email. If you can safely place a test order, complete it and note its Tiendanube order number.
3. In Hellotext, go to **Audience**, search for that email and open the profile's **Activity**. Look for the product view, cart activity and checkout start. If you placed an order, open **Placed order** and check that it has the same number as in Tiendanube.

Abandoned carts don't appear right away: Hellotext waits until the shopper stops using the cart or checkout before recording it.

## Disconnect or uninstall

To disconnect from Hellotext, open **Settings > Integrations**, open the store's menu, choose **Remove** and confirm with **Delete**. Hellotext stops receiving orders, products and activity from the store. Data already imported is kept.

To remove the app from the store, uninstall it from the Tiendanube admin, in **My apps**. Hellotext disconnects the store on its own a few minutes later. To connect it again, install the app again with either path in this guide.

## Troubleshoot

- **The store shows as Suspended.** Tiendanube suspended the app for that store, for example for lack of payment. While it lasts, Hellotext receives no orders, products or abandoned checkouts. When Tiendanube reactivates it, Hellotext reads the catalog again; orders that changed during the suspension are not updated.
- **"This business already has a Tienda Nube store connected".** The business already has another store connected. Remove that connection or connect the new store to another business.
- **"This Tienda Nube store is already connected to another Hellotext account".** The store is connected to another Hellotext business. Remove the connection from that business before connecting it here.
- **"Could not authorize the Tienda Nube store".** Tiendanube didn't complete the authorization. Choose **Tiendanube** in **Browse integrations** again and accept the permissions.
- **Store activity doesn't appear.** If the order appears but the browsing activity is missing, check that Hellotext is still installed under **My apps** in Tiendanube. Repeat the test in a private window without ad blockers. If it still fails, send support the store URL or ID, the page you tested, the approximate time and the order number if available.
- **An order takes a while to appear.** A new order can take a few minutes to arrive. If it hasn't appeared after 30 minutes, share the order number and the time with support.

When asking Hellotext support for help, share the store name, the order number or the shopper's email, the time of the problem and the exact message. Don't share passwords or tokens.

## Related guides

- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Product catalog sync]({% link _integrations/product-catalog-sync.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How customer profiles work]({% link _audience/customer-profiles.md %})
