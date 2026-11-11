Asking a customer for their details over chat takes a string of messages: one question, one answer, and a lot of waiting in between. Many customers stop replying halfway.

A **WhatsApp form** asks for everything at once. Your message carries a button. The customer taps it, a short form opens inside WhatsApp, they fill it in and send it. They never leave the chat, and their answers are saved on their profile in Hellotext.

This guide explains how the form helps, how to add one to a campaign or to a journey, and where the answers go.

## How it helps your business

- **Complete your customer profiles.** Ask once for a birthday, an email or a gender, and use it afterwards in segments, personalization and birthday campaigns.
- **Less back-and-forth.** One tap and one form replace a conversation of several questions. Your team does not have to chase each answer.
- **Answers you can use right away.** Each answer is saved in the right property of the contact: an email as an email, a date as a date. Nobody copies it by hand from a chat.
- **Customers stay in WhatsApp.** There is no web page to open and nothing to sign in to. The form is part of the conversation they are already in.

## What your customer sees

Your customer receives your message as usual. Below the text, after any other buttons, there is a button that reads **Fill the form**, or the text you chose for it.

Tapping it opens a form inside WhatsApp, with one field for each detail you asked for, in the order you chose. The customer fills it in and sends it, and the chat shows that the form was submitted.

The form's own texts, such as its title and its send button, are written in your business's language.

## Before you start

- **WhatsApp is connected.** The form is a WhatsApp feature. See [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %}).
- **The message can go out by WhatsApp.** In a campaign, the tool appears when the campaign targets WhatsApp, alone or together with SMS. In a journey, the tool is always in the toolbar of a **Send a text message** step, and it is disabled while WhatsApp is not one of the step's channels. Customers who get the message by another channel receive the text without the form.
- **The properties you want to fill exist.** A form can ask for the contact's name and for properties of your business, such as birthday or a custom property you created. See [Custom properties and events]({% link _audience/custom-properties-and-events.md %}).
- **Meta accepts your business for forms.** Meta only publishes forms for businesses it has verified and that keep a good messaging quality. The message also goes through Meta's approval, like any WhatsApp template.

## Add a form to a campaign

1. Create or open a campaign and go to the step where you write the message. See [Create a campaign]({% link _campaigns/creating-a-campaign.md %}).
2. In the editor's toolbar, click the form icon <img style='display: inline;'  src="{{site.url}}/images/icons/editor/note-alt.svg">. Its tooltip reads **Add WhatsApp form**.
3. Click **Add properties to collect** and pick what you want to ask for. Each property you pick appears as a tag.
4. Drag the tags to put them in order. The form asks its questions in that order. To remove one, move the pointer over its tag and click the ✕.
5. To change what the button says, edit **Button text**. It starts as **Fill the form** and can be up to 25 characters long.
6. Close the tool. The form's button now appears as the last button under your message, and as the last button in the phone preview. Click it to open the tool again.
7. Finish the campaign and send it as usual.

To take the form off the campaign, remove all of its tags.

## Add a form to a journey

A form works the same way in a message a journey sends. See [Custom journey]({% link _journeys/custom-journey.md %}).

1. Open the journey and add or open a **Send a text message** step.
2. Under **Sending channels**, make sure WhatsApp is one of the channels the step can use. With **Any available channel**, WhatsApp counts when your business has it connected.
3. Click the form icon <img style='display: inline;'  src="{{site.url}}/images/icons/editor/note-alt.svg">, pick the properties, put them in order and set the button text, as in a campaign.
4. Save the step.

The form tool is always visible in this step, but it is disabled while WhatsApp is not among the step's channels. If you take WhatsApp off a step that has a form, the form's button leaves the message. Select WhatsApp again before you save and the form you picked comes back.

**Ask a question** steps do not have the form tool.

## What a form can ask for

| You pick | Your customer gets |
| --- | --- |
| **Name** | A text field. The answer becomes the contact's name. |
| **Phone** | A phone number field. |
| **Email** | An email field. |
| **Company** or a **Text** property | A short text field. |
| A **Long text** property | A larger text box. |
| A **Number** property | A number field. |
| **Birthday** | A date picker. |
| **Gender** | A choice between Male, Female and Other. |
| A **Checkbox** property | A box to tick. |

Properties of other kinds, such as Date, URL, Tags, Lists or Address, cannot be asked in a form, so the tool does not offer them.

## Where the answers go

**On the contact.** Each answer is saved in its property as soon as the customer sends the form. If the contact already had a value there, the new answer replaces it. The name answer replaces the contact's name.

**In the Inbox.** The submission appears in the customer's conversation as a **Form submitted** message that lists each answer, so your team can see what was sent and reply. See [Inbox and conversations overview]({% link _team/inbox-overview.md %}).

Filling in a form does not subscribe the contact or change their consent. See [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %}).

## Good to know

- **One form per message.** Its button is always the last button.
- **Button text.** You choose what the button says, up to 25 characters. If you leave it empty, it reads **Fill the form**. Emojis are removed.
- **Questions are required.** The customer has to answer every question to send the form, except the birthday and the checkboxes.
- **Up to five checkboxes.** WhatsApp allows five Checkbox properties on a form. Once you have picked five, the tool stops offering Checkbox properties until you remove one.
- **Keep property names short.** The property's name is the label of its question, and WhatsApp limits a text field's label to 20 characters. Longer names are cut.
- **Campaigns and journeys.** The form tool is available in campaigns and in the **Send a text message** step of a journey. **Ask a question** steps, playbooks and Inbox replies do not have it.

## Related guides

- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Custom journey]({% link _journeys/custom-journey.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Share a location]({% link _numbers/share-a-location.md %})
