Use this guide when customers have been inactive for around 3 months and you want Hellotext to make a careful win-back attempt.

Dormant Revival is a win-back playbook. It helps Hellotext identify customers who have not purchased, visited, clicked, replied, or otherwise engaged for a longer period, then send a relevant reactivation message when the customer is still eligible to hear from you.

It is not a journey route, a one-time campaign, or the final attempt before suppressing a customer. It sits between [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}), which is for recent inactivity around 30 days, and Sunset Saver, which is for customers around 12 months inactive or not reactivated.

Availability can vary by account and rollout status. If the card appears as on request or disabled, confirm availability with your Hellotext team before planning a launch.

## What Dormant Revival does

Dormant Revival helps bring back customers who have gone quiet for longer than a normal buying pause.

It can:

- Look for customers around 3 months inactive, based on purchase, browse, click, reply, or other meaningful engagement signals.
- Use customer history, product context, catalog data, channel eligibility, and offer rules before a message is sent.
- Suggest products, collections, or offers that are relevant to the customer's past behavior.
- Generate personalized message examples that adapt per customer.
- Let your team give Playground feedback on examples so Hellotext learns what fits the business.
- Follow existing ecommerce offer rules, use AI-driven discounts up to an approved maximum percentage, or send without discounts.
- Choose the most cost-efficient available channel, such as WhatsApp, SMS, or others, and send only when it internally detects an opportunity to keep ROI healthy.
- Skip customers when the customer reactivated, bought recently, entered another active playbook, opted out, cannot be reached, or lacks enough product context.

The exact configuration can vary by account, connected store, catalog quality, channel, templates, and rollout status.

## When to use it

Use Dormant Revival when a customer has been inactive for longer than the Soft Reactivation window but is not yet in a last-attempt moment.

It is a good fit when:

- The customer has been inactive for around 3 months.
- The customer previously bought, visited, clicked, replied, or showed enough interest to justify a win-back message.
- Soft Reactivation did not apply, did not reactivate the customer, or the customer is already past that recent-inactivity moment.
- The business has a relevant reason to reach out, such as a product update, new collection, recommendation, or approved offer.
- The goal is to recover the customer relationship without sending repeated generic campaigns.

Do not use Dormant Revival for a recent 30-day slowdown. Use [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) for that. Do not use it as a final clean-up step for customers who have been inactive for around 12 months; use Sunset Saver when available.

For product-specific moments, use the more specific playbook: [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) for consumable reorder timing, [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) for related products after purchase, and [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) for abandoned cart or checkout moments.

## What it needs before launch

Before enabling Dormant Revival, confirm the setup it depends on.

Check that:

- Your store or data source sends purchase history and customer activity to Hellotext.
- Customer profiles include reliable identifiers, channel consent, and historical behavior.
- Product names, images, prices, stock, and links are current.
- The products or collections you want to use are appropriate for win-back messages.
- The audience you want to reach is identifiable and eligible for the selected channel.
- Purchase, browse, click, reply, unsubscribe, opt-out, and recent reactivation signals are available enough for Hellotext to avoid irrelevant sends.
- If discounts are allowed, ecommerce offer rules and any maximum AI discount percentage are approved before launch.
- Product cards, product links, or rich messages work in the channels you plan to use.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, purchases, attributed revenue, opt-outs, replies, and skipped opportunities.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Dormant Revival**.

The available cards can vary, but the proposed setup focuses on:

- **Outgoing channels:** where Hellotext can send or continue the reactivation message.
- **Audience:** which audience or segment can receive the playbook.
- **Products:** which products, collections, categories, or groups can be used in the message.
- **Discount strategy:** whether the playbook follows existing ecommerce offer rules, can use AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Tone or Playground feedback:** how generated examples should learn what fits your business.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Dormant Revival depends on whether the customer can still be reached in a channel where the message makes sense. Hellotext can internally choose the most cost-efficient channel, such as WhatsApp, SMS, or others depending on availability, and avoid sends when it does not detect an opportunity to keep ROI healthy.

If you need a custom conversational agent with its own instructions, knowledge, and handoff rules, use [Custom Agent]({% link _journeys/custom-agent-playbook.md %}). If you need a fully controlled sequence of steps, use a custom journey.

## How Hellotext chooses the moment

Dormant Revival should start from a meaningful inactivity signal, not from a broad static blast.

Hellotext can use signals like:

- Around 3 months since last purchase, visit, click, reply, or other meaningful engagement.
- Prior purchase history, product categories, customer value, and historical engagement.
- Products previously bought, browsed, clicked, or recommended.
- Whether the customer already reactivated through another playbook, campaign, or reply.
- Whether another playbook owns the current moment, such as cart recovery, replenishment, cross-sell, support, or Soft Reactivation.
- Product availability, price, stock, links, and discount rules.
- Channel eligibility, consent, and recent communication history.

Before sending, Hellotext can also consider:

- Whether the inactivity signal is tied to a reachable customer profile.
- Whether the message has a relevant product, offer, or reason to reach out.
- Whether the customer recently bought, replied, unsubscribed, or opted out.
- Whether the profile can receive a message in an eligible channel.
- Whether there is an internal opportunity to keep ROI healthy for that send.
- Whether another active playbook is a better fit.
- Whether timing, frequency, quiet hours, templates, or channel rules allow the send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the customer moment to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Customer is starting to go quiet and has been inactive for around 30 days | [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) |
| Customer has been inactive for around 3 months | Dormant Revival |
| Customer has been inactive or not reactivated for around 12 months | Sunset Saver when available |
| Customer may need to reorder a consumable product | [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) |
| Customer recently bought and may want a related product | [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) |
| Customer abandoned a cart or checkout | [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) |
| You want to send a planned one-time message to a selected audience | [Campaigns and broadcasts]({% link _campaigns/campaigns-overview.md %}) |

Dormant Revival can coexist with other playbooks when each one owns a different moment. It should not compete with a more specific signal, and it should stop trying to win back a customer who already returned, replied, opted out, or entered another active flow.

## Review messages in the Playground

Dormant Revival can generate personalized examples from customer history, product context, audience, channel, tone, and offer rules. You usually do not need to write every message by hand.

Use the Playground to review examples before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, product choices, and level of urgency that fit your business.

When reviewing examples, look for:

- Whether the message gives a respectful reason to come back.
- Whether the product, collection, or offer is relevant to the customer's history.
- Whether the tone feels warm and intentional, not desperate or repetitive.
- Whether discounts follow the approved strategy.
- Whether the copy avoids assumptions about why the customer left.
- Whether replies can continue naturally in the channel or reach the Inbox when needed.

The more realistic the examples are, the easier it is to teach the system what "good" looks like for your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use test customer profiles that have channel consent, then:

- Choose a profile with historical purchase or engagement and around 3 months of inactivity.
- Confirm the profile has historical and recent activity visible in Hellotext.
- Confirm the audience includes the test profile.
- Confirm the products or collections used by the playbook have correct images, prices, stock, variants, and links.
- Generate or simulate message examples in the Playground.
- Mark examples you like and examples you do not like.
- Test a customer who recently reactivated and should not receive Dormant Revival.
- Test a customer who is closer to 30 days inactive and should belong to Soft Reactivation instead.
- Test a customer who is closer to 12 months inactive and should belong to Sunset Saver when available.
- Test a customer who is not eligible for the channel.
- Review product links, discounts, and attribution.
- Send a realistic reply and confirm it reaches the right teammate or team if handoff is available.

If tracking is custom, confirm that purchase events, product-interest events, click events, reply events, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Dormant Revival being enabled does not mean every inactive customer receives a message.

The playbook may wait, skip, stop, or let another playbook act when:

- Customer activity is missing, delayed, or not tied to a usable customer profile.
- The customer is still in the recent-inactivity window for Soft Reactivation.
- The customer is already in a final-attempt window for Sunset Saver.
- The customer recently bought, clicked, replied, or entered another active playbook.
- No relevant product, collection, offer, or message angle can be found.
- Products are unavailable, out of stock, missing prices, missing images, or missing usable links.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Hellotext does not detect a healthy-ROI opportunity to message at that moment.
- Timing, frequency, quiet hours, templates, or channel rules prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which customers created eligible Dormant Revival moments.
- Which messages were sent, skipped, delayed, clicked, replied to, or purchased from.
- Whether product choices felt relevant to the customer's history.
- Whether links, images, prices, variants, and stock were correct.
- Purchases, attributed revenue, opt-outs, replies, and failed messages.
- Whether discounts improved reactivation or only reduced margin.
- Whether Dormant Revival overlaps with Soft Reactivation, Sunset Saver, Replenishment Driver, Cross-Sell Driver, AI Cart Saver, support playbooks, or campaigns.

Tune one thing at a time: audience, product scope, product logic, tone, Playground feedback, discount strategy, channel, or handoff path.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Connect Shopify]({% link _integrations/connect-shopify.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Soft Reactivation playbook]({% link _journeys/soft-reactivation-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
