Connect your Mercado Libre seller account to bring marketplace sales, customer activity, post-sale conversations, and order notes into Hellotext.

Mercado Libre works as both a commerce data integration and a transaction-specific messaging channel. It is designed for communication related to a Mercado Libre order, not for campaigns or unrelated messages to marketplace buyers.

The integration is currently available for businesses in Colombia and Uruguay.

## What the integration does

After you connect an account, Hellotext can:

- Track Mercado Libre sales and keep subsequent order activity synchronized.
- Add order, product, amount, delivery, payment, claim, refund, and status information when Mercado Libre makes it available.
- Create or update customer profiles with a Mercado Libre identity and any buyer details provided with the sale.
- Bring post-sale messages and supported attachments into the Inbox.
- Synchronize private seller notes with the corresponding Mercado Libre order.
- Use eligible order activity as signals for segments, playbooks, routes, reporting, and attribution.

Mercado Libre does not provide the same buyer data for every order. A customer profile can include the buyer's Mercado Libre username, name, email, or phone number when available, but you should not expect every profile to contain every field.

Connecting Mercado Libre does not perform a complete historical import of every marketplace customer. Hellotext creates and updates customer profiles from the sales and buyer activity available to the integration.

## Before you connect

Confirm that:

- You can sign in to the Mercado Libre seller account you want to connect.
- The seller account is not already connected to another Hellotext business.
- Your Hellotext business country is Colombia or Uruguay.
- Your Hellotext subscription is active so order and message activity can continue syncing.
- You know which team will manage Mercado Libre conversations in the Inbox.

## Connect your Mercado Libre account

1. In Hellotext, go to **Settings**.
2. Select **Integrations** and then **Browse integrations**.
3. Find **Mercado Libre** and select **Integrate Mercado Libre with Hellotext**.
4. Sign in to the Mercado Libre seller account you want to connect.
5. Review the requested access and authorize Hellotext.
6. Return to Hellotext and select **Finish**.

Hellotext starts receiving sales and buyer activity from the connected account; it does not import the seller's complete historical customer database. In some cases, new orders, messages, or notes can take up to one hour to appear because of Mercado Libre synchronization delays.

## How Mercado Libre conversations work

Every Mercado Libre conversation is connected to a specific order or package. It is not a general-purpose chat identity that can be messaged independently of a sale.

Mercado Libre decides whether a seller can start or continue a conversation based on the operation and conversation state. For example, sending can be unavailable because:

- The buyer must write first for that operation.
- The seller has reached a limit on seller-initiated communication.
- The payment or fulfillment state does not allow messages.
- The order was canceled or refunded.
- The buyer blocked the conversation.
- A claim or mediation is active.
- Mercado Libre applied a time or guest-shop restriction.

When Mercado Libre requires the buyer to start, Hellotext waits for that first message and then lets your team reply when the conversation becomes available. Hellotext also stops offering an order as an outbound Mercado Libre route 30 days after its last interaction. Mercado Libre can close or restrict it earlier.

Changing the message text does not remove an order restriction. Review [why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) before retrying.

## Manage messages in the Inbox

When a buyer writes through Mercado Libre, Hellotext adds the message to that customer's conversation in the Inbox. Your team can assign the conversation, reply, and close it using the same workflow as other supported channels.

If the customer has more than one eligible Mercado Libre order, choose the order related to the reply. Hellotext sends the message through that order's post-sale conversation.

Mercado Libre moderates message content. Do not include personal data, offensive language, social-network links, or Mercado Pago links. Supported attachments are sent through Mercado Libre and remain subject to its format, size, moderation, and conversation rules.

For team workflow, read [Inbox and conversations overview]({% link _team/inbox-overview.md %}).

## Add notes to a Mercado Libre order

A note is different from a message:

- A **message** is sent to the buyer in the post-sale conversation.
- A **note** is private to your team and is also added to the selected order in Mercado Libre. It is not sent to the buyer.

When you create a note from a customer conversation, select the Mercado Libre order it belongs to. New notes and note deletions are synchronized between Hellotext and the selected Mercado Libre order.

## Use Mercado Libre in routes, playbooks, and the API

An eligible Mercado Libre order can be used by a route or playbook when the flow has the related order activity and Mercado Libre permits the conversation. Hellotext will not use Mercado Libre merely because the customer profile has a marketplace username.

The same restriction applies to messages created with the API: selecting `mercadolibre` does not bypass the order state or Mercado Libre's conversation rules. Read [Send messages with the API]({% link _developers/send-messages-with-api.md %}) for the request format.

Mercado Libre is not available as a destination for campaigns.

## Verify the integration

After connecting:

1. Wait for a new Mercado Libre sale to appear in Hellotext.
2. Open the customer profile and confirm that the order and Mercado Libre identity are present.
3. Check that a real buyer message appears in the Inbox when one is received.
4. For an eligible conversation, reply from Hellotext and confirm that the message appears in Mercado Libre.
5. Add a private note to the order and confirm that it appears in Mercado Libre without being sent to the buyer.

Also follow [verify your data and signals after setup]({% link _integrations/verify-data-and-signals.md %}) before launching a route or playbook based on Mercado Libre activity.

## Reconnect or remove the integration

If Hellotext reports that Mercado Libre needs to be reauthenticated, go to **Settings > Integrations**, remove the affected integration, and connect the same seller account again.

Removing the integration stops new order, message, and note synchronization and prevents new Mercado Libre sends. Existing customer profiles and conversations remain available for reference in Hellotext.

## Troubleshoot synchronization

If an order, message, or note is missing:

1. Allow up to one hour for the latest activity to synchronize.
2. Confirm that the Mercado Libre integration is still active under **Settings > Integrations**.
3. Check that your Hellotext subscription is active.
4. Open the sale in Mercado Libre and confirm that the missing activity belongs to the connected seller account.
5. Reconnect the account if Hellotext shows an authentication warning.

If the integration is active and the activity still does not appear, contact Hellotext support with the Mercado Libre order ID and the approximate time of the missing event.

## Message costs

Mercado Libre messages are included in Hellotext's non-SMS fair-use calculation. Read [fair-use message policy]({% link _billing/fair-use-message-policy.md %}) for the billing rules.

## Related guides

- [Setup and integrations overview]({% link _integrations/setup-overview.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
- [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Send messages with the API]({% link _developers/send-messages-with-api.md %})
