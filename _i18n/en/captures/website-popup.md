Website Popup lets you collect phone numbers, email addresses, and other customer profile information without sending visitors away from your website.

It is a capture playbook, not an agentic playbook or a journey. The popup collects or updates a customer profile. You can then optionally deliver a coupon and connect the capture to a journey that welcomes or follows up with the new subscriber.

Website Popup is being rolled out progressively. If it appears as **On request**, is disabled, or does not appear in the **Captures** group under **Explore playbooks**, confirm availability with your Hellotext team before planning a launch.

## When to use Website Popup

Use Website Popup when you want to:

- Turn anonymous website visitors into subscribers.
- Collect a phone number, email address, or other customer profile properties.
- Present an offer without sending the visitor to another page.
- Use more than one step to keep the first interaction short.
- Adapt the experience for mobile and desktop.
- Start a welcome journey after a visitor subscribes.

Use a [Website Form]({% link _captures/forms.md %}) when the form should live inside the page instead of opening above it. Use a [Shareable Link]({% link _captures/shareable-link.md %}) when the opt-in starts outside your website, such as from social media, an ad, or an email.

## Before you start

Decide what information you truly need at signup. A phone number or email address is usually enough for the first step. Additional fields can use existing customer profile properties, including custom properties created by your business.

Also confirm:

- Which channel the visitor is subscribing to.
- What value or offer the popup communicates.
- Whether a coupon should be delivered after signup.
- Whether a journey should start after the capture is completed.
- Who can install Hellotext on the website if manual installation is required.
- That the consent notice accurately describes the messages the visitor agrees to receive.

For channel eligibility and consent, see [Who you can message]({% link _audience/consent-and-subscriber-status.md %}).

## Create the popup

1. Open **Playbooks** and click **Explore playbooks**.
2. Find the **Captures** group and choose **Website Popup**.
3. Give the popup a name that identifies its placement or purpose.
4. Build the signup steps and the **Completed** state.
5. Review the style, layout, and settings.
6. Save and continue to the optional coupon and journey assignment.
7. Review the available display settings, then install and publish the popup.

The editor shows separate previews for mobile and desktop. Check both views while you work rather than treating the desktop preview as the final version for every visitor.

## Build the signup steps

A popup can use multiple steps. This lets you ask for one important detail first and request more information only after the visitor continues.

For each step, you can:

- Edit the heading, supporting text, button, links, and consent notice.
- Add fields based on standard or custom customer profile properties.
- Change each field label and placeholder.
- Mark fields as required when the flow cannot continue without them.
- Add, remove, rename, and reorder steps.
- Preview how the step looks on mobile and desktop.

Use the **Completed** state to confirm that the signup was received and explain what happens next. Keep this message useful even when no coupon is assigned.

Do not ask for every available property just because it exists. Each additional field adds work for the visitor and can reduce completion. Collect the minimum needed for the first useful follow-up, then enrich the profile later through conversations, purchases, forms, or other signals.

## Write clear popup copy

The visitor should understand the value, requested information, and next action before entering any data.

- Lead with the concrete benefit or reason to subscribe.
- Use supporting text to explain what the visitor will receive, not to repeat the heading.
- Make the button describe the action, such as **Get my discount** or **Notify me**, instead of using a vague label.
- Keep the first step short enough to scan on a phone.
- Keep the consent notice readable and separate from the promotional promise.
- Make the completed state explain whether to check WhatsApp, SMS, or email, continue shopping, or wait for a follow-up.
- Do not create false urgency or promise a coupon, delivery channel, or response time that the configured flow cannot provide.

Read every step as one sequence. A strong first step can still feel confusing if the second step changes the offer, asks for unexpected information, or uses a different call to action.

## Configure style, layout, and opening behavior

The editor separates the popup configuration into three areas:

| Area | What it controls |
| --- | --- |
| **Style** | Typography and the colors used for text, background, button text, and button background. These choices apply across the popup. |
| **Layout** | The arrangement used on desktop and mobile. Each device can use the layout that best fits its screen. |
| **Settings** | Whether the popup opens automatically or first appears as a bubble, the bubble appearance, and whether it displays on mobile, desktop, or both. |

When the popup uses a bubble, visitors see a small floating prompt and open the full popup by selecting it. Configure the bubble text, text color, background color, and alignment so it is noticeable without covering important website controls.

When the popup opens automatically, review any delay control available in your account. Give the page enough time to become useful before interrupting the visitor.

The initial rollout focuses on opening behavior and device targeting. Advanced conditions based on page path, scroll depth, location, or previous popup views are still being developed. Do not plan a launch around those conditions unless they are available and can be saved in your account.

## Assign a coupon and journey

Coupon and journey assignment are optional.

Assign a coupon when the signup promise includes a discount. When coupon delivery is enabled for your account, Hellotext sends the code to the contact method the visitor provided instead of revealing it immediately in the browser. Hellotext can choose the most cost-efficient available channel between WhatsApp and SMS, or use email when no phone number was collected.

The completed state can show the masked destination and delivery channel. It can also let the visitor change the phone number or email address, or request another delivery after the resend wait has passed.

Assign a journey when the new subscriber should enter a welcome or follow-up flow. If the same capture already triggers another journey, review the warning before continuing so the subscriber does not enter duplicate flows.

## Install the popup

The installation step offers the methods available for the connected website:

- **Automatic installation:** use this when Hellotext detects a supported connected Shopify store.
- **Manual installation:** install [Hellotext.js](https://github.com/hellotext/hellotext.js), then add the initialization code generated for this popup to the website.

Use the generated code exactly as shown because it includes the identifiers for your business and popup. If a developer or agency manages the website, send them the complete manual installation instructions from this step.

After installation, publish the popup only after testing the live website. A correct editor preview does not confirm that the storefront script, device behavior, or submission flow is working.

## Test before publishing

Test the complete experience with customer details you can safely use.

Confirm that:

- The popup opens through the configured automatic trigger or bubble.
- It appears on the intended mobile and desktop devices.
- It does not cover navigation, checkout, consent controls, or other essential website actions.
- Every step fits the screen without clipped text or controls.
- Required fields stop incomplete submissions and explain what needs attention.
- Phone numbers, email addresses, and other properties reach the correct customer profile.
- The consent notice matches the channel and message type.
- The completed state explains the next action clearly.
- The assigned coupon reaches the expected destination when coupon delivery is enabled.
- The assigned journey starts once and does not overlap with another welcome flow.
- Closing, reopening, and using the bubble behave as expected.

Repeat the test in a private browser window and on a real phone. This catches installation, session, and responsive-layout problems that the editor preview cannot show.

## If the popup does not appear

Check these items in order:

1. Confirm that the popup was saved, installed, and published.
2. Confirm that Hellotext.js and the popup initialization code load on the page.
3. Check whether the popup is limited to mobile or desktop.
4. Check whether it opens automatically, after a delay, or only through a bubble.
5. Test in a private browser window to avoid a previous session affecting the result.
6. Confirm that any display conditions available in your account match the page being tested.
7. Reopen the installation step and compare the generated code with the code running on the website.

When reporting a problem, include the popup name, tested URL, device, approximate time, opening behavior, and whether the popup failed to appear or failed after submission.

## Related guides

- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Website Forms]({% link _captures/forms.md %})
- [Shareable Links]({% link _captures/shareable-link.md %})
- [Shopify checkout opt-in]({% link _captures/shopify-checkout.md %})
- [Who you can message]({% link _audience/consent-and-subscriber-status.md %})
- [Getting started with journeys]({% link _journeys/getting-started-with-journeys.md %})
- [Connect Shopify]({% link _integrations/connect-shopify.md %})
