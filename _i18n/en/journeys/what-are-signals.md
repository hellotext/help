Signals are the customer and business activity Hellotext can use to understand what is happening and decide what should happen next.

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
- A campaign can target customers who match recent activity or profile data.
- A report can connect clicks, orders, replies, and revenue back to the message or playbook that influenced them.
- The Inbox can give your team more context before they reply.

## Common signal types

Commerce signals include carts, product views, purchases, order status, refunds, coupons, stock changes, and product catalog data.

Profile signals include customer profile properties, subscription status, consent, preferred channel, location, birthday, tags, and list or segment membership.

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

## Signals, events, and profile properties

An **event** is a tracked action at a point in time, such as `cart.abandoned`, `product.viewed`, `order.placed`, or a custom event from your system.

A **profile property** is information stored on the customer profile, such as name, city, birthday, preferred size, consent status, or custom fields you collect.

A **signal** is the broader idea: any event, property, channel state, conversation state, or business context Hellotext can use to understand the customer and decide what to do next.

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
- [Tracking events]({% link _developers/tracking-events.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Analytics, reporting, and attribution overview]({% link _analytics-reporting-attribution/analytics-overview.md %})
