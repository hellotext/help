Hellotext links are tracked links created with the editor's link tool.
They can be embedded in your messages and used to gather analytics from campaigns, routes, playbooks, Inbox conversations, and other sends.

Links are created with the link tool in the editor. The link tool lets you add a tracked link inside your message.
The link element has the following icon <img style='display: inline;'  src="{{site.url}}/images/icons/link.svg">
and is located in the editor toolbar.

Links have the following structure: `hello.link/XXXXXX` where `XXXXXX` is the link's unique identifier.

When these links are clicked, Hellotext redirects the customer to the URL specified when creating the link and attaches a `hellotext_session` identifier
to the URL. This identifier is used to identify the session and can be used to track actions performed by the customer as signals.
You can look at our client-side <a class="active" href='https://github.com/hellotext/hellotext.js'>JavaScript library</a> that helps you with tracking related events.
