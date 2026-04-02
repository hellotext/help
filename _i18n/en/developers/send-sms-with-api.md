Sending SMS through the Hellotext API is a simple way to integrate reminders, confirmations, or notifications from your own system.

## Before you start

To send SMS through the API you need to:

* Have an account and a business already created in Hellotext.
* Create an authorization token from *Settings* -> *Authorizations*.
* Have SMS balance available in your business.

If SMS balance is not enabled yet, please contact our team to activate it.

## Create the authorization token

Once you are inside your business, go to *Settings* -> *Authorizations*.

Click *Create new token*, give it a name that helps you identify the integration, and copy the generated value. You will use it in the `Authorization` header of each request:

```text
Authorization: Bearer YOUR_TOKEN
```

## Send an SMS

To send a message, make a `POST` request to `https://api.hellotext.com/v1/messages`.

Send these fields in the request body:

* `body`: message content.
* `destination`: destination number in international format, for example `+573176655211`.
* `technology`: delivery technology. For SMS use `sms`.

### cURL example

```bash
curl -X POST "https://api.hellotext.com/v1/messages" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -F "body=Hello, this is an SMS sent through the Hellotext API." \
  -F "destination=+573176655211" \
  -F "technology=sms"
```

If the request is accepted, the API will respond with a JSON similar to this:

```json
{
  "status": "received"
}
```

### Postman example

If you prefer to test it in Postman, configure:

* Method: `POST`
* URL: `https://api.hellotext.com/v1/messages`
* Header: `Authorization: Bearer YOUR_TOKEN`
* Body: `form-data`

Then add these fields to the body. For example:

* `body`: `Hello, this is an SMS sent from Postman.`
* `destination`: `+573176655211`
* `technology`: `sms`

You can also use this header as an example:

* Header `Authorization`: `Bearer YOUR_TOKEN`

## Pricing, length, and encoding

Sending rates depend on your configuration and destination. You can learn more in the [pricing section](https://www.hellotext.com/precios).

By default, SMS messages use `GSM-7 Latin` encoding and each message has a `160` character limit.

If you go over that limit, Hellotext automatically concatenates the content into an additional message and the cost is billed as two SMS messages.

If the text includes characters that are not compatible with `GSM-7`, such as emojis, Hellotext will automatically try to use `UCS-2` encoding. This mode is available in Colombia.

When a message uses `UCS-2`, the maximum length is reduced to `80` characters per message.

## Add shortlinks inside the message

You can generate a short link directly inside the message text using the `{shortlink:URL}` syntax.

For example:

```text
Learn more here {shortlink:https://www.tunegocio.com}
```

Hellotext will replace that instruction with a short link when the message is sent.

If you want to use your own short link domain, see the [custom domain for short links guide](/setting-up-custom-shortlink-domain).

## Profiles and contacts

You do not need to create a profile in advance to make a one-off send to a number using `destination`.

However, if you also want to keep contact history, segment audiences, or reuse that data in campaigns and automations, you can:

* Import your contacts from the Hellotext interface.
* Create profiles programmatically with the [API reference for creating profiles](https://www.hellotext.com/api#create_a_profile).
