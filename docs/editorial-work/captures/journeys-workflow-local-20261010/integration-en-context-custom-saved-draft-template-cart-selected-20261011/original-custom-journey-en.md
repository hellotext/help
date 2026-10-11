Use a custom journey when a prebuilt journey playbook does not match the flow you need.

A custom journey gives you an empty canvas. You choose the trigger, add the steps, define the timing, and decide when customers should continue, branch, receive a message, or leave the journey.

## Select a trigger

The trigger is the customer action that starts the journey.

To select it:

1. Open the beginning of the flow.
2. Choose the action that should start the journey.
3. Confirm the trigger.

The trigger can be a standard event, such as a subscription, cart update, product view, purchase, or message. It can also be a custom event if your account tracks one.

<!-- journeys-workflow:custom-trigger-selected:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-trigger-selected" aria-label="Selected journey trigger">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-trigger-selected-en-mobile.png 4x" width="1560" height="3376" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-trigger-selected-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-trigger-selected-en-desktop.png 4x" width="2304" height="3040" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Journey Begins panel with Viewed a product selected and the Confirm and Cancel buttons." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The panel shows Viewed a product selected before clicking Confirm.</figcaption>
</figure>
<!-- journeys-workflow:custom-trigger-selected:end -->

## Add steps

Journeys move in sequence from one step to the next.

To add a step, drag it into the flow where it should happen.

Common step types include:

### Send a message

Use this step to send a message to the customer.

Messages can include short links, tags, coupons, and product information when the trigger includes product context.

<!-- journeys-workflow:custom-message-sms:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-message-sms" aria-label="Example message with SMS selected">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-message-sms-en-mobile.png 4x" width="1560" height="2600" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-message-sms-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-message-sms-en-desktop.png 4x" width="2304" height="2560" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Send a message editor with a fictitious Vista Studio greeting and SMS selected among the channel options." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictitious Vista Studio message with SMS selected.</figcaption>
</figure>
<!-- journeys-workflow:custom-message-sms:end -->

### Condition

Use a condition when the flow should split based on customer data or behavior.

For example, you can send one path to customers who purchased and another path to customers who did not.

The following example uses age as the condition for a branch.

<!-- journeys-workflow:custom-condition-age:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-condition-age" aria-label="Example age condition">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-condition-age-en-mobile.png 4x" width="1560" height="2440" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-condition-age-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-condition-age-en-desktop.png 4x" width="2304" height="2320" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Condition panel with Age, Above and 18, and no additional wait until the condition is met." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Example branch with Age, Above and 18, with no additional wait in the condition.</figcaption>
</figure>
<!-- journeys-workflow:custom-condition-age:end -->

### Wait

Use a wait step to pause the flow before the next action.

For example, you can wait two hours before sending an abandoned cart reminder.

<!-- journeys-workflow:custom-wait-two-hours:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-wait-two-hours" aria-label="Two-hour wait">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-wait-two-hours-en-mobile-compact.png 4x" width="1560" height="1040" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-wait-two-hours-en-desktop-compact.png" srcset="/images/editorial/journeys-workflow-20261010/custom-wait-two-hours-en-desktop-compact.png 4x" width="2304" height="920" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Wait panel with the value 2 and the Hours unit." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Example Wait configuration with an interval of 2 hours.</figcaption>
</figure>
<!-- journeys-workflow:custom-wait-two-hours:end -->

### Human handoff

Configure an assignment step when a person or team should take over the conversation. Assignment does not stop the journey by itself: it continues to the next step. If the flow should end after handoff, review its connection to the end and the end configuration. **Return to AI routing** controls what happens when the journey ends; it does not select a person or team.

This is especially important for support questions, refunds, complex product questions, or unhappy customers.

<!-- journeys-workflow:custom-assignment-sofia:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-assignment-sofia" aria-label="Example assignment to Sofía">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-assignment-sofia-en-mobile.png 4x" width="1560" height="1360" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-assignment-sofia-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-assignment-sofia-en-desktop.png 4x" width="2304" height="1200" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Assignment panel configured to assign the conversation to Sofía, a fictional team member." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Example conversation assignment to Sofía, a fictional team member.</figcaption>
</figure>
<!-- journeys-workflow:custom-assignment-sofia:end -->

The end is configured separately in **Journey Ends**.

<!-- journeys-workflow:custom-end-policy:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-end-policy" aria-label="Journey end configuration">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-end-policy-en-mobile.png 4x" width="1560" height="880" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-end-policy-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-end-policy-en-desktop.png 4x" width="2304" height="860" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Journey Ends panel with Return to AI routing turned off." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">In this example, Return to AI routing is turned off in Journey Ends.</figcaption>
</figure>
<!-- journeys-workflow:custom-end-policy:end -->

## Save and publish

Click **Save changes** while you work (**Save** on mobile). Saving a new journey without publishing creates a draft. Saving changes to an active journey does not make it inactive.

When you are ready, click **Publish**. To make an active journey inactive, click **Make inactive**.
