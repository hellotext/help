Use this guide when an event, profile update, segment change, playbook trigger, route step, or report metric does not appear where you expected.

Signals can come from a store, website, capture tool, messaging channel, API, Hellotext.js, customer profile, or Inbox conversation. The fastest way to fix a missing signal is to locate where the chain stopped.

## Before you start

Write down the exact symptom before changing settings.

Collect:

- The business where the issue happened.
- The customer profile, email, phone, external ID, or test user.
- The expected signal or event name.
- The affected segment, playbook, route, campaign, or report.
- The channel, store, integration, or tracking source.
- The approximate time the activity happened.
- What you expected to see and what appeared instead.

Use one customer profile or one test event first. Broad issues are easier to understand after you can reproduce one clean example.

## 1. Check the customer profile first

Open the customer profile you expected to update.

Check whether:

- The profile exists.
- The email, phone, external ID, or integration identifier is correct.
- The event or profile property appears on the timeline or profile.
- The customer has the expected subscription or consent status.
- The profile belongs to the same business, store, channel, or marketplace you are testing.
- The customer appears more than once as duplicate profiles.

If the activity exists on a different customer profile, the issue is usually identity matching. Review which identifier each source sends and whether the store, tracking script, API call, or integration is using the same customer identity.

## 2. If the profile is missing or stale

If the customer profile does not exist, or recent profile data is missing, start with the source system.

Check:

- The store or integration is connected to the right Hellotext business.
- API keys, tokens, plugin settings, and permissions are valid.
- The first sync has finished.
- The affected customer exists in the source system.
- The integration is allowed to sync the fields you expect.
- The customer's email, phone, or external ID is present in the source system.

If the data comes from a capture, test the exact QR code, shareable link, form, popup, or checkout opt-in the customer used.

Keep reading: [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## 3. If the event is missing

If the profile exists but the activity is not there, check the event source.

For integrations:

- Confirm the integration supports that event.
- Confirm the event happened after the integration was connected.
- Check whether the source uses a different event or status name.
- Allow time for the integration to sync before testing again.

For Hellotext.js or API tracking:

- Confirm the script or API call runs on the right site, checkout, backend, or app.
- Confirm the request is sent to the right business or environment.
- Keep action names consistent, such as `product.viewed`, `cart.abandoned`, or `order.placed`.
- Include the identifier Hellotext needs to attach the event to the customer profile.
- Include required product, cart, order, or custom properties when the playbook or report depends on them.
- Test with one event and confirm it appears before sending more traffic.

Small differences in action names or customer identifiers can create separate signals that do not match the trigger, segment, or report you expected.

Keep reading: [Tracking events]({% link _developers/tracking-events.md %}).

## 4. If the event exists but nothing happens

A signal can exist without triggering a message, segment update, or report change.

Check the rule that should have used the signal.

For segments:

- The segment uses the same action, property, list, tag, channel, or consent rule.
- The event is recent enough for any time-based rule.
- The customer profile is eligible for the segment.
- The segment has refreshed or recalculated after the activity.

For playbooks or routes:

- The trigger uses the same signal name and properties.
- The playbook or route is active.
- The customer matches the audience and trigger conditions.
- The customer is subscribed or eligible for the channel.
- Frequency limits, quiet hours, stop conditions, or another active playbook did not block the next step.
- The required product, cart, order, channel, or profile data is complete enough for the playbook to act.
- The fallback, unresolved, or assignment path is configured when automation cannot continue.

For campaigns:

- The customer was in the audience at send time.
- The channel and sender were available.
- The customer was eligible for that message type.
- The message was not skipped because of consent, limits, template, or channel rules.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## 5. If reports or attribution look wrong

If the activity happened but reports do not show what you expected, check the measurement path.

Review:

- Whether the message used tracked links.
- Whether the customer clicked from the same profile that later purchased or converted.
- Whether the purchase, order, refund, cancellation, or conversion was synced.
- Whether attribution rules apply to that channel and timing.
- Whether another commercial click or human sales action happened before purchase.
- Whether test activity is filtered, delayed, or easy to confuse with real traffic.
- Whether you are comparing the same date range, channel, campaign, playbook, or audience.

Keep reading:

- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Campaign reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})

## Common symptoms

| Symptom | Where to check first |
| --- | --- |
| Customer profile is missing | Store, integration, capture, import, or API identity |
| Customer activity is on the wrong profile | Email, phone, external ID, duplicate profiles, or source identity |
| Event never appears | Integration sync, Hellotext.js, API request, action name, or environment |
| Event appears but segment does not update | Segment rules, time window, property names, or refresh timing |
| Playbook did not start | Trigger, audience, channel eligibility, consent, stop conditions, or active state |
| Report metrics look low | Tracked links, date range, attribution rules, channel, audience, or synced orders |
| WhatsApp/SMS message did not send | Channel setup, sender, consent, template, limits, or delivery state |

## When to contact support

If the issue still is not clear, include:

- One affected customer profile.
- The exact event or signal you expected.
- The affected segment, playbook, route, campaign, or report.
- The approximate time the activity happened.
- The source system, integration, API request, or capture path involved.
- Screenshots or links showing what you expected and what appeared instead.
- Any recent changes to integrations, tracking scripts, templates, audience rules, or playbook settings.

The more specific the example, the faster support can find whether the issue is setup, identity, tracking, eligibility, reporting, or attribution.

## Related guides

- [What are signals?]({% link _journeys/what-are-signals.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Troubleshooting checklist]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
