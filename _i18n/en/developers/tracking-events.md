Tracking events turns customer behavior into signals Hellotext can use across customer profiles, segments, attribution, playbooks, and the Inbox. Signals can come from your ecommerce site, physical store, custom backend, forms, conversations, or any other source that matters to your business.

Those signals help Hellotext decide when to trigger a playbook, update a segment, enrich a customer profile, support an agent, or attribute revenue to the right action.

For the broader product concept, start with [What are signals?]({% link _journeys/what-are-signals.md %}).

If events are not appearing where expected, use [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) to check identity, action names, integrations, triggers, and reports.

## Understanding Actions

Actions are the generic activities that your customers do.

They are grouped by their kind of action and separated by a dot. 

For example:

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

* `coupon.redeemed` A coupon was redeemed by a customer.

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

An event is the object that creates a relationship between an action and a customer profile at a particular time.

It is created when you track an action from a customer and becomes part of the signal history Hellotext can use later.

## Ways to track events

* Using one of the integrations like Mercado Libre. 
* Using Javascript.
* Using the API.

## Tracking with Integrations

### Mercado Libre

If you sell on Mercado Libre you can track your customers' purchases automatically.

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
