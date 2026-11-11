Asking a customer for their details over chat takes a string of messages: one question, one answer, and a lot of waiting in between. Many customers stop replying halfway.

A **WhatsApp form** asks for everything at once. Your campaign message carries a button. The customer taps it, a short form opens inside WhatsApp, they fill it in and send it. They never leave the chat, and their answers are saved on their profile in Hellotext.

This guide explains how the form helps, how to add one to a campaign, and where the answers go.

## How it helps your business

- **Complete your customer profiles.** Ask once for a birthday, an email or a gender, and use it afterwards in segments, personalization and birthday campaigns.
- **Less back-and-forth.** One tap and one form replace a conversation of several questions. Your team does not have to chase each answer.
- **Answers you can use right away.** Each answer is saved in the right property of the contact: an email as an email, a date as a date. Nobody copies it by hand from a chat.
- **Customers stay in WhatsApp.** There is no web page to open and nothing to sign in to. The form is part of the conversation they are already in.

## What your customer sees

Your customer receives the campaign message as usual. Below the text, after any other buttons, there is a button that reads **Fill the form**.

Tapping it opens a form inside WhatsApp, with one field for each detail you asked for, in the order you chose. The customer fills it in and sends it, and the chat shows that the form was submitted.

The form's own texts, such as its title and its send button, are written in your business's language.

## Before you start

- **WhatsApp is connected.** The form is a WhatsApp feature. See [WhatsApp channel fundamentals]({% link _numbers/whatsapp-channel-fundamentals.md %}).
- **The campaign targets WhatsApp.** It can be a WhatsApp campaign, or one that sends by SMS and WhatsApp. The tool does not appear in campaigns that only send SMS or Email. In a campaign with both channels, customers who get the SMS receive the text without the form.
- **The properties you want to fill exist.** A form can ask for the contact's name and for properties of your business, such as birthday or a custom property you created. See [Custom properties and events]({% link _audience/custom-properties-and-events.md %}).
- **Meta accepts your business for forms.** Meta only publishes forms for businesses it has verified and that keep a good messaging quality. The campaign's message also goes through Meta's approval, like any WhatsApp campaign.

## Add a form to a campaign

1. Create or open a campaign and go to the step where you write the message. See [Create a campaign]({% link _campaigns/creating-a-campaign.md %}).
2. In the editor's toolbar, click the form icon <img style='display: inline;'  src="{{site.url}}/images/icons/editor/note-alt.svg">. Its tooltip reads **Add WhatsApp form**.
3. Click **Add properties to collect** and pick what you want to ask for. Each property you pick appears as a tag.
4. Drag the tags to put them in order. The form asks its questions in that order. To remove one, move the pointer over its tag and click the ✕.
5. Close the tool. A **Fill the form** button now appears as the last button under your message, and as the last button in the phone preview. Click it to open the tool again.
6. Finish the campaign and send it as usual.

To take the form off the campaign, remove all of its tags.

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

- **One form per message.** Its button is always the last button, and it always reads **Fill the form**.
- **Questions are required.** The customer has to answer every question to send the form, except the birthday and the checkboxes.
- **Up to five checkboxes.** WhatsApp allows five Checkbox properties on a form.
- **Keep property names short.** The property's name is the label of its question, and WhatsApp limits a text field's label to 20 characters. Longer names are cut.
- **Campaigns only.** The form tool is available in campaigns. Journeys, playbooks and Inbox replies do not have it.

## Related guides

- [Message editor overview]({% link _numbers/message-editor-overview.md %})
- [Create a campaign]({% link _campaigns/creating-a-campaign.md %})
- [Custom properties and events]({% link _audience/custom-properties-and-events.md %})
- [Consent and subscriber status]({% link _audience/consent-and-subscriber-status.md %})
- [Share a location]({% link _numbers/share-a-location.md %})
