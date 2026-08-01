Use this guide when shoppers are considering one or more products and you want Hellotext to suggest items that complete the look, kit, routine, or set.

Complete-the-Look is an AI-assisted conversion playbook. It uses product context, audience rules, customer behavior, catalog relationships, channel eligibility, and offer rules to generate personalized matching-product suggestions.

It is not a journey route and it is not a generic product recommendation chat. It starts from a product the shopper picked, viewed, or considered, then suggests something that naturally pairs with it.

Availability can vary by account and rollout status. If the card appears as on request or disabled, confirm availability with your Hellotext team before planning a launch.

## What Complete-the-Look does

Complete-the-Look helps turn product interest into a larger or more complete purchase.

It can:

- Suggest products that pair well with what the shopper picked, viewed, or considered.
- Apply only to selected products, collections, categories, or product groups.
- Use customer, product, catalog, price, stock, and channel context before a message is sent.
- Generate message examples that adapt per customer.
- Let your team give Playground feedback on examples so Hellotext learns what fits the business.
- Follow existing ecommerce offer rules, use AI-driven discounts up to an approved maximum percentage, or send without discounts.
- Avoid recommending products that are unavailable, irrelevant, already purchased, or outside the selected product scope.

The exact configuration can vary by account, connected store, catalog quality, channel, templates, and rollout status.

## When to use it

Use Complete-the-Look when the customer already has an anchor product and a matching product can make the choice better.

It is a good fit when:

- A shopper picked or viewed a product and another item completes the look, set, kit, or routine.
- Your catalog has clear product relationships, matching collections, compatible accessories, or merchant-approved product groups.
- Your team wants Hellotext to suggest matching products without manually building a campaign for every product.
- The recommendation should feel like "this goes with what you picked," not like a broad sale.
- Your catalog has reliable product images, prices, stock, variants, and links.

It works especially well for apparel, footwear, accessories, beauty routines, home sets, electronics accessories, compatible product sets, and any catalog where the next product depends on the anchor product.

Do not use it as a conversational recommender. If the customer asks what to buy, compares options, asks about sizes, or needs product guidance in chat, use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}).

For post-purchase add-ons or repeat expansion after a completed purchase, use [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}). For browsing follow-up when there is no matching-product moment, use [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}).

## What it needs before launch

Before enabling Complete-the-Look, confirm the setup it depends on.

Check that:

- Your product catalog or commerce integration is connected.
- Product names, images, prices, variants, stock, and product links are current.
- The products you want to include have meaningful complements, matching products, compatible accessories, or related items.
- Product and variant identifiers are stable across catalog, product-view, cart, recommendation, and purchase signals.
- The audience you want to reach is subscribed, identifiable, and eligible for the selected channel.
- Purchase, cart, and product-interest signals are available so Hellotext can avoid irrelevant suggestions.
- If discounts are allowed, ecommerce offer rules and any maximum AI discount percentage are approved before launch.
- Product cards, product links, or rich messages work in the channels you plan to use.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, add-to-cart actions, purchases, attributed revenue, and skipped opportunities.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Complete-the-Look**.

The available cards can vary, but the proposed setup focuses on:

- **Outgoing channels:** where Hellotext can send matching-product suggestions.
- **Audience:** which audience or segment can receive the playbook.
- **Products:** which products, collections, categories, or groups the playbook can use.
- **Discount strategy:** whether the playbook follows existing ecommerce offer rules, can use AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Tone or Playground feedback:** how generated examples should learn what fits your business.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Complete-the-Look depends on whether the shopper can be reached when the matching-product suggestion is still relevant.

This playbook usually should not require manual prompt, intent, or journey-step configuration. If you need a custom conversational agent with manual intents and knowledge, use [Custom Agent]({% link _journeys/custom-agent-playbook.md %}).

## How recommendations are chosen

Complete-the-Look recommendations should start from a real anchor product.

Hellotext can use signals like:

- The product, variant, collection, category, or style the shopper picked or viewed.
- Products that match the anchor product by style, use case, collection, compatibility, or routine.
- Merchant-provided product groups, catalog relationships, or recommendation logic.
- Product availability, stock, price, images, product links, and variant quality.
- Customer history, prior engagement, purchases, and products already shown when that context is available.

Before sending, Hellotext can also consider:

- Whether the anchor product is still valid and tied to a reachable customer profile.
- Whether the matching product is available and within the configured product scope.
- Whether the customer already bought the suggested product or a close substitute.
- Whether another playbook is a better owner for the same moment.
- Whether consent, timing, frequency, and channel rules allow the send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the customer moment to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Shopper picked or viewed a product and a matching item completes it | Complete-the-Look |
| Shopper viewed a product but there is no matching-product angle | [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) |
| Shopper added products to cart or checkout and left | [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) |
| Shopper needs a recommendation through conversation | [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) |
| Customer already bought and may want an add-on later | [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) |
| Customer may need to reorder a consumable product | [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) |

Complete-the-Look can run alongside Browse Recovery and AI Cart Saver when the product moment is clear. Complete-the-Look owns the "this pairs with what you picked" moment; cart recovery owns abandoned cart or checkout; Browse Recovery owns earlier browsing intent.

## Review messages in the Playground

Complete-the-Look can generate personalized examples from product, audience, catalog, customer, channel, tone, and offer context. You usually do not need to write every message by hand.

Use the Playground to review examples before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, product logic, and level of detail that fit your business.

When reviewing examples, look for:

- Whether the suggested product really pairs with the anchor product.
- Whether the message explains the match without sounding forced.
- Whether product images, prices, links, variants, and discounts are accurate.
- Whether the recommendation avoids products the customer already bought.
- Whether the message creates helpful momentum without inventing urgency.
- Whether replies can continue naturally in the channel or reach the Inbox when needed.

The more realistic the examples are, the easier it is to teach the system what "good" looks like for your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use test customer profiles that have channel consent, then:

- Choose a product that should have a clear matching item.
- Confirm the product and matching items exist in the catalog with correct images, prices, stock, variants, and links.
- Confirm the product is inside the configured product scope.
- Confirm the audience includes the test profile.
- Generate or simulate message examples in the Playground.
- Mark examples you like and examples you do not like.
- Test a product that should not produce a matching suggestion.
- Test a customer who already bought the suggested matching product.
- Test a customer who is not eligible for the channel.
- Review product links, add-to-cart links, discounts, and attribution.
- Send a realistic reply and confirm it reaches the right teammate or team if handoff is available.

If tracking is custom, confirm that product identifiers, variant identifiers, prices, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Complete-the-Look being enabled does not mean every product view or product selection produces a suggestion.

The playbook may wait, skip, stop, or let another playbook act when:

- Product-interest or purchase signals are missing, delayed, or not tied to a usable customer profile.
- The anchor product is outside the configured product scope.
- No relevant matching product can be found.
- The matching product is unavailable, out of stock, missing a price, missing an image, or missing a usable link.
- The customer already bought the suggested product or a close substitute.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Frequency, timing, or channel rules prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which products created eligible complete-the-look moments.
- Which matching products were suggested, skipped, clicked, added to cart, or purchased.
- Whether suggestions felt relevant by product, collection, style, size, or use case.
- Whether product links, images, prices, variants, and stock were correct.
- Clicks, add-to-cart actions, purchases, attributed revenue, opt-outs, replies, and failed messages.
- Whether discounts improved conversion or only reduced margin.
- Whether Complete-the-Look overlaps with Browse Recovery, AI Cart Saver, Smart Recommender, Cross-Sell Driver, or campaigns.

Tune one thing at a time: product scope, audience, recommendation rules, tone, Playground feedback, discount strategy, channel, or handoff path.

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
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
