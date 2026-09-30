Use this guide when you want visitors to start a conversation from your website.

Webchat Widget is an on-site conversational entry point. In Hellotext, it is configured as a playbook and capture: you control how it appears, when it opens, what it says first, and whether visitors can continue through another channel such as WhatsApp.

It is not the AI agent itself. Think of it as the front door on your site. After a visitor starts a conversation, your team, Inbox rules, AI playbooks, or custom agents can handle the next step depending on your setup.

The editor groups settings into cards and shows the webchat preview on the right. This helps you connect each component to the visitor experience.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Appearance, Opening sequence, Teaser, Behavior, and Channels cards; in the wide view, with the Webchat preview on the right.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1234px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 1399px)" srcset="/images/captures/webchat-widget/preview-follow-up/en/overview-mobile.png 2x" width="872" height="1872" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/preview-follow-up/en/overview.png" srcset="/images/captures/webchat-widget/preview-follow-up/en/overview.png 2x" width="2432" height="1726" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Appearance, Opening sequence, Teaser, Behavior, and Channels cards; in the wide view, with the Webchat preview on the right." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Editor overview. The narrow-screen focus keeps all five cards complete; the full preview appears below.</figcaption>
</figure>

## What Webchat Widget does

Webchat Widget lets customers message your business directly from your site.

It can:

- Show a launcher on the pages where you install the widget.
- Open when the visitor clicks the launcher or, if configured, after the page loads.
- Display a short teaser before the visitor opens the chat.
- Start with a configured opening sequence.
- Let visitors ask for help, order guidance, product recommendations, or support.
- Send the conversation to the Inbox when a person needs to reply.
- Continue through WhatsApp when channel handoff is configured.
- Work alongside AI playbooks, support playbooks, custom agents, routes, and response rules.

Webchat works best when the site needs a simple way for visitors to ask questions without leaving the page.

## When to use it

Use Webchat Widget when:

- Visitors often need help before they buy.
- Your team wants a visible chat entry point on the storefront.
- You want product recommendation, support, or order questions to start from the website.
- You want to invite visitors into a conversation without relying only on SMS, WhatsApp, or social channels.
- You want conversations to land in the Inbox with the right team process.
- You want to offer WhatsApp continuation after the visitor starts on the site.

It is especially useful when paired with [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}), [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}), or a focused [Custom Agent]({% link _journeys/custom-agent-playbook.md %}).

## When not to use it

Do not use Webchat Widget as a replacement for every other playbook.

Use a [campaign]({% link _campaigns/campaigns-overview.md %}) when you need a one-time announcement to a selected audience.

Use a [journey route]({% link _journeys/getting-started-with-journeys.md %}) when the customer experience must follow explicit steps, waits, conditions, and assignments.

Use a product or support AI playbook when the main job is the agent's reasoning, not the website entry point. Webchat can start the conversation, but the agent still needs its own mission, knowledge, and handoff rules.

Use checkout opt-in, forms, QR codes, or shareable links when the main job is collecting consent or profile data instead of starting an on-site chat.

## What it needs before launch

Before enabling Webchat Widget, confirm:

- Your website or commerce platform is connected, or you know which installation method you will use.
- Your installation method is ready: Hellotext.js, the WooCommerce plugin, or a compatible VTEX or Fenicio integration.
- You know which website and pages will include the widget.
- The team knows who owns new webchat conversations in the Inbox.
- The opening message explains what the visitor can ask.
- Handoff to WhatsApp is configured if you want visitors to continue there.
- Any AI playbook or custom agent that should answer webchat conversations is ready.
- Response rules and business hours match the level of service you want for webchat.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, find the **Capture** group, and choose **Webchat Widget**. If a playbook of this type already exists, its editor opens.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Webchat Widget card in the desktop playbook catalog.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 400px; width: fit-content; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/capture-overview/desktop-webchat-en.png" srcset="/images/captures/capture-overview/desktop-webchat-en.png 2x" width="800" height="480" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Webchat Widget card in the desktop playbook catalog." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Webchat Widget in the desktop catalog.</figcaption>
</figure>

Webchat Widget includes:

- **Appearance:** brand color, typography, launcher, header, conversation colors, logo, and Hellotext branding.
- **Behavior:** placement, click-to-open or automatic opening, delay, first-visit behavior, and once-per-session behavior.
- **Opening sequence:** the first messages shown in a new webchat conversation.
- **Teaser:** the small invitation that appears before the visitor opens the chat.
- **Channels or handoff:** whether to show WhatsApp, restrict continuation to WhatsApp, and which WhatsApp number to display.
- **Installation:** automatic installation options or manual installation instructions.

You do not need to customize every card. Start with the cards that shape the visitor experience: appearance, behavior, opening sequence, and handoff.

## Design the appearance

The widget should feel like part of your site, but it should still be easy to notice.

Review:

- Launcher color, text color, notification style, and icon.
- Header display, business name, logo, and colors.
- Conversation background and message bubble colors.
- Button and carousel colors when those elements appear.
- Whether your plan allows removing Hellotext branding.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Webchat brand controls, including typography and primary color.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 528px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/appearance-mobile-en.png 2x" width="720" height="136" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/appearance-en.png" srcset="/images/captures/webchat-widget/appearance-en.png 2x" width="1056" height="762" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Webchat brand controls, including typography and primary color." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Brand settings define the widget typography and primary color.</figcaption>
</figure>

The preview lets you review the header, opening-sequence greeting, message field, and launcher together. The bubbles in this view are editor examples.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Complete Example Store Webchat preview, with greeting, message field, and launcher.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 422px; width: fit-content; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/preview-follow-up/en/preview.png" srcset="/images/captures/webchat-widget/preview-follow-up/en/preview.png 2x" width="808" height="1380" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Complete Example Store Webchat preview, with greeting, message field, and launcher." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Open Webchat in the preview, with a fictional greeting that guides the visitor.</figcaption>
</figure>

Test on desktop and mobile. The launcher should not cover checkout buttons, add-to-cart buttons, support links, cookie banners, or other important site controls.

## Choose behavior carefully

For a first launch, use click-to-open unless you have a clear reason to open automatically.

In **Behavior → Opening**, select **Automatically on page load** to reveal the delay and limits. You can open immediately or after 5, 10, or 30 seconds. Use **First visit only** and **Once per session** where appropriate; the example waits 5 seconds and has both limits selected. Automatic opening can also interrupt browsing.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Automatic opening and first-visit and once-per-session limits.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 528px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/behavior-mobile-en.png 2x" width="720" height="228" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/behavior-en.png" srcset="/images/captures/webchat-widget/behavior-en.png 2x" width="1056" height="774" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Automatic opening and first-visit and once-per-session limits." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The example waits 5 seconds. The mobile focus shows both selected limits.</figcaption>
</figure>

Placement matters. Bottom right is usually familiar to visitors, but use the position that does not conflict with your store layout, mobile navigation, or checkout controls.

## Write the opening sequence

The opening sequence should help visitors choose what to do next.

Keep it short:

- Welcome the visitor.
- Name the main things they can ask.
- Offer one or two useful paths, such as order help, product recommendation, or talking to a person.
- Avoid long policy text in the first message.

Open **Opening sequence** and enter the greeting in the editor. **New message** adds another message to that sequence; delays and schedules are also available. The preview reflects the text you edit. Keep the message specific without promising that webchat can solve everything by itself.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Configuration and preview of the fictional Webchat greeting.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 528px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/opening-mobile-en.png 2x" width="728" height="188" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/opening-en.png" srcset="/images/captures/webchat-widget/opening-en.png 2x" width="1056" height="878" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Configuration and preview of the fictional Webchat greeting." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Desktop shows the editor; the mobile focus shows the greeting in the preview, without sending messages.</figcaption>
</figure>

If an AI playbook or custom agent will answer after the conversation starts, make sure the opening sequence matches that agent's actual scope.

## Use the teaser intentionally

The teaser is the small prompt that invites the visitor to open the chat.

Use it to make the chat feel useful:

- "Need help choosing a size?"
- "Want a product recommendation?"
- "Have a question about your order?"
- "Need help before checkout?"

Avoid teaser copy that feels like a forced popup or a promise your team cannot keep.

In **Teaser**, turn on **Teaser bubble** to show the small prompt. Turn on **Use custom opening sequence** if you want different copy from the opening sequence. Review both messages to avoid repetition.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Teaser bubble enabled with the custom sequence disabled.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 544px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/teaser-mobile-en.png 2x" width="698" height="560" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/teaser-en.png" srcset="/images/captures/webchat-widget/teaser-en.png 2x" width="1088" height="504" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Teaser bubble enabled with the custom sequence disabled." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">With the bubble enabled and no custom text, the teaser uses the opening sequence.</figcaption>
</figure>

When [Subscriber Booster]({% link _captures/subscriber-booster-playbook.md %}) is enabled for Webchat and allows its teaser, it can replace this message with a subscription invitation for an eligible visitor. The incentive depends on its configuration and the profile's purchase history. Turning off only its teaser does not disable the invitation inside the chat.

## Configure channel handoff

In **Channels**, **Display WhatsApp icon** adds access to that channel. **Restrict communication only to WhatsApp** changes the experience to a WhatsApp entry point. Select the appropriate number; the editor also allows you to type a number. The fictional example number is not a connected channel and is not used to send messages.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="WhatsApp icon enabled with a fictional number, without restricting the chat to that channel.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 528px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/channels-mobile-en.png 2x" width="666" height="860" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/channels-en.png" srcset="/images/captures/webchat-widget/channels-en.png 2x" width="1056" height="804" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="WhatsApp icon enabled with a fictional number, without restricting the chat to that channel." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The number is fictional. Showing the icon and restricting the chat are different options.</figcaption>
</figure>

Use WhatsApp continuation when:

- Customers may leave the site before your team replies.
- Your team prefers to continue longer conversations in WhatsApp.
- Mobile visitors are more likely to respond from WhatsApp than from the browser.
- You want the visitor to see a specific WhatsApp number for the business.

Be careful with restricting communication only to WhatsApp. Use that option when webchat should mainly act as a doorway to WhatsApp, not when you want visitors to continue replying on the site.

If conversations should be assigned to a teammate or team, configure the Inbox ownership path and review [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Install and test

Open the editor's **Settings** icon to see installation options. Choose the method that matches your site:

- Automatic installation on VTEX or Fenicio, when the corresponding account is connected.
- Manual installation on a website with Hellotext.js.
- Manual installation on WooCommerce with the Hellotext plugin.

Manual installation shows the code and instructions. On this screen, **I've installed my code** or **Install and activate** enable the playbook and its workflow; use them only after preparing your site. A disabled automatic option indicates that the platform must be connected first. The editor preview lets you review appearance and text without activating the widget.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Webchat installation options and manual Hellotext.js installation description.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 508px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/installation-mobile-en.png 2x" width="788" height="192" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/installation-en.png" srcset="/images/captures/webchat-widget/installation-en.png 2x" width="1016" height="1388" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Webchat installation options and manual Hellotext.js installation description." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Desktop shows the available methods; the mobile focus shows the manual option. The widget was not installed or enabled.</figcaption>
</figure>

Then test the exact website where the widget should appear.

Check:

- The widget loads on the website and pages where you installed it.
- The launcher, teaser, and opening sequence appear correctly.
- Click-to-open or automatic opening behaves as configured.
- Delay, first-visit, and once-per-session settings work as expected.
- Messages arrive in the Inbox.
- Assignment, team ownership, and response rules behave as expected.
- WhatsApp handoff or continuation uses the correct number.
- Any connected AI playbook or custom agent answers only within its scope.
- The widget works on desktop and mobile without covering important site controls.

## What to review after launch

During the first days, review:

- Which pages start the most webchat conversations.
- Whether visitors understand the opening sequence.
- Whether the teaser attracts useful conversations or creates noise.
- Whether conversations are answered quickly enough.
- Whether handoffs go to the right teammate, team, or WhatsApp number.
- Whether AI playbooks answer correctly or hand off when needed.
- Repeated questions that suggest you need [Instant Answers]({% link _journeys/instant-answers-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}), a Custom Agent, better policy content, or better site copy.
- Opt-ins, orders, attributed revenue, response health, and missed replies when relevant.

Tune one part at a time: placement, trigger, delay, teaser, opening sequence, handoff, or the playbook that answers after the conversation starts.

## Related guides

- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Subscriber Booster playbook]({% link _captures/subscriber-booster-playbook.md %})
- [Property Collector playbook]({% link _captures/property-collector-playbook.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [Smart Recommender playbook]({% link _journeys/smart-recommender-playbook.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Instant Answers playbook]({% link _journeys/instant-answers-playbook.md %})
- [Return & Exchange Helper playbook]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %})
