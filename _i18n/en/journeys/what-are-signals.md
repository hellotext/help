Signals are customer and business data and activity Hellotext can use to understand what is happening and decide what should happen next.

A signal can come from your store, website, connected channels, capture tools, custom tracking, customer profiles, or conversations in the Inbox.

Signals help Hellotext answer questions like:

- Did this customer abandon a cart?
- Did they view a product several times?
- Did they buy recently?
- Are they eligible to receive a message on this channel?
- Did they reply with a question or need human help?
- Is a product back in stock?

## Why signals matter

Hellotext is most useful when it can act from current context instead of sending the same message to everyone.

Playbooks, routes, campaigns, segments, reports, and Inbox workflows can all use signals in different ways.

For example:

- A playbook can decide whether a customer should receive an abandoned-cart follow-up.
- A route can start when a customer subscribes or matches a trigger.
- A segment can update automatically when customer behavior changes.
- A campaign planned by your team can select its audience based on recent activity or profile data.
- A report can show recorded activity and attributed revenue when the [source and attribution rules]({% link _analytics-reporting-attribution/sales-attribution.md %}) are met.
- The Inbox can give your team more context before they reply.

## Common signal types

Commerce signals include carts, product views, purchases, order status, refunds, coupons, stock changes, and product catalog data.

Profile signals include customer properties, subscription status, consent, location, birthday, tags, and list or segment membership.

Conversation signals include replies, intent, support questions, handoff needs, and whether a conversation is open, assigned, or closed.

Tracking signals include page views, short-link clicks, custom events, external events, and activity captured by Hellotext.js or the API.

Channel signals include whether WhatsApp, SMS, or another channel is connected, approved, eligible, and appropriate for the customer.

## Signals do not always trigger a message

A signal is context. It does not always mean Hellotext will send something immediately.

Before a playbook, route, or campaign acts, Hellotext may also consider:

- The playbook goal.
- The trigger and audience rules.
- Consent and channel eligibility.
- Frequency limits and quiet hours.
- Whether another playbook is already active for the customer.
- Whether a human should take over.
- Whether the required data is complete enough to make a good decision.

This is why two customers can create the same signal but receive different next steps.

For example, a route configured for abandoned carts could follow up with a customer who has not purchased and can receive messages. If another customer abandons a cart but then buys or has not consented to that channel, the same route may withhold the follow-up. The event type is the same; the rules and current context change the decision.

## Signals, events, and profile properties

An **event** is an occurrence recorded at a specific time for a customer or anonymous session. `cart.abandoned`, `product.viewed`, and `order.placed` are action names that can identify the event type; your system can also send custom events.

A **profile property** is standard or custom information stored about a customer, such as birthday, company, tags, or preferred size. Subscription status can also inform decisions, but it is managed separately from editable properties.

A **signal** is the broader idea: any event, property, channel state, conversation state, or business context Hellotext can use to understand the customer and decide what to do next.

To see how attributes and recorded events appear, read the [customer profiles guide]({% link _audience/customer-profiles.md %}).

## How to make signals available

Start by connecting the systems where your data lives.

Common setup steps include:

- Connect your commerce platform.
- Connect WhatsApp, SMS, or another messaging channel.
- Add capture tools so customers can subscribe.
- Install tracking or use an integration that sends events automatically.
- Use Hellotext.js or the API if you have custom activity to send.
- Confirm activity appears on customer profiles before launching a playbook or campaign.

## Related guides

- [Setup overview]({% link _integrations/setup-overview.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Tracking events]({% link _developers/tracking-events.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Browse Recovery playbook]({% link _journeys/browse-recovery-playbook.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
