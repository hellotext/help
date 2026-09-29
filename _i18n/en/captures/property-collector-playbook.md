Use this guide when you want Hellotext to collect missing customer profile information through an AI conversation.

Property Collector is an AI capture playbook. It asks for the properties you configure, validates and saves the answers, and avoids asking for values already present on the customer profile.

It can work as a direct capture playbook or step in temporarily when another playbook needs profile data before it can continue.

## What Property Collector does

Property Collector turns profile enrichment into a focused conversation.

It can:

- Collect standard profile information such as name, phone, and email.
- Collect custom customer profile properties configured by the business.
- Ask only for selected properties that are still missing.
- Follow the configured property order.
- Distinguish properties that must be collected from optional properties.
- Clarify ambiguous or invalid answers instead of guessing.
- Normalize values when there is a deterministic rule, including converting local phone numbers to international format with the business calling code.
- Record when a customer declines an optional property.
- Return the conversation to the original playbook after a prerequisite collection is complete.
- Derive or assign the conversation when a person should take over.

Property Collector stays focused on profile data. It is not a general support or sales agent.

## Two ways it can participate

### As a direct capture playbook

Use Property Collector directly when the main purpose of the conversation is to enrich a customer profile.

The playbook follows its configured collection list, asks for missing values, and saves valid answers to the profile. This works well when the business needs a reusable conversational capture for selected properties. To use it this way, configure and enable the standalone Property Collector playbook.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Subscriber Booster and Property Collector cards in the Captures catalog group.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/ai-en-mobile.png" width="760" height="760" />
        <img class="ht-editorial-visual__image" src="/images/captures/capture-overview/ai-en.png" width="1780" height="520" loading="lazy" decoding="async" alt="Subscriber Booster and Property Collector cards in the Captures catalog group." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The catalog shows Property Collector beside Subscriber Booster in a fictional account.</figcaption>
</figure>

### As a prerequisite for another playbook

Other AI playbooks can include a Property Collector subcomponent with the profile data they need.

When the source playbook detects that one or more configured properties are missing, it uses that subcomponent internally. Property Collector asks only for that active set of missing properties.

For that prerequisite collection to run, the business must also have the Property Collector playbook enabled: its agent handles the temporary conversation. The subcomponent belongs to the source playbook and keeps its own property selection; it does not use the standalone playbook's configured list.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Subscriber Booster notice requiring Property Collector to be enabled before configuring its properties.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/prerequisite-en-mobile.png" width="780" height="1160" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/prerequisite-en.png" width="1150" height="1160" loading="lazy" decoding="async" alt="Subscriber Booster shows the enable Property Collector notice and disables its property selection." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">This prerequisite appears in a fictional Subscriber Booster playbook before Property Collector is enabled.</figcaption>
</figure>

The original playbook remains responsible for the customer's task. Once the required collection is resolved, the conversation returns to that playbook instead of permanently changing ownership.

[Subscriber Booster]({% link _captures/subscriber-booster-playbook.md %}) uses this model to choose which profile properties to collect together with subscription consent.

## Choose properties intentionally

Collect only data that has a clear use in customer experience, segmentation, personalization, support, or another playbook.

Available choices can include:

- Name.
- Phone and email properties.
- Business-defined customer profile properties such as company, gender, numbers, short text, or long text.

Property Collector does not need to ask for a configured value that is already present on the customer profile.

Use clear property names. A customer should understand what the AI is requesting without seeing internal database or CRM terminology.

## Required and optional properties

Each selected property can be marked as required or optional.

When a customer declines an optional property, Property Collector records that decision for the active collection and can continue without asking for the same optional item repeatedly.

In most playbooks, Property Collector limits how many times it asks for a required property. If the customer still provides no usable value after those attempts, it records that the value was not collected and follows the applicable continuation or derivation path. Subscriber Booster handles its required properties differently. Mark a property as required only when the originating task genuinely cannot continue without it.

Too many required fields make a conversational capture feel like a form with no exit. Keep the required set small.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional editor with Name marked important and Email optional in the property collection list.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/fields-en-mobile.png" width="780" height="760" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/fields-en.png" width="1150" height="760" loading="lazy" decoding="async" alt="Fictional editor with Name marked important and Email optional in the property collection list." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Unsaved list: Name is marked important and Email remains optional.</figcaption>
</figure>

## What it needs before direct use

Before enabling Property Collector as a standalone playbook, confirm:

- The profile properties already exist in Hellotext and have useful customer-facing names.
- You know which properties are required and which are optional.
- The selected incoming channels are connected.
- The business country and calling code are correct if phone numbers will be collected.
- Assignment or derivation has an appropriate teammate or team.
- Any playbook that uses Property Collector as a prerequisite explains why it needs the information.
- Property Collector is enabled if another playbook needs its agent for prerequisite collection.

## What you can configure

Open **Playbooks**, click **Explore playbooks**, find the **Captures** group, and choose **Property Collector**.

Property Collector exposes:

- **Properties:** the ordered profile fields the playbook can request.
- **Must collect:** whether each selected property is required for the active collection.
- **Incoming channels:** where the playbook can respond to customer messages.
- **Tone:** the voice used while requesting information.
- **Assignment or derivation:** who should take over when collection cannot continue automatically.

Other compatible playbooks can expose a Property Collector subcomponent with their own prerequisite property list. The source playbook owns that list, but execution requires Property Collector to be enabled.

### Editor controls

The following views show unsaved configuration states for a fictional playbook:

Under **Incoming channels**, choose all available channels or make a manual selection.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Incoming-channel control with all channels selected and a manual-selection option.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-en-mobile.png" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-en.png" width="1150" height="1180" loading="lazy" decoding="async" alt="Incoming-channel control with all channels selected and a manual-selection option." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Use all incoming channels or select the channels manually. Unsaved example.</figcaption>
</figure>

Under **Tone**, select up to three options to shape how the agent asks for information.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tone control with Friendly, Playful, and Exclusive selected.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-en-mobile.png" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-en.png" width="1150" height="1030" loading="lazy" decoding="async" alt="Tone control with Friendly, Playful, and Exclusive selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">The editor supports up to three tones; these are an unsaved fictional selection.</figcaption>
</figure>

Under **Escalation**, enable the handoff and choose a teammate or team who can step in.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Escalation control enabled with the fictional Atención demo team selected.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-en.png" width="1150" height="660" loading="lazy" decoding="async" alt="Escalation control enabled with the fictional Atención demo team selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Escalation can route to a team; this unsaved example uses the fictional Atención demo team.</figcaption>
</figure>

## How the AI handles answers

Property Collector should save only information the customer actually provides.

It can ask a concise clarification when:

- A value is ambiguous.
- A phone number or another structured value is incomplete.
- The answer does not match the property being requested.

It should not invent, infer, or fabricate profile data. When a deterministic normalization rule exists, it can apply that rule before saving the value.

If the customer changes the subject during a prerequisite collection, the conversation can return to the source task or follow the configured derivation path instead of letting Property Collector answer outside its scope.

## How to test it

Use the Playground and test customer profiles before enabling the playbook broadly.

Test:

- A profile missing every configured property.
- A profile that already contains some of the selected properties.
- A valid answer for each property type.
- An ambiguous value that should produce a clarification.
- A local phone number that should be normalized with the business calling code.
- A customer who declines an optional property.
- A required property the customer does not provide.
- A prerequisite collection started by Subscriber Booster or another compatible playbook.
- The return to the original task after collection finishes.
- Assignment or derivation when the playbook cannot complete the collection.

Verify that Playground events and the resulting customer profile match the answers given during the test.

## What to review after launch

Review:

- Whether the playbook asks only for properties that are actually missing.
- Whether customers understand each property request.
- Whether saved values use the correct profile property.
- Whether optional declines are respected.
- Whether required properties are truly necessary.
- Whether phone numbers and other structured values are normalized correctly.
- Whether prerequisite collection returns customers to the original playbook.
- Whether derivations reach the correct teammate or team.

If customers abandon collection often, reduce the number of properties, improve their labels, or reconsider which fields must be collected.

## Related guides

- [Subscriber Booster playbook]({% link _captures/subscriber-booster-playbook.md %})
- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Audience and segmentation overview]({% link _audience/audience-overview.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})
- [How to enable a playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [How to customize a playbook safely]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [AI handoff to Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook library by mission]({% link _journeys/playbook-library-by-mission.md %})
