Use this guide when you want Hellotext to ask customers for product reviews after an order has been delivered.

Review Builder is a post-purchase playbook for collecting structured product reviews. It asks for a star rating, follows up for a written review, and can collect optional photos or videos as part of that review.

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
- Store the rating, written review, and available attachments with the review attempt.

Photos and videos are treated as optional review attachments. Review Builder should not be positioned as a separate content-collection workflow unless Hellotext offers that as its own playbook or feature later.

## When to use it

Use Review Builder when:

- You sell products that customers can review after delivery.
- Your store integration can provide order, product, and delivery signals.
- You want product-level ratings and written feedback.
- You want to identify low-rating experiences and route them to a person when needed.
- You can review individual customer conversations to follow up on product feedback.

It works best when customers have had enough time to receive and try the product before the message arrives.

## How it works with other feedback

Review Builder does not replace the other feedback playbooks. You can have [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) and [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) active alongside Review Builder when each one has the right signals and ownership.

Hellotext's decision engine treats them as different feedback moments. Review Builder asks for product reviews after delivery, NPS Pulse measures relationship loyalty after a delivery experience, and CSAT Pulse measures satisfaction after a resolved conversation.

Use [CSAT Pulse]({% link _journeys/csat-pulse-playbook.md %}) when you want to measure satisfaction after a support, Inbox, or AI interaction.

Use [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) when you want to measure loyalty or likelihood to recommend the brand.

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
- Your team knows who will review customer conversations for feedback that needs follow-up.
- You have a policy for using photos, videos, or customer quotes outside Hellotext.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Review Builder**.

Review Builder exposes:

- **Outgoing channels:** where Hellotext asks for the review.
- **Tone:** how the review request sounds.

Hellotext handles post-delivery timing, spacing between products, duplicate prevention, and the low-rating follow-up inside the playbook. These are automatic behaviors, not setup cards.

Keep the first setup focused. Start with one reliable delivery source and one channel before expanding review collection broadly.

## Understand timing and product spacing

Review Builder should not ask too early.

The usual starting point is after the product has been delivered, often around 7 days later. Hellotext handles this timing automatically and can allow more time when customers need longer to form a useful opinion.

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

## Review responses

Review Builder stores the rating, written review, and available attachments with the review attempt. The customer's replies remain connected to the conversation.

Review individual customer conversations to follow up on feedback. Playbooks does not currently provide a dedicated Review Builder results report, rating distribution, or review-record export.

If you need to use reviews in another system, plan a separate process with your team. Do not rely on a downloadable review file from this playbook.

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

Confirm that the channel, rating buttons, review capture, automatic spacing, low-rating path, and customer conversation all behave as expected.

## What to review after launch

During the first days, review:

- Whether requests were sent too early, too late, or too often.
- Examples of ratings, written reviews, and attachments in customer conversations.
- Low-rating reasons and whether feedback needing help reached the team.
- Repeated quality or fulfillment concerns visible in the conversations you review.
- Opt-outs, failed messages, and negative replies.

Tune one thing at a time in the settings you control: channel or tone. Use the messages and conversations you review to identify unexpected timing, spacing, duplicate requests, or low-rating behavior.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
