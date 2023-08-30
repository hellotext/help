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

## Configuring a subdomain

Navigate to your DNS provider and create a CNAME record that points your subdomain to the default domain for your site. 
For example, if you want to use the subdomain `shop.mysite.com` for Short Links, 
create a CNAME record that points `shop.mysite.com` to `hello.link`.
For more information about how to create the correct record, see your DNS provider's documentation.

## Configuración de un dominio apex

To set up an apex domain, such as example.com, you must configure a custom domain in your business settings and at least one ALIAS, ANAME, or A record with your DNS provider.
For example, if instead of using the subdomain `shop.mysite.com` for Short Links, you want to use the apex domain `mysite.com`,
you need to create an ALIAS, ANAME, or A record that points `mysite.com` to `hello.link`.
For more information about how to create the correct record, see your DNS provider's documentation.

<div class="note">
    Note: DNS changes can take up to 24 hours to propagate.
</div>

After you configure the alias on Hellotext, Hellotext will start using the configured alias when it has verified 
that the alias is configured correctly on your DNS provider and can receive calls.

## <a id='verification' href='#verification' class='navigator'>Verification Process</a>

Hellotext attempts to verify the alias by pinging it every 5 minutes. 
Once the ping is successfully, this means the the ping has traveled from Hellotext to your DNS provider and back to Hellotext.
This means that the alias is configured correctly and Hellotext will start using the alias for Short Links at that point.
When you update the alias, Hellotext will start the verification process again.

## Notes on Changing the Alias

Aliases are used in messages sent to customers, after setting the alias to a specific domain, you should be careful when changing it again.
If you change the alias, Hellotext will start using that alias immediately after it has verified it. 
But, messages that were sent before the alias was changed will still use the old alias. This means that when you are changing the alias,
you need to set up correct redirects to `hello.link` for the old alias, so that customers can still open Short Links sent to them before the alias was changed.
Hellotext is not responsible for routing older Short Links to the correct destination, so you need to make sure that the old alias is still valid.
