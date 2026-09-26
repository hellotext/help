Use Demand insights to understand what customers tried to buy but could not, which products were affected, and the estimated value of those missed opportunities.

Open it from the **Demand insights** card under **Business Performance** on the Dashboard.

## What an unfulfilled request means

An unfulfilled request is a product-related customer request that Hellotext identified with a supported unavailability reason, such as an out-of-stock product or an unavailable size.

It is not the same as:

- an open conversation in Inbox;
- a support question that AI could not answer;
- an AI escalation to a teammate; or
- every product question a customer asks.

The report needs a supported demand signal and enough product or commerce context to classify the request. A conversation does not become unfulfilled demand merely because it ended without a purchase.

## How this report counts results

The selected period is based on when the unfulfilled request began. A later eligible recovery remains connected to that originating request and can update the earlier result.

For example: **Product request began April 7 → Product became available and customer purchased April 9 → Recovery remains connected to April 7.**

Recent dates can change while requests remain inside their recovery window. Compare older periods when you need stable results, and compare recent periods at the same age.

## Read the main metrics

Select a metric to update the timeline and available breakdowns.

### Unfulfilled

The number of supported product requests that Hellotext could not fulfill for the customer.

One customer can generate more than one request when they ask for different products or variants. This is request volume, not necessarily a count of unique customers or conversations.

### Lost revenue

The estimated value associated with purchase requests that could not be completed.

Hellotext uses the product, value, and commerce context available for the request to estimate the opportunity. This value is directional:

- it is not completed revenue;
- it is not attributed revenue;
- it does not prove the customer would have purchased; and
- incomplete product or price context can limit the estimate.

Use it to prioritize repeated and valuable demand patterns, not to reconcile booked sales.

### Affected SKUs

The number of unique products or variants connected to at least one unfulfilled demand signal.

This metric separates breadth from volume. Ten requests for one product create more request volume but do not represent ten affected SKUs.

### Unfulfilled rate

The percentage of eligible product-related requests that could not be fulfilled.

The denominator is the eligible product-demand population, not all Inbox conversations. Review the request count with the rate: a large percentage from a very small population needs different action than the same percentage across thousands of requests.

## Use the breakdowns

The available breakdowns depend on the selected metric.

For **Unfulfilled**, compare by:

- reason;
- product category;
- product or variant;
- store or region;
- channel;
- AI versus human;
- intent; or
- commerce context.

For **Lost revenue**, compare by reason, product category, product, variant, store, region, channel, or AI versus human.

For **Affected SKUs**, compare by product category, reason, store, region, channel, or AI versus human.

For **Unfulfilled rate**, compare by reason, product category, store, region, channel, or AI versus human.

Use one dimension at a time when investigating a change. A product category can contain many individual availability problems, while a commerce-context difference can point to catalog or inventory data that is available in one sales environment but missing in another.

## Understand reasons and commerce context

The **reason** breakdown groups requests by the supported cause of unfulfillment. Examples can include out of stock or a requested size being unavailable.

The percentage for a reason represents its share of unfulfilled requests. The count shows how many requests carried that reason.

**Commerce context** identifies where the purchase was taking place, such as eCommerce, retail, or a marketplace. It helps distinguish a broad product problem from one limited to a store, catalog, or sales environment.

Do not interpret a missing reason or context as zero demand. It can mean the underlying request arrived without enough structured information for that breakdown.

## Compare Demand insights with other reports

| Question | Report |
| --- | --- |
| What did customers try to buy but could not? | Demand insights |
| Which conversations remain unresolved or failed SLA? | Service quality report |
| Which current conversations are waiting for the team? | Workload & capacity report |
| Which completed purchases and revenue were recorded? | Revenue report |
| How did conversations convert after they started? | Performance report |

Demand insights describes missed product opportunity. It does not replace inventory reporting from the commerce platform or operational conversation reporting from Inbox.

## Turn the report into an action

| If you see... | Review... |
| --- | --- |
| Out-of-stock requests concentrated on a product | Inventory timing, catalog synchronization, and whether Back-in-Stock Pounce can notify interested customers when stock returns. |
| Size or variant availability dominates | Variant depth, size availability, catalog data, and alternative recommendations. |
| Lost revenue concentrated in a few products | Replenishment priority, pricing context, recoverability, and repeated customer demand. |
| One commerce context performs worse | Inventory and catalog data for that store, marketplace, or eCommerce integration. |
| Unfulfilled rate rises while request volume is stable | Product mix, reasons, affected categories, and recent inventory changes. |
| Many requests lack product or value detail | Catalog identifiers, variant data, price, currency, intent classification, and integration context. |

Open representative conversations and verify the source catalog before changing inventory, a Playbook, or product recommendations. The report identifies a demand pattern; the conversation and commerce records explain it.

## When data is missing or unexpected

Confirm that:

- the connected eCommerce, marketplace, or retail source provides current catalog and inventory context;
- customer requests carry a supported unavailability reason;
- product and variant identifiers match the connected catalog;
- price, value, and currency are present when Lost revenue should be estimated;
- store, region, channel, intent, and commerce context are recorded when you use those breakdowns;
- AI or teammate handling context is available for the AI-versus-human comparison; and
- both comparisons use the same date range, timezone, metric, and breakdown.

If the customer asked for a product but no supported unfulfilled-demand signal exists, troubleshoot the source Playbook, integration, or tracking path first. If the source records exist but the report remains inconsistent, follow [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Related guides

- [Dashboard guide]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Performance report guide]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Revenue report guide]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Service quality report guide]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Workload & capacity report guide]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Back-in-Stock Pounce playbook]({% link _journeys/back-in-stock-pounce.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Data completeness and reporting gaps]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
