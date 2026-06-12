# Hellotext Help Center

The public [Hellotext](https://www.hellotext.com) help center, served at **[help.hellotext.com](https://help.hellotext.com)**.

It is a [Jekyll](https://jekyllrb.com) site with **bilingual content (English and Spanish)** powered by [`jekyll-multiple-languages-plugin`](https://github.com/kurtsson/jekyll-multiple-languages-plugin), styled with [Tailwind CSS](https://tailwindcss.com) (compiled through [`jekyll-postcss`](https://github.com/mhanberg/jekyll-postcss)), and deployed on Netlify.

## Prerequisites

The versions below are the ones used by the production build (see `netlify.toml` and `.ruby-version`). Match them to avoid surprises.

| Tool    | Version   | Where it's pinned                 |
| ------- | --------- | --------------------------------- |
| Ruby    | `3.3.6`   | `.ruby-version`                   |
| Bundler | `2.4.22`  | `netlify.toml`                    |
| Node.js | `18`      | `.nvmrc` / `netlify.toml`         |
| Yarn    | `1.22.22` | `package.json` (`packageManager`) |

Use a version manager such as [rbenv](https://github.com/rbenv/rbenv) / [asdf](https://asdf-vm.com) for Ruby and [nvm](https://github.com/nvm-sh/nvm) for Node. Enable Yarn via Corepack: `corepack enable`.

> If the exact Ruby patch `3.3.6` isn't installed, the nearest `3.3.x` patch (e.g. `3.3.11`) builds fine with the pinned Jekyll `~> 4.4`.

## Install

```bash
bundle install   # Ruby gems (Jekyll + plugins)
yarn install     # Node packages (Tailwind / PostCSS toolchain)
```

Or, with the bundled script: `yarn setup`.

## Local development (serve)

```bash
bin/jekyll               # serves on http://localhost:4000 with livereload
# equivalently:
bundle exec jekyll serve
# or:
yarn serve
```

`bin/jekyll` accepts an optional port argument, e.g. `bin/jekyll 4001`.

## Build (production / verification)

```bash
JEKYLL_ENV=production bundle exec jekyll build   # outputs to _site/
# equivalently:
yarn build
```

This is the **exact command Netlify runs** to publish the site.

> **Gotcha:** a plain `bundle exec jekyll build` (without `JEKYLL_ENV=production`) fails with `Could not connect to the PostCSS server`. The `jekyll-postcss` plugin expects its dev server during `serve`; for a one-off build you must use the production environment shown above. Always use `yarn build` / the production command for a standalone build or CI check.

## Project structure

```
_config.yml              Site config: collections, languages, plugins
netlify.toml             Deploy config (build command + Ruby/Bundler/Node versions)

_<collection>/           Guide stubs per topic, e.g.:
  _integrations/         (Shopify, Wix, Woo, WhatsApp, VTEX, …)
  _journeys/  _captures/  _campaigns/  _numbers/  _audience/  _billing/  …
_i18n/
  en.yml  es.yml         UI string translations
  en/<collection>/...    English guide bodies
  es/<collection>/...     Spanish guide bodies
_topics/                 Topic landing pages that list each collection's guides
_layouts/  _includes/    Page templates
images/  css/  fonts/    Static assets
```

Each guide is a thin **stub** in a collection directory (front matter only, plus a
`{% translate_file %}` include) whose body lives in **both** `_i18n/en/...` and
`_i18n/es/...`.

## Adding a guide

1. Create the stub, e.g. `_integrations/connect-example.md`:

   ```yaml
   ---
   languages: ["en", "es"]

   en:
     title: Connect Example
     description: One-line summary shown in the topic list.
   es:
     title: Conecta Example
     description: Resumen de una línea para la lista de temas.

   permalink: connect-example
   permalink_es: conecta-example

   layout: guide
   topic: integrations
   popular: false
   ---
   { % translate_file integrations/connect-example.md % }
   ```

2. Add the translated bodies at `_i18n/en/integrations/connect-example.md` and `_i18n/es/integrations/connect-example.md`.
3. Run `yarn build` and confirm the guide renders at its permalink and appears in the correct topic page (e.g. `/integrations` and `/es/integraciones`).

The `connect-shopify` integration is a complete, recent example to copy from.

## Deployment

Netlify builds with `JEKYLL_ENV=production bundle exec jekyll build` and publishes the `_site/` directory (see `netlify.toml`). Merges to the production branch deploy automatically.
