## Short Links

<div class="note">
    Note: Short Link aliasing is part of the <i>White Label</i> feature. 
    Refer to our <a data-external href="https://www.hellotext.com/pricing" class="active" target="_blank">Pricing</a> for more information. 
</div>

Hellotext generates ShortLinks that are used to collect customer information and track their activity on their site. 
With Short Links, you can know which Campaign or Journey sent the message to the customer, when did they click the Short Link,
and where they were redirected to. 

By default, Hellotext generates Short Links using the domain `hello.link`. Short Links will be displayed in the following format
when sending to customers: `hello.link/XXXXXX`.

Aliasing a Short Link allows you to specify a specific domain to use instead of `hello.link`. It helps to make your
messages more personalized as your customers to recognize the domain and automatically trust the link, this can be useful when building brand loyalty.

For example, if you own the domain `mydomain.com`, you can alias your Short Links to use `mydomain.com` instead of `hello.link`.
Then, when generating Short Links, Hellotext will use the domain you specified instead of `hello.link`. 
Short Links will be displayed in the following format when sending to customers: `mydomain.com/XXXXXX`.

## Configuring the alias on Hellotext

To configure the alias, you need to have be an Administrator or Owner of the business. 
Firstly, login to your account, and go to the business' settings page. Click on _Edit Business_
Then, enter a your domain name in the CNAME field, make sure that the cname corresponds to a domain that you own.

## Configuring the alias on your DNS provider

Navigate to your DNS provider and create a CNAME record that points your subdomain to the default domain for your site. 
For example, if you want to use the subdomain `www.myshop.com` for Short Links, 
create a CNAME record that points `www.myshop.com` to `hello.link`.
For more information about how to create the correct record, see your DNS provider's documentation.

<div class="note">
    Note: DNS changes can take up to 24 hours to propagate.
</div>
