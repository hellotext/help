Connect your Tiendanube store to bring its catalog, customers and orders into Hellotext, record what shoppers do in the store and at checkout, and see which carts were abandoned.

You connect by installing the Hellotext app on Tiendanube, from Hellotext or from the Tiendanube App Store. You don't need to edit your theme or paste code: the app installs its own scripts in the store and at checkout.

## What the integration syncs

- **Catalog:** every product in the store is imported when you connect, with each variant as its own product under its parent. Products then update on their own when you create, edit or delete them. An unpublished or deleted product is archived, and a variant with no stock, when you manage stock, is marked out of stock.
- **Customers, optional:** you can import the customers you already have in Tiendanube when the connection finishes.
- **Orders:** each new order arrives with its products, its total and its shipping address, and is linked to the customer who placed it by email or phone. Hellotext also records when the order is paid, shipped, delivered or cancelled, and full refunds. Orders placed before the connection are not imported.
- **Storefront activity:** page views, product views with their variant, cart changes and cart views.
- **Checkout activity:** the checkout start, and the shopper's identification when they type their email. From then on, what they browsed before is on their profile.
- **Abandoned carts:** when a shopper starts checkout and doesn't buy, Hellotext records the abandoned cart with its products and the link to resume the purchase.

Importing a customer or receiving their email does not grant permission to message them. Check consent for each channel before including them in campaigns.

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

## Connect from the Tiendanube App Store

1. In the Tiendanube App Store, find **Hellotext** and install it. Accept the permissions it requests.
2. Tiendanube takes you to Hellotext:
   - If you're already signed in to Hellotext, in **Where to install your shop?** choose the business and then **Install**, or choose **Install on a new business**.
   - If you don't have an account, create your account and your business. The store is connected to that business.

## Import your existing customers

1. In **Do you want to import your existing customers?**, choose **Yes, import my existing customers into Hellotext.** or **Not now. I’ll do this later.** and then **Continue**.
2. If you import, choose the lists for new customers and whether to update their existing properties, then choose **Save & Start import**.
3. The import keeps running if you close the page. When it finishes, you'll see how many customers were imported.

Each import creates a **Tienda Nube import #1** list (the number goes up with each import) with the customers it brought in. If you choose **Not now**, you can import them later from **Settings > Integrations**: open the store's menu and choose **Import Customers**.

## Check that everything works

- **In Settings:** the store appears in **Settings > Integrations** with its name.
- **In the store:** open a product, add it to the cart, start checkout and type a test email.
- **In Hellotext:** open **Audience**, find that email and check its **Activity**: the added product, the viewed cart and the started checkout appear there. If you complete the purchase, the order appears as **Placed order** with its Tiendanube number a few minutes later.

Abandoned carts don't appear right away: Hellotext waits until the shopper stops using the cart or checkout before recording it.

## Disconnect or uninstall

To disconnect from Hellotext, open **Settings > Integrations**, open the store's menu, choose **Remove** and confirm with **Delete**. Hellotext stops receiving orders, products and activity from the store. Data already imported is kept.

To remove the app from the store, uninstall it from the Tiendanube admin, in **My apps**. Hellotext disconnects the store on its own a few minutes later. To connect it again, install the app again with either path in this guide.

## Troubleshoot

- **The store shows as Suspended.** Tiendanube suspended the app for that store, for example for lack of payment. While it lasts, Hellotext receives no orders, products or abandoned checkouts. When Tiendanube reactivates it, Hellotext reads the catalog again; orders that changed during the suspension are not updated.
- **"This business already has a Tienda Nube store connected".** The business already has another store connected. Remove that connection or connect the new store to another business.
- **"This Tienda Nube store is already connected to another Hellotext account".** The store is connected to another Hellotext business. Remove the connection from that business before connecting it here.
- **"Could not authorize the Tienda Nube store".** Tiendanube didn't complete the authorization. Choose **Tiendanube** in **Browse integrations** again and accept the permissions.
- **Store activity doesn't appear.** Check that the app is still installed in Tiendanube's **My apps** and test in a private window without ad blockers. Views and cart activity land on the shopper's profile once they type their email at checkout.
- **An order takes a while to appear.** A new order can take a few minutes to arrive. If it hasn't appeared after 30 minutes, share the order number and the time with support.

When asking Hellotext support for help, share the store name, the order number or the shopper's email, the time of the problem and the exact message. Don't share passwords or tokens.

## Related guides

- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Product catalog sync]({% link _integrations/product-catalog-sync.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How customer profiles work]({% link _audience/customer-profiles.md %})
