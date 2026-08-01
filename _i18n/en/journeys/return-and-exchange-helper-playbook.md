Use this guide when your team spends time explaining return policies, exchange rules, eligibility, and next steps after a purchase.

Return & Exchange Helper is a reactive support playbook. It helps customers understand whether a return or exchange may be possible, what information is needed, what the next step is, and when a person should take over.

It is not a generic FAQ agent and it should not approve exceptions by itself. It works best when your policies are clear, your order context is available, and your team has defined when the playbook can continue and when it must hand off.

## What Return & Exchange Helper does

Return & Exchange Helper helps customers move through a return or exchange request.

It can:

- Respond when a customer asks to return, exchange, replace, or refund an item.
- Explain return and exchange policies from approved knowledge.
- Ask for missing details such as order number, item, reason, size, condition, or photos when needed.
- Use order context when it is available to help identify the purchase.
- Explain next steps, timelines, packaging requirements, pickup or drop-off instructions, and refund expectations from your policy.
- Hand off when the request needs approval, an exception, a refund decision, or human investigation.
- Work alongside [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), Webchat, Inbox assignment, and response rules.

The playbook should stay grounded in the information your business has approved. If your policy or order data is unclear, it should ask for clarification or hand off instead of guessing.

## When to use it

Use Return & Exchange Helper when:

- Customers often ask how to return or exchange products.
- Your policy has repeatable rules: time window, item condition, eligible products, required proof, refund method, exchange options, and shipping instructions.
- Your team wants AI to handle the first support step before a person reviews exceptions.
- Customers need a guided path instead of a general FAQ answer.
- You want returns and exchanges to land in the Inbox with the right ownership when a person is needed.

It is a good fit for straightforward policy explanation, collecting required context, and routing eligible cases to the next step.

## When not to use it

Do not use Return & Exchange Helper as the owner for every post-purchase case.

Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when the customer mainly asks where an order is, whether it shipped, or how to track a package.

Use [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) when the customer wants to cancel an order before it ships or before it is too late to cancel.

Use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) when the customer only needs a general policy explanation and does not need a guided return or exchange flow.

Use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) when the customer wants help choosing another product before buying.

Use a [Custom Agent]({% link _journeys/custom-agent-playbook.md %}) when your returns process needs custom intents, external actions, special integrations, or a narrow workflow that the prebuilt playbook does not cover.

Use the Inbox directly when the case involves fraud concerns, legal language, high-value exceptions, payment disputes, or a customer who is very upset.

## What it needs before launch

Before enabling Return & Exchange Helper, confirm:

- The return and exchange policy is current and approved.
- The policy explains windows, item condition, non-returnable products, proof required, refund method, exchange options, and shipping responsibility.
- Order data is available when the playbook should identify purchases.
- Your team knows which cases the playbook may handle and which cases require a person.
- The incoming channels where customers ask for returns or exchanges are connected and ready.
- A teammate or team is configured for handoff.
- Response rules and business hours match the urgency of post-purchase support.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Return & Exchange Helper**.

The available cards can vary, but you may be able to review:

- **Knowledge or upload documents:** return policy, exchange policy, warranty rules, shipping instructions, product exclusions, and internal support guidance.
- **Incoming channels:** where customers can ask for return or exchange help.
- **Tone:** the voice used in replies.
- **Escalation or assignment:** who should take over when a person is needed.
- **Prompt or instructions, when available:** what the playbook may explain, what it must not approve, and when to hand off.
- **Web search or approved websites, when available:** public policy pages the agent can use for this mission.

Keep the first setup narrow. It is easier to expand a clear return flow than to diagnose an agent that tries to solve every post-purchase issue.

## Prepare policy knowledge

The playbook needs policy content that is specific enough to guide the customer.

Include:

- Return and exchange windows.
- Eligible and non-returnable product categories.
- Required product condition, packaging, tags, receipt, order number, or photos.
- Whether exchanges can be made for size, color, product, store credit, or refund.
- Who pays for return shipping.
- Pickup, drop-off, mail-in, or store-return instructions.
- Refund method and expected timing.
- Warranty or defective-product rules.
- What happens when an item was final sale, discounted, personalized, opened, damaged, or used.

Avoid vague policy content such as "contact us for returns" if you want the playbook to answer consistently. If the policy changes, update the source before expecting the playbook to use the new rule.

## Define what needs a person

Returns and exchanges often need human judgment.

Configure handoff or team ownership for cases such as:

- The customer asks for a refund approval.
- The request is outside the normal return or exchange window.
- The item is damaged, defective, wrong, missing, used, personalized, or final sale.
- The customer disputes payment, shipping cost, or refund amount.
- The order cannot be found.
- The customer asks for an exception.
- The customer is angry, frustrated, or dissatisfied.
- The request requires a shipping label, pickup, replacement, store credit, or operational action that the playbook cannot safely complete.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Connect it to Webchat and Inbox

Return & Exchange Helper can work well with [Webchat Widget]({% link _journeys/webchat-widget-playbook.md %}) when customers look for post-purchase help from your site.

Before launch, confirm:

- Webchat or the incoming channel is enabled.
- The opening message does not promise an instant approval.
- The handoff owner is the right teammate or team.
- Response rules reflect how quickly a person should reply after a handoff.
- The Inbox team knows what context the playbook should collect before escalation.

## How to test it

Test with realistic post-purchase messages before enabling the playbook broadly.

Use test customer profiles and channels that match your launch plan, then try:

- A straightforward return request inside the policy window.
- A straightforward exchange request for size or color.
- A request with missing order number or item details.
- A request where the order can be found from the customer profile.
- A request outside the return window.
- A final-sale, personalized, opened, used, or non-returnable item.
- A damaged, defective, wrong, or missing product.
- A refund approval request.
- A complaint from an upset customer.
- A question that is only a general policy FAQ and may belong to Instant Answers.
- A tracking question that should go to Order-Update Delight.

Review whether the playbook asks for the right missing details, follows policy, avoids unsupported approval, and hands off to the correct teammate or team.

## What to review after launch

During the first days, review:

- Which customer messages activated the playbook.
- Whether the playbook followed the right policy source.
- Whether it collected useful information before handoff.
- Which cases were resolved without a person.
- Which cases required approval, exception handling, or investigation.
- Whether handoffs went to the right teammate or team.
- Repeated unclear cases that suggest missing policy content.
- Response speed, resolution rate, handoff rate, customer replies, refunds, exchanges, failed messages, and customer satisfaction when relevant.

Tune one thing at a time: policy knowledge, channel selection, tone, handoff target, or the cases the playbook should own.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Webchat Widget playbook]({% link _journeys/webchat-widget-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
