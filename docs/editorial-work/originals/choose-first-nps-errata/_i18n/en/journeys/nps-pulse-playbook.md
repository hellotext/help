Use this guide when you want to measure whether customers are likely to recommend your brand after they have received an order.

NPS Pulse is a relationship feedback playbook. It asks a 0-10 recommendation question after a reliable delivery event, classifies the answer as promoter, passive, or detractor, asks one score-based follow-up, and helps your team recover when the score is low.

It is not a product review request and it is not a support satisfaction survey. Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) for product reviews after delivery. Use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) for satisfaction after a resolved support, Inbox, AI, or playbook conversation.

## What NPS Pulse does

NPS Pulse helps you measure loyalty at a relationship level.

It can:

- Send an NPS question after a delivered order or equivalent delivered event.
- Ask how likely the customer is to recommend your brand on a 0-10 scale.
- Accept quick replies when the channel supports them, or a typed number.
- Classify the answer as promoter, passive, or detractor.
- Ask one follow-up question based on the score.
- Store the score, bucket, and reason text for reporting.
- Create a recovery path when the customer is a detractor.
- Avoid duplicate NPS requests for the same delivery event.

The goal is to understand brand loyalty after the customer has had enough experience to evaluate the order, delivery, and overall relationship.

## When to use it

Use NPS Pulse when:

- You want to measure loyalty or likelihood to recommend.
- You have reliable delivered-order or delivered-shipment signals.
- You want a simple 0-10 relationship signal, not a product review.
- Your team wants to follow up with detractors.
- You have enough delivered orders to learn from trends over time.

It works best after the customer has received the order and had a little time to form an opinion.

## How it works with other feedback

NPS Pulse does not replace the other feedback playbooks. You can have [Review Builder]({% link _journeys/review-builder-playbook.md %}), [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}), and NPS Pulse active at the same time.

Hellotext's decision engine uses different signals to choose the right feedback moment. For example, it can ask for a product review after delivery, ask for CSAT after a resolved conversation, and ask for NPS when the goal is to measure loyalty or likelihood to recommend.

Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) when you need product-level ratings, written reviews, and exportable review records.

Use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) when the question is whether a support, Inbox, AI, or playbook conversation was helpful.

Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when the customer is asking where an order is.

Use the Inbox directly when the customer is already upset, asking for help, or reporting a problem that should not wait for a survey flow.

## What it needs before launch

Before enabling NPS Pulse, confirm:

- Delivered-order or delivered-shipment signals are reliable.
- The customer profile has an eligible messaging channel and consent.
- Your team knows who reviews detractor responses.
- Your team knows where NPS results will be reviewed.
- Product review collection and support satisfaction are handled by their own playbooks when needed.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Edit the NPS message

Open **Playbooks**, click **Explore playbooks**, and choose **NPS Pulse**.

Open **NPS message** to edit the primary question customers receive after delivery.

The default question is:

On a scale from 0 to 10, how likely are you to recommend us to a friend or colleague?

Keep the question focused on recommendation. If you add too much context, customers may answer about a single support interaction or a single product instead of the overall relationship.

NPS Pulse uses score-based follow-up questions after the customer answers. Those follow-ups help explain why the customer gave that score.

## Understand timing and eligibility

NPS Pulse is designed to send after delivery, not immediately after purchase.

The default timing is about 7 days after a reliable delivered milestone.

A prompt may be skipped when:

- Hellotext does not have a delivered milestone for the order, shipment, or mapped event.
- The delivered timestamp is missing or invalid.
- The same delivery event already received an NPS request.
- The customer is not eligible for the channel.
- Consent, channel policy, rate limits, or other send guardrails block the message.

If NPS is skipped because of eligibility, do not treat that as a broken playbook. It usually means Hellotext did not have a safe or meaningful moment to ask.

## Understand the score

NPS uses a 0-10 answer.

Hellotext classifies the score as:

| Score | Bucket | Meaning |
| --- | --- | --- |
| 9-10 | Promoter | The customer is likely to recommend the brand. |
| 7-8 | Passive | The customer is satisfied enough, but not strongly loyal. |
| 0-6 | Detractor | The customer may be unhappy or at risk. |

If the customer replies with something that is not a number from 0 to 10, NPS Pulse asks for a valid number once. If the reply is still invalid, it stops instead of looping.

## Handle follow-up responses

After a valid score, NPS Pulse asks one follow-up question based on the bucket.

For detractors, the follow-up asks what went wrong or what could be better.

For passives, it asks what would make the experience a 9 or 10.

For promoters, it asks what the customer liked most.

The free-text answer is stored with the NPS result so your team can understand the reason behind the score.

## Follow up on detractors

Detractor scores need attention.

When a customer gives a 0-6 score, NPS Pulse can create a recovery path so the team can follow up.

Detractor follow-up can:

- Bring the conversation into the Inbox.
- Create a recovery item for the team.
- Keep the reason text connected to the original NPS score.
- Help your team spot repeated delivery, product, policy, or support problems.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Review NPS reports

NPS reporting helps you understand loyalty over time.

Review:

- Overall NPS score.
- Response rate.
- Promoter, passive, and detractor counts.
- Bucket distribution over time.
- Reason text by bucket.
- Detractor recovery follow-up.
- Differences by channel, time range, intent, playbook, campaign, or delivery source when available.

NPS score is calculated as the percentage of promoters minus the percentage of detractors.

## How to test it

Test with realistic delivered-order scenarios before enabling NPS Pulse broadly.

Try:

- A delivered order that should receive NPS.
- An order without a delivered milestone that should not receive NPS.
- A promoter score from 9 to 10.
- A passive score from 7 to 8.
- A detractor score from 0 to 6.
- A typed number instead of a quick reply.
- An invalid reply.
- A customer who is not eligible for the selected messaging channel.

Confirm that the NPS question sends only when expected, valid scores are stored, the correct bucket appears in reporting, one follow-up question is sent, and detractors reach the right recovery process.

## What to review after launch

During the first days, review:

- How many delivered orders were eligible.
- How many prompts were sent, skipped, delivered, and answered.
- NPS score and response rate.
- Promoter, passive, and detractor distribution.
- Common reason text themes.
- Detractor follow-up and response speed.
- Any signs that the question is being sent before the customer had enough delivery context.

Tune one thing at a time: message copy, delivery data quality, channel readiness, or detractor follow-up ownership.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
