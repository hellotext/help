In Hellotext, every AI Agent begins with a single, simple ingredient: its prompt.

The prompt defines the agent’s personality, tone, purpose, and limits.

It is what transforms an abstract automation into a real brand voice — one that can sell, assist, or delight customers as if it were a person on your team.

Writing a great prompt is less about technical detail and more about clarity and intent. The better you define who the agent is, how it should speak, and what it must never do, the more consistently it will represent your brand.


In this article:

- **[What agents can do by default](#what-agents-can-do-by-default)**
- **[The anatomy of a good prompt](#the-anatomy-of-a-good-prompt)**
  - **[Identity](#identity)**
  - **[Tone](#tone)**
  - **[Context](#context)**
  - **[Behavior and boundaries](#behavior-and-boundaries)**
- **[Enriching the prompt with knowledge and rules](#enriching-the-prompt-with-knowledge-and-rules)**
- **[A Model prompt example](#a-model-prompt-example)**
- **[Best practices](#best-practices)**
- **[How Hellotext uses your prompt](#how-hellotext-uses-your-prompt)**
- **[Final reflection](#final-reflection)**

## What agents can do by default

<img src="images/journeys/en/ai-agent-prompt.jpg" alt="" width="768" />

Every agent in Hellotext can perform a wide range of actions automatically. It can read your product catalog and inventory in real time, recommend products, check stock, and guide customers through decisions.

It can also search across URLs or documents you attach—such as a FAQ, policy guide, or product manual—so that it always answers from verified information rather than guessing.

Agents can collect and store any customer profile properties you choose, from name and city to preferred size or interests. They can also decide when to escalate a conversation to a human, following rules you define in the Journey Editor.

And, most importantly, every message they send passes through Hellotext’s privacy and tone guardrails, ensuring consistent brand voice and compliance across all channels.

## The anatomy of a good prompt

A strong prompt has four main parts: identity, tone, context, and behavior.

### Identity

Begin by describing who the agent is and what role it plays for your brand. Give it a name if you wish. Make it sound like a person the customer would naturally trust.

> Example:
> 
> You are **Astra**, the digital stylist of the brand *Lumina Atelier*. Your role is to welcome every visitor warmly, help them find the right pieces for their style and mood, and answer questions with precision and grace.

This opening tells the system how to embody the brand. It’s short, human, and specific.

### Tone

Define how the agent should sound. Choose the voice that reflects your brand culture — calm and elegant, youthful and friendly, professional and precise.

Describe it in full sentences, not bullet points. For example:

> “Astra speaks in a confident and thoughtful tone. She writes in clear, concise sentences, with a friendly rhythm. She never oversells or pressures. Her language feels warm and intelligent, as if she were a trusted in-store advisor.”

Tone is one of the most powerful elements of a prompt. It determines whether your customers feel cared for or managed by a machine.

### Context

Here, give the agent the brand and product background it needs to understand the world it speaks from. Include your brand values, materials, and any factual information that shapes the way it answers.

> Lumina Atelier is a contemporary womenswear label that designs modular, timeless garments made from organic cotton and soft viscose blends. Each piece is designed in Lisbon and produced locally. Comfort, durability, and quiet elegance define the brand.

This information gives the agent a reference point to ground its recommendations and ensure it never invents details.

### Behavior and boundaries

End by stating what the agent can and cannot do. Think of this as its code of conduct.

Include when to ask for more information, when to stop, and when to escalate to a human.

> Astra should always greet the visitor by name if available, and ask one question at a time to understand the occasion or preference.
> 
> She can recommend up to three products per message, each with a clear reason and link.
> 
> She should never make assumptions about stock, delivery times, or pricing.
> 
> If a question requires confirmation from the team—for example, regarding international shipping or custom orders—she must not invent an answer. Instead, she should explain that a specialist will confirm and ask for contact details to follow up.

This structure gives the agent enough freedom to sound natural, but enough discipline to stay reliable.

## Enriching the prompt with knowledge and rules

Once the tone and behavior are set, you can enrich the agent’s abilities by connecting it to your existing knowledge.

Attach any relevant documents, such as product guides, policies, or manuals. The agent will use these as authoritative sources.

You can also add URLs, like your brand’s FAQ or “About Us” page, to anchor its answers in up-to-date, verifiable content.

If you want the agent to collect or update profile data during conversations, specify it in the prompt. For example:
“Whenever a customer mentions their city or size, save that information automatically to their profile.”

You can also instruct it on how to handle handoffs:
“If the customer expresses dissatisfaction or mentions a refund, escalate to the human support team ‘Returns Desk’.”

Behind the scenes, the Supervisor routes these intents — whether product recommendation, support question, or profile update — through the appropriate agents defined in your workspace.

## A Model prompt example

Here’s a full, clean example you can adapt for your own brand.

> **Prompt Example – Lumina Atelier**
>
> You are **Astra**, the digital stylist of *Lumina Atelier*, a contemporary womenswear brand that creates modular and timeless pieces for modern women.
> 
> Your mission is to guide each visitor with warmth and clarity, help them discover garments that fit their needs, and respond with precision.
> 
> Speak in a confident, intelligent tone — calm, thoughtful, and elegant — using clear, natural sentences. Avoid slang or exaggeration.
> 
> You can access the full catalog of products and stock information, so you may recommend items that match the client’s preferences.
> 
> You may also consult the following resources: luminaatelier.com, the product FAQ PDF, and the Returns & Shipping Guide.
> If you’re uncertain about any information, never guess. Tell the customer you will confirm with a team member and ask for their name and contact to follow up.
> 
> Automatically collect and save the customer’s name, city, and preferred sizes for future reference.
> 
> Escalate any complex inquiries about stock, wholesale orders, or special collaborations to the human team “Client Care”.

This prompt is simple yet complete: it defines voice, purpose, access, and limits. It’s written in the same natural tone that customers will later experience.

## Best practices

When writing your own prompt, focus on clarity and restraint. A good agent doesn’t need paragraphs of brand philosophy; it needs a compass.

Describe what the agent should care about, not what it should say in every case. Let Hellotext’s AI adapt dynamically based on the conversation and the data it can access.

Keep your language precise. Avoid marketing slogans. Make sure every instruction is actionable.

And remember: the prompt is not static. Review your agents’ conversations from the Inbox, observe how customers respond, and refine the text until the tone feels perfectly aligned with your brand.

## How Hellotext uses your prompt

When a conversation starts, Hellotext’s Supervisor reads the intent behind each message, whether it’s an order inquiry, a product recommendation, or a support question, and routes it to the correct agent.

Each response passes through several services before it reaches the customer:

1. The **Creative Lab** drafts the message based on your tone and content.
2. The **Guardrails** module checks that the text complies with privacy, tone, and brand guidelines.
3. The **Send-Time Optimization (STO)** engine decides the ideal time to deliver it.
4. The **Channel Dispatcher** sends it through the right medium — WhatsApp, SMS, Instagram, or Webchat.

Your prompt is the foundation on which all these systems operate. It defines how intelligence, automation, and brand personality merge into a single, coherent experience.

## Final reflection

Think of your agent prompt as a creative brief for a person you’re about to hire — someone who will speak to thousands of your customers.

Be specific about what they represent, how they speak, and where their knowledge ends.

A few well-chosen paragraphs can define a voice that feels unmistakably yours, working around the clock with warmth, precision, and consistency.