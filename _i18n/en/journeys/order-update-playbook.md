Use this guide when customers often ask where an order is, whether it shipped, or how to track a package.

Order-Update Delight is a reactive AI support playbook. It responds when a customer asks about the status of an order, shipment, delivery, or tracking number. It uses order and shipment data connected to Hellotext, then decides whether to answer, ask for missing details, send a tracking CTA, or hand off.

It is not a general support agent and it is not a product recommender. Its job is order tracking. For product discovery, use [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %}). For broader support or policy questions, use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), a [custom agent]({% link _journeys/custom-agent-playbook.md %}), or the Inbox.

## What Order-Update Delight does

Order-Update Delight helps customers understand what is happening with an existing order.

It can:

- Recognize order-status questions such as "Where is my order?", "Did it ship?", "Can you track this?", or "What is the status of order 123?"
- Look for active shipments, orders being prepared, or recently shipped orders for the customer when they do not provide an order ID.
- Look up an order or shipment when the customer provides an order ID or tracking number.
- Use connected logistics operator data, when available, to get more detail about the delivery state.
- Explain basic order, shipment, fulfillment, and delivery stages using available data.
- Send a short order-status message with a tracking button when the channel supports it and a tracking URL is available.
- Ask for the order ID or tracking number when Hellotext cannot identify the right order.
- Hand off when the request requires a person or falls outside order tracking.

The playbook should stay grounded in order data. It should not invent order status, tracking URLs, or delivery dates.

## When to use it

Use Order-Update Delight when order-status questions create repetitive support work.

It is a good fit when:

- Customers often ask where their order is.
- Your store or order source sends order, shipment, and tracking information into Hellotext.
- Customers can be matched to their orders through their customer profile, order ID, or tracking number.
- Your team wants AI to answer straightforward order-status questions before handing off.
- You want a clear support path for questions that need a person.

Do not use it to modify, cancel, place, or approve orders. Do not use it to change shipping addresses, change delivery instructions, expose billing or payment details, or make delivery promises that are not present in the connected order or shipment data.

## What it needs before launch

Before enabling Order-Update Delight, confirm the setup it depends on.

Check that:

- Your store, order source, or commerce integration is connected.
- Order references, order states, shipment states, tracking numbers, and tracking URLs are available when your team expects the playbook to use them.
- Recent order and shipment activity appears on the right customer profiles.
- A logistics operator or carrier integration is connected if you want Hellotext to fetch richer delivery-state details beyond the order data already stored in Hellotext.
- The channels where customers ask order questions are connected and ready.
- The outgoing channel can send the order-status response format you want to use.
- Customers have consent and are eligible for the channels you plan to use.
- A teammate or team is ready to take over when the playbook cannot resolve the request.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Order-Update Delight**.

The available cards can vary, but you may be able to review:

- **Incoming channels:** where the playbook can receive order-status questions.
- **Outgoing channels:** where the playbook can send order-status replies or tracking CTAs.
- **Escalation or assignment:** who should take over when a person is needed.
- **Tone:** the voice used in replies.

Order-Update Delight uses a built-in order-update intent. You usually do not need to create manual intents for it. It also does not work like a custom agent prompt; the main setup work is making sure the order data, channels, and handoff path are correct.

## What it should hand off

Order-Update Delight should hand off or route elsewhere when the customer asks for something beyond order tracking.

Common handoff cases include:

- Canceling an order.
- Changing items in an order.
- Placing a new order.
- Changing a shipping address or delivery instructions.
- Accessing billing or payment details.
- Approving a refund, return, exchange, or replacement.
- Handling complaints, damaged items, missing items, or courier exceptions that require a person.
- Answering product-discovery questions that belong to a sales playbook.

For human handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

For guided return or exchange conversations that do not belong to order tracking, use [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) when it is available in your account.

## Why it may not answer

Order-Update Delight being enabled does not mean every support message will receive an order-status answer.

The playbook may not answer, may ask for more information, or may hand off when:

- The message is not about order tracking.
- Another active playbook is a better owner for the conversation.
- Hellotext cannot match the customer to an active, prepared, or recently shipped order.
- The customer provides an order ID or tracking number that cannot be found.
- The order exists but shipment or tracking details are not available yet.
- No logistics operator is connected, or the tracking lookup times out or cannot resolve carrier data.
- The channel cannot send the expected tracking button or CTA.
- The customer asks for a change, cancellation, payment detail, refund, return, exchange, or complaint resolution.
- A person needs to decide, approve, or investigate the case.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How to test it

Test with realistic support questions before enabling the playbook broadly.

Use test customer profiles and channels that match your launch plan, then try:

- "Where is my order?" from a customer with an active shipment.
- "Where is my order?" from a customer with a recent order but no shipment yet.
- A message with a valid order ID.
- A message with a valid tracking number.
- A message with a valid tracking number that should use the connected logistics operator.
- A message with an unknown order ID or tracking number.
- A shipped order with a tracking URL that should produce a tracking CTA.
- A shipped order without a tracking URL.
- A request to cancel an order or change an address.
- A billing, payment, return, exchange, damaged-item, or complaint message that should hand off.
- A product recommendation question that should go to another playbook.

Review whether the playbook uses available data, avoids guessing, asks for the right missing identifier, sends the expected tracking action, and hands off to the correct teammate or team.

## What to review after launch

During the first days, review:

- Which customer messages activated the playbook.
- Whether the playbook found the correct order or shipment.
- Whether the customer needed to provide an order ID or tracking number.
- Whether tracking CTAs opened the right tracking URL.
- Cases where the playbook could not find order data.
- Cases where it made a handoff and whether that handoff went to the right owner.
- Repeated questions that suggest missing order data, unclear shipping communication, or carrier delays.
- Resolution rate, handoff rate, response speed, customer replies, and failed messages.

Tune one thing at a time: order data quality, channel selection, handoff target, tone, or the supporting order/shipment integration.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
