Start with **Settings → Billing**. Select the period you want to review in the usage summary and, if you have an invoice or payment record, compare it with that same month.

## The amount is higher than expected

Check these items separately:

1. Confirm the plan and billing agreement active during the period. Prepaid accounts and fixed agreements can be settled differently.
2. If your plan uses the standard monthly comparison, review the usage summary and identify which of the four Hellotext amounts was highest.
3. Check whether attributed revenue increased after eligible purchases were recorded.
4. Review billable SMS parts, the destination country, and the applicable rate. The published “up to X SMS” figure is an approximate equivalent, not a free bucket deducted first.
5. Confirm the non-SMS message volume used by the fair-use calculation.
6. Review applicable taxes separately. WhatsApp fees paid directly to Meta do not appear on the Hellotext invoice; check them in Meta billing.

Under the standard monthly comparison, do not add the four Hellotext amounts: only the highest becomes the charge for that comparison. See [SMS pricing and sender types]({% link _billing/sms-pricing-and-number-types.md %}) and [Meta fees for WhatsApp]({% link _billing/whatsapp-fees.md %}) to separate those charges.

## Attribution does not match a report

Confirm that both views use the same date range, currency, and date basis. A playbook report can organize results by trigger date while another report can use a different event date.

Use [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %}) and [Data integrity and differences between reports]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}) to reconcile the source data.

## An invoice is not available

Invoices appear when they are available for a billing period. In **Invoices**, open **Select month** and choose a month under the relevant year. If the business has no invoices yet, you will see an empty state and the selector will be absent.

If an older finalized period is missing, contact support with the business identifier and month.

## A payment method failed

- Confirm that the method is still valid and supports the account currency.
- Add another method when **New payment method** is available.
- Review the business balance when balance billing applies.
- If Shopify is shown as the payment method, review the billing status in the connected Shopify account.

Do not send card security codes or complete payment credentials to support.

The following empty state shows where to add an alternative method. The example cards drawn above the button are an interface preview; they do not represent saved cards or a failed payment.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Where to add a payment method">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/payment-methods-en-mobile.png" width="812" height="1040" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/payment-methods-en.png" width="1770" height="1070" loading="lazy" decoding="async" alt="Fictional empty Payment methods state with New payment method; faded cards are a preview, not saved methods." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">This fictional account has no saved cards; the image shows where to add an alternative method, not a failed payment.</figcaption>
</figure>

## A plan change is not reflected

Open the current plan card. If you scheduled a downgrade or cancellation, look for its notice and effective date. An upgrade can take effect during the current period after payment succeeds; confirm the status shown for your account.

Refresh Billing after a successful payment. If the status still does not match, provide support with the current plan, requested plan, confirmation time, and any visible error.

## Currency or taxes look incorrect

Open **Billing information** and check the tax details. Use **Change Country** to inspect the business country and tax notice; do not save a change if the current country is correct. Changing it can affect tax treatment, currency, and available payment methods.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Billing country and taxes">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/country-en-mobile.png" width="812" height="564" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/country-en.png" width="1770" height="568" loading="lazy" decoding="async" alt="Fictional Change Country form with Uruguay selected and the notice about taxes on future invoices." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The form was opened to show the notice; no change was saved.</figcaption>
</figure>

Do not change the country only to alter a price. It should represent the business's correct billing location.

## What to include in a support request

- business or workspace identifier;
- billing month and currency;
- invoice or payment reference;
- expected and displayed amounts;
- screenshot of the relevant summary without sensitive payment data; and
- the date and time of a failed payment or plan change.

## Related guides

- [Pricing model]({% link _billing/how-pricing-works.md %})
- [Plan usage and monthly charges]({% link _billing/understanding-plan-quotas.md %})
- [Billing settings, payment methods, and invoices]({% link _billing/billing-settings-and-invoices.md %})
- [Change or cancel your plan]({% link _billing/change-or-cancel-your-plan.md %})
