The performance fee connects the price of Hellotext to results attributed to Hellotext. The calculation uses two inputs: the revenue attributed during the billing period and the performance rate for your plan.

## The calculation

**Performance fee = attributed revenue × your plan rate**

For example, if a business has US$4,000 in attributed revenue and its plan rate is 4%, the performance fee amount is US$160.

Hellotext then compares that US$160 with the plan minimum, SMS costs, and the variable messaging fee. The highest amount becomes the Hellotext charge for the period.

## Which revenue is included

The calculation uses revenue attributed to Hellotext, not all revenue from your store.

For each eligible order, the attribution engine considers source evidence, source precedence, customer and order identity, participation, and the applicable attribution window. A purchase that happens later can still be attributed when eligible Hellotext evidence falls within its window.

Read [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %}) for the complete customer-facing methodology.

## Which rate applies

The performance rate depends on the selected plan or commercial agreement. Plans can also use a threshold before the rate becomes the amount that exceeds the plan minimum.

Use the public [Hellotext pricing page](https://www.hellotext.com/pricing) for current plan rates and thresholds. Use **Settings → Billing** to confirm the plan active for your business.

## Why recent amounts can change

An attributed purchase can happen after the original campaign, playbook, journey, delivery, signal, click, or engagement. Reports add the result according to the date model described in each report, while billing includes eligible attributed revenue for the applicable billing period.

When reconciling an amount, compare the same date range and currency in Billing and in the relevant revenue or source report.

## Related guides

- [Pricing model]({% link _billing/how-pricing-works.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Revenue report guide]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Troubleshoot billing questions]({% link _billing/billing-troubleshooting.md %})
