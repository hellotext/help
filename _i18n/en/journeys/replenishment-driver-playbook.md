Use this guide when customers buy products that run out, wear down, or need to be replaced on a predictable cycle.

Replenishment Driver is an active retention playbook. It helps Hellotext remind customers to reorder around the moment they may need the product again, using product usage data, purchase history, customer behavior, channel eligibility, and send checks.

It is not a generic win-back campaign and it is not a cart recovery flow. It starts after a purchase and focuses on repeat orders for products where timing matters.

## What Replenishment Driver does

Replenishment Driver helps customers reorder before the product runs out.

It can:

- React after a customer buys a replenishable product.
- Use product-level usage data, such as `usage_duration_days`, when available.
- Use product-family defaults or average reorder patterns when a product-specific value is missing.
- Learn from the customer's own purchase cycle when enough history exists.
- Schedule a reminder near the estimated refill window.
- Include a reorder link, product link, or discount when those options are available and configured.
- Skip, wait, or stop when the customer already reordered, the product is not eligible, another playbook is a better owner, or the customer cannot be reached.

The exact experience can vary by account, connected store, channel, available templates, and playbook rollout status.

## When to use it

Use Replenishment Driver when repeat purchase depends on a product being consumed or replaced.

It is a good fit for products such as:

- Vitamins, supplements, or wellness products.
- Coffee, tea, food, pet food, or household staples.
- Skin care, beauty, or personal care products.
- Refills, replacement parts, filters, or consumable accessories.
- Any product family where your team knows a reasonable usage window.

It works best when Hellotext can see order history, product identity, quantity, and a refill timing signal for the SKU or product family.

Do not use it for products that are usually bought once and kept for a long time. For related product suggestions after a purchase, use [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}). For customers who have gone cold across the brand, use a reactivation playbook. For customers who have not bought yet, use [First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}).

## What it needs before launch

Before enabling Replenishment Driver, confirm the setup it depends on.

Check that:

- Your store, ERP, or data source sends order and purchase history to Hellotext.
- Products, variants, SKUs, names, and links match your catalog.
- Replenishable products are identifiable by product, SKU, category, or product family.
- Usage windows are available, such as a `usage_duration_days` value, product-family default, or internal average.
- Purchase dates and quantities are reliable enough to estimate when a customer may need more.
- Reorder links, product links, prices, stock, and optional discount rules are current.
- The channel the playbook can use is connected and ready.
- Customers have consent and are eligible for the channel.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review scheduled, sent, skipped, clicked, reordered, and attributed outcomes.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Replenishment Driver**.

The playbook exposes the settings that control how it communicates:

- **Discount strategy:** whether the reminder follows existing ecommerce offer rules, can use AI-driven discounts up to a maximum percentage, or sends without discounts.
- **Channels:** where Hellotext can send or continue the conversation.
- **Tone or Playground feedback:** how generated follow-ups should learn what fits your business.

Keep automatic channel selection unless you have a clear reason to limit the playbook. Replenishment Driver depends on whether the customer can actually be reached when the refill window arrives.

Product usage duration and replenishment eligibility come from product data, purchase history, and Hellotext's internal scoring. They are inputs to the decision, not reminder-schedule controls on the playbook.

## How timing works

Replenishment timing is an estimate, not proof that the customer has run out.

Hellotext can use several levels of signal:

- A product setting, such as `usage_duration_days`, when your team knows how long a product usually lasts.
- A product-family or category default when a specific product does not have its own value.
- Average reorder behavior from customers who bought the same product.
- The customer's own repeat-purchase pattern when enough history exists.

The playbook then calculates when a reminder makes sense before the estimated refill point. Hellotext handles that delivery timing automatically rather than asking you to schedule each reminder.

Before sending, Hellotext can also consider:

- Whether the purchase signal is tied to a usable customer profile.
- Whether the purchased product is eligible for replenishment.
- Whether the customer already reordered the same product or a replacement.
- Whether the product, price, stock, discount, or link still makes sense.
- Whether the profile can receive a message in an eligible channel.
- Whether another playbook is already a better fit for this moment.
- Whether consent, timing, frequency, or channel rules allow a send.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with other post-purchase playbooks

Use the customer moment to decide the owner.

| Customer moment | Better fit |
| --- | --- |
| Customer may be running out of a consumable product | Replenishment Driver |
| Customer bought one product and may want a related product | [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}) |
| Customer received an order and should review the product | [Review Builder]({% link _journeys/review-builder-playbook.md %}) |
| Customer should give loyalty feedback after delivery | [NPS Pulse]({% link _journeys/nps-pulse-playbook.md %}) |
| Customer has been inactive for a long period | Reactivation or win-back playbook when available |
| Customer has not bought yet | [First-Purchase Driver]({% link _journeys/first-purchase-driver-playbook.md %}) |

Replenishment Driver can run alongside feedback playbooks when the moments are different. Review Builder asks about the product experience after delivery; Replenishment Driver follows up near the estimated refill window.

## Review messages in the Playground

Replenishment Driver can generate personalized follow-ups from product, purchase, usage, customer, and channel context. You usually do not need to write every message by hand.

Use the Playground to review sample messages before launch. Mark the examples you like and the examples you do not like, so Hellotext can learn the style, wording, and level of detail that fits your business.

When reviewing examples, look for:

- Whether the message sounds like a helpful refill reminder, not a pressure tactic.
- Whether the copy says the customer may be running low instead of claiming certainty.
- Whether the product, quantity, link, and discount are relevant.
- Whether replies can naturally continue in the channel or reach the Inbox when needed.

The more realistic the Playground examples are, the easier it is to teach the system what "good" looks like for your store.

## How to test it

Test with a small, realistic path before enabling it broadly.

Use test customer profiles that have channel consent, then:

- Place a test order with a replenishable product.
- Confirm the order and product appear on the customer profile.
- Confirm the product has a usage window, product-family default, or enough purchase history to estimate one.
- Confirm the order and product create an eligible replenishment opportunity.
- Test a customer who reorders before the reminder, which should prevent or update the replenishment follow-up.
- Test a non-replenishable product that should be excluded.
- Test a customer who is not eligible for the channel.
- Review reorder links, product links, discounts, and attribution.
- Send a realistic reply and confirm the resulting conversation appears in the Inbox.

If tracking is custom, also confirm that purchase events, product identifiers, quantities, timestamps, and customer identifiers match what Hellotext expects.

## Why it may not send

Replenishment Driver being enabled does not mean every purchase produces a refill reminder.

The playbook may wait, skip, stop, or let another playbook act when:

- Purchase history is missing, delayed, or not tied to a usable customer profile.
- The product is not marked or recognized as replenishable.
- Usage duration, product-family defaults, or average reorder data are missing.
- The customer already reordered.
- The product is unavailable, discontinued, out of stock, or missing a usable link.
- The profile cannot be reached in an eligible channel.
- The customer unsubscribed, opted out, or is otherwise not eligible.
- Frequency, timing, or quiet-hour rules prevent the send.
- The channel, sender, template, link, or message format is not ready.
- Another active playbook is a better fit.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which products and product families created eligible replenishment moments.
- Which reminders were scheduled, sent, delayed, skipped, or blocked.
- Which products had missing or suspicious usage windows.
- Clicks, repeat purchases, attributed revenue, opt-outs, replies, and failed messages.
- Whether discounts increased repeat orders or reduced margin.
- Whether Replenishment Driver overlaps with [Cross-Sell Driver]({% link _journeys/cross-sell-driver-playbook.md %}), reactivation, or campaigns.

Tune one thing at a time: product data, discount strategy, channel, tone, or Playground feedback.

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
- [Cross-Sell Driver playbook]({% link _journeys/cross-sell-driver-playbook.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [First-Purchase Driver playbook]({% link _journeys/first-purchase-driver-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
