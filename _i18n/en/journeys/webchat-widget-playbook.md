Use this guide when you want visitors to start a conversation from your website.

Webchat Widget is an on-site conversational entry point. In Hellotext, it is configured as a playbook and capture: you control how it appears, when it opens, what it says first, and whether visitors can continue through another channel such as WhatsApp.

It is not the AI agent itself. Think of it as the front door on your site. After a visitor starts a conversation, your team, Inbox rules, AI playbooks, or custom agents can handle the next step depending on your setup.

## What Webchat Widget does

Webchat Widget lets customers message your business directly from your site.

It can:

- Show a launcher on selected website pages.
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
- Hellotext.js, automatic Shopify or VTEX installation, or the WooCommerce plugin path is ready for your site.
- Allowed domains include the site where the widget should load, if your account restricts webchat, popups, and forms by domain.
- The team knows who owns new webchat conversations in the Inbox.
- The opening message explains what the visitor can ask.
- Handoff to WhatsApp is configured if you want visitors to continue there.
- Any AI playbook or custom agent that should answer webchat conversations is ready.
- Response rules and business hours match the level of service you want for webchat.

For setup validation, use [Verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}).

## What you can configure

Open **Playbooks**, click **Explore playbooks**, and choose **Webchat Widget**.

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

Test on desktop and mobile. The launcher should not cover checkout buttons, add-to-cart buttons, support links, cookie banners, or other important site controls.

## Choose behavior carefully

For a first launch, use click-to-open unless you have a clear reason to open automatically.

Automatic opening can increase visibility, but it can also interrupt browsing. If you use it, choose a short delay and consider first-visit or once-per-session limits so the widget does not repeatedly open for the same visitor.

Placement matters. Bottom right is usually familiar to visitors, but use the position that does not conflict with your store layout, mobile navigation, or checkout controls.

## Write the opening sequence

The opening sequence should help visitors choose what to do next.

Keep it short:

- Welcome the visitor.
- Name the main things they can ask.
- Offer one or two useful paths, such as order help, product recommendation, or talking to a person.
- Avoid long policy text in the first message.

Good opening messages are specific enough to guide the visitor without pretending the webchat can solve everything by itself.

If an AI playbook or custom agent will answer after the conversation starts, make sure the opening sequence matches that agent's actual scope.

## Use the teaser intentionally

The teaser is the small prompt that invites the visitor to open the chat.

Use it to make the chat feel useful:

- "Need help choosing a size?"
- "Want a product recommendation?"
- "Have a question about your order?"
- "Need help before checkout?"

Avoid teaser copy that feels like a forced popup or a promise your team cannot keep.

If you use a custom teaser sequence, test the full path from teaser to opening message so the copy does not repeat itself.

## Configure channel handoff

Webchat can hand off or continue the conversation through another channel, commonly WhatsApp.

Use WhatsApp continuation when:

- Customers may leave the site before your team replies.
- Your team prefers to continue longer conversations in WhatsApp.
- Mobile visitors are more likely to respond from WhatsApp than from the browser.
- You want the visitor to see a specific WhatsApp number for the business.

Be careful with restricting communication only to WhatsApp. Use that option when webchat should mainly act as a doorway to WhatsApp, not when you want visitors to continue replying on the site.

If conversations should be assigned to a teammate or team, configure the Inbox ownership path and review [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Install and test

Use the installation option that matches your site:

- Automatic installation on Shopify.
- Automatic installation on VTEX.
- Manual installation on a website with Hellotext.js.
- Manual installation on WooCommerce with the Hellotext plugin.

Then test the exact website where the widget should appear.

Check:

- The widget loads only on allowed domains and expected pages.
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
