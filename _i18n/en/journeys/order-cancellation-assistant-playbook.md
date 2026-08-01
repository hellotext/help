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

The available cards can vary, but you may be able to review:

- **Knowledge or upload documents:** cancellation policy, fulfillment cutoff rules, shipping rules, payment guidance, refund expectations, and internal support instructions.
- **Incoming channels:** where customers can ask for cancellation help.
- **Tone:** the voice used in replies.
- **Escalation or assignment:** who should take over when a person is needed.
- **Prompt or instructions, when available:** what the playbook may explain, which alternatives it may offer, what it must not promise, and when to hand off.
- **Web search or approved websites, when available:** public policy pages the agent can use for this mission.

Keep the first setup narrow. It is easier to expand a clear cancellation flow than to diagnose a playbook that tries to solve every post-purchase problem.

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

Some cancellation requests can be saved without pressuring the customer.

Only offer alternatives your team approves, such as:

- Helping the customer choose a different size, color, or item.
- Routing the customer to [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) when the customer wants a different product.
- Explaining shipping status if the customer wants to cancel because they do not know where the order is.
- Offering to connect the customer with a person when the reason is unclear or sensitive.

Do not use the playbook to pressure a customer into keeping an order. If the customer clearly wants to cancel and cancellation requires a person or operational action, hand off.

## Define what needs a person

Cancellation requests often need human judgment or an operational action.

Configure handoff or team ownership for cases such as:

- The customer asks for immediate cancellation.
- The order is already fulfilled, shipped, delivered, or in a state the playbook cannot change.
- The request needs payment review, refund approval, fraud review, or account verification.
- The customer asks to change the address, items, payment method, or delivery instructions.
- The order cannot be found.
- The customer asks for an exception.
- The customer is angry, frustrated, or dissatisfied.
- The request requires an action in your commerce, fulfillment, payment, or shipping system.

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
