Sometimes you may want to start tracking events from new visitors to your site who have not been identified and can't be associated on Hellotext yet. 

To help you start collecting events for them, the [**Hellotext.js**](https://github.com/hellotext/hellotext.js) library creates a new session identifier for every new visitor when it is not already set.

You can store this session identifier and later attach it to the profile when it becomes known, for example when the visitor registers or logins into the site.

Assuming you have the [**Hellotext.js**](https://github.com/hellotext/hellotext.js) already installed and configured, to obtain the current session, simple call the method `Hellotext.session`:

```javascript
Hellotext.session
// Returns bBJn9vR15yPaYkWmR2QK0jopMeNxrA6l
```

Keep this value on your system as you will need to send it back using the API when the profile becomes known.

## Attach session to an existing profile

Once the visitor becomes known, for example after he logins into your site, you should make an API request to associate the unidentified session to his customer profile. 

Once the session is associated all tracked events associated to the session will become part of the customer profile.

The following example uses ruby's [**HTTParty**](https://github.com/jnunemaker/httparty) library. This may vary depending on the programming language, but the nature of the request remains the same.

When making a request to the API make sure to authenticate by setting the `Authorization` header with the bearer token as the example. You can create an authorization token from the Tokens section in the business Settings. 

```ruby
HTTParty.post "https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    profile_id: "PROFILE_ID"
  }.to_json
```

Replace the `HELLOTEXT_SESSION_ID` in the URL with the session identifier and `PROFILE_ID` with the existing profile identifier.

If the request was made correctly the API should respond with a HTTP Status code of `201` and a JSON response similar to this:

```json
{
  "id": "WBAkaqNz",  
  "type": "session",
  "profile_id": "MzYwlE50",
  "created_at": 1665684173,
}
```

## Attach session to new profile

If the profile doesn't already exist on Hellotext, you need to create it first. 

We recommend reading the [**API reference for creating a profile**](https://www.hellotext.com/api#create_a_profile) to learn how to specify customer attributes. You may want to create the profile with as many attributes as you have of your customer.

```ruby
HTTParty.post "https://api.hellotext.com/v1/profiles", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    first_name: "John",
    last_name: "Smith"
    phone: "+59899000001"
  }.to_json
```

The response will return the identifier of the profile. 

Use this profile identifier now to attach the session to following the instructions described on *Attach session to an existing profile*.