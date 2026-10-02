Use this guide when your team spends time answering the same support questions again and again.

Instant Answers is a reactive AI support playbook. It responds when a customer asks a common support question and uses approved knowledge, policies, and connected context to answer or hand off when a person should take over.

It is not a journey route, a campaign, a product recommender, or a custom agent with your own intents. It is the support playbook for repeat questions that should be answered quickly and consistently.

## What Instant Answers does

Instant Answers helps customers get immediate support for common questions.

It can:

- Respond when a customer asks a support question in an enabled incoming channel.
- Use uploaded documents, approved websites, FAQs, policies, or other knowledge sources when available.
- Answer questions about shipping policies, payment methods, store information, product care, warranty basics, sizing guidance, and other repeat support topics.
- Ask a clarifying question when the customer's request is missing important details.
- Hand off when the answer is not available, the customer is upset, or the request needs human judgment.
- Work alongside Webchat, Inbox assignment, response rules, and other support playbooks.

Instant Answers works best when the answer is already written somewhere your team trusts.

## When to use it

Use Instant Answers when:

- Your team answers the same FAQs repeatedly.
- Customers ask questions before or after purchase that do not require a custom decision.
- You have current policies, help pages, PDFs, product notes, or internal support guidance that the agent can use.
- You want faster first responses outside business hours or during busy periods.
- You want the agent to answer simple questions and hand off exceptions to the right teammate or team.

Good topics include shipping policy, return-window explanations, payment methods, store hours, product-care instructions, warranty basics, size-guide explanations, and where to find account or order information.

## When not to use it

Do not use Instant Answers as the owner for every conversation.

Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when the question is about a specific order, shipment, tracking number, delivery state, or "Where is my order?"

Use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) when the customer wants product discovery, comparison, or recommendations.

Use [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) when your account has that playbook available and the customer needs a returns or exchanges flow, not only a policy explanation.

Use [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}) when your account has that playbook available and the customer needs help requesting a cancellation, not only a policy explanation.

Use a [Custom Agent]({% link _journeys/custom-agent-playbook.md %}) when you need custom intents, a narrow specialist agent, external actions, or a support mission that is too specific for the prebuilt playbook.

Use a [journey route]({% link _journeys/getting-started-with-journeys.md %}) when the experience must follow visible steps, waits, questions, branches, and assignments.

## What it needs before launch

Before enabling Instant Answers, confirm:

- The support topics it should answer are clear.
- The policies, FAQs, documents, or approved websites it should use are current.
- Conflicting or outdated support content has been removed.
- The incoming channels where customers ask these questions are connected and ready.
- A teammate or team is configured for handoff.
- Your team knows which questions the playbook should answer and which ones it should leave to a person.
- Response rules and business hours match the level of service you want for support conversations.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Instant Answers**.

The available cards can vary, but you may be able to review:

- **Knowledge or upload documents:** FAQs, policies, product notes, guides, or other approved support content.
- **Incoming channels:** where the playbook can answer customer questions.
- **Tone:** the voice used in replies.
- **Escalation or assignment:** who should take over when the playbook cannot resolve the request.
- **Web search or approved websites, when available:** public pages the agent can use for the support mission.

Keep the setup focused. If the playbook needs too many exceptions, split the work: use a specialized support playbook, a custom agent, or an Inbox process for the risky cases.

## Prepare knowledge

Knowledge quality is the biggest factor in answer quality.

Use sources your team already trusts:

- Help center pages.
- Shipping, returns, exchange, warranty, and privacy policies.
- Store hours, pickup instructions, and contact information.
- Product-care notes, size guides, and material guidance.
- Internal support instructions that are stable enough for customers.

Before uploading or approving sources, remove:

- Expired promotions or old prices.
- Draft policy language.
- Contradictory return or warranty rules.
- Internal notes that should not be shared with customers.
- Unsupported claims about delivery times, refunds, or approvals.

If the source changes, update the knowledge before expecting the playbook to answer correctly.

## Define handoff boundaries

Instant Answers should hand off when a customer needs a person, not a general answer.

Common handoff cases include:

- The customer asks for a person.
- The customer is angry, frustrated, or dissatisfied.
- The customer reports a defective, damaged, wrong, or missing product.
- The request needs approval, exception handling, refund, cancellation, exchange, account change, payment detail, or human sales action.
- The answer is not in the approved knowledge.
- The customer asks about a specific order and [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) should handle it instead.
- No active playbook can resolve the request safely.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Connect it to Webchat and Inbox

Instant Answers can work well with [Webchat Widget]({% link _captures/webchat-widget-playbook.md %}).

Webchat gives visitors a place to ask from the site. Instant Answers can answer supported questions after the conversation starts. The Inbox gives your team a place to handle exceptions, handoffs, and follow-up replies.

Before launch, confirm:

- Webchat or the incoming channel is enabled.
- The opening message does not promise support the playbook cannot provide.
- The handoff owner is the right teammate or team.
- Response rules reflect how quickly a person should reply after a handoff.

## How to test it

Test with realistic support messages before enabling the playbook broadly.

Use test customer profiles and channels that match your launch plan, then try:

- A common FAQ with a clear answer in the approved knowledge.
- The same question written with typos, short wording, or casual language.
- A question that needs a clarifying follow-up.
- A question that is not covered by the uploaded documents or approved pages.
- A question where two documents could conflict.
- A specific order-status question that should go to Order-Update Delight or hand off.
- A product recommendation question that should go to Smart Recommender or hand off.
- A return, exchange, refund, cancellation, damaged-item, or complaint message that should hand off or route elsewhere.
- A message from each incoming channel you plan to use.

Review whether the answer is grounded, concise, correct for the channel, and clear about next steps.

## What to review after launch

During the first days, review:

- Which customer messages activated the playbook.
- Which questions were answered successfully.
- Which questions should have gone to another playbook.
- Whether answers cited or followed the right source.
- Whether customers asked follow-up questions because the answer was unclear.
- Whether handoffs went to the right teammate or team.
- Repeated unanswered questions that suggest missing knowledge.
- Response speed, resolution rate, handoff rate, customer replies, failed messages, and opt-outs when relevant.

Tune one thing at a time: knowledge, channel selection, tone, handoff target, or the support topics you expect the playbook to own.

If you want to measure satisfaction after resolved support conversations, use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) alongside the support playbook.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
