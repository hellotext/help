Use this guide when you want Hellotext to ask customers for product reviews after an order has been delivered.

Review Builder is a post-purchase playbook for collecting structured product reviews. It asks for a star rating, follows up for a written review, can collect optional photos or videos as part of that review, and helps your team review or export the results.

It is not a general satisfaction survey, a support agent, or a broad content campaign. Its job is to collect product reviews at the right time after delivery.

## What Review Builder does

Review Builder helps you collect reviews from customers who recently received a product.

It can:

- Wait until an order has been delivered before asking for a review.
- Ask for a rating from 5 stars to 1 star.
- Ask for a written review after the customer chooses a rating.
- Let the customer include photos or videos with the review when the channel supports it.
- Avoid asking for several products too close together when an order includes multiple items.
- Avoid asking again for the same product, repeated purchase, or close variant when the customer was already asked.
- Ask what went wrong when the customer gives a low rating.
- Offer to hand off to the team when the customer gives a low rating or needs help.
- Store review responses for review reporting and export.

Photos and videos are treated as optional review attachments. Review Builder should not be positioned as a separate content-collection workflow unless Hellotext offers that as its own playbook or feature later.

## When to use it

Use Review Builder when:

- You sell products that customers can review after delivery.
- Your store integration can provide order, product, and delivery signals.
- You want product-level ratings and written feedback.
- You want to identify low-rating experiences and route them to a person when needed.
- You want a downloadable review record that can be used outside Hellotext.

It works best when customers have had enough time to receive and try the product before the message arrives.

## When not to use it

Do not use Review Builder as a replacement for every feedback workflow.

Use **CSAT Pulse** when you want to measure satisfaction after a support, Inbox, or AI interaction.

Use **NPS Pulse** when you want to measure loyalty or likelihood to recommend the brand.

Use [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when the customer is asking where the order is or whether it has been delivered.

Use [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}) when the customer wants to return or exchange the item.

Use [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) when the customer has a policy or product question before leaving a review.

Use the Inbox directly when the customer is upset, reports a damaged or defective product, or asks for urgent help.

## What it needs before launch

Before enabling Review Builder, confirm:

- Delivered-order signals are available.
- Product data is available for the items you want reviewed.
- Customer profiles have consent and an eligible channel.
- The channel can support the rating and follow-up experience you want.
- Your team knows who handles low ratings or negative replies.
- You know where review results will be reviewed or exported.
- You have a policy for using photos, videos, or customer quotes outside Hellotext.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Review Builder**.

The available cards can vary, but the playbook is designed around:

- **Outgoing channels:** where Hellotext asks for the review.
- **Tone:** how the review request sounds.
- **Timing:** when the request is sent after delivery.
- **Product spacing:** how review requests are spaced when a customer bought multiple products.
- **Low-rating follow-up:** what the playbook asks when the customer chooses 1 or 2 stars.
- **Derivation or assignment:** who should take over when a low rating needs attention.

Keep the first setup focused. Start with one reliable delivery source and one channel before expanding review collection broadly.

## Understand timing and product spacing

Review Builder should not ask too early.

The usual starting point is after the product has been delivered, often around 7 days later. The exact timing may vary by product type, delivery speed, and how long customers need before forming a useful opinion.

If a customer bought multiple products, the playbook should avoid asking for every product immediately. Review requests should be spaced out by several days so the customer is not overwhelmed.

If the customer bought the same product again, or a very close variant, avoid asking for the same review repeatedly.

## Design the review flow

The review flow has two main steps.

First, the customer receives a rating question with options from 5 stars to 1 star.

After the customer selects a rating, Review Builder asks for a written review. The customer may include photos or videos if the channel and message flow support attachments.

For high or neutral ratings, keep the follow-up simple and appreciative. For low ratings, the playbook should ask what went wrong and offer to connect the customer with the team.

Do not make the customer repeat information that Hellotext already has from the order, product, or customer profile.

## Handle low ratings

Low ratings are useful signals, not just bad outcomes.

For 1-star or 2-star reviews, Review Builder can ask what happened and offer a handoff.

Low-rating cases may need a person when:

- The customer says the product arrived damaged or defective.
- The wrong product arrived.
- Delivery or fulfillment caused the bad experience.
- The customer asks for a refund, return, exchange, cancellation, or compensation.
- The customer is angry or disappointed.
- The reply includes sensitive or unclear context.

For handoff behavior, use [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Review and export results

Review Builder stores the reviews it collects.

The playbook report should help you see:

- Products with reviews received.
- Rating distribution.
- Review text.
- Review attachments such as image or video URLs when available.
- The customer profile and ecommerce customer identifier when available.
- The product name and ecommerce product identifier when available.
- The date and time of the review.
- A link back to the conversation where the review was given.

Reviews can be downloaded so your team can analyze them or upload them to another review system. If Hellotext adds direct integrations with review platforms later, document that as a separate setup path.

## How to test it

Test with real-looking order and delivery scenarios before enabling Review Builder broadly.

Try:

- A delivered order with one product.
- A delivered order with multiple products.
- A customer who already received a review request for the same product.
- A repeat purchase or close variant.
- A 5-star rating followed by a written review.
- A 1-star or 2-star rating followed by a complaint.
- A review with a photo or video attachment, if your channel supports it.
- A customer who asks for help instead of leaving a review.
- A customer who should not receive the request because delivery data or channel eligibility is missing.

Confirm that timing, channel, rating buttons, review capture, low-rating handoff, and reporting all behave as expected.

## What to review after launch

During the first days, review:

- How many eligible delivered orders entered the playbook.
- Whether requests were sent too early, too late, or too often.
- Rating distribution by product.
- Written review quality.
- Attachments received.
- Low-rating reasons.
- Handoffs created from negative feedback.
- Products with repeated quality or fulfillment concerns.
- Opt-outs, failed messages, and negative replies.
- Export completeness.

Tune one thing at a time: timing, channel, tone, product spacing, low-rating handoff, or the products included in the playbook.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
