Use this guide when shoppers showed interest in a product and you want Hellotext to notify the right people automatically when that product becomes meaningfully cheaper for them.

Price-Drop Pouncer is an autonomous conversion playbook. It connects catalog price changes with recent customer interest, checks whether each customer personally saw a higher price, and sends a focused price-drop alert when the opportunity still makes sense.

Its value is operational simplicity: Hellotext watches for relevant price drops, finds the shoppers most likely to care, and communicates the new price without your team building a segment, checking product history, or sending a one-off campaign.

It is not a journey route and it is not a general sale announcement. It is a prebuilt playbook with its own configuration and automatic eligibility rules.

## What Price-Drop Pouncer does

Price-Drop Pouncer helps recover demand that was paused by price.

It can:

- Start when Hellotext receives a product price decrease from your catalog.
- Match that price change with recent product interest from product views, cart additions, or product recommendations.
- Compare the current price with the price each customer most recently saw, not only with the previous catalog price.
- Send a notification with product context, the previous price, the new price, the percentage drop, and a product link.
- Use customer context to adjust the message tone and urgency without inventing price facts.
- Check whether the product is still sellable before sending.
- Avoid messaging when the customer recently bought the product, the price changed again, or the product can no longer be sold.
- Let your team review available configuration such as channel, tone, and handoff or assignment behavior.

The exact configuration can vary by account, connected store, plan, and rollout status. Review the generated playbook before enabling it instead of assuming every business has the same options.

## When to use it

Use Price-Drop Pouncer when customers showed interest in a specific product and the price later drops enough to make a follow-up useful.

It is a good fit when:

- Shoppers viewed a product but did not buy.
- Shoppers added a product to cart but left before purchase.
- Hellotext recommended a product and the customer has a recent recommendation signal.
- Your catalog sends reliable product price changes.
- Product links, images, prices, sellability, and availability are accurate.
- You want an automatic price alert, not a broad sale campaign.

Use a campaign or broadcast when you want to announce a sale, promotion, or price change to a selected audience, even if those customers did not show interest in the specific product.

Use [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}) when the key change is availability, not price. Use [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) when the shopper viewed an available product but no price drop happened. Use [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) when the strongest signal is an abandoned cart or checkout. Use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) when the customer needs help finding a better product or alternative.

## What it needs before launch

Before enabling the playbook, confirm the catalog, product, and customer signals it depends on.

Check that:

- Your store, ERP, catalog, or product source sends price changes to Hellotext.
- Product and variant identifiers are stable across catalog, product-view, cart, recommendation, and purchase signals.
- Prices use the same currency for comparison.
- Product names, images, current prices, sellability, availability, and product links are current.
- Customer profiles are subscribed, identifiable, and reachable.
- Product-view, cart-addition, and recommendation signals are being captured where relevant.
- Purchase or order signals are available so the playbook can avoid contacting customers who already bought.
- The channel is connected and ready.
- Customers have consent and are eligible for the channel.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After enabling the playbook, use the automatically generated reports to review triggered shoppers, delivered messages, engagement, recovered purchases, attributed revenue, revenue by segment, revenue by channel, and average time to recovery.

## How to configure it

Go to **Playbooks**, click **Explore playbooks**, and choose **Price-Drop Pouncer**.

Review the generated playbook configuration before enabling it.

Pay special attention to:

- **Channel:** where the price alert can be sent.
- **Tone:** how direct, playful, premium, or restrained the message should feel.
- **Assignment or handoff:** who should handle replies if a customer responds.
- **Product data:** whether names, images, prices, links, and availability look correct.
- **Catalog connection:** whether price changes arrive reliably and quickly.
- **Message preview:** whether the message explains the product, the old price, the new price, and the reason to revisit without exaggerating urgency.

The configuration focuses on the drop threshold, channel, tone, product data, and assignment or handoff. Prompts, intents, or journey steps belong to other playbook types, not this price-drop playbook.

## How it decides who should get a price alert

Price-Drop Pouncer does not send every price change to every reachable customer.

It looks for a recent product-interest signal, then checks whether the new price is meaningfully lower than the price that customer most recently saw.

Current interest sources include:

| Customer signal | What it means |
| --- | --- |
| Product view | The customer viewed the product or a variant recently. |
| Cart addition | The customer added the product or a variant to cart recently. |
| Product recommendation | Hellotext recently recommended the product to that customer. |

If the same customer has multiple signals for the product family, Hellotext uses the most recent price-bearing observation. This keeps the alert honest: if a customer first saw a product at one price and later saw it at a lower price, the playbook compares against the latest price they actually saw.

## How the message is written

The message is grounded in exact price-drop facts from Hellotext.

It can include:

- A clear price-drop hook.
- The previous price the customer saw.
- The current product price.
- The percentage drop.
- Product context and a product link.
- A call to view the product and its new price.

The message should not invent stock, sell-through, deadlines, expiry, reservations, future-price claims, or a specific amount saved. It should not push the customer directly to checkout or claim the item is still in their cart unless that is explicitly supported.

If Hellotext has reliable live stock information, the message may use that context carefully. It should never create false urgency from missing or stale stock data.

## How it works with nearby playbooks

Use the customer moment to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Product became cheaper for a shopper who recently showed interest | Price-Drop Pouncer |
| Product was unavailable and became sellable again | [Back-in-Stock Pounce]({% link _journeys/back-in-stock-pounce.md %}) |
| Shopper viewed an available product but no price drop happened | [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) |
| Shopper added products to cart or checkout and left | [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) |
| Shopper needs a recommendation or alternative | [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) |
| Business wants to announce a sale to a selected audience once | Campaign or broadcast |

Price-Drop Pouncer can run alongside browse, cart recovery, recommendations, and back-in-stock alerts when ownership is clear. Price-Drop Pouncer owns the moment when the new price is the reason to re-engage.

## How to test it

Test with a small, realistic case before enabling it broadly.

Use a test customer profile that has channel consent, then:

- View, add to cart, or receive a recommendation for a test product.
- Confirm the product-interest signal appears on the right customer profile.
- Change the product price downward in the connected catalog.
- Confirm the price change reaches Hellotext with the same product or variant identifiers.
- Confirm the product is still sellable and has a usable product link.
- Confirm the message uses the right product, previous price, new price, percentage drop, image, and link.
- Confirm the playbook does not send if the product becomes unsellable.
- Confirm the playbook does not send an outdated message if another price change supersedes the first one.
- Confirm the playbook does not send if the test customer already purchased, when that condition applies.
- Send a reply and confirm it reaches the Inbox if your team should handle replies.
- Review triggered, delivered, engaged, recovered, skipped, and blocked examples after launch.

If tracking is custom, confirm that product identifiers, variant identifiers, price amounts, currency, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Enabling the playbook does not guarantee every catalog price decrease produces a message.

The playbook may not send when:

- The price change did not arrive.
- The price increased, stayed the same, or changed currency.
- The price drop was not meaningful enough compared with the price the customer most recently saw.
- The customer did not have recent product-view, cart-addition, or recommendation interest.
- The product or variant identifiers do not match across catalog and customer signals.
- The product is unavailable, hidden, archived, missing a price, or missing a usable link.
- A newer price change superseded the quoted price.
- The customer already bought the product recently.
- The profile cannot be reached in the selected channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- The channel, sender, WhatsApp template, or message format is not ready.
- Frequency limits or another send rule delays or blocks the message.
- Another playbook or campaign is already handling the same customer moment.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which products created price-drop triggers.
- How many customer profiles were eligible.
- How many messages were delivered, skipped, blocked, engaged, or recovered.
- Whether the old price, new price, and percentage drop were correct.
- Whether products were still sellable when customers clicked.
- Whether product links, images, prices, and variants were correct.
- Replies, opt-outs, and support questions.
- Purchases, attributed revenue, revenue by segment, revenue by channel, and missed opportunities.
- Whether the playbook overlaps with campaigns, Browse Recovery, cart recovery, Back-in-Stock Pounce, or Smart Recommender.

Tune one thing at a time: channel, tone, assignment, product data, catalog sync, or related playbook scope.

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
- [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Campaigns and broadcasts overview]({% link _campaigns/campaigns-overview.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
