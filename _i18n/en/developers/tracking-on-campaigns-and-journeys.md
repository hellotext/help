After sending a campaign or activating a journey you will want to learn about its results: how customers engaged and behaved. And ideally, you also would like to keep this information in such a way that it can be re-used in future marketing campaigns.

Luckily enough, this is exactly the purpose behind using Campaigns and the good news is that it is made simple to implement. 

## Short links and Sessions

A short link is simply a way to reduce the length of a URL to something that looks like `hello.link/3lsnvh`. 

This help you overcome the 160-character limit of text messages leaving more space for the message. On text messages also shorter links also feels more inviting. 

You can share shorten links to your messages on Campaigns and Journeys.

When customers click on a short link they are redirected to the original URL. Hellotext  attaches a GET parameter to the original URL called `hellotext_session_id` containing a session identifier uniquely generated from each click.

Every time a customer clicks on a short link an event will be created and will appear on his profile's activities. Clicks are also aggregated to the reports of the campaign or journey.

## Getting started tracking

If your site runs with any of the platforms we already offer integration support, you can connect it to start tracking events automatically. 

If your integration is not yet supported or if you have your own custom implementation, you can start tracking events installing the [**Hellotext.js**](https://github.com/hellotext/hellotext.js) library.

### Setup the library on your site

Begin by installing the library.

```bash
npm install hellotext
```

Import the library into your app.

```javascript
import Hellotext from "hellotext";
```

Initialize the library passing the public `HELLOTEXT_BUSINESS_ID` identifier that represents the business.

You can find it from the Business's settings page.

```javascript
Hellotext.initialize("HELLOTEXT_BUSINESS_ID");
```

## Tracking client-side events

Tracking events is straightforward and perhaps the simplest example is tracking a page view:

```javascript
Hellotext.track("page.visited");
```

Please refer to the [**library usage documentation**](https://github.com/hellotext/hellotext.js#usage) for a complete reference on all the actions and attributes available.

## Tracking server-side events

Sometimes you may want to track events that happened outside the browser, for example you may want to track events directly on the server-side of your system, or at time where the customer may not be present. 

This is possible by capturing the session identifier and store it on your system to use it later when you want to track an event associated to this session.

To obtain the current session, simple call `Hellotext.session`:

```javascript
Hellotext.session
// Returns c7a42761-f34d-41a2-b078-6a8172690350
```

You can then track events sending a `POST` request directly to the API. 

Learn more on [**External tracking**](/external-tracking)