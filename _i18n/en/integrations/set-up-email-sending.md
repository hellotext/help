Set up an email sender to send messages from Hellotext using an address on your business domain, such as `support@acme.com`.

You will choose the sender name and address, add three records to your domain's DNS settings, and allow time for verification. Once the domain is verified, Hellotext activates the sender's Email channel.

This guide walks through the setup in Hellotext and the changes your domain administrator needs to make. It also explains how to reopen the DNS instructions, add another sender, and handle common setup problems.

<div class="note">
  Email sending is available on the Enterprise plan. You need to be an Owner or Administrator of the Hellotext business to configure the sender.
</div>

## Before you start

Have the following ready:

- **The correct Hellotext business.** Choose the business that will send the emails. A sending domain can belong to only one Hellotext business at a time.
- **An active subscription with Email enabled.** If the Email option is unavailable, check your plan with the business owner or Hellotext support.
- **A verified Hellotext account email.** The email address you use to sign in to Hellotext must be verified before you configure an integration.
- **A domain your business controls.** For example, if you plan to send from `support@acme.com`, you need access to the DNS settings for `acme.com`.
- **Permission to add DNS records.** This may be your own access or help from the person or agency that manages your domain.
- **A sender name and email address.** Choose details that your customers will recognize when a message arrives.

Your DNS provider is the service that manages your domain's DNS records. It may be your domain registrar, a service such as Cloudflare, or a provider used by your website administrator. Buying a domain from one company does not necessarily mean that company still manages its DNS.

If someone else manages the domain, you can complete the sender form yourself and share the three DNS records with them. They can publish the records without signing in to Hellotext.

### What happens to your existing mailbox?

Your current mailbox and email provider can continue operating while Hellotext sends using your business address. The DNS records in this guide authorize email sending; adding them does not import your mailbox, copy your previous emails, or move incoming mail from your current provider.

You do not need to enter your mailbox password for this setup. Hellotext handles registration of the sending domain and displays the DNS records you need.

Keep your existing incoming-mail routing in place. This wizard does not ask you to change your domain's MX records. If you also want new emails sent directly to an existing address such as `support@acme.com` to arrive in the Hellotext Inbox, discuss that inbound setup separately with [Hellotext support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Choose your sender name and address

The sender form contains two fields:

| Field | What to enter | Example |
| --- | --- | --- |
| **Sender name** | The name customers should see alongside the email address. Use your business name, a recognizable team name, or a person's name with the business. | `Acme Support` or `Sofía at Acme` |
| **Sender email** | The full email address you want to send from, using a domain your business controls. | `support@acme.com` |

Enter the complete email address, including the part before `@`. Hellotext derives the sending domain from the address, so there is no separate domain field to fill in.

For example:

| Sender email | Domain Hellotext will ask you to verify |
| --- | --- |
| `support@acme.com` | `acme.com` |
| `sales@acme.com` | `acme.com` |
| `orders@mail.acme.com` | `mail.acme.com` |

Choose the domain deliberately. An address on a subdomain, such as `orders@mail.acme.com`, produces setup instructions for that subdomain. Check the domain shown on the next screen before publishing its records.

A personal address ending in `@gmail.com`, `@outlook.com`, or another provider's shared domain is not suitable for this process: you cannot publish the required records for a domain that provider owns. Use an address on your own business domain.

## 1. Open Email setup

1. Sign in to Hellotext and select the correct business.
2. Open **Settings**.
3. Select **Integrations**.
4. Click **Browse integrations**.
5. In **Communication**, select **Email**.

The first screen is titled **Set up your email sender**.

If Email is visible but unavailable, ask the business owner to check whether the business has Email enabled on its subscription. If you cannot access the setup as a teammate, ask an Owner or Administrator to complete it.

## 2. Add the sender details

1. Enter the **Sender name**.
2. Enter the **Sender email**.
3. Check the spelling of both fields, especially the domain after `@`.
4. Click **Next**.

Hellotext saves the sender and requests the DNS records for its domain. When registration succeeds, the next screen is titled **Verify your sending domain**.

The domain appears in the instructions on that page. Confirm that it matches the address you intended to use. If it is wrong, use **Back** to return to the sender form and correct the address before continuing.

If an error appears on the form, follow the message shown. An invalid address or missing sender name needs to be corrected before you can continue. Domain conflicts and registration errors are covered in the troubleshooting section below.

## 3. Add the three DNS records

The **Verify your sending domain** page displays three DNS records. Each record has a **Type**, **Name**, and **Value**.

These are DKIM records. DKIM helps receiving mail services verify that messages sent using your domain are authorized. Publishing the records is also how the sending service checks your control of the domain.

### Match the fields in Hellotext to your DNS provider

DNS providers use different labels for the same fields. Use this mapping when creating each record:

| In Hellotext | Common label at your DNS provider | What to enter |
| --- | --- | --- |
| **Type** | Type or Record type | Choose **CNAME**. |
| **Name** | Name, Host, or Hostname | Use the record name shown in Hellotext, accounting for whether your provider adds the domain automatically. |
| **Value** | Value, Target, Destination, or Points to | Copy the complete value shown for that same record. |

Create each record separately. Keep the name and value from the same record together; do not combine the three values into one entry.

### Publish the records

1. Open your DNS provider in another browser tab and sign in.
2. Select the domain whose DNS records you need to manage.
3. Open its DNS records section.
4. Add a new record and choose **CNAME**.
5. Copy the **Name** from the first Hellotext record into the provider's name or host field.
6. Copy the matching **Value** into the provider's target or value field.
7. If a TTL field is required, use the provider's default or automatic setting unless your domain administrator has specified another value.
8. Save the record.
9. Repeat the process for the second and third Hellotext records.
10. Review the saved entries and confirm that all three names point to their corresponding values.

Copy the values from your own Hellotext setup page. An example from another guide, another business, or a previous setup may not match the records required for this sender.

### Check whether your provider adds the domain automatically

Some providers expect a full record name; others append the domain to whatever you enter. For example, a name displayed as `example-token._domainkey.acme.com` may need to be entered as `example-token._domainkey` when you are editing the DNS zone for `acme.com`.

Check the resulting full name after saving. It must match the name shown in Hellotext, rather than ending in the domain twice. Preserve the `_domainkey` part and its underscore.

The token in this example is illustrative. Always use your actual record name from Hellotext.

### If you use Cloudflare

Set these CNAME records to **DNS only**. Cloudflare's proxy is for web traffic and should not be enabled for email verification records. See [Cloudflare's proxy limitations](https://developers.cloudflare.com/dns/proxy-status/limitations/) and its [instructions for managing DNS records](https://developers.cloudflare.com/dns/manage-dns-records/how-to/create-dns-records/).

### Preserve your other DNS records

Add the three records alongside your existing DNS configuration. The wizard does not ask you to replace your website records, change nameservers, or remove records used by your current email provider.

If your provider reports that a record with the same name already exists, compare its type and target with the Hellotext instructions. An exact match may already be in place. If the target differs or you do not know what the existing record is for, ask your domain administrator before replacing it.

Keep the Hellotext records published for as long as you use the sender. They remain part of the domain's email authentication setup after initial verification.

## 4. Finish the wizard and allow time for verification

After adding the DNS records, return to Hellotext and click **Continue**.

The final page says **Email sender added** and displays the sender address. Click **Finish** to return to **Integrations**.

<div class="note">
  “Email sender added” confirms that the sender has been saved. The domain still needs to be verified before you can use it to send emails. Clicking Continue or Finish does not bypass verification.
</div>

DNS changes take time to become visible across the internet. They may be picked up quickly, but allow up to 72 hours for domain-verification DNS changes to propagate.

Hellotext checks pending senders automatically every five minutes. Once the sending domain and its DKIM configuration are verified, Hellotext activates the sender's Email channel. You can close the wizard while this happens; keeping the page open is not required.

If someone else will add the DNS records later, you can finish the wizard after sharing the instructions. The sender will remain unavailable for sending until the records have been published and verification succeeds.

To use the channel after activation, open a customer conversation whose profile has an email address and check the message destination selector for **Email**. A saved integration alone does not confirm that the channel is ready, and a customer profile without an email address cannot provide an email destination.

## Reopen the DNS instructions

You can return to the instructions whenever you need to review the records or share them with your domain administrator:

1. Go to **Settings > Integrations**.
2. Find the email sender by its name and address.
3. Open its three-dot menu.
4. Select **View setup instructions**.

This opens the same **Verify your sending domain** page with the saved DNS records. You do not need to create another sender to retrieve them.

When you open the instructions from the integrations list, **Back** returns to **Integrations**.

## Edit a sender or add another address

### Change the sender name or address

Go to **Settings > Integrations**, open the sender's three-dot menu, and select **Edit**. Update the fields and click **Next** to save.

Changing the sender name changes the name used for that sender. Changing the part before `@` while keeping the same domain, such as moving from `support@acme.com` to `sales@acme.com`, keeps the same sending domain.

Changing to a different domain starts verification for the new domain. Hellotext disables the sender's existing Email channel during that change. Follow the new DNS instructions and allow the new domain to be verified before relying on that sender again.

Plan a domain change for a time when you can complete the DNS work. If you need to keep both addresses available, add a separate sender instead of replacing the current one.

### Add another sender on the same domain

You can add more than one sender address on a domain within the same Hellotext business. For example, `support@acme.com` and `sales@acme.com` can belong to the same business.

Repeat **Settings > Integrations > Browse integrations > Email** for the additional address. Use a distinct address and review the DNS instructions returned for it. If the required records are already present, leave them in place and allow Hellotext to verify the additional sender.

An existing verified domain does not make the new sender ready at the instant you save the form; Hellotext still checks that sender before activating its channel.

### Remove a sender

From **Settings > Integrations**, open the sender's three-dot menu, select **Delete**, and confirm the deletion in the dialog.

Removing the integration disables its Email channel during cleanup. Coordinate the change with anyone using that sender. When the last sender for a domain is removed, Hellotext also removes its sending registration; adding it again later may require publishing new verification records.

## Troubleshoot email setup

### Email is unavailable in the integrations catalog

Check that you selected the correct business and that its subscription includes Email. Email sending is part of Enterprise. An Owner or Administrator can review the business's subscription or contact Hellotext support if Email should be available.

### The domain is connected to another business account

Hellotext shows **This domain is already connected to another business account.** when another business already has a sender using that domain.

Different addresses on the same domain do not avoid this restriction: `support@acme.com` and `sales@acme.com` still use `acme.com`.

If you manage both businesses, first confirm which one should own the domain. Coordinate removal or changes to all senders using that domain in the previous business before setting it up in the intended business. A domain remains reserved while that business still has another sender using it.

If you do not recognize the other business or cannot access it, contact Hellotext support with the domain and the business where you want to configure it. Repeatedly changing the part before `@` will not resolve a domain ownership conflict.

### Hellotext could not register the sending domain

If the form says **We could not register your sending domain. Please try again.**, check the sender address and try again. If you left the wizard and the sender is already listed under **Integrations**, open **Edit** on that sender to continue its setup.

If the error persists, contact support with the business name, sender address, and approximate time of the attempt. DNS changes cannot fix a registration request that has not produced the required records.

### The instructions page does not show the DNS records

Open **Edit** for the saved sender, confirm the email address, and click **Next** to retry registration. If the three records still do not appear, contact support before adding DNS entries. Use only the records returned by Hellotext.

### You added the records but cannot use Email yet

Check the following with the person who manages your DNS:

- You edited the active DNS provider for the domain shown in Hellotext.
- All three entries were saved as CNAME records.
- Each name is paired with the value from the same Hellotext record.
- The saved names match Hellotext's full names, including `_domainkey`.
- The provider did not append your domain twice.
- The values were copied in full, without adding `https://`, spaces, or quotation marks.
- Cloudflare records, if applicable, are set to DNS only.
- You are using the latest instructions for this sender, especially after changing or re-adding it.

Allow time for DNS propagation and Hellotext's next verification check. If the records are correct and the sender is still unavailable after the expected propagation period, contact support. Avoid deleting and recreating the sender just to check its progress; reopen **View setup instructions** instead.

### Your normal mailbox still receives new emails

That is expected when its incoming-mail routing has not changed. Verifying the sending domain does not automatically forward messages addressed directly to your business mailbox into Hellotext. Contact support if you need help planning that separate setup.

## Information to share with support

For an email setup problem, include:

- The business name in Hellotext.
- The sender email and domain you are trying to use.
- The exact error message or the step where you are stuck.
- Your DNS provider's name.
- When the records were added or last changed, with your time zone.
- A screenshot of the Hellotext DNS instructions and the corresponding saved DNS entries, when relevant.

This helps support distinguish an account-access issue, a registration problem, and a DNS verification delay. For contact options, see [Contact Hellotext support]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Related guides

- [Email channel fundamentals]({% link _numbers/email-channel-fundamentals.md %})
- [Setup overview]({% link _integrations/setup-overview.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
