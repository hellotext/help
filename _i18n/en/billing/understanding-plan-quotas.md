Use the Billing **Usage summary** to understand what happened in a billing period before reconciling an invoice.

## Open the usage summary

1. Open **Settings → Billing**.
2. Find the card for your current plan.
3. In **Usage summary**, select the billing period you want to review.

The first card shows the active plan, the monthly amount calculated so far, and **Change My Plan**. In the image, the plan minimum is the highest amount for a fictional account with no attributed sales or billable messages.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Active plan and monthly amount">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/understanding-plan-quotas/plan-en-mobile.png" width="740" height="528" />
        <img class="ht-editorial-visual__image" src="/images/billing/understanding-plan-quotas/plan-en.png" width="1464" height="464" loading="lazy" decoding="async" alt="Fictional Grow plan card with a $299 monthly amount and the Change My Plan control." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The isolated account has no attributed sales or billable messages; the illustrated amount comes from the plan.</figcaption>
</figure>

The second card separates attributed sales from their fee and shows SMS and other message counts and costs. Use its period selector to choose an available month. These rows are zero in the demonstration account; the image helps identify the fields and does not represent a business with usage.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Usage summary and period selector">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/understanding-plan-quotas/usage-en-mobile.png" width="740" height="954" />
        <img class="ht-editorial-visual__image" src="/images/billing/understanding-plan-quotas/usage-en.png" width="1464" height="922" loading="lazy" decoding="async" alt="Fictional Usage summary with a September 2026 selector and no attributed sales, SMS, or other message usage." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The fictional account has no transactions. The selector only offers periods available to that business.</figcaption>
</figure>

## Read the comparison

Hellotext can calculate four monthly amounts:

- plan minimum;
- performance fee from attributed revenue;
- SMS costs; and
- variable non-SMS messaging amount.

The Hellotext charge uses only the highest amount, rather than adding those four components. Compare the amount on the plan card with the monetary rows in **Usage summary**; sales and message counts provide context but are not additional charges.

Read [Pricing model]({% link _billing/how-pricing-works.md %}) for the complete rule.

## Compare the correct period

Choose the same month when comparing Billing with a report or invoice. Keep these differences in mind:

- A recent period can still receive eligible attributed purchases before it is finalized.
- Reports can organize metrics by trigger, send, interaction, or purchase date depending on the report.
- Billing uses the applicable billing period and account currency.

When attribution is the leading amount, use the revenue and source reports to investigate the underlying results rather than comparing unrelated date columns.

## Review balance and payment history

The Billing page also shows the business balance when applicable and a **Payment history** control. Open it and use **Select month** to review movements for the selected month and year.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Payment history and month selector">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/history-en-mobile.png" width="748" height="688" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/history-en.png" width="1770" height="568" loading="lazy" decoding="async" alt="Open Payment history in a fictional account with no movements and a Select month control." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">This reuses an approved Billing settings capture; no payment was created.</figcaption>
</figure>

Balance activity and the monthly usage comparison answer different questions:

- Usage explains how the monthly Hellotext amount was determined.
- Payment history explains movements recorded against the business balance.

## Review older periods

The selector shows the active plan period and earlier periods that are available. When the business changed plans, confirm which plan was active in the month being reviewed.

Use the invoice for the finalized billed amount and the usage summary for its operational context.

## Related guides

- [Billing settings, payment methods, and invoices]({% link _billing/billing-settings-and-invoices.md %})
- [Performance fee calculation]({% link _billing/performance-fee-calculation.md %})
- [Revenue report guide]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Troubleshoot billing questions]({% link _billing/billing-troubleshooting.md %})
