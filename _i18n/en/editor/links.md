Hellotext links are special links that are created in the Editor's link element. 
These are special links that can be embedded in your messages and can be used to gather analytic information about your Campaigns and Journeys.

Links are created by using the link element in the Editor. The link element is a special element that allows you to create a link that can be embedded in your message.
The link element has the following icon <img style='display: inline;'  src="{{site.url}}/images/icons/link.svg">
and is located in the Editor's toolbar.

Links have the following structure: `hello.link/XXXXXX` where `XXXXXX` is the link's unique identifier. 

When these links are clicked. We redirect the user to the URL specified when creating the Link and we will attach a `hello_session` identifier 
to the URL. This identifier is used to identify the user and can be used to track actions performed by the user. 
You can look at our client-side <a class="active" href='https://github.com/hellotext/hellotext.js'>JavaScript library</a> that helps you with tracking related events.
