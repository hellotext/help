Use this checklist when you are setting up Hellotext for the first time or preparing a new business to go live.

The goal is to make sure your account, signals, channels, captures, and first playbook, route, or send are ready before customers start receiving messages.

If you are new to the product, start with [What is Hellotext?]({% link _getting-started/what-is-hellotext.md %}).

If you are choosing between playbooks, campaigns, and Inbox workflows, read [How Hellotext works]({% link _getting-started/how-hellotext-works.md %}).

## 1. Create and review your business

Create your business, choose the main country where it operates, and select the plan that fits your stage.

Before continuing, confirm the business name, its URL identifier, country, language, timezone, billing setup, and team access. Check the current plan and terms for the features and channels you will use; a business name does not confirm its subscription plan.

In **Settings**, check the **Business ID** to recognize which business you are preparing, especially if your account can access several. It is a public identifier, separate from your sign-in user and a private API token. **Enterprise** in the image is this fictional example business name.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identify the selected business in Settings">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional business named Enterprise with Business ID 4ONLdN32 and the Edit business control." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data. Enterprise is this example business name; the card does not confirm its plan or billing.</figcaption>
</figure>

Keep reading: [Setting up your business]({% link _getting-started/setting-up-your-business.md %}).

## 2. Connect your commerce platform

Connect the platform where your customer, order, and product data lives. This helps Hellotext build customer profiles, read commerce signals, understand purchase activity, and attribute results.

Start with the integration that matches your store:

- [Connect Wix]({% link _integrations/connect-wix.md %})
- [Connect WooCommerce]({% link _integrations/connect-woo.md %})
- [Connect VTEX]({% link _integrations/connect-vtex.md %})
- [Connect Mercado Libre]({% link _integrations/connect-mercado-libre.md %})

If you use WhatsApp commerce features, also review [Connect your catalog to WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %}).

Before launching anything from this data, [verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

Check a known sample against its source system: the correct profile, order reference and source, items, quantities, amounts, currency, and date. Confirm which data and events your integration syncs and when it processes them. A saved product or order does not prove that a purchase was recorded, associated with the correct profile, or counted as an attributed sale.

This editor helps you recognize the data: **Order ID** displays reference `ORDER-1001`; **Source** displays `custom_store`, and **Total amount** is the monetary amount USD 89.90. **Delivery: Deliver** describes the fulfillment type, without confirming shipment or delivery. The example is an existing fictional order with no events; it does not prove a connected store or completed sync.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Recognize an order reference, source and amount">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-en-mobile.png 2x" />
        <img class="ht-editorial-visual__image" src="/images/developers/orders-with-api/details-en.png" srcset="/images/developers/orders-with-api/details-en.png 2x" width="1006" height="914" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real fictional order editor with reference ORDER-1001, amount USD 89.90, source custom_store and delivery type Deliver." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing fictional order data, with no saved change or recorded event. Order ID identifies its reference; Delivery is not a delivery confirmation.</figcaption>
</figure>

Validate purchase or cart signals only through authorized operations in an isolated test environment supported by the integration. Check their effects on charges, stock, notifications, and automations; an internal contact does not isolate a production purchase. Retain original references and dates to reconcile what was received.

## 3. Connect your messaging channels

Connect the channel you plan to use first. For most teams, this starts with WhatsApp or SMS.

If you are using WhatsApp, connect the WhatsApp account before creating WhatsApp captures or sending WhatsApp campaigns.

Keep reading: [Connect WhatsApp]({% link _integrations/connect-whatsapp.md %}).

For SMS, check available senders and destinations, your business limits, and the unsubscribe mechanism before planning a send. For WhatsApp, check the sender identity and the active approved version of the template that will actually be sent; saving a draft does not confirm approval.

Confirm permission for the planned channel, destination, and communication type, and honor opt-outs. A connected account, an available phone number, or a profile marked subscribed does not establish that permission on its own. Check the [current WhatsApp policy](https://whatsappbusiness.com/policy/) for its conversation initiation and reply rules.

Also confirm how replies will be handled. Channels used for conversations are not necessarily available for campaigns; check the options offered by your business for the chosen send.

Keep reading: [Messaging channels overview]({% link _numbers/messaging-overview.md %}).

## 4. Add at least one capture tool

Before you launch campaigns, playbooks, or routes, make sure customers have a clear way to subscribe.

Start with the capture that matches where customers are most likely to join:

- QR codes for stores, packaging, printed material, or events.
- Shareable links for social media, ads, email, and landing pages.
- Forms for collecting customer details on your website.
- Checkout opt-in when customers are already buying.

Keep reading: [Capture tools overview]({% link _captures/capture-overview.md %}).

Review the information requested, the channel named in the notice, and what someone will receive after subscribing. In this example form, **Phone number**, **Subscribe**, and the SMS notice match one another; review configuration and permission before adapting the notice to promise another channel.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Review a form phone field and consent notice">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 490px; width: fit-content; margin: 0 auto;">
      <div>
        <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/en/preview.png" srcset="/images/captures/forms/ui-refresh/en/preview.png 2x" width="944" height="692" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional Editorial Demo form preview with centered Get updates heading, Phone number field, Subscribe button and SMS consent notice." />
      </div>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictional form saved as a draft, with no submissions, coupon or journey. The preview does not confirm installation, subscription or sending.</figcaption>
</figure>

Before distributing a QR or link, or installing a form, review its destination and actual state, along with any associated coupon or journey. A draft preview does not prove it is installed or active. Collecting a detail, creating a profile, and verifying marketing permission are separate steps; check state and the intended communication before adding that person to a send.

## 5. Prepare your first audience

Create or review the audience you will contact first.

Use lists when you want to manage group membership explicitly. Use segments when you want Hellotext to update membership according to data or behavior rules. Check current membership before sending, including availability of the data each rule needs.

Check inclusions and exclusions in the chosen send: included groups are combined, a repeated profile counts once, and a selected exclusion removes it even if it also belongs to an included group. Profile counts or reachable recipient counts do not establish consent. Check permission by channel and destination, opt-outs, and exclusions; **Unconfirmed** does not confirm a subscription.

Keep reading:

- [Understanding Lists and Segments]({% link _audience/lists-and-segments.md %})
- [Better targeting using Segments]({% link _audience/segments.md %})

## 6. Launch one focused playbook, route, or campaign

Choose one first outcome before expanding: recover abandoned carts, follow up after purchase, answer frequent questions with [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), guide returns or exchanges with [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), guide cancellation requests with [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}), collect subscribers, or send a one-time announcement.

Use a prebuilt playbook when the mission is already available. Use a route when you need a predictable step-by-step flow. Use a campaign when you need a one-time send to a selected audience.

Define the trigger, audience, channel, message, timing, and reply owner before enabling the flow or confirming the send. Playbooks and journeys can act on every profile meeting their conditions; a “test” label or internal name does not isolate their effects.

Before going broad, run an authorized check in an isolated environment or with controlled internal destinations and the required permission, as appropriate for the channel. Review the final message with actual variable values and fallbacks, links, tone, timing, unsubscribe mechanism, and handoff. Writing STOP in the body does not configure an unsubscribe mechanism by itself. Confirm receipt and reply handling; preparation or acceptance does not prove delivery.

Keep the first launch focused, with an owner and pause criteria. Review other flows, waits, and scheduled sends affecting the same audience; a pause does not recall messages already handed to a provider or guarantee cancellation of everything pending.

Keep reading:

- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [How Hellotext works]({% link _getting-started/how-hellotext-works.md %})
- [First wins starter pack]({% link _getting-started/first-wins-starter-pack.md %})
- [Implementation paths]({% link _getting-started/implementation-paths.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Creating a Campaign]({% link _campaigns/creating-a-campaign.md %})
- [First launch best practices]({% link _getting-started/tips-and-best-practices.md %})

## 7. Invite the people who will answer replies

Once customers can reply, make sure the right people have access to the inbox.

Invite teammates, review their roles, and confirm they accepted access to the correct business before launch. Agree on who will handle conversations, at what times, and what happens if the team is busy or has no coverage.

For playbooks that offer **Escalation**, review the switch and target team, such as **Atención demo** in this fictional Property Collector draft. That selection does not confirm an enabled playbook, an available member, or an actual conversation assignment.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Recognize the escalation control and its target team">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real unsaved Property Collector draft with Escalation enabled in the editor and the fictional team Atención demo selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">An unsaved draft control. The proper fictional team name is retained in English UI. Selecting a team does not prove an active playbook or a conversation assigned to an available member.</figcaption>
</figure>

Check receipt and conversation ownership through an authorized test of the intended channel, and identify who can pause or correct the flow if needed. If the channel cannot receive replies, provide another contact path and an owner to handle it.

Keep reading:

- [Understanding team roles]({% link _team/understanding-team-roles.md %})
- [Assigning conversations]({% link _team/assigning-conversations.md %})

## 8. Check the first results

After your first launch, review what happened before changing too many things at once.

Look at audience growth, replies, clicks, playbook activity, campaign reporting, and attributed sales. Define a common review period and timezone; distinguish new profiles from confirmed permissions, prepared messages from delivered ones, and total clicks from unique clicks per message.

Compare each result against the population and period used by its report. A click does not prove a purchase, and a saved order does not prove attribution. Check references, original events, and attribution windows before comparing sales with your store; reports may update after data is received.

Record the initial goal, result, opt-outs or errors, and next change. Adjust one concrete cause at a time and retain a reference for the previous period. If there are incorrect recipients, duplicates, or an unsubscribe mechanism that fails, review scope and pausing before expanding.

Keep reading:

- [Measure success in your first 7 days]({% link _getting-started/measure-success-first-7-days.md %})
- [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %})
- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Campaign Reporting]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [How we attribute sales]({% link _analytics-reporting-attribution/sales-attribution.md %})

## Optional before launch

Set up a [custom domain for short links]({% link _integrations/custom-domain-for-short-links.md %}) if you want branded links from the beginning. Confirm your plan supports it, the domain is verified, and destinations work before distributing links; entering a domain does not verify its DNS.

Review [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}) if your first sends will use SMS.
