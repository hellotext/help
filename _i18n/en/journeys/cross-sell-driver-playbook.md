Use this guide when customers have already shown enough purchase intent and Hellotext can suggest a relevant add-on, accessory, complementary item, or next product.

Cross-Sell Driver is an active expansion playbook. It helps Hellotext suggest complementary products after a purchase or strong product interest, using order history, catalog context, product relationships, stock, customer behavior, channel eligibility, and send checks.

It is not a broad promotion and it is not a generic product recommendation chat. It starts from a specific customer moment: the customer bought, is likely to buy, or showed interest in an anchor product, and another product may naturally fit next.

## What Cross-Sell Driver does

Cross-Sell Driver helps increase order value or repeat purchase by recommending products that make sense with what the customer already bought or considered.

It can:

- React after a purchase, delivery, or strong product-interest signal when those signals are available.
- Use the purchased or viewed product as the anchor for the recommendation.
- Suggest matching SKUs, accessories, complementary products, items often bought together, or related categories.
- Use catalog data, stock, product links, order history, and recommendation signals to avoid irrelevant suggestions.
- Include an add-to-cart link, product link, or discount when those options are available and configured.
- Avoid sending when the customer already bought the recommended product, the product is unavailable, another playbook owns the moment, or the customer cannot be reached.
- Continue the conversation or hand off to the Inbox when a reply needs a person.

The exact experience can vary by account, connected store, catalog quality, channel, available templates, and playbook rollout status.

## When to use it

Use Cross-Sell Driver when there is a clear relationship between what the customer already bought or considered and what they may want next.

It is a good fit for moments like:

- A customer buys a camera and may need a memory card, case, or tripod.
- A customer buys shoes and may want socks, care products, or a matching accessory.
- A customer buys skin care and may want a product from the same routine.
- A customer buys one item from a set and may want the rest of the look or kit.
- A returning customer shows interest in a product family and has purchase history that helps choose the next best add-on.

It works best when Hellotext can see order history, product identity, catalog metadata, stock, product links, and enough product relationship or recommendation data to make the suggestion feel natural.

Do not use it for products that do not have meaningful add-ons or next steps. For real-time product discovery in a conversation, use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}). For consumable products that need to be reordered, use [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}). For a one-time promotion to a selected audience, use a campaign.

## What it needs before launch

Before enabling Cross-Sell Driver, confirm the setup it depends on.

Check that:

- Your store, ERP, or data source sends purchases and order history to Hellotext.
- Products, variants, SKUs, names, images, prices, stock, and product links are current.
- Product relationships can be inferred or provided through catalog data, collections, categories, purchase history, or recommendation logic.
- The products you want to recommend have enough stock and usable links.
- Your team knows which collections, categories, or products should be included or excluded in the playbook configuration.
- If discounts are allowed, eCommerce offer rules and any maximum AI discount percentage are approved before launch.
- The channel the playbook can use is connected and ready.
- Customers have consent and are eligible for the channel.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, add-to-cart actions, purchases, attributed revenue, and skipped opportunities.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Cross-Sell Driver**.

The playbook exposes product scope and recommendation rules:

- **Product scope:** which products, collections, categories, or families can start or receive cross-sell recommendations.
- **Recommendation rules:** product relationships, exclusions, or merchandising rules that should guide suggested items.

Depending on the account rollout, it may also show cards for:

- **Discount strategy:** whether the message follows existing eCommerce offer rules, can use AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Channels:** where Hellotext can send or continue the conversation.
- **Tone or Playground feedback:** how generated follow-ups should learn what fits your business.
- **Escalation or assignment:** who should take over when a reply needs a person.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Cross-Sell Driver depends on whether the customer can be reached when the add-on suggestion is still relevant.

Hellotext handles customer eligibility, send timing, and reporting automatically. Product scope and recommendation rules remain direct controls for deciding which products participate and how complements are selected.

## How recommendations are chosen

Cross-sell recommendations should start from a real customer signal, not from a generic product list.

Hellotext can use signals like:

- The product, SKU, collection, category, or brand the customer bought or viewed.
- Products commonly bought together with the anchor item.
- Catalog relationships, compatible products, items often bought together, or merchant-provided collections.
- Stock, price, product availability, product links, and image quality.
- Customer history, preferences, engagement, and prior purchases.
- Products already shown, clicked, ignored, or bought when that context is available.

Before sending, Hellotext can also consider:

- Whether the anchor product is tied to a usable customer profile.
- Whether the recommended product is available and relevant.
- Whether the customer already bought the recommendation or a close substitute.
- Whether the recommendation would conflict with another active playbook.
- Whether the profile can receive a message in an eligible channel.
- Whether consent, timing, frequency, or channel rules allow the send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the customer moment to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Customer needs help choosing a product in a conversation | [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) |
| Customer bought or considered one product and may want a complementary one | Cross-Sell Driver |
| Customer may be running out of a consumable product | [Replenishment Driver]({% link _journeys/replenishment-driver-playbook.md %}) |
| Customer browsed but did not add to cart | [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) |
| Customer abandoned a cart | [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) |
| Customer received an order and should review the product | [Review Builder]({% link _journeys/review-builder-playbook.md %}) |

Cross-Sell Driver can run alongside Replenishment Driver when the product moments are different. Cross-sell suggests a related product; replenishment reminds the customer to reorder the same or replacement product when it may be running out.

## Review messages in the Playground

Cross-Sell Driver can generate personalized follow-ups from product, order, catalog, customer, and channel context. You usually do not need to write every message by hand.

Use the Playground to review sample messages before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, and level of detail that fits your business.

When reviewing examples, look for:

- Whether the recommendation feels genuinely related to the anchor product.
- Whether the message explains why the add-on is useful without sounding forced.
- Whether the product, image, price, link, and discount are accurate.
- Whether the recommendation avoids products the customer already bought.
- Whether replies can naturally continue in the channel or reach the Inbox when needed.

The more realistic the Playground examples are, the better the system can adapt messages to your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use test customer profiles that have channel consent, then:

- Place or import a test order with a product that should have a clear add-on.
- Confirm the order and product appear on the customer profile.
- Confirm the catalog contains the product, related products, stock, prices, images, and links.
- Confirm the recommended products are relevant and available.
- Test a product that should not produce a cross-sell suggestion.
- Test a customer who already bought the suggested add-on.
- Test a customer who is not eligible for the channel.
- Review product links, add-to-cart links, discounts, and attribution.
- Send a realistic reply and confirm it reaches the right teammate or team if handoff is available.

If tracking is custom, confirm that purchase events, product identifiers, quantities, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Cross-Sell Driver being enabled does not mean every purchase or product view produces a recommendation.

The playbook may wait, skip, stop, or let another playbook act when:

- Purchase or product-interest signals are missing, delayed, or not tied to a usable customer profile.
- The anchor product is not eligible for cross-sell.
- No relevant complementary product can be found.
- The recommended product is unavailable, out of stock, missing a price, or missing a usable link.
- The customer already bought the recommended product or a close substitute.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Frequency, timing, or quiet-hour rules prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which products or categories created eligible cross-sell moments.
- Which recommendations were sent, skipped, clicked, added to cart, or purchased.
- Which products have weak or missing relationship data.
- Whether suggested products are available, relevant, and not repetitive.
- Clicks, add-to-cart actions, repeat purchases, attributed revenue, opt-outs, replies, and failed messages.
- Whether discounts increase add-on purchases or only reduce margin.
- Whether Cross-Sell Driver overlaps with Smart Recommender, Replenishment Driver, cart recovery, or campaigns.

Tune one thing at a time: product scope, recommendation rules, and, when those cards are present, discount strategy, channel, tone, or handoff path.

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
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Replenishment Driver playbook]({% link _journeys/replenishment-driver-playbook.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
