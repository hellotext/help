QR Code Subscriber is a capture playbook that starts a subscription from a printed or digital code. You can create a code that opens SMS or, when WhatsApp is enabled for your business, one that opens WhatsApp. Scanning prepares the message; the person chooses whether to send it.

Use separate codes for different placements so you can recognize where each subscription began:

* A clothing store can place one code at the counter to invite customers to receive news and offers.
* A retailer can include another code in its weekly flyer and distinguish that source from the store.
* A consumer packaged goods brand can print a code on packaging to invite customers to receive tips or promotions.

## How it works

Scanning opens the selected app: the native SMS app or WhatsApp. The destination number and text are prepared. Hellotext adds a unique reference to the text to identify this QR code.

The person must press **Send**. Only after Hellotext receives that message can it record the subscription on the customer profile and attribute it to the capture. Scanning without sending does not subscribe anyone.

## Create a QR code

Open **Playbooks**, click **Explore playbooks**, find the **Capture** group, and choose **QR Code Subscriber**. Give it a name that identifies its placement, such as “Packaging QR.”

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="QR Code Subscriber">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 416px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/capture-overview/desktop-qr-en.png" width="800" height="480" loading="lazy" decoding="async" alt="QR Code Subscriber in a fictional account." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">QR Code Subscriber card in the fictional catalog desktop view.</figcaption>
</figure>

First choose **SMS** or **WhatsApp**. WhatsApp is available only when that channel is enabled for your business.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="QR code type chooser with SMS available and WhatsApp disabled in the fictional account.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/type-en-mobile.png" width="740" height="1500" />
        <img class="ht-editorial-visual__image" src="/images/captures/qr-codes/type-en.png" width="1320" height="1310" loading="lazy" decoding="async" alt="Choose the Type step: SMS selected and WhatsApp unavailable for this account." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Choose the app the code opens; WhatsApp availability depends on the account.</figcaption>
</figure>

On the next step, select the number or channel that will receive the message. For SMS, you can choose an available business number or short code, or keep **Using default settings for sending**. Check the destination prepared on the customer's phone before you share the code.

Write clear consent text in **Personalize the message your users will send to subscribe**. The editor previews the text but does not send it. Hellotext appends the capture reference when it generates the QR code.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Number and opt-in message setup in a fictional QR code draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/message-en-mobile.png" width="860" height="1160" />
        <img class="ht-editorial-visual__image" src="/images/captures/qr-codes/message-en.png" width="1320" height="1380" loading="lazy" decoding="async" alt="Default number and fictional opt-in text in the QR code editor." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Number and message before saving. The example text was not sent.</figcaption>
</figure>

## Choose the follow-up

Saving the number and message creates the QR code and opens the step for assigning a coupon and a playbook compatible with the subscription event.

No welcome message is sent automatically when you leave the follow-up playbook unselected. To welcome new subscribers, choose a route or playbook that starts on subscription and contains the appropriate message.

You can choose a coupon when the selected playbook has a message prepared to include it. If you skip this step, the QR code remains available without that automatic follow-up.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Optional compatible coupon and welcome journey choices for a fictional QR code.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/assignment-en-mobile.png" width="900" height="1050" />
        <img class="ht-editorial-visual__image" src="/images/captures/qr-codes/assignment-en.png" width="1220" height="1100" loading="lazy" decoding="async" alt="Assign a coupon and journey step with fictional GUIA-QR-10 coupon and QR welcome journey selected." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Follow-up choices in a disabled fictional capture. No message was sent.</figcaption>
</figure>

## Download and test the QR code

After you save or skip the follow-up, you will see the QR code and **Download QR Code in SVG**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Fictional QR code result with an option to download the SVG file.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/result-en-mobile.png" width="900" height="1730" />
        <img class="ht-editorial-visual__image" src="/images/captures/qr-codes/result-en.png" width="2200" height="1550" loading="lazy" decoding="async" alt="Generated QR code and Download QR Code in SVG button on the final screen." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Demo account result: the code opens an unsent SMS draft to a reserved fictional number.</figcaption>
</figure>

SVG is a vector format that scales cleanly for printed materials, packaging, or websites.

Before publishing, scan it with a phone and check that it opens SMS or WhatsApp as selected, with the expected destination, message, and reference. You can check these details without sending the message. For a complete subscription test, use an authorized test number and check the profile and follow-up after sending.

## Related guides

- [Capture tools overview]({% link _captures/capture-overview.md %})
- [Shareable Link]({% link _captures/shareable-link.md %})
- [Who can I message? Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
