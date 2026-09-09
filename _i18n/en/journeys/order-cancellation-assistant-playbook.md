Use this guide when customers ask to cancel an order after purchase, especially before the order has shipped or been fulfilled.

Order Cancellation Assistant is a reactive post-purchase support playbook. It helps customers understand whether cancellation may be possible, collects the context your team needs, offers useful alternatives when appropriate, and hands off when a person must decide or take action.

It is not a general FAQ agent and it should not promise that an order has been cancelled unless the action is actually completed by your business process. It works best when your cancellation policy, order data, handoff rules, and save-the-sale options are clear.

## What Order Cancellation Assistant does

Order Cancellation Assistant helps customers move through an order cancellation request.

It can:

- Respond when a customer asks to cancel, undo, or stop an order.
- Use order context when it is available to help identify the purchase.
- Ask for missing details such as order number, customer information, item, reason, or urgency.
- Explain whether cancellation may still be possible based on approved policy and order status.
- Offer alternatives when appropriate, such as updating the request, choosing a replacement, getting order-status help, or speaking with a person.
- Hand off when the cancellation needs approval, an operational action, payment review, or exception handling.
- Work alongside [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), Webchat, Inbox assignment, and response rules.

The playbook should stay grounded in order and policy data. If the order state is unclear, the customer asks for a decision, or the cancellation requires an action outside the playbook, it should hand off instead of guessing.

## When to use it

Use Order Cancellation Assistant when:

- Customers often ask to cancel orders after purchase.
- Your team wants AI to handle the first support step before a person reviews exceptions.
- Your cancellation policy has repeatable rules, such as cutoff time, fulfillment status, shipping state, payment method, or final-sale limitations.
- You want to understand why customers cancel and save the sale when a helpful alternative exists.
- You want cancellation requests to land in the Inbox with the right owner when a person is needed.

It is a good fit for pre-shipment cancellation requests, collecting cancellation reasons, explaining policy, and routing cases to the right next step.

## When not to use it

Do not use Order Cancellation Assistant as the owner for every post-purchase request.

Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when the customer mainly asks where an order is, whether it shipped, or how to track a package.

Use [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) when the customer wants to return or exchange an order that was already delivered or can no longer be cancelled.

Use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) when the customer only needs a general explanation of the cancellation policy.

Use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) when the customer still wants help choosing a different product before buying.

Use the Inbox directly when the case involves fraud concerns, payment disputes, legal language, high-value exceptions, or a customer who is very upset.

## What it needs before launch

Before enabling Order Cancellation Assistant, confirm:

- Your cancellation policy is current and approved.
- The policy explains when cancellation is possible, when it is too late, and what happens after a cancellation request.
- Order data is available when the playbook should identify purchases.
- Your team knows which cancellation cases the playbook may handle and which cases require a person.
- Any save-the-sale options are approved, such as changing the request, offering a replacement, or routing to a sales teammate.
- The incoming channels where customers ask to cancel are connected and ready.
- A teammate or team is configured for handoff.
- Response rules and business hours match the urgency of cancellation requests.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Order Cancellation Assistant**.

Start with the two components that define how cancellation requests should be handled:

- **Cancellation policy:** the latest order stage you accept for cancellation, returns guidance, and permission for partial cancellation.
- **Save strategy:** whether to offer an alternative before cancellation, which alternatives are allowed, and the maximum store credit.

Then configure the supporting components:

- **Assignment:** the teammate or team that should take over when a person is needed.
- **Upload documents:** cancellation and return policies, product restrictions, payment guidance, refund expectations, and internal support instructions.
- **Outgoing channel:** the channel the assistant uses to reply.
- **Tone:** the voice used in replies.
- **Prompt:** additional instructions for your business, including exceptions and handoff expectations.
- **Discount:** discount permissions and limits. Configure discounts here, separately from the store-credit limit in Save Strategy.
- **Web search:** approved websites the assistant can consult for policy information.

The two components set your business's rules and permissions. Enabling an option does not itself cancel an order, change an item, issue a refund, or grant credit. The assistant should only confirm an action after it has been completed; requests that cannot be completed through the available store connection need your team.

## Cancellation Policy component

Use **Cancellation policy** to define when the assistant can continue with a cancellation request and what it should offer when cancellation is no longer possible.

> **Integration required for partial cancellation:** Connect Shopify or VTEX to enable **Allow partial cancellation**. Without either connection, that option is disabled and grayed out. The cancellation-stage setting and returns guidance are general policy settings. You do not need both integrations connected.

| Option | What it means |
| --- | --- |
| **Allow cancellation until** | Choose the latest order stage your business accepts. The selected stage is included, along with the earlier stages listed below. Your store's restrictions and the order's eligibility still apply. |
| **Offer returns after shipping** | When a shipped or delivered order cannot be cancelled, guide the customer to your returns process. This is guidance: it does not open a return request or issue a refund. Turn it off if these cases should go to your team instead. |
| **Allow partial cancellation** | Allow a request to remove selected items while keeping the rest of the order. Use it only when your connected store supports the change for that order. It is different from replacing an item, which is configured in Save Strategy. |

### Choosing the cancellation stage

The dropdown offers four stages. **Until includes the selected stage**, rather than stopping just before it.

| Selected option | Stages included in your policy |
| --- | --- |
| **Placed an order** | Placed only. |
| **Order confirmed** | Placed and confirmed. |
| **Order shipped** | Placed, confirmed, and shipped. |
| **Order delivered** | Placed, confirmed, shipped, and delivered. |

For example, choose **Order confirmed** if your policy should stop accepting cancellations once the order is shipped. Choosing **Order shipped** includes the shipped stage in your business policy, but does not override a store restriction that prevents cancelling an order after shipment. The same applies to delivered orders.

Checkout started, printed shipping labels, and already-cancelled orders are not cutoff options. An order inside your selected window can still need review because of its payment, refund, cancellation, or fulfillment status. Keep the uploaded policy consistent with these settings so the assistant can explain the next step clearly.

## Save Strategy component

Use **Save strategy** to authorize a useful alternative when a customer asks to cancel. The alternative should address the customer's reason, and the customer can decline it and continue with the cancellation request.

> **Shopify or VTEX required:** Save Strategy requires a connection to one of these platforms. A connection does not guarantee that every action is available: item changes, shipping refunds, and store credit depend on the platform, the store's setup, and the particular order. If an action is unavailable, your team must handle it. You do not need both integrations connected.

| Option | What it means |
| --- | --- |
| **Try to keep the order** | Turn on the strategy to allow a relevant, approved alternative before proceeding with cancellation. Turn it off to handle the cancellation request without a save attempt. The other strategy controls are then disabled and dimmed, while their saved values are kept for later. |
| **Offer item replacement** | Allow another item, size, color, or variant to be proposed when the order can still be edited. This is an adjustment to an existing order before preparation, where supported, rather than an exchange of an item already delivered. |
| **Offer a shipping refund** | Allow a refund of shipping charges already paid as an incentive to keep the order, where supported. It does not speed up delivery, change the shipping service, or make a future shipment free. |
| **Offer store credit** | Allow credit for a future purchase as an incentive to keep the current order, where supported. Store credit is separate from a refund of the original payment. Enabling it reveals the maximum-credit amount and currency. |
| **Maximum store credit** | Set the maximum credit the assistant may offer for one order, using the amount and currency selector. Enter an amount greater than zero when store credit is enabled. This is a monetary limit, not a percentage or a promise to offer the full amount every time. |

For example, a maximum store credit of **10 USD** authorizes an offer of up to **10 USD for an order**. Choose the currency your business intends to use for that credit. This setting does not control shipping refunds or discounts; discount limits belong to the separate **Discount** component.

Enable only the alternatives your team is prepared to honor. These permissions do not override store restrictions or make an unavailable operation possible. If the customer declines an alternative, continue with their cancellation request or the appropriate handoff, rather than repeating the offer.

## Prepare cancellation policy knowledge

The playbook needs policy content that is specific enough to guide the customer.

Include:

- When an order can be cancelled.
- Which order states are too late to cancel.
- What happens when the order is already packed, fulfilled, shipped, picked up, delivered, or handed to a carrier.
- Whether payment authorization, capture, refund, store credit, or cancellation fees apply.
- Whether certain products are final sale, personalized, perishable, digital, or otherwise not cancellable.
- What information the team needs before reviewing the request.
- Which cases should move to returns, exchanges, order updates, or the Inbox.
- What the customer should expect after the request is received.

Avoid vague policy content such as "contact us to cancel" if you want the playbook to answer consistently. If the policy changes, update the source before expecting the playbook to use the new rule.

## Define save-the-sale boundaries

Use **Save strategy** to choose the alternatives your team approves. An item replacement can help with a wrong size or color; a shipping refund may help with a shipping-cost concern; store credit can be offered only within the amount and currency you configured.

A customer asking where an order is may need [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), while someone choosing another product may need [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}). Use a person when the reason is unclear, sensitive, or requires an exception. Do not pressure a customer to keep an order or promise an alternative the store cannot provide.

## Define what needs a person

Cancellation requests often need human judgment or an operational action.

Configure handoff or team ownership for cases such as:

- The customer needs a cancellation that cannot be completed through the available store connection.
- The order is outside your cancellation policy or the store prevents the requested change, and returns guidance does not resolve the request.
- The request needs payment review, refund approval, fraud review, or account verification.
- The customer asks for an address, payment-method, or delivery-instruction change, or an item change that is not permitted or supported.
- The order cannot be found.
- The customer asks for an exception.
- The customer is angry, frustrated, or dissatisfied.
- The requested action in your commerce, fulfillment, payment, or shipping system requires a person to complete it.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Connect it to Webchat and Inbox

Order Cancellation Assistant can work well with [Webchat Widget]({% link _captures/webchat-widget-playbook.md %}) when customers need quick post-purchase help from your site.

Before launch, confirm:

- Webchat or the incoming channel is enabled.
- The opening message does not promise instant cancellation.
- The handoff owner is the right teammate or team.
- Response rules reflect how quickly a person should reply after a handoff.
- The Inbox team knows what context the playbook should collect before handoff.

## How to test it

Test with realistic post-purchase messages before enabling the playbook broadly.

Use test customer profiles and channels that match your launch plan, then try:

- A cancellation request at your selected cutoff stage and another at the next stage, to check the inclusive boundary.
- Partial cancellation with neither integration connected, and with the supported connection you plan to use.
- Store credit with an amount and currency selected, including a missing or zero amount that needs correcting.
- A customer who declines an alternative and still wants to cancel.
- An action your store cannot complete, which should go to your team without a completion promise.
- A cancellation request for an order that has not shipped.
- A cancellation request for an order that is already packed, shipped, or delivered.
- A request with missing order number or customer details.
- A request where the order can be found from the customer profile.
- A customer who wants to cancel because shipping is delayed.
- A customer who wants a different size, color, or product instead.
- A payment or refund question.
- A request to change address, item, payment method, or delivery instructions.
- A complaint from an upset customer.
- A tracking question that should go to Order-Update Delight.
- A return or exchange question that should go to Return & Exchange Helper.

Review whether the playbook asks for the right missing details, follows policy, avoids unsupported promises, offers approved alternatives, and hands off to the correct teammate or team.

## What to review after launch

During the first days, review:

- Which customer messages activated the playbook.
- Whether the playbook followed the right policy source.
- Whether it collected useful information before handoff.
- Which cancellation reasons appeared most often.
- Which cases were saved with an approved alternative.
- Which cases required approval, refund review, fulfillment action, or investigation.
- Whether handoffs went to the right teammate or team.
- Repeated unclear cases that suggest missing policy content.
- Response speed, resolution rate, handoff rate, cancellation rate, saved-order rate, customer replies, failed messages, and customer satisfaction when relevant.

Tune one thing at a time: policy knowledge, save-the-sale boundaries, channel selection, tone, handoff target, or the cancellation cases the playbook should own.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
