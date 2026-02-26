Sometimes you may want to track events that happened outside the visitor browser. For example, you may want to track events on the server-side of your system, or at some time when the customer is not present.

You can track events by sending a `POST` request directly to the API and passing either the profile identifier or the session identifier.

The following examples use ruby's [**HTTParty**](https://github.com/jnunemaker/httparty) library. This may vary depending on the programming language, but the nature of the request remains the same.

When making a request to the API make sure to authenticate by setting the `Authorization` bearer token as the example. You can create an authorization token from the Tokens section in the business Settings.

### Tracking by profile

You can track events directly to profiles by simply specifying the profile identifier when tracking the event. If the profile doesn't exist on Hellotext you must create it first. We recommend reading the [**API reference for creating a profile**](https://www.hellotext.com/api#create_a_profile).

```ruby
HTTParty.post "https://api.hellotext.com/v1/attribution/events", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    action: "product.purchased",
    product: "vxqQJ3Yg",
    profile: "PROFILE_ID"
  }.to_json
```

Replace the `PROFILE_ID` with the profile identifier of your customer. 

If the request was made correctly the API should respond with a HTTP Status code of `201` and a JSON response similar to this:

```json
{
  "state": "ok"
}
```

### Tracking by session

This is perfectly possible by capturing the session identifier and keeping it on your system to use it later when tracking an event.

To obtain the current session, simply call `Hellotext.session`:

```javascript
Hellotext.session
// Returns bBJn9vR15yPaYkWmR2QK0jopMeNxrA6l
```

Perform the following request to the API:


```ruby
HTTParty.post "https://api.hellotext.com/v1/attribution/events", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    action: "product.purchased",
    product_id: "vxqQJ3Yg",
    session_id: "HELLOTEXT_SESSION_ID"
  }.to_json
```

You should replace the `HELLOTEXT_SESSION_ID` with the session identifier.

If the request was made correctly the API should respond with a HTTP Status code of `201` and a JSON response similar to this:

```json
{
  "state": "ok"
}
```