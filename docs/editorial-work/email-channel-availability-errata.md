# Email channel availability linked errata

## Scope

- The published `numbers/email-channel-fundamentals.md` pair remains `pending` for its own complete editorial and visual review. This narrow correction is linked from the Messaging channels overview batch and does not close that row.
- Original ES and EN bodies were preserved at `originals/email-channel-availability-errata/`. SHA-256: ES `b42661bd46208829a742e5bdfb1d51435ecc891e4ece96e097e71ed241fd0509`; EN `900be33309b01075d31a6ee051cd044acfbeb21e1f8ceeb6000dca1639543527`.
- Preserve titles, routes, related links and publication state. Change only the cross-channel availability statements and scope the existing Inbox checklists.

## Verified correction

The previous `Where you can use Email` section excluded campaigns, autonomous playbooks and routes. In the reviewed Rails source, `app/views/campaigns/wizard/technologies.html.erb` renders the Email choice; the campaign delivery engine checks feature and subscription eligibility. `app/models/flux/resolver.rb` supports Email for authored Journey Message and Question steps with an Email design. `app/views/playbook/component/channels/_form.html.erb` lists Email, and `app/models/cg/composer/engine/eligibility.rb` checks the recipient, business access and active sender for proactive playbooks. Selection alone is not a successful send. The corrected ES/EN text explains these conditions without promising Email for every account or workflow.

The article's remaining procedures show individual Inbox conversations. Their opening and closing checklists are now explicitly scoped to Inbox, so the newly corrected campaign and Journey statement does not make the Inbox-only steps sound universal.

## Visual decision and verification

This correction changes the availability paragraph, not a distinct control tutorial. A single account screenshot would prove neither access for all businesses nor delivery through every supported workflow. Keep the pair pending for its complete section-by-section figure review. Both full edited pages were reviewed with the Messaging channels overview in a local browser at 1280 CSS px desktop and 390 CSS px mobile; the corrected availability sections remained legible and the pages did not overflow horizontally. `yarn build` passed. Public verification remains pending.
