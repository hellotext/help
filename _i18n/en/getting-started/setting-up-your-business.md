Use this guide when you are creating a new Hellotext business or reviewing an existing business before launch.

For the complete launch order, start with the [launch checklist]({% link _getting-started/launch-checklist.md %}).

## Before you start

Make sure you know:

- The business name and main country.
- Who should own the Hellotext business.
- Who needs admin access during setup.
- Which commerce platform, marketplace, or custom system should connect first.
- Which messaging channel you plan to use first, usually WhatsApp or SMS.

If you do not have access to Hellotext yet, contact your Hellotext representative or request a demo from the [Hellotext website](https://www.hellotext.com/demo).

## Create or review the business

When you create a business, use a name and username your team will recognize. The country should match where the business mainly operates. Check the conditions for your market: billing country can affect taxes and currency, while channel availability and rates also depend on the destination and provider.

Open **Settings** and check the name and **Business ID** to recognize the selected business. The ID is public; it differs from the login email, the business username in its URL, and a private API token. Here, **Enterprise** is the fictional business name, without confirming its subscription plan.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Recognize the selected business in Settings">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fictional Enterprise business with public Business ID 4ONLdN32 and Edit business control." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data. Enterprise is a business name; this card does not prove the subscription plan.</figcaption>
</figure>

**Edit business** lets you review the name, **Username**, business language, and time zone. Username identifies the business in its URL; it does not change each person's login email. Review the time zone used for schedules and reports, and the business language separately from each account's language.

To review the country, open **Billing**, find **Billing information**, and use the country change control. The screen below shows **Uruguay** and the notice about taxes on future invoices. This reviews billing country; opening the form or selecting an option does not save a change or connect a channel. Confirm its consequences before saving.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Review billing country and its tax notice">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 903px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/country-en-mobile.png 2x" width="812" height="564" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/country-en.png" srcset="/images/billing/billing-settings-and-invoices/country-en.png 2x" width="1770" height="568" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real Change billing country form with Uruguay selected, tax notice, Save changes and Cancel." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Existing fictional interface, form opened without saving. Selecting Uruguay does not prove channel availability.</figcaption>
</figure>

Before you connect integrations or send messages, confirm that:

- The business name is correct.
- The username is easy for your team to identify.
- The business country, language, and time zone are correct.
- The owner account is the right one.
- Admin users who will set up integrations have access.

In **Your Team**, check who is labeled **Owner**. An Administrator role does not make someone the Owner. If the owner account is wrong, fix that before making broader setup changes. Keep reading: [Transfer business ownership]({% link _integrations/transferring-ownership.md %}).

## Confirm billing and plan context

Your plan determines what is included, how usage is counted, and which billing rules apply. In **Billing**, review the plan, period, and usage for the correct business. The amount shown so far can change during the month; it is not a final invoice or the sum of all categories.

This fictional **Grow** example is for September 2026 in Uruguay: a USD 299 monthly minimum, a USD 252 attribution fee on USD 8,400 in sales, USD 12 for SMS, and USD 2 for other messages. The calculation shows the highest of these amounts, USD 299. It helps you recognize the card without setting conditions for another market or contract.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identify the plan and the amount calculated so far">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 750px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/understanding-plan-quotas/plan-en-mobile.png 2x" width="920" height="528" />
        <img class="ht-editorial-visual__image" src="/images/billing/understanding-plan-quotas/plan-en.png" srcset="/images/billing/understanding-plan-quotas/plan-en.png 2x" width="1464" height="504" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real Your plan is Grow card with fictional USD 299 amount so far, Plan, Attribution, SMS and Other messages categories, and Change my plan control." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fictional September 2026 usage in Uruguay: Grow minimum 299, attribution 252, SMS 12 and other messages 2 USD. The highest is 299; it is not a final invoice or the sum of categories.</figcaption>
</figure>

Use the billing guides when you need to understand plan minimums, performance fees, SMS costs, variable messaging fees, or invoices.

Keep reading:

- [Pricing model]({% link _billing/how-pricing-works.md %})
- [Plan usage and quotas]({% link _billing/understanding-plan-quotas.md %})

For current plan pricing and SMS rate tables, always check the public [Hellotext pricing page](https://www.hellotext.com/pricing).

A new prepaid business may have SMS access, but sending requires available destinations and senders, recipient permission, sufficient balance or payment conditions, and current limits. A temporary daily limit may apply while Hellotext reviews sending quality; creating the business does not guarantee immediate sending. Keep reading: [SMS sending limits for new businesses]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

## Connect your data source

Connect the platform where customer, order, product, cart, and purchase activity lives. This helps Hellotext build customer profiles, read signals, personalize messages, and attribute results from the beginning.

Start with the setup overview, then choose the guide that matches your store or marketplace. Confirm that you connect the correct source account and have the necessary permissions. Authorization and synchronization are separate steps: an active connection does not prove all data has been imported. Review a known sample of profiles and orders, their references, source, currency, and dates; a saved order alone does not prove a recorded or attributed purchase.

Keep reading: [Setup and integrations overview]({% link _integrations/setup-overview.md %}).

## Connect your first messaging channel

Before you create captures, playbooks, routes, or campaigns, confirm which channel customers should use to hear from you and reply.

Use the messaging overview to decide what to prepare for SMS, WhatsApp, and sender setup. Check the sender, destinations, unsubscribe mechanism, and response handling. For WhatsApp, review the active approved template version you will use when required. A connected channel or a phone number on a profile does not demonstrate permission for that channel and communication type, or enable every sending flow.

Keep reading: [Messaging channels overview]({% link _numbers/messaging-overview.md %}).

## Invite the right teammates

Invite the people who will configure the business, review reports, answer replies, or manage customers in the Inbox.

Use roles carefully: **Agent** for Inbox support, **Manager** for operations and marketing, and **Administrator** for people who need to maintain sensitive settings. Reserve **Owner** for the person responsible for the business; changing ownership uses the transfer process, not a normal invitation. Your plan also determines whether you can add collaborators: a role does not add features unavailable to your business.

In **Your Team**, open **Invite a team member** and enter their email address. This field shows `operations@example.test` as an unsaved fictional draft; no invitation has been created or sent yet.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Recognize an invitation email before creating it">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 445px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/getting-started/setting-up-your-business/invite-en-mobile.png 2x" width="764" height="196" />
        <img class="ht-editorial-visual__image" src="/images/getting-started/setting-up-your-business/invite-en.png" srcset="/images/getting-started/setting-up-your-business/invite-en.png 2x" width="854" height="196" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Real Email address field with operations@example.test entered without saving." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">First field in the Invite a team member wizard. Unsaved fictional email, without creating an invitation or sending email.</figcaption>
</figure>

Continue the wizard only for an authorized person: review role, teams, and Inbox capacity before sending the invitation. Saving a draft does not grant access; the person must accept the invitation. Role, team membership, and capacity handle permissions, routing, and workload separately.

Keep reading: [Team roles and permissions]({% link _team/understanding-team-roles.md %}).

## Continue with launch

Once access, billing context, data, channels, and teammates are ready, continue with captures, your first audience, and your first playbook or journey. Before activation or a planned send, use the checklist to review permissions, content, audience, and owners. Any sending validation must be authorized and isolated, with your own recipients who have given permission; a draft or acceptance response does not prove delivery.

Keep reading: [Launch checklist]({% link _getting-started/launch-checklist.md %}).
