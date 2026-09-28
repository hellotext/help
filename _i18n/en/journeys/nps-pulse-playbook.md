Use this guide when you want to measure whether customers are likely to recommend your brand after they have received an order.

NPS Pulse is a relationship feedback playbook. After a delivered-order event, it schedules a 1-10 recommendation question and records the first valid score as promoter, passive, or detractor.

It is not a product review request and it is not a support satisfaction survey. Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) for product reviews after delivery. Use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) for satisfaction after a resolved support, Inbox, AI, or playbook conversation.

## What NPS Pulse does

NPS Pulse helps you measure loyalty at a relationship level.

It can:

- Send an NPS question after a delivered-order event recognized by Hellotext.
- Ask how likely the customer is to recommend your brand on a 1-10 scale.
- Accept quick replies when the channel supports them, or a typed number.
- Classify the answer as promoter, passive, or detractor.
- Store the first valid score and its bucket.
- Avoid duplicate NPS requests for the same delivery event.
- Apply a 90-day interval between eligible NPS requests for the same customer.

The goal is to understand brand loyalty after the customer has had enough experience to evaluate the order, delivery, and overall relationship.

## When to use it

Use NPS Pulse when:

- You want to measure loyalty or likelihood to recommend.
- You have reliable delivered-order signals.
- You want a simple 1-10 relationship signal, not a product review.
- Your team wants to follow up with detractors.

It works best after the customer has received the order and had a little time to form an opinion.

## How it works with other feedback

NPS Pulse does not replace the other feedback playbooks. You can have [Review Builder]({% link _journeys/review-builder-playbook.md %}), [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}), and NPS Pulse active at the same time.

The same delivered-order event can schedule NPS Pulse and Review Builder independently when both playbooks are enabled. Each applies its own eligibility and delivery rules.

Use [Review Builder]({% link _journeys/review-builder-playbook.md %}) when you need product-level ratings and written reviews.

Use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) when the question is whether a support, Inbox, AI, or playbook conversation was helpful.

Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when the customer is asking where an order is.

Use the Inbox directly when the customer is already upset, asking for help, or reporting a problem that should not wait for a survey flow.

## What it needs before launch

Before enabling NPS Pulse, confirm:

- Delivered-order signals are reliable and reach Hellotext.
- The customer profile has an eligible messaging channel and consent.
- Your team has a separate process for handling low scores.
- Product review collection and support satisfaction are handled by their own playbooks when needed.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## Edit the NPS message

Open **Playbooks**, click **Explore playbooks**, and choose **NPS Pulse**.

Open **NPS message** to edit the primary question customers receive after delivery.

The default question is:

On a scale from 1 to 10, how likely are you to recommend us to a friend or colleague?

Keep the question focused on recommendation. If you add too much context, customers may answer about a single support interaction or a single product instead of the overall relationship.

You can edit the question text. The 1-10 score buttons are fixed.

## Understand timing and eligibility

NPS Pulse starts from a delivered-order event, not a purchase. If an integration reports shipment delivery, it must use that event to trigger this playbook.

Scheduling starts seven days after the event timestamp. Send-time optimization and contact pacing may choose a later slot.

If no delivery event arrives, no question is scheduled. An event already processed does not produce another question. A new attempt may be skipped when:

- Another NPS attempt for the customer occupies the 90-day interval.
- The customer is outside the configured audience.
- The customer is not eligible for the channel.
- Consent, channel policy, rate limits, or other send guardrails block the message.

If an attempt is skipped, check the delivery signal, audience, and channel eligibility before changing the playbook.

## Understand the score

NPS uses a 1-10 answer.

Hellotext classifies the score as:

| Score | Bucket | Meaning |
| --- | --- | --- |
| 9-10 | Promoter | The customer is likely to recommend the brand. |
| 7-8 | Passive | The customer is satisfied enough, but not strongly loyal. |
| 1-6 | Detractor | The customer may be unhappy or at risk. |

Only a numeric reply from 1 to 10 is stored as an NPS score. NPS Pulse does not send an automatic request to correct an invalid reply.

## What happens after a reply

The first valid reply is linked to the NPS attempt with its score and bucket. Later replies do not replace that score.

The playbook does not send a second question or link a later written explanation as the reason for the score.

## Follow up on detractors

A score from 1 to 6 is classified as a detractor. NPS Pulse does not itself create a recovery item or initiate an NPS-specific Inbox handoff. Decide separately who will review those scores and how they will follow up.

## Understand the available NPS data

The playbook stores the score and bucket in its internal record. The current Playbooks view shows general performance metrics, but it does not include an NPS report with an overall score, response rate, or bucket distribution.

By definition, NPS is the percentage of promoters minus the percentage of detractors among valid responses. That calculation is not shown as a metric in the current Playbooks view.

## How to test it

Test with realistic delivered-order scenarios before enabling NPS Pulse broadly.

Try:

- A delivered order that should receive NPS.
- An order without a recognized delivery event that should not trigger NPS Pulse.
- A promoter score from 9 to 10.
- A passive score from 7 to 8.
- A detractor score from 1 to 6.
- A typed number instead of a quick reply.
- An invalid reply.
- A customer who is not eligible for the selected messaging channel.

In a test environment, confirm that the question is scheduled only when expected, valid scores are stored with the correct bucket, and an invalid reply does not trigger a second NPS question.

## What to review after launch

During the first days, check:

- That the delivered-order signal arrives with the expected timestamp.
- That the audience, channel, and consent allow the intended sends.
- That no more than one attempt is scheduled for the same event and the request is not repeated during the 90-day interval.
- That your team has a separate process for handling low-score replies.

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
