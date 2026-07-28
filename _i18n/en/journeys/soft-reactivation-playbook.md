Use this guide when customers have started to go quiet and you want Hellotext to re-engage them before they become fully inactive. Soft Reactivation covers recent inactivity, usually around 30 days without a purchase, visit, click, reply, or other meaningful engagement.

Soft Reactivation is a retention playbook. It helps Hellotext recognize customers whose recent behavior is cooling down, then send a personalized nudge with relevant products, offers, or messaging context when the customer is still reachable.

It is not a journey route, a one-time campaign, or a final win-back attempt. It sits earlier in the customer lifecycle: after the customer has shown value, but before they have been inactive long enough for Dormant Revival, which is for customers around 3 months inactive. For customers around 12 months inactive or not reactivated, use Sunset Saver when available.

Availability can vary by account and rollout status. If the card appears as on request or disabled, confirm availability with your Hellotext team before planning a launch.

## What Soft Reactivation does

Soft Reactivation helps keep customers warm before the relationship goes cold.

It can:

- Look for customers whose recent purchase, browse, click, or reply behavior has slowed down.
- Use customer history, product context, catalog data, channel eligibility, and offer rules before a message is sent.
- Suggest products that may bring the customer back based on recent or historical interest.
- Generate personalized message examples that adapt per customer.
- Let your team give Playground feedback on examples so Hellotext learns what fits the business.
- Follow existing ecommerce offer rules, use AI-driven discounts up to an approved maximum percentage, or send without discounts.
- Skip customers when a recent purchase, another active playbook, missing consent, channel limits, or poor product context makes the send a bad fit.

The exact configuration can vary by account, connected store, catalog quality, channel, templates, and rollout status.

## When to use it

Use Soft Reactivation when customers are not fully dormant yet, but their engagement has started to drop.

It is a good fit when:

- The customer has been inactive for around 30 days.
- A customer bought before but has not bought again recently.
- A customer used to click, browse, or reply and has slowed down.
- The business wants a gentle return message instead of a heavy win-back campaign.
- There are relevant products, collections, or offers that make sense for the customer.
- The goal is to maintain the relationship before the customer becomes difficult to recover.

Do not use it for a specific product replenishment moment. Use [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) when the customer may need to reorder a consumable product. Use [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) when the next best action is a related product after a purchase. Use Dormant Revival when the customer has been inactive for around 3 months and Sunset Saver when the customer has been inactive or not reactivated for around 12 months.

## What it needs before launch

Before enabling Soft Reactivation, confirm the setup it depends on.

Check that:

- Your store or data source sends purchase history and customer activity to Hellotext.
- Customer profiles include reliable identifiers, channel consent, and recent behavior.
- Product names, images, prices, stock, and links are current.
- The products or collections you want to promote are eligible for reactivation messages.
- The audience you want to reach is identifiable and eligible for the selected channel.
- Purchase, browse, click, reply, and opt-out signals are available enough for Hellotext to avoid irrelevant sends.
- If discounts are allowed, ecommerce offer rules and any maximum AI discount percentage are approved before launch.
- Product cards, product links, or rich messages work in the channels you plan to use.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, purchases, attributed revenue, opt-outs, replies, and skipped opportunities.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Soft Reactivation**.

The available cards can vary, but the proposed setup focuses on:

- **Outgoing channels:** where Hellotext can send or continue the reactivation message.
- **Audience:** which audience or segment can receive the playbook.
- **Products:** which products, collections, categories, or groups can be used in the message.
- **Discount strategy:** whether the playbook follows existing ecommerce offer rules, can use AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Tone or Playground feedback:** how generated examples should learn what fits your business.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Soft Reactivation depends on whether the customer can be reached at a moment when the nudge still feels timely.

If you need a custom conversational agent with its own instructions, knowledge, and handoff rules, use [Custom Agent]({% link _journeys/custom-agent-playbook.md %}). If you need a fully controlled sequence of steps, use a custom journey.

## How Hellotext chooses the moment

Soft Reactivation should start from a real cooling-down signal, not from a static calendar blast.

Hellotext can use signals like:

- Days since last purchase, last visit, last click, last reply, or last meaningful engagement.
- Prior purchase history and customer value.
- Recent product interest, categories browsed, or products previously bought.
- Whether another playbook already owns the moment, such as cart recovery, replenishment, cross-sell, or support.
- Product availability, price, stock, links, and discount rules.
- Channel eligibility, consent, and recent communication history.

Before sending, Hellotext can also consider:

- Whether the inactivity signal is tied to a reachable customer profile.
- Whether the message has a relevant product, offer, or reason to reach out.
- Whether the customer recently bought, replied, unsubscribed, or opted out.
- Whether the profile can receive a message in an eligible channel.
- Whether another active playbook is a better fit.
- Whether timing, frequency, quiet hours, templates, or channel rules allow the send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the customer moment to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Customer is starting to go quiet and has been inactive for around 30 days | Soft Reactivation |
| Customer has been inactive for around 3 months | Dormant Revival when available |
| Customer has been inactive or not reactivated for around 12 months | Sunset Saver when available |
| Customer may need to reorder a consumable product | [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) |
| Customer recently bought and may want a related product | [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) |
| Customer abandoned a cart or checkout | [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) |
| You want to send a planned one-time message to a selected audience | [Campaigns and broadcasts]({% link _campaigns/campaigns-overview.md %}) |

Soft Reactivation can coexist with other playbooks when each one owns a different moment. It should not compete with a more specific signal, such as an abandoned cart, an expected replenishment window, or an active support conversation.

## Review messages in the Playground

Soft Reactivation can generate personalized examples from customer history, product context, audience, channel, tone, and offer rules. You usually do not need to write every message by hand.

Use the Playground to review examples before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, product choices, and level of urgency that fit your business.

When reviewing examples, look for:

- Whether the message feels like a helpful check-in, not pressure.
- Whether the product or collection is relevant to the customer's history.
- Whether the message gives the customer a clear reason to return.
- Whether discounts follow the approved strategy.
- Whether the copy avoids exaggerated urgency or assumptions about why the customer left.
- Whether replies can continue naturally in the channel or reach the Inbox when needed.

The more realistic the examples are, the easier it is to teach the system what "good" looks like for your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use test customer profiles that have channel consent, then:

- Choose a profile with purchase or engagement history that has slowed down.
- Confirm the profile has recent and historical activity visible in Hellotext.
- Confirm the audience includes the test profile.
- Confirm the products or collections used by the playbook have correct images, prices, stock, variants, and links.
- Generate or simulate message examples in the Playground.
- Mark examples you like and examples you do not like.
- Test a customer who recently bought again and should not receive a reactivation nudge.
- Test a customer who is not eligible for the channel.
- Review product links, discounts, and attribution.
- Send a realistic reply and confirm it reaches the right teammate or team if handoff is available.

If tracking is custom, confirm that purchase events, product-interest events, click events, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Soft Reactivation being enabled does not mean every quiet customer receives a message.

The playbook may wait, skip, stop, or let another playbook act when:

- Customer activity is missing, delayed, or not tied to a usable customer profile.
- The customer has not cooled down enough for a reactivation message.
- The customer recently bought, clicked, replied, or entered another active playbook.
- No relevant product, collection, offer, or message angle can be found.
- Products are unavailable, out of stock, missing prices, missing images, or missing usable links.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Timing, frequency, quiet hours, templates, or channel rules prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which customers created eligible soft-reactivation moments.
- Which messages were sent, skipped, delayed, clicked, replied to, or purchased from.
- Whether product choices felt relevant to the customer's history.
- Whether links, images, prices, variants, and stock were correct.
- Purchases, attributed revenue, opt-outs, replies, and failed messages.
- Whether discounts improved reactivation or only reduced margin.
- Whether Soft Reactivation overlaps with Replenishment Driver, Cross-Sell Driver, AI Cart Saver, support playbooks, or campaigns.

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
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
