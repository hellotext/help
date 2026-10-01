Use the message editor when writing content for Hellotext conversations, campaigns, routes, and playbooks. Its shared toolbar supports text, links, and personalization; available options depend on the channel, business, and editing context.

Before writing, check the recipient or audience, selected channel, and content version you are editing. A draft or preview does not establish that the message is approved, authorized, or delivered.

## What you can do

Use the editor to:

- **Format text** with bold and italic where the channel supports them.
- **Add tracked links** to review their click signals.
- **Insert personalization tags** using values available from the profile or message context.
- **Share supported rich content**, such as locations, when both the channel and that editor allow it.

**Recognize the editor and its version.** Templates have separate **Message** and **Email** editors. The figure shows **Message** with fictional unsaved text: **Read** is bold and *instructions* is italic. Visible formatting does not guarantee the same result in every channel: **SMS uses plain text**. The chain icon opens the link tool; the braces icon opens personalization.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real Message editor with Read in bold and instructions in italic, fictional unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/format-en-mobile.png 2x" width="652" height="528" />
        <img src="/images/numbers/message-editor-basics/format-en.png" srcset="/images/numbers/message-editor-basics/format-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="528" loading="lazy" decoding="async" alt="Real Message editor with Read in bold and instructions in italic, fictional unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused without changing its pixels. No content was sent.</figcaption>
</figure>

**Review the link destination.** The **Create a shortlink** form accepts a URL. The figure retains **https://shop.example.test/returns**, a fictional destination typed without adding or visiting it. It is not a real URL to copy. This form has a static URL field, with no field for assigning a dynamic name.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Create a shortlink form with a fictional URL not added and complete buttons.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 464px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/link-en-mobile.png 2x" width="728" height="428" />
        <img src="/images/numbers/message-editor-basics/link-en.png" srcset="/images/numbers/message-editor-basics/link-en.png 2x" style="width: auto; margin: 0 auto;" width="892" height="436" loading="lazy" decoding="async" alt="Create a shortlink form with a fictional URL not added and complete buttons." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused without changing its pixels. No content was sent.</figcaption>
</figure>

**Add short link**, or <kbd>Enter</kbd> inside the field, creates the link before the message is saved or sent. **Cancel** closes the pending URL without adding it; discarding the draft afterwards does not undo a link already created. A created link or recorded click does not establish consent, delivery, or an attributed sale. Check the final destination through an authorized validation with isolated data.

**Choose personalization data.** Open **Insert tags**, the braces button, to see the available options. The figure shows a fictional campaign draft containing **Hello** with the **Tags** selector open, including the fictional custom property **Nivel de fidelidad**. It does not show a sent message or a value already resolved for a customer. The narrow variant is a crop of the same desktop interface.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tags selector open in a fictional campaign draft, showing profile tags and Nivel de fidelidad.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 818px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/personalization-tags/selector-en-mobile.png 2x" width="1020" height="780" />
        <img src="/images/audience/personalization-tags/selector-en.png" srcset="/images/audience/personalization-tags/selector-en.png 2x" style="width: auto; margin: 0 auto;" width="1600" height="1360" loading="lazy" decoding="async" alt="Tags selector open in a fictional campaign draft, showing profile tags and Nivel de fidelidad." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; approved source reused without changing its pixels. No content was sent.</figcaption>
</figure>

Options can vary with the business properties and the conversation's profile. Profile or custom-property tags can use a fallback when a value is missing. Product, cart, and order tags require the corresponding object and context; they are not all listed in this selector. Review values and links again whenever you reuse content in another flow.

**Check available rich content.** WhatsApp may support a location in a compatible editor, but selecting WhatsApp does not enable that tool in every playbook editor. Use tools that are visible and enabled for the current channel and context. SMS supports text and URLs; attachments and formatting from other channels do not transfer automatically.

## Where the editor appears

You may see the editor in places such as:

- **Inbox**, when replying in a conversation whose destination and state allow composition. Tool availability depends on the channel and conversation window.
- **Campaigns**, when preparing content for the chosen audience and channels.
- **Routes and playbooks**, inside steps or components that author automated messages. They do not all expose the same tools.
- **Settings > Templates**, when preparing reusable content and reviewing its Message or Email versions where available.

Writing content is one part of setup. Before launching, review permission for the channel and destination, the active version or required approval, variables, URLs, opt-out, and timing. Follow the [Go-live checklist]({% link _getting-started/go-live-checklist.md %}) and validate with isolated fictional data and authorized destinations. Saving a template, approving it, activating automation, and delivering a message are distinct states.

## Related guides

- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Message editor basics]({% link _numbers/message-editor-basics.md %})
- [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Personalization tags]({% link _audience/personalization-tags.md %})
- [Share a location]({% link _numbers/share-a-location.md %})
