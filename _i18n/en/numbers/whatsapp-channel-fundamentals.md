Use WhatsApp when customers expect a conversational channel and you want Hellotext to support replies, playbooks, routes, campaigns, AI agents, and commerce in one place.

This guide explains how to think about WhatsApp after the account is connected. For the connection steps, start with [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %}).

## What WhatsApp is best for

WhatsApp works well when the customer may reply, ask a follow-up question, or need help before buying.

Use WhatsApp for:

- Inbox conversations with customers.
- AI agents that answer questions or recommend products, such as [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}).
- Order-status support with [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) when order and tracking data are available.
- Playbooks that recover carts, help shoppers choose, support post-purchase questions, or react to customer signals.
- Routes that ask questions, branch, assign conversations, or collect context.
- Targeted campaigns to eligible audiences.
- Product discovery when the catalog is available for WhatsApp, and continuation to checkout when the commerce integration supports that flow.

Use SMS when you mainly need broad reach and a simple text message. Many businesses use both channels. Keep reading: [SMS channel fundamentals]({% link _numbers/sms-channel-fundamentals.md %}).

## Prepare the channel before launch

Before you rely on WhatsApp for customers, confirm that:

- Your WhatsApp Business account and phone number are connected in Hellotext.
- Meta billing, verification requirements, and account and phone-number restrictions allow the intended use.
- The phone number you plan to use is available in Hellotext.
- You have permission for WhatsApp, the destination, and the intended message type. Retain how and when it was obtained: a purchase, a saved phone number, or **Subscribed** status does not establish that permission by itself.
- Replies are routed to the team that will handle them in the Inbox.
- You validated flows with authorized test data and recipients in an isolated environment before launch. Do not use a real campaign or imported contacts as an improvised test.
- Required products are eligible, synchronized, and available in the correct catalog when the flow needs WhatsApp commerce; connecting an account does not establish that all its products are published.

Keep reading: [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %}).

## Understand inbound and outbound messages

WhatsApp behaves differently depending on who started the conversation.

When a customer messages the connected, enabled channel, Hellotext can receive the conversation in the Inbox. Depending on configuration and eligibility, a playbook, route, or AI agent may also handle it. The WhatsApp customer service window lasts **24 hours from the customer’s latest message**. Another customer message resets it; a business send or closing the conversation in Hellotext does not reset it.

Outside that window, use an approved WhatsApp template allowed for the message’s purpose. Business-initiated sends, including campaigns and proactive playbooks, must follow template and consent rules. A recent conversation or reachable destination does not replace permission for future promotions. Consult the [current WhatsApp Business policy](https://business.whatsapp.com/policy).

Plan your WhatsApp experience around both modes:

- **Inbound:** customer asks, Hellotext replies or routes the conversation.
- **Outbound:** Hellotext sends a template-based message to an eligible audience or customer profile.

## Templates and message categories

WhatsApp templates help Meta review and classify business-initiated messages. Use them when Hellotext needs to start a WhatsApp conversation or send outside the customer service window.

The three template categories are:

- **Marketing:** offers, product suggestions, abandoned cart reminders, launches, and promotions.
- **Utility:** order, account, delivery, or other transactional updates requested by the customer.
- **Authentication:** one-time passwords and identity verification.

**Service** describes replies inside the customer service window; it is not a fourth template category. The final purpose and content determine classification, even if the local name says “order update.”

Choose the category, language, and content for the actual use. Check the **active approved version for the sending WhatsApp account**. A saved draft or pending change does not establish that this content is already approved; an earlier version may remain active while the change is reviewed. Meta can reject, pause, or restrict a template, so approval does not guarantee delivery.

In **Settings > Templates**, the **Message** editor lets you prepare the body and review formatting. The figure shows “Read” in bold and “instructions” in italics: it is a fictional unsaved draft, opened in the common editor from SMS. It identifies the content area; it does not show an approved WhatsApp template, its category, or delivery. Available tools depend on the channel and flow.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Message editor with fictional formatted return text, unsaved; no WhatsApp approval is shown.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/format-en-mobile.png 2x" width="652" height="528" />
        <img src="/images/numbers/message-editor-basics/format-en.png" srcset="/images/numbers/message-editor-basics/format-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="528" loading="lazy" decoding="async" alt="Message editor with fictional formatted return text, unsaved; no WhatsApp approval is shown." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused. It does not demonstrate WhatsApp approval, connection, or delivery.</figcaption>
</figure>

Keep reading: [Message editor basics]({% link _numbers/message-editor-basics.md %}).

For current pricing and category details, review Meta's [WhatsApp Business Platform pricing](https://business.whatsapp.com/products/platform-pricing#rates). Meta charges for delivered messages by category and market; its service replies inside the window have no Meta charge. This does not make Hellotext usage or billing free. Do not assume a fixed rate or equate acceptance with delivery.

## How Hellotext uses WhatsApp

### Inbox

WhatsApp replies can appear in the Inbox so teammates can answer, assign, close, or hand off conversations. Define who handles them, their capacity, and working hours. Receipt does not guarantee that a particular person has taken ownership. If AI or a playbook cannot resolve a conversation, provide a clear handoff to the responsible teammate. Closing a conversation is a Hellotext service state and does not open another Meta window.

Keep reading: [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

### Playbooks and routes

Playbooks and routes can use WhatsApp for automated conversations, product recommendations, cart recovery, support, post-purchase follow-up, and branching flows.

Before launch, validate the real trigger, received context, active version, each branch, and the flow’s own schedules and limits in the authorized environment. Check what happens on a reply, handoff, or pause. Inbox tools are not identical to route tools: the Playbook message form, for example, does not offer location. A preview or draft does not establish that the flow is active or a reply has arrived.

### Campaigns

Campaigns can send targeted WhatsApp messages to eligible audiences. Review the final channel, exclusions, permission, active version, time zone, schedule, and potential overlaps before confirming. Do not apply one playbook’s limit or window to all campaigns. The WhatsApp and SMS option does not turn every failure into a resend: fallback requires a compatible flow, a valid destination, and permission for SMS.

Keep reading: [Campaigns overview]({% link _campaigns/campaigns-overview.md %}).

### Capture tools

Capture tools can help customers opt in to WhatsApp. Explain the channel, purpose, and expected messages. In **QR Codes > Choose the Type**, check the **WhatsApp** option: the real figure has SMS selected and WhatsApp disabled in the fictional business. It does not represent a connected WhatsApp channel or completed subscription.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="QR code type chooser: SMS selected and WhatsApp disabled in the fictional business.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 678px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/type-en-mobile.png 2x" width="740" height="1500" />
        <img src="/images/captures/qr-codes/type-en.png" srcset="/images/captures/qr-codes/type-en.png 2x" style="width: auto; margin: 0 auto;" width="1320" height="1310" loading="lazy" decoding="async" alt="QR code type chooser: SMS selected and WhatsApp disabled in the fictional business." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused. It does not demonstrate WhatsApp approval, connection, or delivery.</figcaption>
</figure>

Scanning a QR code or opening a link may prepare a message on the device; it does not send it. Hellotext records subscription for these captures when it processes the corresponding inbound message. Follow-up depends on the assigned configuration; do not assume an automatic welcome. Keep reading: [QR codes]({% link _captures/qr-codes.md %}).

Keep reading: [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

### Commerce

A compatible catalog can support product discovery and recommendations. Verify each product and variant: identity, source, reference, price and currency, image, URL, eligibility, and synchronization/publication result. A Hellotext **Reference** or **SKU** is not itself the Meta catalog identifier; a saved price does not establish available stock.

The **Settings > Objects > Products** figure shows the fictional identity of **Agenda semanal**, reference **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER**, and source **custom_store**. The same proper name is retained in both UI languages. It is an independent draft product without a photo, URL, additional variants, or events; it is not a WhatsApp import or a catalog ready to sell.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Edit fictional product Agenda semanal with reference, SKU, and custom_store source; no published catalog is shown.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/products-and-inventory-with-api/identity-en-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-en.png" srcset="/images/developers/products-and-inventory-with-api/identity-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Edit fictional product Agenda semanal with reference, SKU, and custom_store source; no published catalog is shown." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused. It does not demonstrate WhatsApp approval, connection, or delivery.</figcaption>
</figure>

Adding products to a cart or receiving a request through WhatsApp does not confirm a purchase, payment, or delivery. Continuation to checkout depends on a compatible integration producing a valid URL; connecting a catalog does not make it available for every catalog. Reconcile the order and its signals with the store before treating it as a sale. Keep reading: [Product catalog synchronization]({% link _integrations/product-catalog-sync.md %}).

## Keep WhatsApp healthy

WhatsApp quality depends on sending messages that customers expect and want.

Before and after launch:

- Send only to customer profiles with WhatsApp consent.
- Keep frequency reasonable.
- Make the message purpose clear.
- Avoid sending the same reminder too many times.
- Watch replies, complaints, blocks, opt-outs, and sends with errors. Honor opt-outs received through other routes too; opt-out text in a draft does not process a customer’s request.
- Review phone-number quality and sending limits in Meta.
- Route confused, angry, or high-risk conversations to the Inbox.

If quality drops or customers are surprised by the messages, pause and adjust the audience, template, schedule, or flow rules. Distinguish accepted requests, processed messages, routing, delivery, and viewing. In the current API, HTTP 200 with **received** does not include an ID or guarantee creation or delivery; **error** status is distinct from an inbound event. If the outcome is uncertain, reconcile the request and statuses before retrying to avoid duplicates.

For support, share the business, flow, period and time zone, template/version, and available request or message identifiers. Do not include tokens, passwords, or unnecessary private data.

## First WhatsApp launch checklist

Before your first WhatsApp launch, confirm that:

1. WhatsApp is connected in Hellotext.
2. Meta billing, verification, and templates are ready.
3. Permission, destination, and message type are checked for each recipient.
4. Replies go to the right Inbox owners.
5. Flows were validated with authorized isolated data and recipients, keeping tests separate from real sales.
6. Handoff, limits, schedules, permitted fallback, pause, and uncertain-result handling are clear.

After an authorized launch, review statuses, replies, and reporting for the real flow. Attribution needs recorded purchase signals and the applicable window; a cart request, click, or reply is not automatically an attributed sale. Retain period, time zone, population, and denominator when comparing results, and check pending outcomes before repeating sends.

Keep reading: [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %}).

## Related guides

- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [SMS channel fundamentals]({% link _numbers/sms-channel-fundamentals.md %})
- [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
