Use this guide when customers have been inactive for around 12 months, or were not reactivated by earlier attempts, and you want Hellotext to make one careful final attempt before automatically backing off.

Sunset Saver is a final win-back playbook. It helps Hellotext identify customer profiles that have not purchased, visited, clicked, replied, or otherwise engaged for a long period, send a final message when there is still a healthy opportunity, then suppress future automatic recovery attempts if the customer does not come back.

It is not a journey route, a one-time campaign, or a manual list clean-up. It sits at the end of the reactivation family: after [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}), which is for recent inactivity around 30 days, and [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}), which is for customers around 3 months inactive.

Availability can vary by account and rollout status. If the card appears as on request or disabled, confirm availability with your Hellotext team before planning a launch.

## What Sunset Saver does

Sunset Saver helps close the recovery cycle without continuing to pressure customers who have been inactive for a long time.

It can:

- Look for customers around 12 months inactive or not reactivated after earlier attempts.
- Use customer history, product context, catalog data, channel eligibility, and offer rules before a message is sent.
- Generate one final personalized message with a clear reason to come back, such as a relevant product, collection, update, or approved offer.
- Let your team give Playground feedback on examples so Hellotext learns which tone and style fit the business.
- Follow existing eCommerce offer rules, use AI-driven discounts up to an approved maximum percentage, or send without discounts.
- Choose the most cost-efficient available channel, such as WhatsApp, SMS, or others, and send only when it internally detects an opportunity to keep ROI healthy.
- Automatically suppress future recovery attempts for that profile if the customer does not buy, reply, or show another relevant signal.
- Skip customers when there is no consent, the profile cannot be reached, another playbook is a better fit, or there is not enough relevant reason to reach out.

The exact configuration can vary by account, connected store, catalog quality, channel, templates, and rollout status.

## When to use it

Use Sunset Saver when the customer has already passed the normal reactivation windows and you do not want to keep sending win-back messages indefinitely.

It is a good fit when:

- The customer has been inactive for around 12 months.
- The customer did not come back after Soft Reactivation, Dormant Revival, or other recovery moments.
- The business has a strong and respectful reason to make one final attempt.
- You want Hellotext to reduce pressure automatically if that attempt does not work.
- There is enough history, product, offer, or context for the message to avoid feeling generic.

Do not use Sunset Saver for customers who are just starting to cool down. For a recent slowdown, use [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}). For customers who have been inactive for around 3 months, use [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}).

For product-specific moments, use the more specific playbook: [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) for consumable reorder timing, [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) for related products after purchase, and [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) for abandoned cart or checkout moments.

## What it needs before launch

Before enabling Sunset Saver, confirm the setup it depends on.

Check that:

- Your store or data source sends purchase history and customer activity to Hellotext.
- Customer profiles include reliable identifiers, channel consent, and historical behavior.
- Purchase, browse, click, reply, unsubscribe, opt-out, and recent reactivation signals are available.
- Hellotext can distinguish recently inactive customers, customers around 3 months inactive, and customers around 12 months inactive or not reactivated.
- Product names, images, prices, stock, and links are current if the message can include recommendations.
- The audience you want to reach is identifiable and eligible for the selected channel.
- If discounts are allowed, eCommerce offer rules and any maximum AI discount percentage are approved before launch.
- Product cards, product links, or rich messages work in the channels you plan to use.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, purchases, attributed revenue, opt-outs, replies, skipped opportunities, and profiles suppressed from future recovery attempts.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Sunset Saver**.

The available cards can vary, but the proposed setup focuses on:

- **Outgoing channels:** where Hellotext can send or continue the final message.
- **Audience:** which audience or segment can receive the playbook.
- **Products:** which products, collections, categories, or groups can be used in the message.
- **Discount strategy:** whether the playbook follows existing eCommerce offer rules, can use AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Tone or Playground feedback:** how generated examples should learn what fits your business.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Sunset Saver depends on finding a reachable and cost-efficient channel for a customer who has been inactive for a long time. Hellotext can internally choose the most cost-efficient channel, such as WhatsApp, SMS, or others depending on availability, and avoid sends when it does not detect an opportunity to keep ROI healthy.

Suppression after the attempt is part of how the playbook behaves. It does not mean unsubscribing the customer or changing their channel consent; it means Hellotext stops trying future automatic recovery attempts for that profile if the final attempt does not create a relevant signal.

If you need a custom conversational agent with its own instructions, knowledge, and handoff rules, use [Custom Agent]({% link _journeys/custom-agent-playbook.md %}). If you need a fully controlled sequence of steps, use a custom journey.

## How Hellotext chooses the moment

Sunset Saver should start from a real long-inactivity signal, not from a broad static blast.

Hellotext can use signals like:

- Around 12 months since last purchase, visit, click, reply, or other meaningful engagement.
- Whether the customer was not reactivated after other attempts or recovery moments.
- Prior purchase history, product categories, customer value, and historical engagement.
- Products previously bought, browsed, clicked, or recommended.
- Whether another playbook owns the current moment, such as cart recovery, replenishment, cross-sell, support, Soft Reactivation, or Dormant Revival.
- Product availability, price, stock, links, and discount rules.
- Channel eligibility, consent, and recent communication history.

Before sending, Hellotext can also consider:

- Whether the inactivity signal is tied to a reachable customer profile.
- Whether the message has a relevant product, offer, or reason to reach out.
- Whether the customer recently bought, replied, unsubscribed, or opted out.
- Whether the profile can receive a message in an eligible channel.
- Whether there is an internal opportunity to keep ROI healthy for that send.
- Whether another active playbook is a better fit.
- Whether channel rules, templates, quiet hours, or eligibility allow the send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the customer moment to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Customer is starting to go quiet and has been inactive for around 30 days | [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) |
| Customer has been inactive for around 3 months | [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}) |
| Customer has been inactive or not reactivated for around 12 months | Sunset Saver |
| Customer may need to reorder a consumable product | [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) |
| Customer recently bought and may want a related product | [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) |
| Customer abandoned a cart or checkout | [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) |
| You want to send a planned one-time message to a selected audience | [Campaigns]({% link _campaigns/campaigns-overview.md %}) |

Sunset Saver can coexist with other playbooks when each one owns a different moment. It should not compete with a more specific signal, and it should stop trying to win back a customer who already returned, replied, opted out, or entered another active flow.

## Review messages in the Playground

Sunset Saver can generate personalized examples from customer history, product context, audience, channel, tone, and offer rules. You usually do not need to write every message by hand.

Use the Playground to review examples before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, product choices, and level of urgency that fit your business.

When reviewing examples, look for:

- Whether the message communicates a clear and respectful reason to come back.
- Whether the product, collection, or offer is relevant to the customer's history.
- Whether the tone feels final without being aggressive, desperate, or repetitive.
- Whether discounts follow the approved strategy.
- Whether the copy avoids assumptions about why the customer left.
- Whether replies can continue naturally in the channel or reach the Inbox when needed.

The more realistic the examples are, the easier it is to teach the system what a good final attempt looks like for your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use test customer profiles that have channel consent, then:

- Choose a profile with historical purchase or engagement and around 12 months of inactivity.
- Confirm the profile has historical activity visible in Hellotext.
- Confirm the audience includes the test profile.
- Confirm the products or collections used by the playbook have correct images, prices, stock, variants, and links.
- Generate or simulate message examples in the Playground.
- Mark examples you like and examples you do not like.
- Test a customer who recently reactivated and should not receive Sunset Saver.
- Test a customer who is closer to 30 days inactive and should belong to Soft Reactivation instead.
- Test a customer who is closer to 3 months inactive and should belong to Dormant Revival instead.
- Test a customer who is not eligible for the channel.
- Review product links, discounts, and attribution.
- Confirm that, if the attempt does not create a relevant signal, the profile is excluded from future automatic recovery attempts.

If tracking is custom, confirm that purchase events, product-interest events, click events, reply events, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Sunset Saver being enabled does not mean every old customer receives a message.

The playbook may wait, skip, stop, suppress, or let another playbook act when:

- Customer activity is missing, delayed, or not tied to a usable customer profile.
- The customer still belongs in Soft Reactivation or Dormant Revival.
- The customer recently bought, clicked, replied, or entered another active playbook.
- The customer already received a final attempt and was suppressed from future recovery attempts.
- No relevant product, collection, offer, or message angle can be found.
- Products are unavailable, out of stock, missing prices, missing images, or missing usable links.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Hellotext does not detect a healthy-ROI opportunity to message at that moment.
- Channel rules, templates, quiet hours, or eligibility prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which customers created eligible Sunset Saver moments.
- Which messages were sent, skipped, delayed, clicked, replied to, or purchased from.
- Which profiles were suppressed from future automatic recovery attempts.
- Whether product choices felt relevant to the customer's history.
- Whether links, images, prices, variants, and stock were correct.
- Purchases, attributed revenue, opt-outs, replies, and failed messages.
- Whether discounts improved recovery or only reduced margin.
- Whether Sunset Saver overlaps with Soft Reactivation, Dormant Revival, Replenishment Driver, Cross-Sell Driver, AI Cart Saver, support playbooks, or campaigns.

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
- [Dormant Revival playbook]({% link _journeys/dormant-revival-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
