Use this guide when customers asked to be notified about an unavailable product and you want Hellotext to notify them automatically when that product or variant is available again.

Back-in-Stock Pounce is an autonomous conversion playbook. It connects inventory signals with the customer profiles that showed interest, checks that the opportunity still makes sense, and sends a relevant alert to those people without your team manually checking lists, matching stock, or building campaigns.

Its value is operational simplicity: Hellotext communicates the restock automatically and intelligently to the customers waiting for that product, with the context they need to come back and buy.

It is not a journey route or a broad restock campaign. It is a prebuilt playbook with its own configuration.

## What Back-in-Stock Pounce does

Back-in-Stock Pounce helps convert demand that was blocked by inventory.

It can:

- Start when Hellotext receives a back-in-stock or availability signal for a product or variant.
- Use a waiting-list, notify-me, product-interest, or capture signal when that data is available.
- Send a notification with product context and a product link when the customer can be reached.
- Check whether the product or variant is still available before the message goes out.
- Stop when the product is unavailable again, the customer already bought, the customer is not reachable, or no more follow-up is needed.
- Let your team review and edit the playbook configuration before enabling it.

The exact configuration can vary by account, connected store, and rollout status. Review the generated playbook before enabling it instead of assuming every business has the same options.

## When to use it

Use Back-in-Stock Pounce when the customer wanted a specific product but inventory blocked the purchase.

It is a good fit when:

- Customers join a waitlist or ask to be notified when an item returns.
- A specific size, color, variant, or SKU was unavailable and becomes sellable again.
- Your store or data source can send reliable product or variant stock updates.
- Product links, images, prices, and availability are accurate enough to send quickly.
- You want a direct restock alert, not a broader merchandising message.

Use a campaign instead when you want to announce a restock to a selected audience once, even if those customers did not ask for that product.

Use [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) when the customer viewed an available product but did not buy. Use [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) when the customer added the product to cart or checkout. Use [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) when the customer needs help choosing alternatives or related products.

## What it needs before launch

Before enabling the playbook, confirm the inventory and customer signals it depends on.

Check that:

- Your store, ERP, catalog, or inventory source sends stock or availability changes to Hellotext.
- Product and variant IDs match the product-interest, waitlist, or notify-me signal.
- Out-of-stock and back-in-stock states are reliable at the level you plan to message about.
- Product names, images, prices, stock, and product links are current.
- The customer profiles that asked to be notified are subscribed, identifiable, and reachable.
- The channel is connected and ready.
- Customers have consent and are eligible for the channel.
- Purchase or order signals are available if the playbook should avoid messaging customers who already bought.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After enabling the playbook, use the automatically generated reports to review entries, sends, skips, clicks, purchases, attributed revenue, and failures.

## How to configure it

Go to **Playbooks**, click **Explore playbooks**, and choose **Back-in-Stock Pounce**.

Review the playbook cards available in your account before enabling it. The configuration can include:

- **Outgoing channels:** where Hellotext can send the stock alert.
- **Tone or Playground feedback:** how the generated notification should fit your business.
- **Assignment or handoff:** who should handle replies when a customer needs a person.
- **Product scope, when exposed:** which products, variants, categories, or collections can participate.

Hellotext handles the stock trigger, customer-interest matching, send timing, availability recheck, purchase check, and reporting automatically. Back-in-Stock Pounce does not require a prompt, intents, journey steps, waits, or exit conditions.

## How it works with nearby playbooks

Use the customer signal to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Customer asked to be notified about an unavailable item | Back-in-Stock Pounce |
| Customer viewed an available product but did not add to cart | [Browse Recovery]({% link _journeys/browse-recovery-playbook.md %}) |
| Customer added products to cart or checkout and left | [AI Cart Saver]({% link _journeys/ai-cart-saver-playbook.md %}) or [Cart Saver route]({% link _journeys/cart-saver-route.md %}) |
| Customer needs help choosing a product or alternative | [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}) |
| Business wants to announce a restock to a selected audience once | Campaign or broadcast |

Back-in-Stock Pounce can run alongside browse and cart recovery when the ownership is clear. Back-in-stock handles the unavailable-item moment; browse and cart recovery handle available products that the customer did not buy.

## How to test it

Test with a small, realistic case before enabling it broadly.

Use a test customer profile that has channel consent, then:

- Create or identify a product or variant that is unavailable.
- Create a waitlist, notify-me, capture, or product-interest signal for that test profile.
- Confirm the product-interest signal appears on the right customer profile.
- Send or simulate the stock or availability update that makes the item sellable again.
- Confirm the playbook detects that update and creates an eligible back-in-stock opportunity.
- Confirm the message uses the right product, variant, image, price, and link.
- Confirm the playbook does not send if the product becomes unavailable again.
- Confirm the playbook does not send if the test customer already bought the product.
- Send a reply and confirm it reaches the Inbox if your team should handle replies.
- Review sent, skipped, failed, clicked, and converted examples after launch.

If tracking is custom, confirm that product identifiers, variant identifiers, stock status, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Enabling the playbook does not guarantee every restock produces a message.

The playbook may not send when:

- The stock or availability signal did not arrive.
- The product-interest, waitlist, or notify-me signal is missing.
- The product or variant IDs do not match across the stock update and customer signal.
- The product is still unavailable, hidden, archived, missing a price, or missing a usable link.
- The customer already bought the item.
- The profile cannot be reached in the selected channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- The channel, sender, WhatsApp template, or message format is not ready.
- Quiet hours, frequency limits, or another send rule delays or blocks the message.
- Another playbook or campaign is already handling the same customer moment.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which products or variants created back-in-stock entries.
- How many customer profiles entered the playbook.
- How many messages were sent, skipped, failed, clicked, or converted.
- Whether products were still available when customers clicked.
- Whether product links, images, prices, and variants were correct.
- Replies, opt-outs, and support questions.
- Purchases, attributed revenue, and missed opportunities.
- Whether the playbook overlaps with campaigns, Browse Recovery, cart recovery, or Smart Recommender.

Tune one thing at a time among the cards the playbook exposes: product scope, channel, tone, Playground feedback, or assignment.

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
- [Price-Drop Pouncer playbook]({% link _journeys/price-drop-pouncer.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [AI Cart Saver playbook]({% link _journeys/ai-cart-saver-playbook.md %})
- [Cart Saver route]({% link _journeys/cart-saver-route.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Campaigns and broadcasts overview]({% link _campaigns/campaigns-overview.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
