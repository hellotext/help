Use WhatsApp when customers expect a conversational channel and you want Hellotext to support replies, playbooks, routes, campaigns, AI agents, and commerce in one place.

This guide explains how to think about WhatsApp after the account is connected. For the connection steps, start with [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %}).

## What WhatsApp is best for

WhatsApp works well when the customer may reply, ask a follow-up question, or need help before buying.

Use WhatsApp for:

- Inbox conversations with customers.
- AI agents that answer questions or recommend products.
- Playbooks that recover carts, help shoppers choose, support post-purchase questions, or react to customer signals.
- Routes that ask questions, branch, assign conversations, or collect context.
- Targeted campaigns to eligible audiences.
- Product discovery and checkout when your catalog is connected.

Use SMS when you mainly need broad reach and a simple text message. Many businesses use both channels.

## Prepare the channel before launch

Before you rely on WhatsApp for customers, confirm that:

- Your WhatsApp Business account and phone number are connected in Hellotext.
- Meta billing and business verification are in good standing.
- The phone number you plan to use is available in Hellotext.
- Your audience has consent for WhatsApp messages.
- Replies are routed to the team that will handle them in the Inbox.
- Any playbook, route, campaign, or AI agent has been tested through WhatsApp.
- Your product catalog is connected if you want WhatsApp commerce or product recommendations.

Keep reading: [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %}).

## Understand inbound and outbound messages

WhatsApp behaves differently depending on who started the conversation.

When a customer messages your business, Hellotext can receive the conversation in the Inbox. Depending on your setup, the message can also be handled by a playbook, route, or AI agent. Meta defines a customer service window for business replies after a customer message, and that window resets when the customer sends another message.

When your business starts or restarts a conversation, you should expect to use an approved WhatsApp template. This affects campaigns, proactive playbooks, cart recovery, reactivation, and other business-initiated sends.

Plan your WhatsApp experience around both modes:

- **Inbound:** customer asks, Hellotext replies or routes the conversation.
- **Outbound:** Hellotext sends a template-based message to an eligible audience or customer profile.

## Templates and message categories

WhatsApp templates help Meta review and classify business-initiated messages. Use them when Hellotext needs to start a WhatsApp conversation or send outside the customer service window.

Common template categories include:

- **Marketing:** offers, product suggestions, abandoned cart reminders, launches, and promotions.
- **Utility:** order, account, delivery, or other transactional updates requested by the customer.
- **Authentication:** one-time passwords and identity verification.
- **Service:** replies to customer inquiries during the service window.

Choose templates that match the actual purpose of the message. A campaign promotion, an order update, and a support reply should not be treated as the same kind of WhatsApp send.

For current pricing and category details, review Meta's [WhatsApp Business Platform pricing](https://business.whatsapp.com/products/platform-pricing#rates).

## How Hellotext uses WhatsApp

### Inbox

WhatsApp replies can appear in the Inbox so teammates can answer, assign, close, or hand off conversations. If AI or a playbook cannot resolve a conversation, route it to the right owner.

Keep reading: [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

### Playbooks and routes

Playbooks and routes can use WhatsApp for automated conversations, product recommendations, cart recovery, support, post-purchase follow-up, and branching flows.

Before launching, test the WhatsApp path from trigger to reply. Confirm what happens when the customer answers, when the AI cannot resolve, and when a teammate needs to take over.

### Campaigns

Campaigns can send targeted WhatsApp messages to eligible audiences. Keep campaigns focused, use the right template category, and avoid sending more often than customers expect.

Keep reading: [Campaigns and broadcasts overview]({% link _campaigns/campaigns-overview.md %}).

### Capture tools

Capture tools can help customers opt in to WhatsApp. Make the subscription language clear so customers understand what channel they are joining and what kind of messages they may receive.

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

### Commerce

If your catalog is connected, WhatsApp can support richer shopping flows. Customers can discover products, receive recommendations, add products to cart, and continue toward checkout from the conversation.

## Keep WhatsApp healthy

WhatsApp quality depends on sending messages that customers expect and want.

Before and after launch:

- Send only to customer profiles with WhatsApp consent.
- Keep frequency reasonable.
- Make the message purpose clear.
- Avoid sending the same reminder too many times.
- Watch replies, complaints, blocks, opt-outs, and failed sends.
- Review phone-number quality and sending limits in Meta.
- Route confused, angry, or high-risk conversations to the Inbox.

If quality drops or customers are surprised by the messages, pause and adjust the audience, template, timing, or playbook rules.

## First WhatsApp launch checklist

Before your first WhatsApp launch, confirm that:

1. WhatsApp is connected in Hellotext.
2. Meta billing, verification, and templates are ready.
3. Your audience has WhatsApp consent.
4. Replies go to the right Inbox owners.
5. Playbooks, routes, AI agents, or campaigns have been tested.
6. Handoff and fallback paths are clear.
7. Reporting and attribution are ready for review after launch.

Keep reading: [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %}).

## Related guides

- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
