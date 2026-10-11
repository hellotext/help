Use a journey when you want a step-by-step customer flow with a clear trigger, waits, messages, conditions, branches, and handoffs.

A journey is one type of playbook. Not every playbook is a journey.

Some playbooks are more autonomous: for example, [Smart Recommender]({% link _journeys/smart-recommender-playbook.md %}), [Order-Update Delight]({% link _journeys/order-update-playbook.md %}), [Return & Exchange Helper]({% link _journeys/return-and-exchange-helper-playbook.md %}), [Order Cancellation Assistant]({% link _journeys/order-cancellation-assistant-playbook.md %}), or [Instant Answers]({% link _journeys/instant-answers-playbook.md %}) can read signals, understand intent, and decide what to do in the conversation. Those playbooks may use AI agents or decision logic instead of a fixed route.

## When to use a journey

Use a journey when the sequence should be predictable and you want to control the path.

Good journey use cases include:

- Welcoming a new subscriber.
- Running a simple abandoned cart route.
- Sending a post-purchase follow-up.
- Waiting a specific amount of time before a second message.
- Branching based on whether the customer clicked, replied, purchased, or matched a condition.
- Handing off to a person after a specific step.

An abandoned cart can exist in more than one form: [Cart Saver route]({% link _journeys/cart-saver-route.md %}) with fixed steps, or an AI playbook that decides more dynamically based on signals and customer context.

<!-- journeys-entry:catalog-route-vs-agent:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="catalog-route-vs-agent" aria-label="Distinguish the two cart options">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/catalog-route-vs-agent-en-mobile-compact-v2.png 4x" width="1560" height="1632" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/catalog-route-vs-agent-en-desktop-compact.png" srcset="/images/editorial/journeys-workflow-20261010/catalog-route-vs-agent-en-desktop-compact.png 4x" width="3264" height="1120" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Hellotext catalog showing the Cart Saver and AI Cart Saver cards." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The two catalog cards distinguish the cart journey from the AI playbook.</figcaption>
</figure>
<!-- journeys-entry:catalog-route-vs-agent:end -->

Keep reading: [Cart Saver route]({% link _journeys/cart-saver-route.md %}) and [Abandoned cart: route template vs AI playbook]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## When to use another playbook type

Use a more autonomous playbook or AI agent when the experience needs to decide in real time.

Examples include:

- Recommending products from a catalog.
- Answering frequent questions with [Instant Answers]({% link _journeys/instant-answers-playbook.md %}).
- Guiding order tracking, cancellation, return, or exchange support with the right post-purchase playbook.
- Understanding a customer's message and choosing the next response.
- Deciding which offer, product, channel, or timing is best for each customer.
- Coordinating with other playbooks so customers are not overloaded.

Keep reading: [Playbooks and automation overview]({% link _journeys/playbooks-overview.md %}).

## How journeys work

A journey starts when a customer matches a trigger. That trigger can come from a capture tool, your store integration, a campaign, a custom event, or a conversation.

After the trigger, Hellotext moves the customer through the route you defined. The journey can send a message, wait for a period of time, check a condition, branch, apply a coupon, or route the conversation to a person.

The important difference is that the route is designed by you. Hellotext follows the route and its conditions; it is not the same as an autonomous playbook deciding the full mission on its own.

## Start from a journey template

Use a journey template when you want to launch a proven step-by-step flow quickly.

To create one, go to the automation area in Hellotext, choose a journey template, review the trigger and steps, and adjust the copy, timing, channel, conditions, and handoff rules before publishing.

<!-- journeys-workflow:template-cart-selected:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="template-cart-selected" aria-label="Initial fragment of a journey template">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 818px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/template-cart-selected-en-mobile.png 4x" width="1560" height="2200" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/template-cart-selected-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/template-cart-selected-en-desktop.png 4x" width="3200" height="2440" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Initial fragment of a template in the journey editor, with the beginning connected to a 2-hour wait step." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Beginning of the Cart Saver #1 template, with a two-hour wait connected to the start of the journey.</figcaption>
</figure>
<!-- journeys-workflow:template-cart-selected:end -->

If no template fits what you need, create a [custom journey]({% link _journeys/custom-journey.md %}).

<!-- journeys-entry:catalog-builder-choice:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="catalog-builder-choice" aria-label="Locate Journey Builder">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/catalog-builder-choice-en-mobile-compact.png 4x" width="1560" height="1632" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/catalog-builder-choice-en-desktop-compact.png" srcset="/images/editorial/journeys-workflow-20261010/catalog-builder-choice-en-desktop-compact.png 4x" width="3264" height="1120" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Hellotext catalog showing the Journey Builder and Custom Agent options." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Journey Builder is the entry point for designing a custom journey.</figcaption>
</figure>
<!-- journeys-entry:catalog-builder-choice:end -->

## Review before publishing

Before you publish, check that:

- The trigger matches the behavior you want to react to.
- The route steps happen in the order you expect.
- Wait times are reasonable for the customer.
- The channel is connected and ready.
- The audience and consent rules are correct.
- Messages sound like your brand.
- Links, coupons, and personalization tags work.
- Any handoff to a human team is clear.

Click **Save changes** while you work (**Save** on mobile). Saving a new journey without publishing creates a draft. Saving changes to an active journey does not make it inactive.

<!-- journeys-workflow:custom-saved-draft:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-saved-draft" aria-label="Fictional journey saved as a draft">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 432px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-saved-draft-en-mobile.png 4x" width="1560" height="1028" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-saved-draft-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-saved-draft-en-desktop.png 4x" width="1656" height="952" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Journey list with Draft selected and the saved fictional journey with the Viewed a product trigger." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The saved fictional journey appears under Draft.</figcaption>
</figure>
<!-- journeys-workflow:custom-saved-draft:end -->

When you are ready, click **Publish**.

<!-- journeys-workflow:custom-active:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-active" aria-label="Published fictional journey in Active">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 432px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-active-en-mobile.png 4x" width="1560" height="1028" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-active-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-active-en-desktop.png 4x" width="1656" height="952" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Journey list with Active selected and the fictional journey with its Viewed a product trigger." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The fictional journey appears under Active after publishing.</figcaption>
</figure>
<!-- journeys-workflow:custom-active:end -->

To make an active journey inactive, click **Make inactive**.

<!-- journeys-workflow:custom-inactive:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-inactive" aria-label="Fictional journey in Inactive">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 432px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-inactive-en-mobile.png 4x" width="1560" height="1028" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-inactive-en-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-inactive-en-desktop.png 4x" width="1656" height="952" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Journey list with Inactive selected and the fictional journey with its Viewed a product trigger." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The same fictional journey appears under Inactive after choosing Make inactive.</figcaption>
</figure>
<!-- journeys-workflow:custom-inactive:end -->

## Next steps

If your flow needs an AI agent, review [how to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).
