## Short Links

<div class="note">
  Custom short link domains are part of <i>White Label</i> and require a subscription that includes this feature. Refer to our <a data-external href="https://www.hellotext.com/pricing" class="active" target="_blank">pricing</a> and confirm availability for your business.
</div>

Hellotext uses short links to redirect to a destination and record clicks associated with the corresponding message. Their default address has the format `hello.link/XXXXXX`. An alias changes the visible domain, for example, to `go.example.com/XXXXXX`; it retains the link code and configured destination.

A recognizable domain can help identify your brand. It does not guarantee trust, permission to send, visitor identity, or an attributed sale. Message context, eligible signals, and attribution windows still have their own rules. See [Tracked links in campaigns, journeys, and playbooks]({% link _analytics-reporting-attribution/tracked-links.md %}).

Choose a domain or subdomain you control and can maintain over time. A dedicated subdomain, such as `go.example.com`, avoids replacing the domain used by your store or email. The example domains in this guide are fictional.

## Configuring the alias on Hellotext

You must be an **Owner** or **Administrator**, have a verified Hellotext account email, and a subscription with custom domains enabled. If the field is disabled, review the subscription with the owner or support before continuing.

Under **Settings > General**, confirm the business and select **Edit Business**. The header shows the fictional business **Enterprise**, public ID **4ONLdN32**; that name does not indicate its subscription plan. The public ID identifies the business and does not belong in the domain field.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real General header with the fictional business Enterprise, its public ID, and Edit Business entry.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-en-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-en.png" srcset="/images/developers/custom-store-integration/business-en.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Real General header with the fictional business Enterprise, its public ID, and Edit Business entry." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; the state is explained in the preceding text.</figcaption>
</figure>

In **Domain for short links**, enter only the complete hostname, for example, `go.example.com`: without `https://`, a port, path, spaces, or the `/XXXXXX` code. Your business must control the domain, and it must not be reserved as another Hellotext business's alias. It differs from **Authorized domains**, which limits where captures such as Webchat, popups, and forms load.

The figure shows the real field with **go.example.test**, a fictional unsaved draft. This demonstration has no connected domain, configured DNS, or completed verification.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Real Domain for short links field with fictional unsaved go.example.test; it does not establish DNS or verification.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 419px; margin: 0 auto;">
      <picture>
        <img src="/images/integrations/custom-domain-for-short-links/domain-en.png" srcset="/images/integrations/custom-domain-for-short-links/domain-en.png 2x" style="width: auto; margin: 0 auto;" width="802" height="348" loading="lazy" decoding="async" alt="Real Domain for short links field with fictional unsaved go.example.test; it does not establish DNS or verification." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Real interface with fictional data; the state is explained in the preceding text.</figcaption>
</figure>

Review the hostname and select **Save** when you are ready to configure that real domain. Saving starts the pending configuration; it does not publish DNS records or prove HTTPS or links work. Complete the following setup and verify the result before using it in messages.

## Configuring a subdomain

At the provider managing your domain's active DNS, configure the dedicated subdomain to point to `hello.link`. This table shows an example:

| DNS field | Example value |
| --- | --- |
| Type | `CNAME` |
| Name or host | `go`, or `go.example.com` if the provider requires the complete name |
| Target or value | `hello.link` |

The DNS value does not include `https://` or a path. Check that the provider does not append the domain twice and that no other conflicting CNAME, A, or AAAA record has the same name. Do not replace store or email records with this example.

Your provider determines how to enter the name, TTL, and proxy options. Follow its documentation; for example, [creating subdomain records in Cloudflare](https://developers.cloudflare.com/dns/manage-dns-records/how-to/create-subdomain/). DNS and HTTPS are separate checks: confirm with Hellotext support that the custom domain can serve HTTPS requests with a valid certificate before sending it to customers.

## Configuring an apex domain

A root or apex domain, such as `example.com`, requires a compatible provider option. It may be called **ALIAS**, **ANAME**, or **CNAME flattening**; these mechanisms are not interchangeable across services. Do not create an ordinary apex CNAME or assume every ALIAS accepts `hello.link` as its target.

Read your provider's documentation and confirm the Hellotext setup with support. [Cloudflare explains its CNAME flattening](https://developers.cloudflare.com/dns/cname-flattening/); [Route 53 restricts alias record targets](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html). If your provider cannot support the required target, use a dedicated subdomain.

Do not replace your store's apex without planning the effect on the website and other services. Publishing DNS does not configure the HTTPS certificate by itself. Propagation depends on the provider, TTL, and caches; it can take hours and has no universal 24-hour deadline.

<a id='verification' href='#verification' class='navigator'></a>
## Verification Process

Hellotext schedules checks for pending aliases every **5 minutes** and rechecks verified aliases **daily**. These tasks are queued: they do not guarantee an update exactly five minutes after saving.

The check makes an **HTTPS** request to the configured domain at Hellotext's verification path and treats an **HTTP 200** response as positive. It is not a network ping or an independent confirmation of every DNS record or link destination. Ongoing HTTPS link access needs its own validation.

Return to **Settings > General**. When an alias is saved, the header shows **Short Links Domain** and the indicator reports **Pending Verification** or **Verified** when inspected. The preceding figure does not show these states because its domain was never saved.

New short links use the alias when it is verified; otherwise they use `hello.link`. Changing the hostname clears its verification and requires another check. A failed subsequent check can also remove its verified state.

If it remains pending, review the saved hostname, active DNS, record conflicts, and HTTPS access. Avoid rules sending every path to a homepage, login, or challenge. Contact support with the business, domain, provider, state, and change time with its time zone; do not share passwords or DNS keys.

Before using it in a send, validate an authorized test link with isolated data and confirm the expected final destination. Opening a message link can record a click and affect reports: do not use customer links to check setup. **Verified** does not prove message delivery, consent, or attribution.

## Notes on Changing the Alias

Plan the transition before saving a new hostname or clearing the field. Links already included in messages retain their old address; updating the alias does not rewrite what customers received. New links return to `hello.link` until the new alias is verified.

Keep control of the old domain and maintain HTTPS. Coordinate with its server administrator a redirect to `https://hello.link` that **preserves the complete path and query parameters**: for example, `/XXXXXX` must still reach the same code. Do not redirect every link to a homepage or assume that keeping only the old CNAME will be sufficient after the change.

Check old link continuity and the new setup separately through authorized isolated tests. Hellotext does not automatically configure your old domain's server or redirects. If you cannot maintain them, coordinate the transition with support before removing the alias. For business setup, see [Set up your business]({% link _getting-started/setting-up-your-business.md %}).
