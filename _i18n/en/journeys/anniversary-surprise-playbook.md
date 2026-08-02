Use this guide when you want to celebrate customer purchase or relationship anniversaries, and Hellotext has a reliable date that defines when the message should be sent.

Anniversary Surprise is a playbook based on a customer or history date. It can help recognize moments such as a first-purchase anniversary, customer relationship anniversary, or custom date, depending on the data source available in your account.

It is not a birthday greeting, a seasonal campaign, or an inactive-customer reactivation playbook. It is a playbook for an annual relationship moment: celebrating that the customer has completed another cycle with the brand.

Availability can vary by account, plan, connected data sources, and rollout status. If the card appears as on request or disabled, confirm availability with your Hellotext team before planning a launch.

## What Anniversary Surprise does

Anniversary Surprise turns a meaningful customer date into a retention message.

It can:

- Use an anniversary source, such as first purchase, profile creation, subscription date, or a custom date, when available.
- Detect when the customer reaches an anniversary based on that source.
- Send a celebration message with a grateful or appreciative tone.
- Include an approved coupon or existing ecommerce offer when the message calls for one.
- Personalize the message with customer profile data, purchase history, or relationship context when that data is available.
- Skip profiles when the anniversary date is missing, consent is missing, the channel is not ready, or the profile cannot be reached.

The exact setup can vary by account, connected store, channel, templates, historical data, and rollout status.

## When to use it

Use Anniversary Surprise when your brand wants to recognize an existing relationship, not when you want to push a purchase without context.

It is a good fit when:

- You have a reliable date that represents the customer's relationship with the business.
- The anniversary makes sense for your brand: first purchase, first opt-in, profile creation, membership, or a custom date.
- The message can feel grateful, personal, and useful.
- The business wants to offer a greeting or approved coupon without creating manual campaigns.
- Your team wants a retention moment that does not depend on inactivity, cart behavior, or birthday.

For personal birthdays, use [Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}). For customers who have gone quiet, use [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}), [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}), or [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) depending on the inactivity window. For commercial dates such as holidays, launches, or one-time promotions, use [Campaigns]({% link _campaigns/campaigns-overview.md %}).

## What it needs before launch

Before enabling Anniversary Surprise, confirm which anniversary source it will use.

Check that:

- The anniversary source is clear: first purchase, profile creation, opt-in, membership, or a custom date.
- The date exists for the profiles you want to reach.
- The date is precise enough to calculate the anniversary.
- Customer profiles include reliable identifiers and channel consent.
- The audience you want to reach is identifiable and eligible.
- The channel, sender, or WhatsApp account is ready.
- The message or template is approved if the channel requires it.
- If you include a coupon or ecommerce offer, it is approved and works before launch.
- Purchase, profile, or custom-property data is synced if the anniversary depends on it.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). If you import profiles or custom dates, see [Import customer profiles]({% link _audience/import-customer-profiles.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, purchases, attributed revenue, replies, opt-outs, and skipped messages.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Anniversary Surprise**.

Available options can vary, but review:

- **Anniversary source:** which date starts the playbook if your account exposes that control.
- **Audience:** which profiles can receive the playbook.
- **Outgoing channels:** where Hellotext can send the message.
- **Message:** the anniversary copy and variables it will use.
- **Coupon or offer:** the approved coupon or existing ecommerce offer to include when relevant.
- **Inbox replies:** how your team should review replies if the customer responds.

Do not assume every account uses the same anniversary source. If the control is not visible, confirm with your Hellotext team which date the playbook uses before launch.

If you need a sequence with custom steps, conditions, or branches, use a custom journey. If you need a custom conversational agent, use [Custom Agent]({% link _journeys/custom-agent-playbook.md %}).

## How Hellotext chooses the moment

Anniversary Surprise should start from a reliable date, not a broad campaign.

Hellotext can use signals like:

- First-purchase date, if the anniversary is purchase-based.
- Profile creation, subscription, opt-in, or membership date, if the anniversary is relationship-based.
- A custom date property, if your team uses one as the anniversary.
- Whether the profile belongs to the configured audience.
- Whether the profile has consent and can receive messages on the channel.
- Whether the channel, sender, template, and coupon are ready.
- Whether frequency, consent, or quiet-hour rules allow the send.

The most important point is that your team knows which date represents the anniversary. Two businesses can use different sources and still call the playbook Anniversary Surprise.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the type of date or signal to decide which playbook should act.

| Customer moment | Better fit |
| --- | --- |
| It is the customer's birthday | [Birthday Bash]({% link _journeys/birthday-bash-playbook.md %}) |
| It is a purchase, relationship, membership, or custom-date anniversary | Anniversary Surprise |
| Customer is starting to go quiet | [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) |
| Customer has been inactive for around 3 months | [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}) |
| Customer has been inactive or not reactivated for around 12 months | [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) |
| You have a commercial date or one-time launch | [Campaigns]({% link _campaigns/campaigns-overview.md %}) |

Anniversary Surprise can coexist with other playbooks when each one responds to a different moment. Still, avoid sending several promotional messages to the same customer at the same moment if another active playbook is a better fit.

## How to test it

Test with controlled customer profiles before enabling it for a broad audience.

Use test customer profiles that have channel consent, then:

- Confirm which anniversary source the playbook will use.
- Add or identify an anniversary date on the profile or purchase history.
- Confirm the date appears correctly in Hellotext.
- Confirm the profile belongs to the playbook audience.
- Review the message, variables, coupon, and links.
- Test a profile whose anniversary matches the expected moment.
- Test a profile with a date that should not enter yet.
- Test a profile without consent or without a reachable channel.
- Reply to the test message and confirm it reaches the Inbox or the right owner when relevant.

If you import dates from a store, CRM, or file, confirm that the date format is interpreted correctly before launch.

## Why it may not send

Anniversary Surprise being enabled does not mean every profile receives a message.

The playbook may skip or wait when:

- No anniversary source is configured or available.
- The profile does not have the required date.
- The date does not match the expected anniversary moment.
- The profile does not belong to the configured audience.
- The customer does not have consent or is not eligible for the channel.
- The channel, sender, template, coupon, or link is not ready.
- Frequency, consent, or quiet-hour rules prevent the send.
- Another active playbook is a better fit for that moment.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which profiles created anniversary moments.
- Which anniversary source produced those moments.
- Which messages were sent, skipped, clicked, replied to, or purchased from.
- Whether the coupon or link worked correctly.
- Whether the tone felt grateful and natural for the brand.
- Whether there were opt-outs, negative replies, or failed messages.
- Whether Anniversary Surprise overlaps with birthdays, campaigns, reactivation, or other retention playbooks.

Tune one thing at a time: anniversary source, audience, channel, message, or coupon.

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
