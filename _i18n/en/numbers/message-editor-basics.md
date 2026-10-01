Use the message editor to write inbox replies, campaigns, and journey or playbook messages. Available tools depend on the channel and where you are editing; they do not all support the same attachments, emojis, contact cards, or formatting. See the [Message editor overview]({% link _numbers/message-editor-overview.md %}) to recognize its uses.

This guide explains how to apply bold and italic in the editor and open the link tool. Writing or previewing a draft does not save it, approve it, or send it to customers.

### How to format your messages

Click inside the text before using a shortcut. Templates have separate **Message** and **Email** editors: check which version you are changing. Formatting visible while composing does not guarantee the channel will retain it. **SMS uses plain text**; bold or italic in the editor does not turn the SMS into a message with that style.

#### Bold

Select the words you want to emphasize and use the shortcut:

- <kbd> Ctrl</kbd> + <kbd>B</kbd> on Windows
- <kbd>⌘ Command</kbd> + <kbd>B</kbd> on Mac

To remove bold, select those words and use the same shortcut again. Check the result inside the editor before continuing.

#### Italic

Select the words you want to italicize and use the shortcut:

- <kbd> Ctrl</kbd> + <kbd>I</kbd> on Windows
- <kbd>⌘ Command</kbd> + <kbd>I</kbd> on Mac

Use it again on the selection to remove italic. You can apply both styles to a selection, but use emphasis sparingly to keep the message readable.

The figure shows the **Message** version of a fictional unsaved template: **Read** is bold and *instructions* is italic. This is the editor state, not an approved template or a delivered SMS; its SMS version remains plain text.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real Message editor with Read in bold and instructions in italic, a fictional unsaved draft.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/format-en-mobile.png 2x" width="652" height="528" />
        <img src="/images/numbers/message-editor-basics/format-en.png" srcset="/images/numbers/message-editor-basics/format-en.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="528" loading="lazy" decoding="async" alt="Real Message editor with Read in bold and instructions in italic, a fictional unsaved draft." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with a fictional unsaved draft; no content was saved or sent.</figcaption>
</figure>

#### Links

The editor's link tool lets you insert a tracked short link. Its chain icon is in the toolbar, visible in the editor figure. Place the caret where you want to insert the link and open the tool with its icon or these shortcuts while the editor has focus:

- <kbd> Ctrl</kbd> + <kbd>K</kbd> on Windows
- <kbd>⌘ Command</kbd> + <kbd>K</kbd> on Mac

Under **Create a shortlink**, paste the complete destination URL, including `https://`. The form has a URL field; it does not have a field for assigning the link a dynamic name. [Personalization tags]({% link _audience/personalization-tags.md %}) are a separate tool and must be checked with the relevant profile data.

The figure shows **https://shop.example.test/returns**, a fictional destination entered without confirmation. No link was created and the destination was not visited. **Add short link** and **Cancel** are shown in full to identify the choice.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real Create a shortlink form with a fictional URL not added and complete Add short link and Cancel buttons.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 464px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/link-en-mobile.png 2x" width="728" height="428" />
        <img src="/images/numbers/message-editor-basics/link-en.png" srcset="/images/numbers/message-editor-basics/link-en.png 2x" style="width: auto; margin: 0 auto;" width="892" height="436" loading="lazy" decoding="async" alt="Real Create a shortlink form with a fictional URL not added and complete Add short link and Cancel buttons." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with a fictional unsaved draft; no content was saved or sent.</figcaption>
</figure>

Once you have reviewed your real URL, **Add short link** registers it and inserts the link in the editor. Pressing <kbd>Enter</kbd> inside the field also starts that creation. **Cancel** closes the form without adding the pending URL. Adding a link happens before saving or sending the message: discarding the draft afterward should not be treated as undoing an already created link.

Check the final destination through authorized validation with isolated data. A URL accepted by the form does not prove its page exists or is accessible. Opening a message link can record a click and affect reports; avoid customer links when testing. See [Tracked links]({% link _analytics-reporting-attribution/tracked-links.md %}) to interpret these signals. A created link or click does not demonstrate consent, delivery, or an attributed sale.
