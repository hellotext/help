Connect a Facebook Page to bring eligible Messenger conversations into the Hellotext Inbox. Messenger connects to a Page, not to a personal Facebook profile.

Facebook Messenger and Instagram are separate integrations. Connecting one does not connect the other.

## Before you connect Messenger

Confirm that:

- Your business has the Facebook Page you want to connect.
- You have a Facebook account with administrator access to the company Meta Business Suite and the Page.
- The company has a configured Meta Business account.
- You can authorize the messaging and webhook permissions requested by Hellotext.
- The Page is not connected to another Hellotext business.
- Your Hellotext subscription is active.

Hellotext currently connects one Facebook Page per business. A Page can also be connected to only one Hellotext business at a time.

## Connect your Facebook Page

1. In Hellotext, go to **Settings**.
2. Select **Integrations**, then **Explore integrations**.
3. Find **Messenger** and open the integration.
4. Review the requirements and confirm that you have access to Meta Business Suite and the Page.
5. Select **Log in to Facebook**.
6. Sign in with the Facebook account that administers the correct Meta Business account and Page.
7. Select the Page you want to connect.
8. Review and authorize all requested permissions.
9. Return to Hellotext and confirm that the Page appears successfully connected.

Choose the Page carefully. Each customer Messenger identity is associated with that specific Page and is not automatically reusable with another Page.

## Verify the connection

Use a personal Facebook account that is separate from the Page:

1. Send a new private message to the connected Page.
2. Open the Hellotext Inbox and find the conversation.
3. Confirm that Hellotext created or updated the correct customer profile.
4. Reply from Hellotext.
5. Confirm that the reply arrives in Messenger.

The test must be a private message to the Page. A public comment, Page post, message to a personal profile, or Instagram DM does not test the Messenger connection.

## If the Page is connected to another business

If Hellotext says the Page is already connected:

1. Open the Hellotext business where it is currently connected.
2. Go to **Settings > Integrations**.
3. Remove the Messenger integration.
4. Return to the correct business and connect the Page again.

If you do not recognize the other business or cannot access it, contact Hellotext support before removing the integration.

## Reauthorize or replace the Page

Messenger can stop receiving or sending messages if Page access changes, permissions are removed, the Page is disconnected from Meta Business, or Meta invalidates authorization.

First confirm that your Facebook account still has administrator access to the Meta Business account and Page. Then:

1. Go to **Settings > Integrations**.
2. Find the connected Messenger Page.
3. Remove the Messenger integration.
4. Select **Messenger** again and log in with Facebook.
5. Select the same Page or its replacement and authorize the requested permissions.
6. Send a private test message from a personal account.

Removing the integration disables that Messenger channel. Confirm that you have access to the correct Page before removing it.

## Troubleshoot the connection

If you cannot select the Page or complete authorization:

- Confirm that you signed in with the correct Facebook account.
- Verify in Meta Business Suite that the account has administrator access to the business and Page.
- Accept all permissions requested by Hellotext.
- Check that the Page is not connected to another Hellotext business.
- Try again from **Settings > Integrations**.

If the Page appears connected but the test message does not arrive:

- Send a private message from a separate personal account.
- Confirm that you messaged the connected Page rather than a personal profile.
- Verify that Hellotext still has the required Page permissions.
- Reauthorize the integration if access changed in Meta Business Suite.

For problems after the conversation already appears in the Inbox, see [Facebook Messenger fundamentals]({% link _numbers/facebook-messenger-fundamentals.md %}) and [Why a message did not send]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Related guides

- [Facebook Messenger fundamentals]({% link _numbers/facebook-messenger-fundamentals.md %})
- [Connect Instagram DM]({% link _integrations/connect-instagram-dm.md %})
- [Messaging channels overview]({% link _numbers/messaging-overview.md %})
- [Inbox and conversations overview]({% link _team/inbox-overview.md %})
