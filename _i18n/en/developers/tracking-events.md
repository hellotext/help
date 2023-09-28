One of the most powerful marketing techniques is the ability to track what your customers do when they interact with your brand. This could be when they browse your site or visit your physical store. Tracking your customers actions in an unified way unlocks an unprecedented number of possibilities: segment your audience based on their behavior to reach them with better precision campaigns, trigger automations based on what customers do and let your team use this data as it happens as opportunities to engage and sell more.

One of the key aspects that makes Hellotext unique is its ability to easily track all the important actions that your customers perform from any source that matters to you: that can be what they do at your eCommerce site, your physical retail shop or in any other valuable interaction.

## Understanding Actions

Actions are the generic activities that your customers do. 

They are grouped by their kind of action and separated by a dot. 

For example, examples of actions are:

### Cart actions

* `cart.abandoned` A cart was abandoned.
* `cart.added` Added an item to the cart.
* `cart.removed` Removed an item from the cart.

### Order actions

* `order.placed` Order has been placed.
* `order.confirmed` Order has been confirmed by you.
* `order.cancelled` Order has been cancelled either by you or your customer.
* `order.shipped` Order has been shipped to your customer.
* `order.delivered` Order has been delivered to your customer.

### Product actions

* `product.purchased` A product has been purchased.
* `product.viewed` A product page has been viewed.

### Coupon actions

* `coupon.redeemed` A coupon was redeem by a customer.

### Refund actions

* `refund.requested` A customer requested a refund.
* `refund.received` A refund was issued by you to your customer.

### Page views actions

* `page.viewed` A page was viewed by a customer.

### App actions

* `app.install` An app was installed.
* `app.remove` An app was removed.
* `app.spent` A customer spent on an app.

### Form actions

* `form.completed` A form was completed by the customer.

### Custom actions

It is possible to create your own defined actions directly using the API. For example:

* `signup_form.completed`
* `physical_store.paid`
* `event.attendance`

Learn more on the **[API Reference for Actions](https://www.hellotext.com/api#actions)**.

## Understanding Events

An event is the object that creates a relationship between an action and the subscriber at a particular time. 

It is the object that is created when you track an action of a customer.

## Ways to track events

* Using one of the integrations like Mercado Libre. 
* Using Javascript.
* Using the API.

## Tracking with Integrations

### Mercado Libre

If you sell on Mercado Libre you track track your customers purchases automatically. 

Simply connect your Mercado Libre account with just a few clicks and you will start tracking the following events immediately:

* `order.confirmed` Order has been confirmed by you.
* `order.shipped` Order has been shipped to your customer. 
* `order.cancelled` Order has been cancelled either by you or your customer.
* `refund.requested` A customer requested a refund.
* `refund.received` A refund was issued by you to your customer.

## Tracking events programmatically

### Tracking with Javascript

To track client side events you can use the **[Hellotext.js](https://github.com/hellotext/hellotext.js)** javascript library. 

Please refer to the Github repository at **[hellotext/hellotext.js](https://github.com/hellotext/hellotext.js)** to see the latest installation and configuration instructions.

### Tracking using the API

Learn more on **[API Reference for Tracking](https://www.hellotext.com/api#tracking)**.
