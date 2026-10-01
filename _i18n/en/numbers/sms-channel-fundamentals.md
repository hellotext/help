Use SMS for a concise text message addressed to a compatible phone number. Hellotext can use it for campaigns, autonomous playbooks, routes, Inbox conversations, supported capture flows, and API messages. Availability depends on the business, destination, and flow; a stored phone number does not establish permission to contact it.

SMS supports text and URLs. Buttons, attachments, products, and locations from other channels do not transfer automatically; bold or italic formatting in the editor becomes plain text. SMS does not use Meta's WhatsApp template approval, but sender, carrier, account, content, and consent requirements still apply.

Rates and sender types vary with the destination and account agreement. Review [SMS pricing and number types]({% link _billing/sms-pricing-and-number-types.md %}) and [current pricing](https://www.hellotext.com/pricing) for your market. Message parts affect SMS usage; they do not by themselves equal the final invoice total.

## Before you use SMS

Confirm that:

- An enabled sender and compatible SMS route support the destination country.
- The complete number includes its country code and belongs to the authorized recipient.
- You have permission for that channel, destination, and message type; retain how and when it was obtained.
- The business has access to the flow and is not stopped by balance, billing, limits, or a paused campaign.
- The sender supports the replies and opt-outs you promise, and they can be handled by the correct business.

Hellotext may select active owned numbers, shared short codes, or external providers according to availability and configuration. The business country alone does not guarantee a sender, coverage, or inbound replies. An alphanumeric sender may have different restrictions from a two-way phone number.

If a compatible route is missing or you need a dedicated identity, consult Hellotext before planning the launch. A connected WhatsApp account does not automatically enable all SMS destinations.

## How Hellotext uses SMS

### Campaigns

When creating a compatible campaign, you can choose:

- **WhatsApp and SMS:** permits both channels for eligible destinations. WhatsApp availability, profile destinations, and content determine routing; it is not an instruction to resend every WhatsApp error through SMS.
- **WhatsApp only:** restricts channel selection to WhatsApp.
- **SMS only:** restricts channel selection to SMS.

Options depend on the business channels and features. SMS fallback must be allowed by the flow and content and have SMS permission. The reachable audience and an **Unconfirmed** profile do not establish that permission. Review the audience, exclusions, and final channel before launch.

Keep reading: [Campaign best practices]({% link _campaigns/campaign-best-practices.md %}).

### Autonomous playbooks

A proactive playbook evaluates the opportunity, eligibility, content, and available routes. Selection may follow channel priorities or a specific route already allocated; it **does not guarantee the cheapest channel**. It may omit sending when the opportunity is no longer valid or no compatible destination exists.

Enabling SMS does not make every playbook send an SMS. Review that playbook's configuration and scope, recipient permission, and active content version. A reactive playbook handles a conversation under its channel and rules; do not assume it automatically switches to SMS when that channel fails.

### Routes

Steps follow their configured channels and conditions. Selecting all available channels does not guarantee delivery through each one or override an opt-out. Review each branch's destination and content, including missing phone numbers, unsubscribed profiles, and unavailable routes.

Validate branches with isolated fictional data and authorized destinations before activation. Check timing, frequency, and flow access separately; do not assume one setting covers all routes and playbooks.

### Inbox and replies

A reply can open or continue a conversation when the sender and provider support inbound messages and the reply is routed to the business. Teammates or a compatible playbook can handle it according to configuration and capacity; a reply does not by itself assign a particular person.

Shared short codes can serve several businesses. For a reply from the same number and channel, Hellotext uses previous outbound messages and their state update time to determine the business. This association is not an exclusive identity or a guarantee that every reply reaches the business you expected. For dedicated continuity, review [Exclusive short codes]({% link _numbers/exclusive-short-codes.md %}) with support and validate actual reception.

### API messages

The integration must select compatible technology, destination, and content; when origin is omitted, Hellotext may resolve an available sender. An explicit origin does not guarantee coverage or delivery. Protect the private token and separate testing from real audiences.

An HTTP 200 **received** response acknowledges the request and queues processing; it returns no created-message ID or guarantee of creation or delivery. It is not the state of an inbound SMS. Reconcile the result before repeating a request whose outcome is uncertain.

Keep reading: [Send messages with the API]({% link _developers/send-messages-with-api.md %}).

## Understand SMS length and message parts

Text may split into several billable parts even when the phone displays one message. Characters, encoding, personalization values, and the final URL and opt-out text affect its size. Some symbols use more than one unit; emoji and certain characters may change encoding. Concatenated messages reserve space for joining their parts.

The figure shows **Return follow-up**, a fictional unsaved draft in the **Message** version, with unresolved `{name}`, an example URL, and **Reply STOP to opt out**. No template was created or content sent. The field helps review text, tag, and URL; this capture does not show a segment counter or WhatsApp approval.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Message editor with fictional return text, unresolved name tag and example URL; unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/send-messages-with-api/editor-en-mobile.png 2x" width="668" height="718" />
        <img src="/images/developers/send-messages-with-api/editor-en.png" srcset="/images/developers/send-messages-with-api/editor-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Message editor with fictional return text, unresolved name tag and example URL; unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused without changing its pixels. No import was started or message sent.</figcaption>
</figure>

When the flow's editor shows an SMS estimate, use it as guidance. Unresolved tags may make it approximate; the actual name, resolved URL, and opt-out text can change the result. The browser estimate and provider segmentation are not one universal equivalent formula: usage is recorded from the text and encoded parts during processing. Keep one clear purpose and action; check representative actual values through an authorized validation with isolated data.

Keep reading: [SMS pricing and number types]({% link _billing/sms-pricing-and-number-types.md %}), [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %}), and the [SMS encoding and segment reference](https://www.twilio.com/docs/glossary/what-sms-character-limit). That provider's limits do not replace the conditions of your Hellotext route.

## Consent and opt-outs

A valid number, **Subscribed** profile, purchase, or recent conversation does not establish permission for every channel and content type. Hellotext's reachability and exclusion controls may filter destinations, but they do not obtain or verify your SMS permission evidence by themselves.

The figure shows the importer's consent question with **No, do not update these customers as subscribed** selected. This fictional state precedes starting the import; the file still showed **Not selected**. Declaring consent during import does not create the original evidence or guarantee a changed state for an existing deduplicated profile. Check resulting profiles and channel permission before using them.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Importer consent question with No selected; the import was not started.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 1050.5px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-en-20260928-crop.png 2x" width="780" height="1200" />
        <img src="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-en-20260928-crop.png 2x" style="width: auto; margin: 0 auto;" width="2065" height="705" loading="lazy" decoding="async" alt="Importer consent question with No selected; the import was not started." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused without changing its pixels. No import was started or message sent.</figcaption>
</figure>

Before sending:

- Explain the business, purpose, channel, and opt-out method; retain permission evidence.
- Exclude unsubscribed, invalid, internal, and test profiles and destinations as appropriate.
- Check that the announced opt-out works with that sender and its reply reaches Hellotext.
- Handle opt-out requests and respect profile status; do not switch channels or reimport to evade it.

Hellotext recognizes opt-out replies such as **BAJA** or **STOP** when the inbound message arrives and is processed; it can mark the profile unsubscribed. This differs from writing that word in a draft: the text does not configure inbound reception or establish a processed opt-out. Coordinate requests received through support or other means too.

See [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}) to distinguish permission, profile state, and destination reachability.

## Delivery states and failed messages

Check the message state and reason; request acceptance is not delivery. Message data may expose:

- **Pending (`pending`):** not yet confirmed for dispatch.
- **Dispatched (`dispatched`):** the dispatch attempt started; it does not confirm carrier or phone reception.
- **Routed (`routed`):** the provider accepted sending and may still be processing it.
- **Delivered (`delivered`):** a provider delivery confirmation arrived. This does not establish reading, clicking, or an attributed purchase.
- **Error (`error`):** a failure and reason were recorded; the API uses `error`, even though a timestamp is named `failed_at`.

An inbound message may have state `received`; this differs from the **received** acknowledgement when creating through the API. Flows may omit a recipient or stop before a Message exists, so error counts do not explain every omission either.

Do not repeat a send while its outcome is uncertain. Review the reason, destination, sender, final channel, and request/dispatch times; consult support if you cannot reconcile it. Blocks can include an invalid number, carrier rejection, unavailable route, balance or billing, a limit, or a paused flow.

A new prepaid business may have a temporary daily SMS cap during quality review. This differs from the configured monthly maximum and each campaign, route, or playbook's restrictions; do not assume one universal cap or that waiting a few minutes resets it.

Keep reading: [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) and [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

## First SMS launch checklist

Before launch, confirm that:

1. The sender and SMS route support the destination country, including replies if promised.
2. Each destination has permission for SMS and the content type; review exclusions and existing profiles.
3. The final text identifies the business and has a clear purpose, correct URL, and usable opt-out.
4. The part estimate is acceptable with representative personalization and current agreement rates.
5. Replies and opt-outs reach the business and team or playbook able to handle them.
6. You validated delivery, replies, URLs, personalization, and opt-out with isolated fictional data and authorized destinations, using no real audience for testing.
7. You know how to review states, reasons, and reports, reconcile uncertain results, and pause the flow before further attempts.

## Related guides

- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Exclusive short codes]({% link _numbers/exclusive-short-codes.md %})
- [SMS pricing and number types]({% link _billing/sms-pricing-and-number-types.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
