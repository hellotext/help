Shareable Link is a capture playbook that creates a link for starting a subscription through SMS or WhatsApp. Opening it prepares a pre-filled opt-in message in the selected app on the customer's phone.

The person decides whether to tap **Send**. Only when Hellotext receives that message can it record the subscription on the customer profile and attribute it to the link. Opening the link without sending does not subscribe anyone.

You can also attach a coupon when the configured follow-up route contains a message that can deliver it.

## Create a Shareable Link capture

To set up a Shareable Link, open **Playbooks**, click **Explore playbooks**, find the **Capture** group, and choose **Shareable Link**. Give it a name that identifies where you will share it, such as “Instagram Link.”

### Choose the app you want the link to open
Choose the app the link should open. Available options are _SMS_ and _WhatsApp_. WhatsApp is available only when a compatible WhatsApp account is connected.

### Choose the phone number and message 

Choose the phone number that should receive the opt-in message:

- If you have selected SMS in the first step, and if you have phone numbers or short codes associated with your business, you can choose one of these as the number that customers will send the opt-in message to.
- If you selected WhatsApp, confirm that it is enabled for your business and check the prepared destination before sharing the link.

If you do not choose a specific number, you can keep **Using default settings for sending**. Check the destination the link opens before publishing it.

You can customize the pre-filled message customers send to subscribe. Keep the subscription intent clear; Hellotext preserves the capture reference needed to identify the source.

### Choose the follow-up

Saving the number and message creates the link and opens the step for assigning a coupon and a playbook compatible with the subscription event.

No welcome message is sent automatically when you leave the follow-up playbook unselected. To welcome new subscribers, choose a route or playbook that starts on subscription and contains the appropriate message.

You can choose a coupon when the selected playbook has a message prepared to include it. If you skip this step, the link remains available without that automatic follow-up.

### Share the link

After you save or skip the follow-up, copy the link from the last step.

Share this link as you would do with a regular link.

Before publishing, open the link on a phone and check that it prepares the expected app, destination, opt-in message, and capture reference. You can inspect these details without sending. For a complete subscription test, use an authorized test number and check the profile and follow-up afterward.

### Share on Instagram {#howto-share-instagram}

Use the Link sticker to add the shareable link to your story. When people tap on the sticker, they'll be redirected.

To add a Link sticker

1. Capture or upload content to your story
2. Select the **Sticker** tool. This may be placed differently depending on which version of Instagram you're using.
3. Tap the "Link" sticker, here you should paste the shareable link
4. Place the sticker on your story, do any other modifications needed
5. Publish your story

## Related guides

- [Capture tools overview]({% link _captures/capture-overview.md %})
- [QR Code Subscriber]({% link _captures/qr-codes.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
