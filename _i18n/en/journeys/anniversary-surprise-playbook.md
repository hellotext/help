Use this guide when you want to celebrate the anniversary of a customer's first purchase and Hellotext retains valid signals identifying that purchase.

Anniversary Surprise uses the anniversary of the first recorded purchase. The anniversary signal must retain a valid link to that first purchase and its source entity. Profile creation, subscription, membership, or a custom date property does not replace that purchase.

It is not a birthday greeting, a seasonal campaign, or an inactive-customer reactivation playbook. It is a playbook for an annual relationship moment: celebrating that the customer has completed another cycle with the brand.

Availability can vary by account, plan, connected data sources, and rollout status. If the card appears as on request or disabled, confirm availability with your Hellotext team before planning a launch.

## What Anniversary Surprise does

Anniversary Surprise can turn the first-purchase anniversary into a retention message.

It can:

- Use valid first-purchase history as the anniversary source.
- Evaluate the anniversary signal and its first-purchase link on the corresponding date in the business timezone.
- Send a celebration message with a grateful or appreciative tone.
- Include an approved coupon or existing eCommerce offer when the message calls for one.
- Personalize the message with customer profile data, purchase history, or relationship context when that data is available.
- Skip profiles when the anniversary date is missing, consent is missing, the channel is not ready, or the profile cannot be reached.

The exact setup can vary by account, connected store, channel, templates, historical data, and rollout status.

## When to use it

Use Anniversary Surprise when your brand wants to recognize an existing relationship, not when you want to push a purchase without context.

It is a good fit when:

- You have a reliably recorded first purchase linked to the customer.
- Celebrating the anniversary of that first purchase makes sense for your brand.
- The message can feel grateful, personal, and useful.
- The business wants to offer a greeting or approved coupon without creating manual campaigns.
- Your team wants a retention moment that does not depend on inactivity, cart behavior, or birthday.

For personal birthdays, use [Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}). For customers who have gone quiet, use [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}), [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}), or [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) depending on the inactivity window. For commercial dates such as holidays, launches, or one-time promotions, use [Campaigns]({% link _campaigns/campaigns-overview.md %}).

## What it needs before launch

Before enabling Anniversary Surprise, confirm the quality and provenance of the first recorded purchase.

Check that:

- The first purchase retains a valid confirmed-order or product-purchase event, its timestamp, and its source entity.
- The anniversary signal is linked to that first purchase and the same customer.
- The date is precise and the anniversary falls on the corresponding day in the business timezone.
- Customer profiles include reliable identifiers and channel consent.
- The audience you want to reach is identifiable and eligible.
- The channel, sender, or WhatsApp account is ready.
- The message or template is approved if the channel requires it.
- If you include a coupon or eCommerce offer, it is approved and works before launch.
- Purchase history and its identifiers are synced; a standalone date property does not create the required link.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). If you import profiles, see [Import customer profiles]({% link _audience/import-customer-profiles.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, purchases, attributed revenue, replies, opt-outs, and skipped messages.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Anniversary Surprise**.

Available options can vary, but review:

- **First-purchase data:** verify the history the playbook depends on; do not assume a generic date selector exists.
- **Audience:** which profiles can receive the playbook.
- **Outgoing channels:** where Hellotext can send the message.
- **Message:** the anniversary copy and variables it will use.
- **Coupon or offer:** the approved coupon or existing eCommerce offer to include when relevant.
- **Inbox replies:** how your team should review replies if the customer responds.

The verified source is the first recorded purchase. Importing a profile date or naming another source in instructions does not change that contract.

If you need a sequence with custom steps, conditions, or branches, use a custom journey. If you need a custom conversational agent, use [Custom Agent]({% link _journeys/custom-agent-playbook.md %}).

## How Hellotext chooses the moment

Anniversary Surprise requires a valid first-purchase anniversary signal.

Hellotext can use signals like:

- The first recorded purchase, with its retained event and source entity.
- An anniversary signal whose year, date, and lineage match that first purchase.
- Whether that purchase remains the customer's first recorded purchase.
- Whether the profile belongs to the configured audience.
- Whether the profile has consent and can receive messages on the channel.
- Whether the channel, sender, template, and coupon are ready.
- Whether frequency, consent, or quiet-hour rules allow the send.

A valid anniversary signal must also pass send-time checks. If the anniversary day ends in the business timezone or the first-purchase history changes, the opportunity may become invalid.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the type of date or signal to decide which playbook should act.

| Customer moment | Better fit |
| --- | --- |
| It is the customer's birthday | [Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}) |
| It is the eligible anniversary of the first recorded purchase | Anniversary Surprise |
| Customer is starting to go quiet | [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) |
| Customer meets the prolonged-inactivity stage criteria | [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}) |
| Customer meets the churn-risk stage criteria | [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) |
| You have a commercial date or one-time launch | [Campaigns]({% link _campaigns/campaigns-overview.md %}) |

Anniversary Surprise can coexist with other playbooks when each one responds to a different moment. Still, avoid sending several promotional messages to the same customer at the same moment if another active playbook is a better fit.

## How to test it

Test with controlled customer profiles before enabling it for a broad audience.

Use test customer profiles that have channel consent, then:

- Confirm that the first recorded purchase is the anniversary source.
- Identify valid first-purchase history and its linked anniversary signal; a date added to the profile is insufficient.
- Confirm the date appears correctly in Hellotext.
- Confirm the profile belongs to the playbook audience.
- Review the message, variables, coupon, and links.
- Test a profile whose anniversary matches the expected moment.
- Test a profile with a date that should not enter yet.
- Test a profile without consent or without a reachable channel.
- Reply to the test message and confirm it reaches the Inbox or the right owner when relevant.

If you sync history from a store or custom source, confirm timestamps, identifiers, and purchase-entity lineage. Importing profiles does not demonstrate that those events exist.

## Why it may not send

Anniversary Surprise being enabled does not mean every profile receives a message.

The playbook may skip or wait when:

- There is no valid first-purchase anniversary signal.
- The first-purchase event, source entity, or customer link is missing.
- The date does not match the anniversary in the business timezone, the day has ended, or first-purchase history has changed.
- The profile does not belong to the configured audience.
- The customer does not have consent or is not eligible for the channel.
- The channel, sender, template, coupon, or link is not ready.
- Frequency, consent, or quiet-hour rules prevent the send.
- Another active playbook is a better fit for that moment.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which profiles created anniversary moments.
- Which first purchase and anniversary signal produced those moments.
- Which messages were sent, skipped, clicked, replied to, or purchased from.
- Whether the coupon or link worked correctly.
- Whether the tone felt grateful and natural for the brand.
- Whether there were opt-outs, negative replies, or failed messages.
- Whether Anniversary Surprise overlaps with birthdays, campaigns, reactivation, or other retention playbooks.

Review first-purchase history quality first. Tune one thing at a time: audience, channel, message, or coupon.

## Related guides

- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [What are signals?]({% link _journeys/what-are-signals.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Import customer profiles]({% link _audience/import-customer-profiles.md %})
- [Personalize messages with tags]({% link _audience/personalization-tags.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Birthday Bash playbook]({% link _journeys/birthday-bash-playbook.md %})
- [Soft Reactivation playbook]({% link _journeys/soft-reactivation-playbook.md %})
- [Dormant Revival playbook]({% link _journeys/dormant-revival-playbook.md %})
- [Sunset Saver playbook]({% link _journeys/sunset-saver-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
