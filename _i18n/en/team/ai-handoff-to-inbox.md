Use handoff to move responsibility for a conversation to a teammate or team when the customer needs human help. Check both ownership and conversation state: receiving, assigning, and opening a conversation are separate actions.

Handoff can happen from a playbook, a journey, an AI agent step, or a custom agent. The important part is to decide where ownership should move when automation cannot resolve the conversation safely.

## How handoff works

Four common configurations participate in that path. Availability depends on the playbook, flow, and account; a prompt instruction does not enable a disabled escalation tool by itself.

### Playbook escalation

Sales, support, and custom playbooks can include an **Escalation** setting. Use it to choose who should step in when the agent needs help, such as a teammate or a team.

Enable the control that allows escalation and check its recipient. Use it when the agent can handle most requests but needs to pass a case to a person. Handoff may put AI into silent or Copilot mode depending on the flow; it does not guarantee that every automation stops permanently.

The figure reuses the Property Collector form: **Atención demo** is a fictional team selected in an unsaved draft. It identifies the control and destination, not a handed-off conversation. Other playbooks may offer different options.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Escalation enabled with fictional team Atención demo selected in an unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-en-mobile.png 2x" width="780" height="680" />
        <img src="/images/captures/property-collector/handoff-en.png" srcset="/images/captures/property-collector/handoff-en.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="660" loading="lazy" decoding="async" alt="Escalation enabled with fictional team Atención demo selected in an unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Escalation enabled with fictional team Atención demo selected in an unsaved draft.</figcaption>
</figure>

### Journey assignment step

Journeys can use an **Assignment** step. Its menu offers **Open conversation**, **Close conversation**, **Assign conversation**, **Add tag**, and **Remove tag**. Adding a tag does not assign an owner.

The figure shows the complete menu of a new unsaved step, with no action chosen and no conversation changed.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Assignment step menu with all five actions and Save changes disabled.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-en-mobile.png 2x" width="778" height="1300" />
        <img src="/images/team/ai-handoff-to-inbox/assignment-en.png" srcset="/images/team/ai-handoff-to-inbox/assignment-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="1300" loading="lazy" decoding="async" alt="Assignment step menu with all five actions and Save changes disabled." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Assignment step menu with all five actions and Save changes disabled.</figcaption>
</figure>

Use this step when handoff should happen at a specific point in a route, such as after a condition, a customer answer, or a branch that identifies a sensitive or high-value case. Select the action, then an existing teammate or team.

In this second draft, **Assign conversation to Lucía** identifies a fictional teammate. Neither the step nor journey was saved; no conversation was assigned.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Assign conversation to Lucía action in a fictional unsaved step.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/target-en-mobile.png 2x" width="778" height="840" />
        <img src="/images/team/ai-handoff-to-inbox/target-en.png" srcset="/images/team/ai-handoff-to-inbox/target-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="840" loading="lazy" decoding="async" alt="Assign conversation to Lucía action in a fictional unsaved step." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Assign conversation to Lucía action in a fictional unsaved step.</figcaption>
</figure>

**Assigning does not necessarily open the conversation.** An existing closed conversation can stay closed; if the step needs to create one for assignment, it creates a private, closed conversation. When the process needs attention in the open Inbox, also configure opening and check action order. A close action may be skipped if a teammate replied since the step began waiting; that does not automatically cancel the other actions or steps.

### AI agent step in a journey

If available for your account, a journey can include an **AI agent** step. **View playbooks** lets you select an active playbook; **AI Routing** can choose among active playbooks that admit that context, channel, and audience. It does not make every saved playbook a candidate.

Check whether the agent should send the first message or wait for the customer, and how long it should wait without a reply. The pictured draft has no playbook selected, keeps **Send the first message**, and shows a **6-hour** wait. It was not saved and did not generate or send a message; six hours is not the team’s response commitment or the channel’s window.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="AI agent with no playbook selected, starting options and six-hour wait; unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/agent-settings-en-mobile.png 2x" width="778" height="1500" />
        <img src="/images/team/ai-handoff-to-inbox/agent-settings-en.png" srcset="/images/team/ai-handoff-to-inbox/agent-settings-en.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="1500" loading="lazy" decoding="async" alt="AI agent with no playbook selected, starting options and six-hour wait; unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">AI agent with no playbook selected, starting options and six-hour wait; unsaved draft.</figcaption>
</figure>

When no active playbooks are available, the chooser shows this notice. The focused crop retains the real form’s text and **Explore Playbooks** button. No playbook was activated to populate the list.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Chooser notice: no active playbooks are available, with Explore Playbooks button.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 457px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/agent-empty-en-mobile.png 2x" width="650" height="252" />
        <img src="/images/team/ai-handoff-to-inbox/agent-empty-en.png" srcset="/images/team/ai-handoff-to-inbox/agent-empty-en.png 2x" style="width: auto; margin: 0 auto;" width="878" height="252" loading="lazy" decoding="async" alt="Chooser notice: no active playbooks are available, with Explore Playbooks button." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Chooser notice: no active playbooks are available, with Explore Playbooks button.</figcaption>
</figure>

The step has solved and unresolved outcomes. No reply or no admissible playbook can also lead to unresolved. That outcome does not hand off by itself: connect an Assignment step with the required owner and service state. Check both branches and how the journey continues or ends.

### Custom playbooks and intents

Custom playbooks can define **Intents**: phrases describing the needs they should handle. Hellotext classifies the message with its context and eligible playbooks; this is not an exact keyword matching rule.

The figure shows **I want to ask about a return.** entered into a new agent’s field. It is a fictional phrase that was neither added nor saved: **New intent** was not pressed, and the agent was not activated or run.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Intents field with fictional phrase I want to ask about a return, not added or saved.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 646px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-en-mobile.png 2x" width="764" height="544" />
        <img src="/images/team/ai-handoff-to-inbox/intents-en.png" srcset="/images/team/ai-handoff-to-inbox/intents-en.png 2x" style="width: auto; margin: 0 auto;" width="1256" height="520" loading="lazy" decoding="async" alt="Intents field with fictional phrase I want to ask about a return, not added or saved." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Intents field with fictional phrase I want to ask about a return, not added or saved.</figcaption>
</figure>

This lets you create multiple [custom agents]({% link _journeys/custom-agent-playbook.md %}) for different jobs. For example, one agent can handle product recommendations, another can answer support questions, and [Order-Update Delight]({% link _journeys/order-update-playbook.md %}) can manage order-status requests. Each agent can resolve the conversation, route it to another playbook through Supervisor routing, or escalate it to the configured teammate or team.

## When Hellotext should escalate

Define escalation rules before you launch a playbook or journey.

Common escalation moments include:

- The customer asks to speak with a person.
- The customer is angry, frustrated, or dissatisfied.
- The customer reports a defective, damaged, wrong, or missing product.
- The request is outside the current playbook's purpose.
- The AI is uncertain or cannot verify the answer.
- The customer asks about refunds, exchanges, cancellations, payment, account access, or a special exception.
- The customer is ready to buy but needs a human sales action.
- Hellotext cannot find another active playbook that should handle the request.
- The same issue repeats and the conversation is not progressing.

If a wrong answer would create operational, legal, financial, or brand risk, escalate instead of continuing automatically.

## What to configure before launch

Before customers reach the workflow, check the handoff path that applies to your setup.

For playbooks:

- Enable escalation and choose a teammate or team with Inbox access.
- Confirm the agent prompt explains when it should escalate.
- Confirm what it can say before handoff and what happens if assignment fails. A team at capacity can leave the case pending in that team without an individual owner; it is not automatically redistributed to another team. Having no assignable team members is a different failure.
- If no destination is selected, review automatic selection and the case where no teammate is available: the conversation can remain unassigned while waiting for someone to come online. Do not assume a guaranteed fallback owner.
- Check presence, capacity, schedules, and the process outside working hours. Assignment does not confirm that someone read the case, and schedules do not apply identically to every flow.

For journeys:

- Add an Assignment step wherever the route should assign the conversation.
- Choose each action and its order; confirm that a case needing attention is open as well as assigned.
- If an AI agent step has an unresolved branch, connect it to an Assignment step and check admission, starting, and waiting conditions.

For [custom agents]({% link _journeys/custom-agent-playbook.md %}):

- Define the intents that should activate each agent.
- Choose the incoming channels where the agent should respond.
- Configure escalation for the person or team that should step in.
- Test what happens when no active playbook can resolve the request.

Keep reading: [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %}).

## What the Inbox should show

When a conversation reaches the Inbox, the teammate should understand what happened without rereading everything from the beginning.

A useful handoff should make these things clear:

- Why the conversation was handed off.
- Which playbook, intent, journey, or AI step handled it first.
- What the customer wants.
- What the agent already said or did.
- Which product, cart, order, policy, or customer profile detail matters.
- Whether the customer is waiting for support, sales help, or operational follow-up.
- Who owns the next reply.
- Whether the situation is urgent.

This list is a recommended review; those details are not all available automatically or immediately. History or a summary may update in the background. Check the correct object and customer before treating an order, cart, or profile detail as the case’s context.

The more specific the verified context, the easier it is to reply naturally. Opening, closing, or assigning in the Inbox does not reset the WhatsApp reply window. Check channel rules in [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %}).

## Test the handoff path

Before going live, test each handoff path you depend on.

Use an isolated environment with data and recipients authorized for the test. A draft figure does not demonstrate an executed handoff. Before launch, confirm with evidence from the actual flow that:

1. A playbook escalates to the expected teammate or team.
2. A journey Assignment step assigns, opens, closes, or tags the conversation correctly.
3. An AI agent step sends unresolved conversations to the right Assignment step.
4. Custom intents activate the expected agent.
5. AI Routing chooses an appropriate active playbook.
6. A request with no admissible active playbook follows the intended path; also check no available teammates and a team at capacity, including cases left pending or unassigned.
7. The teammate has enough context to answer without asking the customer to repeat everything.

If the teammate has to guess why the conversation arrived, improve the escalation rule, prompt, intent, or assignment path before launch.

## What teammates should do after handoff

When a teammate takes over:

- Read the latest customer message and automation context.
- Check the customer profile, order, cart, or product information before replying.
- Avoid repeating questions the agent already asked.
- Be clear that a person is now helping.
- Assign or reassign the conversation if ownership is wrong.
- Close the conversation when no further action is needed and check configured follow-ups. Closing in the Inbox does not mean AI resolved the case or cancel all pending jobs; an enabled satisfaction playbook may depend on closure when its conditions are met.

Team participation does not automatically remove attribution. Its effect depends on the attribution path and available evidence. Campaign evidence can remain eligible when a teammate participates; a teammate-owned non-campaign checkout can block attribution; and Product Recommender uses its own commercial-driver evaluation. Other playbooks and routes do not automatically use that same evaluation.

Keep reading: [Sales attribution]({% link _analytics-reporting-attribution/sales-attribution.md %}).

## Review handoff quality

After launch, review handoffs regularly.

Look for:

- Conversations that were escalated too late.
- Conversations that were escalated too early.
- Intents that activate the wrong agent.
- AI Routing choosing the wrong playbook.
- Missing or unclear escalation owners.
- Customers repeating information.
- Unassigned cases, cases pending in a team, or closed conversations that should be open, waiting too long.
- Similar questions that could become better prompts, uploaded documents, intents, or route branches.

Use what you learn to tune the prompt, intents, playbook rules, journey branches, team ownership, or response process.

## Related guides

- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Assign conversations]({% link _team/assigning-conversations.md %})
- [Teams and Inbox capacity]({% link _team/teams-and-inbox-capacity.md %})
- [Response times and response rules]({% link _team/understanding-response-times.md %})
- [How Hellotext works]({% link _getting-started/how-hellotext-works.md %})
- [Order-Update Delight playbook]({% link _journeys/order-update-playbook.md %})
- [Review Builder playbook]({% link _journeys/review-builder-playbook.md %})
- [CSAT Pulse playbook]({% link _journeys/csat-pulse-playbook.md %})
- [NPS Pulse playbook]({% link _journeys/nps-pulse-playbook.md %})
- [Order Cancellation Assistant playbook]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Custom Agent playbook]({% link _journeys/custom-agent-playbook.md %})
- [How to write a great agent prompt]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Go-live checklist before you send]({% link _getting-started/go-live-checklist.md %})
