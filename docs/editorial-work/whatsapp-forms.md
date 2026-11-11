# WhatsApp forms — release documentation

## Publication state

Prepared on 2026-11-11 as a draft for the feature tracked in
[hellotext/hellotext#4545](https://github.com/hellotext/hellotext/issues/4545).
Do not merge or publish this guide until the campaign tool is deployed and its
released behavior has been checked against both translations. Merging Help's
main branch triggers publication. Auto-merge must remain disabled.

The guide follows the implementation in the Hellotext Rails repository:

- [#7037](https://github.com/hellotext/hellotext/pull/7037) (merged): the form
  itself, built from an ordered list of properties and published to Meta.
- [#7039](https://github.com/hellotext/hellotext/pull/7039) (merged): the form
  button on a WhatsApp template, the submitted form as an Inbox message and the
  answers saved to the contact.
- Branch `whatsapp-flow-composer` (not yet a pull request): the form tool in
  the campaign editor, the form button shown last under the message and in the
  preview, and the **Form submitted** card in the Inbox. Every interface label
  quoted in the guide comes from this branch and can still change in review.

## Article inventory

This is a new guide; there is no earlier published article to preserve.

| Locale | Source body | Planned route | State |
| --- | --- | --- | --- |
| English | `_i18n/en/numbers/whatsapp-forms.md` | `/whatsapp-forms` | Draft; not published |
| Spanish | `_i18n/es/numbers/whatsapp-forms.md` | `/es/formularios-de-whatsapp` | Draft; not published |

The shared stub is `_numbers/whatsapp-forms.md`, listed in the Numbers topic
right after Share a location, the other guide about a single editor tool.
Message editor overview links to it from its related guides in both languages.

The inline tool icon is `images/icons/editor/note-alt.svg`, copied unchanged
from `app/assets/images/icons/note-alt.svg` in the Rails repository.

## Reader task and scope

Understand what a WhatsApp form is and why it is worth using, add one to a
campaign, and know where the answers end up.

The copy is written for the person who writes campaigns. It opens with the
problem a form solves, shows what the customer sees before any control is
named, and then walks through the tool. It calls the feature a WhatsApp form;
Meta's name for it, WhatsApp Flows, appears only in the tool's own title.

It leaves out how Meta reviews a form, the form's wire format and anything
about journeys or playbooks, where the tool is not available.

## Behavior the guide states, and its source

| Statement | Source in the Rails repository |
| --- | --- |
| The tool shows only when the campaign targets WhatsApp, alone or with SMS | `app/views/campaign/broadcasts/_broadcast.html.erb` |
| Which properties can be asked, and the field each one becomes | `WhatsApp::Flow::Builder::INPUTS` |
| Every question is required except the birthday and checkboxes | `WhatsApp::Flow::Builder::ALWAYS_OPTIONAL` |
| At most five Checkbox properties | `WhatsApp::Flow::Builder::CHECKBOX_LIMIT` |
| A text field's label is cut at 20 characters | `WhatsApp::Flow::Builder::LABEL_LIMITS` |
| The form's title and send button use the business's language | `WhatsApp::Flow::Builder#run` |
| The form button is always the last button | `Campaign::Composer#ordered_buttons` |
| Answers replace the contact's values, including the name | `WhatsApp::Flow::Submitted#run` |
| The Inbox lists the answers in the form's order | `Message::FlowReplyComponent` |

Meta's requirement of a verified business with good messaging quality comes
from Meta's WhatsApp Flows documentation, not from Hellotext code.

Two behaviors are not yet settled in the product and are deliberately left out
of the guide: what the merchant sees when Meta refuses a form, and what happens
when more than five Checkbox properties are picked. Add them once the tool
reports those cases.

## Visual decisions

The guide has no screenshots yet. Three would help the reader recognize the
interface, and all are pending until the tool is released, because they must be
captured from the real application under the shared screenshot standard:

- The open form tool with a few properties added as tags, after step 4 of "Add
  a form to a campaign", in each language.
- The message editor with the **Fill the form** button last under the message
  and in the phone preview, after step 5.
- The **Form submitted** message in a conversation, in "Where the answers go".

The table of what a form can ask for and the "Good to know" list stay in prose:
they explain rules, not screens.

The guide describes a campaign message, so a recipient example was considered.
It would help: the message with its form button, and the form the button opens,
are the clearest way to show the result. It is pending because the editorial
`messages` component has no form button and no form screen, and a recipient
example must not be drawn as an invented screenshot. Until the component
supports it, "What your customer sees" describes the experience in prose.

## Verification

- A local `jekyll build` on 2026-11-11 completed and produced both routes. Each
  page shows the guide in the Numbers topic between Share a location and
  Exclusive short codes, every internal link resolves to its route in the
  page's language, and the inline tool icon is served from
  `images/icons/editor/note-alt.svg`.
- That build ran on Ruby 3.3.12 because 3.3.6 was not installed locally, and
  without `JEKYLL_ENV=production`. `yarn build` and its security header check
  have not been run for this draft.
- The rendered pages have not been inspected in a browser at desktop and
  mobile widths.
- Not published; no public URL to verify.
