Use this guide when you have birthday dates on customer profiles and want Hellotext to automatically send a birthday greeting with an approved message or coupon code on the right day.

Birthday Bash is a customer-profile signal playbook. When Hellotext detects that a profile's birthday matches the current day, it can start the playbook and send a birthday message through an eligible channel.

It is not an autonomous AI agent or a manual campaign. It is a prebuilt playbook for one clear annual moment: greeting the customer on their birthday using the date stored on their profile.

Availability can vary by account, plan, connected channels, and rollout status.

## What Birthday Bash does

Birthday Bash turns profile data into a customer relationship moment.

It can:

- Detect customer profiles whose birthday matches the current day and month.
- Create a birthday event to start the playbook when it is active.
- Send a birthday message with a celebratory tone.
- Include an approved coupon or existing ecommerce offer when the message calls for one.
- Personalize the message with customer profile data, such as name or birthday, when available.
- Skip profiles when the birthday is missing, consent is missing, the channel is not ready, or the profile cannot be reached.

The exact behavior can vary by account, channel, templates, coupon setup, and rollout status.

## When to use it

Use Birthday Bash when your business wants to recognize a personal date and already has the data needed to do it reliably.

It is a good fit when:

- Customer profiles have birthdays with day and month.
- The birthday was collected with consent and a clear expectation.
- The message feels natural for the brand.
- The business wants to offer a greeting or approved coupon without creating a manual campaign every day.
- Your team wants a retention moment that does not depend on inactivity or cart behavior.

Do not use it to win back customers who have gone cold. For that, use [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}), [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}), or [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) depending on the inactivity window.

Do not use it as a replacement for seasonal campaigns or purchase anniversaries. For a commercial date, use campaigns; for purchase or relationship anniversaries, use [Anniversary Surprise]({% link _journeys/anniversary-surprise-playbook.md %}).

## What it needs before launch

Before enabling Birthday Bash, confirm that the birthday signal is reliable.

Check that:

- Customer profiles have a birthday property.
- The birthday includes at least day and month.
- Birthday data was imported, synced, or collected correctly.
- The audience you want to reach has channel consent.
- The channel, sender, or WhatsApp account is ready.
- The birthday message or template is approved if the channel requires it.
- If you include a coupon or ecommerce offer, it is approved and works before launch.
- The audience excludes profiles that should not receive promotional messages.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}). If you import profiles, see [Import customer profiles]({% link _audience/import-customer-profiles.md %}). For custom tracking, use [Tracking events]({% link _developers/tracking-events.md %}).

After launch, use the automatically generated reports to review sends, clicks, purchases, attributed revenue, replies, opt-outs, and skipped messages.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Birthday Bash**.

Available options can vary, but you usually review:

- **Outgoing channels:** where Hellotext can send the greeting.
- **Audience:** which profiles can receive the playbook.
- **Message:** the birthday copy and variables it will use.
- **Coupon or offer:** the approved coupon or existing ecommerce offer to include when relevant.
- **Inbox replies:** how your team should review replies if the customer responds.

You do not need to create a manual campaign for each date. The playbook depends on the profile's birthday signal and runs when the birthday matches the current day.

If you need a sequence with custom steps, conditions, or branches, use a custom journey. If you need a custom conversational agent, use [Custom Agent]({% link _journeys/custom-agent-playbook.md %}).

## How Hellotext chooses the moment

Birthday Bash starts from the birthday event on the customer profile.

Hellotext can use signals like:

- Birthday day and month stored on the profile.
- Whether the profile belongs to the configured audience.
- Whether the profile has consent and can receive messages on the channel.
- Whether the channel, sender, template, and coupon are ready.
- Whether frequency, consent, or quiet-hour rules allow the send.

The birth year may exist on the profile, but the birthday trigger mainly needs day and month to know when to send the greeting.

For the broader decision model, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## How it works with nearby playbooks

Use the type of moment to decide which playbook should act.

| Customer moment | Better fit |
| --- | --- |
| It is the customer's birthday | Birthday Bash |
| It is a purchase or relationship anniversary | [Anniversary Surprise]({% link _journeys/anniversary-surprise-playbook.md %}) |
| Customer is starting to go quiet | [Soft Reactivation]({% link _journeys/soft-reactivation-playbook.md %}) |
| Customer has been inactive for around 3 months | [Dormant Revival]({% link _journeys/dormant-revival-playbook.md %}) |
| Customer has been inactive or not reactivated for around 12 months | [Sunset Saver]({% link _journeys/sunset-saver-playbook.md %}) |
| You want to send a commercial date announcement | [Campaigns]({% link _campaigns/campaigns-overview.md %}) |

Birthday Bash can coexist with other playbooks because its signal is a profile date. Still, avoid sending several promotional messages to the same customer at the same moment if another active playbook is a better fit.

## How to test it

Test with controlled customer profiles before enabling it for a broad audience.

Use test customer profiles that have channel consent, then:

- Add a birthday with day and month to the test profile.
- Confirm the birthday property appears correctly on the profile.
- Confirm the profile belongs to the playbook audience.
- Review the message, variables, coupon, and links.
- Test a profile whose birthday matches today.
- Test a profile with a birthday on another day, which should not enter.
- Test a profile without consent or without a reachable channel.
- Reply to the test message and confirm it reaches the Inbox or the right owner when relevant.

If you import birthdays from a store, CRM, or file, confirm that the date format is interpreted correctly before launch.

## Why it may not send

Birthday Bash being enabled does not mean every profile receives a message.

The playbook may skip or wait when:

- The profile does not have a birthday.
- The birthday does not include day or month.
- The date does not match the current day.
- The profile does not belong to the configured audience.
- The customer does not have consent or is not eligible for the channel.
- The channel, sender, template, coupon, or link is not ready.
- Frequency, consent, or quiet-hour rules prevent the send.
- Another active playbook is a better fit for that moment.

For a step-by-step diagnosis, use [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## What to review after launch

During the first days, review:

- Which profiles created birthday events.
- Which messages were sent, skipped, clicked, replied to, or purchased from.
- Whether the coupon or link worked correctly.
- Whether the tone felt natural for the brand.
- Whether there were opt-outs, negative replies, or failed messages.
- Whether Birthday Bash overlaps with campaigns, reactivation, or other retention playbooks.

Tune one thing at a time: audience, channel, message, or coupon.

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
- [Anniversary Surprise playbook]({% link _journeys/anniversary-surprise-playbook.md %})
- [Soft Reactivation playbook]({% link _journeys/soft-reactivation-playbook.md %})
- [Dormant Revival playbook]({% link _journeys/dormant-revival-playbook.md %})
- [Sunset Saver playbook]({% link _journeys/sunset-saver-playbook.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
