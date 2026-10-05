Use this guide after you have chosen the first playbook you want to launch.

A playbook should be enabled only after the required signals, channels, messages, knowledge, and handoff rules are ready. The exact configuration cards vary by playbook type and account, but the launch pattern is the same: configure the mission, test the experience, enable it, then review early results.

If you are still deciding what to launch, start with [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %}).

## Before you start

Confirm the basics first:

- Your store, website, catalog, or data source is connected when the playbook depends on commerce activity.
- The customer signals the playbook needs are appearing on customer profiles.
- The channel the playbook will use is connected and ready.
- The audience has consent and is eligible for the channel.
- A teammate or team is ready to handle handoffs.
- You know which report or Inbox view you will use to review the first results.

If the playbook depends on product, order, cart, policy, or FAQ information, make sure that information is current before you enable the playbook.

## Open the playbook

Go to **Playbooks**, click **Explore playbooks**, and choose the playbook you want to configure.

Use **All** to explore the catalog and **In my plan** to filter included options. A card may require a plan upgrade or a request; catalog presence does not establish editor access or a ready channel.

These screenshots show a fictional account and two catalog filters. No playbook was installed or enabled.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real catalog with All selected in a fictional account">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1070px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-enable-a-playbook/catalog-all-en-mobile.png 2x" width="828" height="876" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/catalog-all-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/catalog-all-en-desktop.png 2x" width="2104" height="984" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real catalog with All selected in a fictional account" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real catalog with All selected in a fictional account</figcaption>
</figure>

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real catalog with In my plan selected in a fictional account">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1070px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-enable-a-playbook/catalog-plan-en-mobile.png 2x" width="828" height="876" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/catalog-plan-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/catalog-plan-en-desktop.png 2x" width="2104" height="984" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real catalog with In my plan selected in a fictional account" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real catalog with In my plan selected in a fictional account</figcaption>
</figure>

Some types allow one playbook per business. If a copy already exists, including an inactive copy, Hellotext opens its configuration instead of creating another.

Custom playbooks and [custom agents]({% link _journeys/custom-agent-playbook.md %}) may allow multiple versions. Give each version a clear name that explains its mission, audience, or channel.

## Review the configuration cards

Each playbook shows the configuration cards that apply to that mission.

You may see cards such as:

- **Incoming channels**, for channels where customers can contact the playbook.
- **Outgoing channels**, for channels the playbook can use when sending messages.
- **Agent prompt**, for instructions that tell the AI agent what to do and how to respond.
- **Intents**, for customer intentions that should activate a custom agent.
- **Uploads**, for knowledge such as FAQs, policies, product notes, or documents the agent can use.
- **Discounts**, for eCommerce offer rules and maximum AI discount limits.
- **Tone**, for the voice used in AI-generated responses.
- **Escalation**, for the teammate or team that should take over when the agent needs help.
- **Web search**, for approved websites the agent can use when searching online.
- **[Webchat settings]({% link _captures/webchat-widget-playbook.md %})**, for appearance, behavior, sequence, teaser, and handoff settings when the playbook is a webchat.

This example is a new **Custom Agent**, without saving or enabling it. The desktop view shows Intents, Agent prompt, Uploads, and Incoming channels; the mobile view focuses on the first two cards. These are configuration controls, not executed instructions, uploaded documents, or connected channels.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Configuration cards in a new fictional Custom Agent without saving">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-enable-a-playbook/cards-en-mobile.png 2x" width="828" height="720" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/cards-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/cards-en-desktop.png 2x" width="1256" height="984" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Configuration cards in a new fictional Custom Agent without saving" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Configuration cards in a new fictional Custom Agent without saving</figcaption>
</figure>

You do not need to change every card. Change only what affects the customer experience, the playbook's permissions, or the team that will own exceptions.

## Configure channels

Choose where the playbook can act.

For inbound playbooks, decide whether it should respond on all incoming channels or only selected channels such as WhatsApp, Webchat, Instagram DM, or SMS.

For outbound playbooks, confirm the outgoing channel, sender, WhatsApp account, or template requirements before enabling the playbook.

If a channel is not ready, do not enable a playbook that depends on it. Finish the channel setup first.

## Configure the agent or route logic

For AI playbooks and custom agents, review:

- The prompt and business instructions.
- The intents that should activate the agent.
- Uploaded knowledge, FAQs, policies, and product information.
- Tone and brand voice.
- Escalation rules.
- Whether the agent can use web search or external actions.

For route-style playbooks, review:

- The trigger or signal that starts the route.
- Messages, waits, conditions, branches, and assignments.
- Stop conditions and frequency expectations.
- Links, coupons, product recommendations, and personalization.

Use the smallest setup that can prove the playbook works. It is easier to expand a focused playbook than to diagnose a broad one.

## Test before enabling

Use the playbook preview or **Playground** when available. It is a simulation: a reply there does not establish a real profile’s eligibility, channel readiness, or receipt by a teammate.

A test may use AI, documents, or external tools. Use test data you control and review the effects before running it. Check eligibility, channel readiness, and receipt separately in the authorized live workflow.

This Playground belongs to the earlier fictional draft. It is empty: no question was entered and no AI reply was generated. On mobile, open the **Playground** tab to see the test area.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real empty Playground in a fictional Custom Agent without running a test">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 686px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-enable-a-playbook/playground-en-mobile.png 2x" width="860" height="1154" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/playground-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/playground-en-desktop.png 2x" width="1336" height="1106" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real empty Playground in a fictional Custom Agent without running a test" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real empty Playground in a fictional Custom Agent without running a test</figcaption>
</figure>

Test:

- A customer who should enter the playbook.
- A customer who should not enter the playbook.
- The main success path.
- A reply or question the playbook should answer.
- A case the playbook should escalate.
- Links, products, offers, and personalization.
- The Inbox handoff path and assignment target.

For AI playbooks, test several realistic messages. Confirm that the agent stays in scope, uses the right knowledge, and escalates when it should.

## Save and enable

When the setup is ready, review its name and **Enable this playbook**. On mobile, the switch appears without that label.

In this editor, changing the switch submits the configuration: enabling is not a local change awaiting another Save click. On an existing playbook, **Save changes** appears when you edit; on a new one, enabling may save the first copy. Some types also require installation.

The screenshot shows an empty fictional draft with the switch off. The name is proposed for that new copy; it does not indicate a saved playbook or readiness for customers. The mobile interface itself hides the name.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="New fictional Custom Agent header with the switch off">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 918px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-enable-a-playbook/header-en-mobile.png 2x" width="860" height="234" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/header-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/header-en-desktop.png 2x" width="1800" height="194" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="New fictional Custom Agent header with the switch off" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">New fictional Custom Agent header with the switch off</figcaption>
</figure>

The next views show **Asistente de atención · Demo**, an existing fictional playbook. Its active state was prepared temporarily in an isolated demonstration environment with jobs and deliveries disabled, then restored. The ON switch and **Active** label show configuration state; they do not establish eligibility, an agent reply, or a delivered message.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Native header with the switch ON in a fictional demonstration playbook">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1118px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-enable-a-playbook/active-header-en-mobile.png 2x" width="860" height="234" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/active-header-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/active-header-en-desktop.png 2x" width="2200" height="194" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Native header with the switch ON in a fictional demonstration playbook" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Native header with the switch ON in a fictional demonstration playbook</figcaption>
</figure>

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Active label on a fictional playbook in the demonstration environment">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 352px; width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/active-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/active-en-desktop.png 2x" width="668" height="242" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Active label on a fictional playbook in the demonstration environment" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Active label on a fictional playbook in the demonstration environment</figcaption>
</figure>

After a playbook is enabled, Hellotext can mark its workflow as active and customers who match the playbook conditions may begin entering it.

Enabled does not mean every matching signal will send immediately. Hellotext still checks customer eligibility, channel readiness, frequency, timing, and handoff rules before each send. For details, see [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

To stop new entries, open the playbook list and use **Disable** on the active playbook. Check its saved state afterward. Disabling does not guarantee cancellation of queued work, provider messages, or every process already running. If a change’s result is uncertain, verify its state before repeating it: a second toggle can reverse the first.

The same active playbook’s menu offers **Disable**. It was opened to show the option without selecting it.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real menu with Disable on a fictional active playbook, without selecting the option">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 210px; width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/disable-menu-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/disable-menu-en-desktop.png 2x" width="384" height="238" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real menu with Disable on a fictional active playbook, without selecting the option" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real menu with Disable on a fictional active playbook, without selecting the option</figcaption>
</figure>

The **Inactive** view shows the same fictional playbook’s original state, captured after restoring the active demonstration to its original inactive state. It is a saved copy separate from the new draft; these screenshots do not show a delivery or provider cancellation.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Existing fictional playbook with the saved Inactive state">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 418px; width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-enable-a-playbook/inactive-en-desktop.png" srcset="/images/journeys/how-to-enable-a-playbook/inactive-en-desktop.png 2x" width="800" height="128" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Existing fictional playbook with the saved Inactive state" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing fictional playbook with the saved Inactive state</figcaption>
</figure>

## Watch the first activity

Do not launch and walk away.

During the first day, review:

- Whether the right customer profiles entered.
- Whether the expected messages were delivered.
- Whether replies reached the Inbox.
- Whether the agent answered within scope.
- Whether handoffs went to the right teammate or team.
- Whether links, products, discounts, and recommendations worked.
- Whether reporting started to show activity.

If the playbook touches revenue or support, keep the first audience narrow until the team has reviewed the first conversations.

## Tune after launch

Change one thing at a time.

Common adjustments include:

- Narrowing the audience or trigger.
- Improving the prompt.
- Adding or updating knowledge documents.
- Changing the channel selection.
- Updating tone or offer strategy.
- Adjusting handoff rules.
- Fixing tracking, links, templates, or product data.

After each change, give the playbook enough activity before comparing results again.

For a safer editing process, keep reading: [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Related guides

- [Choose your first playbook]({% link _journeys/choose-your-first-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [How Hellotext decides whether a playbook can send]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Troubleshoot a playbook that did not trigger or send]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [Webchat Widget playbook]({% link _captures/webchat-widget-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook reporting]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Troubleshoot missing signals or activity]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
