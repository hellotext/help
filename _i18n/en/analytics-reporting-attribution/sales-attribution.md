Hellotext links orders to campaigns, playbooks, routes, and other eligible interactions using recorded source evidence, defined source precedence, and attribution windows.

The resulting metric is **attributed revenue**: revenue connected to eligible Hellotext activity under these rules.

To review a particular sale, check whether Hellotext recorded the revenue, whether eligible evidence belongs to the same customer or order, which source takes precedence within the applicable window, and how much of the order that attribution path supports. A sale can appear in total revenue without receiving attribution.

## What attributed revenue means

A sale is attributed when Hellotext receives an eligible revenue event and can connect it to supported source evidence for the same customer or order.

Attributed revenue is used in reporting and, where applicable, performance-based billing. It does not by itself mean that every attributed sale was caused by Hellotext or that the full amount is incremental growth.

## Evidence and source precedence

Hellotext evaluates several kinds of evidence before assigning attribution. The order or conversion must contain enough customer, order, and source context to connect it to an eligible interaction.

When more than one source is available:

1. A recognized external source takes precedence unless the timing proves that the selected eligible Hellotext evidence occurred later. Unknown timestamps and exact ties favor the external source.
2. Eligible active Hellotext evidence takes precedence over passive exposure.
3. Within the same evidence class, Hellotext normally selects the most recent eligible evidence. Deterministic rules resolve exact timestamp ties.

Active evidence can include:

- a Hellotext source or UTM connected to a campaign, playbook, or route;
- a click on an eligible campaign, playbook, or route link;
- qualifying engagement with a product recommendation.

Passive evidence can include:

- an eligible campaign delivery;
- an eligible proactive playbook delivery;
- a qualifying recommendation or commerce signal;
- other supported source context recorded by Hellotext.

A [tracked link]({% link _analytics-reporting-attribution/tracked-links.md %}) is one useful source of evidence, but it is not required for every attribution path. Likewise, receiving a message does not make every later purchase attributable: the delivery, customer, order, source, and time-window requirements must all qualify.

### Can a sale be attributed after delivery, without a click?

Yes. An eligible campaign or proactive playbook delivery can support a purchase within the default 24-hour delivery window, even without a click. The message must have a recorded delivery to the same customer within the applicable window; a read receipt is not required. The purchase must still pass the remaining source and attribution rules.

Delivery does not prove that the customer read the message or make every later purchase attributable.

## Attribution windows

Hellotext currently uses these default windows:

- **Seven days from an eligible click or engagement.**
- **24 hours from an eligible delivery or passive signal.**

Window duration can be configured by account.

The seven-day window begins when the eligible click or engagement happens. It is not seven days added after the first 24 hours.

Some signals have their own validity period. Not every delivery, channel, template, route, or playbook is eligible for passive attribution.

### What counts as engagement with a WhatsApp catalog recommendation?

Opening a recommended product through the tracked WhatsApp catalog within **ten minutes of the recommendation** can qualify as engagement. The product opened must match a product in that recommendation, and the activity must be linked to the same customer before purchase.

The ten minutes determine whether the view counts as engagement; they are not the time allowed to purchase. A qualifying view can support the default seven-day session window, measured from that view. A generic catalog tracking tag or an unrelated product-page visit is not enough on its own.

## Do we attribute the entire order?

**The amount depends on the attribution path selected for the purchase.** Campaign and other order-level attribution can credit the order amount. Some Webchat paths apply narrower product and quantity limits:

- **Webchat product recommendations:** when this path supplies the attribution, only purchased products matching valid recommendation signals contribute to the attributed amount. Product Recommender must also pass its commercial evaluation.
- **Webchat bundle additions:** when this path supplies the attribution, paid units are limited to the quantity of that product added by the action. Units already in the cart before the action do not earn credit from it. Free promotional lines for the same product are handled separately, as explained below.

For example, a customer buys a recommended product for $40 and an unrelated product for $60. If the Webchat recommendation path is selected and attribution is approved, the attributed amount is **$40**, while the order remains **$100** in total merchant revenue.

These limits belong to those Webchat attribution paths; they are not a product-matching requirement for every campaign or playbook sale. A Webchat playbook tracking tag alone is insufficient to claim the entire order without matching product evidence through these paths.

For these product-level calculations, Hellotext normally uses the matching order-item amounts. If an eligible line for the supported product has a total of exactly zero, such as a free promotion, Hellotext can count it separately from paid units and value its quantity at the catalog unit price. The attributed value can therefore differ from the amount paid for those items.

## What happens when another marketing source is present

If the order or conversion carries a recognized source from another marketing channel, that source takes precedence **unless Hellotext can prove that its selected eligible evidence occurred later**.

Both timestamps must be known. If either timestamp is unavailable, or the timestamps are equal, the external source wins and Hellotext does not count the order as Hellotext-attributed revenue. Later Hellotext evidence must still pass the remaining attribution rules; being later is not sufficient by itself.

If stronger external-source evidence arrives after Hellotext initially attributed the order, the engine can revoke the earlier Hellotext attribution while keeping the order in the merchant's overall revenue history.

A missing or unsupported source is not proof that Hellotext should receive attribution. The order must still have eligible Hellotext evidence.

## How AI and team participation are evaluated

A teammate's participation does not produce one universal attribution result. The applicable rule depends on the source path.

### Product Recommender: who drove the commercial interaction?

Product Recommender requires recorded AI or playbook commercial activity before purchase and an evaluation that identifies AI as the commercial driver. That means evaluating actions that move the customer toward purchase, rather than counting every message in the conversation.

AI recommendations, product links, checkout links, and qualifying customer engagement can count. On the teammate's side, commercial actions include recommendations, coupons, product links, checkout links, and manually recorded goals.

- If the latest recorded commercial action belongs to a teammate, the evaluator does not grant AI attribution.
- If the latest AI and human commercial actions have identical timestamps, the driver remains undetermined and the evaluator does not grant attribution.
- A qualifying sustained human takeover can also prevent attribution, even without an individual coupon or product link. This rule checks the final uninterrupted human-led conversation segment: at least ten minutes, with no gaps longer than five minutes between entries or before purchase. AI activity can interrupt that segment.
- A support-only reply, such as answering a delivery question, does not by itself count as a human commercial action.

AI may have assisted a purchase without receiving attribution for it.

### Campaigns, checkout ownership, and other playbooks

- **Campaign attribution** is evaluated from source evidence and can still apply when a teammate completes checkout. It does not use the Product Recommender commercial-driver test.
- **Human-owned checkout** blocks ordinary non-campaign attribution when a teammate or commerce operator explicitly owns the order. A proven continuation of an earlier attributed purchase is a separate, capped replacement-order case described below.
- **Other playbooks** can receive attribution from their supported source context. A recorded teammate checkout link can require the commercial evaluation even when the commerce platform did not identify a human order owner.
- **Routes** follow their supported source-context and checkout-ownership rules. Not every sale passes through the same AI-versus-human evaluation.

## Delayed confirmations and repeated order records

### Why can attribution appear after the window has ended?

Windows are evaluated against the recorded customer activity and conversion times, rather than when processing finishes. A delay in receiving or processing an event does not create a new attribution window.

When an order has saved source and evaluation context from before confirmation, a delayed confirmation can reuse that context. Later conversation activity does not automatically become the source of that earlier purchase.

### Does receiving the order again count it again?

Repeated records for the same recognized order do not create another ordinary attribution claim. Itemized revenue also does not create a second purchase-level claim. This depends on Hellotext recognizing the same order; a replacement with a different identifier follows the continuity rules below.

## Cancellations, refunds, and replacement orders

When Hellotext receives a supported cancellation or revocation for an attributed order, it can remove the active attributed amount from reporting and applicable billing calculations.

If a teammate or commerce operator creates a replacement for a cancelled order and Hellotext can prove that it continues the original purchase, the carried attribution is limited to the lower of:

- the amount previously attributed; or
- the value of the replacement order.

Refund and partial-refund behavior depends on the commerce data Hellotext receives and supports. After an order-value adjustment, verify the amount shown in the Revenue report and contact Support if it does not match the source order.

## How to inspect an attribution decision

For attributed rows, the Revenue report export can show information such as:

- the credited campaign, route, or playbook;
- attribution type and reason;
- source and channel;
- AI and human commercial evidence, when applicable;
- commercial driver, when evaluated;
- a plain-language explanation;
- a link to the relevant conversation or event context.

Detailed engine receipts also record the candidates and source evidence considered. When a non-attributed order or an older record does not expose enough detail in the merchant report, contact Support with the order reference and only the customer identifier needed to investigate it.

## Attributed revenue and incremental growth

Attributed revenue answers:

> Which revenue was linked to eligible Hellotext evidence under the attribution methodology?

Incremental measurement answers a different question:

> How much additional revenue occurred because of the activity compared with what would otherwise have happened?

Hellotext does not treat those two measurements as interchangeable.

## Examples

### Campaign delivery without a click

An eligible campaign message is delivered, and the customer purchases within the default 24-hour delivery window. No recognized external source or click is present.

The order may be attributed to the campaign even if the message did not contain a short link. Delivery does not prove that the customer read the message.

### Hellotext evidence after an external source

An external source is recorded at 10:00. The customer clicks an eligible Hellotext campaign link at 11:00 and purchases at 12:00. Both source timestamps are known.

The later Hellotext evidence can take precedence, provided the purchase passes the remaining attribution rules. If the source timing cannot be established, the external source retains precedence.

### Product recommendation with support participation

Product Recommender suggests a product and the customer engages with that recommendation. A teammate later answers a support-only question.

The support reply does not automatically remove attribution. The Product Recommender decision uses the supported commercial evidence and its sequence.

### Human-owned non-campaign checkout

A playbook interaction occurs, but a teammate or commerce operator explicitly owns the final checkout and no campaign source has precedence.

The order may remain visible in total merchant revenue without becoming Hellotext-attributed revenue.

### Custom monetary event

A positive custom monetary event is received, configured as a goal, and has supported customer and source context.

It can be evaluated for attribution if it passes the remaining rules. A custom event that is not a goal can appear in total revenue but cannot become attributed revenue, even with a positive amount and source evidence.

## Related guides

- [Performance report guide]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Revenue report guide]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Track campaign, route, and playbook links]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Pricing model]({% link _billing/how-pricing-works.md %})
- [Plan usage and quotas]({% link _billing/understanding-plan-quotas.md %})
