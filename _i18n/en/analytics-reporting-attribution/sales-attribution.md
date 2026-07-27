Hellotext links orders to campaigns, playbooks, routes, and other eligible interactions using recorded source evidence, defined source precedence, and attribution windows.

The resulting metric is **attributed revenue**: revenue connected to eligible Hellotext activity under these rules.

## What attributed revenue means

A sale is attributed when Hellotext receives an eligible revenue event and can connect it to supported source evidence for the same customer or order.

Attributed revenue is used in reporting and, where applicable, performance-based billing. It does not by itself mean that every attributed sale was caused by Hellotext or that the full amount is incremental growth.

## Evidence and source precedence

Hellotext evaluates several kinds of evidence before assigning attribution. The order or conversion must contain enough customer, order, and source context to connect it to an eligible interaction.

When more than one source is available:

1. A recognized external source on the order or conversion takes precedence over Hellotext attribution.
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

## Attribution windows

Hellotext currently uses these default windows:

- **Seven days from an eligible click or engagement.**
- **24 hours from an eligible delivery or passive signal.**

Window duration can be configured by account.

The seven-day window begins when the eligible click or engagement happens. It is not seven days added after the first 24 hours.

Some signals have their own validity period. Not every delivery, channel, template, route, or playbook is eligible for passive attribution.

## What happens when another marketing source is present

If the order or conversion carries a recognized source from another marketing channel, that external source takes precedence and Hellotext does not count the order as Hellotext-attributed revenue.

If stronger external-source evidence arrives after Hellotext initially attributed the order, the engine can revoke the earlier Hellotext attribution while keeping the order in the merchant's overall revenue history.

A missing or unsupported source is not proof that Hellotext should receive attribution. The order must still have eligible Hellotext evidence.

## How AI and team participation are evaluated

A teammate's participation does not produce one universal attribution result. The applicable rule depends on the source path.

- Campaign source evidence is evaluated directly and does not use the Product Recommender commercial-driver test.
- A checkout explicitly owned by a teammate or commerce operator can block non-campaign attribution.
- In Product Recommender flows, Hellotext can evaluate explicit AI and human commercial actions before purchase, including recommendations, coupons, product links, checkout links, and qualifying customer engagement.
- A support-only reply is not automatically treated as a human commercial action.
- A sustained human takeover can affect the Product Recommender decision even when no individual coupon or product link was recorded.
- Other playbooks and routes follow their supported source-context rules and should not be described as if every sale passes through the same human-versus-AI evaluation.

Human participation, commercial assistance, checkout ownership, and the final attribution result are related but distinct facts.

## Cancellations, refunds, and replacement orders

When Hellotext receives a supported cancellation or revocation for an attributed order, it can remove the active attributed amount from reporting and applicable billing calculations.

If a cancelled order is replaced and Hellotext can prove that the new order continues the original purchase, the carried attribution is limited to the lower of:

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

Detailed engine receipts also record the candidates and source evidence considered. When a non-attributed order or an older record does not expose enough detail in the merchant report, contact Support with the order reference and customer information.

## Attributed revenue and incremental growth

Attributed revenue answers:

> Which revenue was linked to eligible Hellotext evidence under the attribution methodology?

Incremental measurement answers a different question:

> How much additional revenue occurred because of the activity compared with what would otherwise have happened?

Hellotext does not treat those two measurements as interchangeable.

## Examples

### Eligible campaign delivery without a click

A customer receives an eligible campaign message and purchases within the default 24-hour delivery window. No recognized external source is present.

The order may be attributed to the campaign even if the message did not contain a short link.

### Purchase after a click

A customer clicks an eligible Hellotext link and purchases six days later.

The order may qualify because it is within seven days of the click. The seven-day window starts at the click, not after the delivery window ends.

### External source at purchase

A customer interacted with Hellotext earlier, but the order carries a recognized source from another marketing channel.

The order is not attributed to Hellotext because the external source takes precedence.

### Product recommendation with support participation

Product Recommender suggests a product and the customer engages with that recommendation. A teammate later answers a support-only question.

The support reply does not automatically remove attribution. The Product Recommender decision uses the supported commercial evidence and its sequence.

### Human-owned non-campaign checkout

A playbook interaction occurs, but a teammate or commerce operator explicitly owns the final checkout and no campaign source has precedence.

The order may remain visible in total merchant revenue without becoming Hellotext-attributed revenue.

### Custom monetary event

A custom positive monetary event is received with supported customer and source context.

It can be evaluated for attribution. Being custom does not automatically exclude it, but the custom event alone is not sufficient evidence.

### No supported evidence

The purchase is outside the applicable window, cannot be connected to the customer or order, or has no supported attribution source.

The revenue remains merchant revenue but is not attributed to Hellotext.

## Related guides

- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Track campaign, route, and playbook links]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Pricing model]({% link _billing/how-pricing-works.md %})
- [Plan usage and quotas]({% link _billing/understanding-plan-quotas.md %})
