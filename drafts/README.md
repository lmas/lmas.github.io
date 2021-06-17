
# Drafts

This directory contains a list of **drafts** for the blog, in various stages of incompleteness.
They are **not final** and will be subjected to changes!

## Ideas for future posts

This is a list of interesting things and links to third party sources. The intent is *not to steal content whatsoever*.
It's simply a way for myself to document my own struggles and experiences with these topics (using these source references)
and one day I would like expand on them.
All credits and copyrights belong to the original authors.

- github actions and quirks (cron jobs running late and in UTC for example)
  https://github.com/actions/checkout
  https://docs.github.com/en/actions
  https://docs.github.com/en/actions/reference/encrypted-secrets

- setting up a freebsd gateway at home (dns, dhcp, firewall, wifi, storage etc.)

- publishing go code:
  https://golang.org/doc/modules/publishing
  https://golang.org/doc/modules/release-workflow#first-stable
  https://stackoverflow.com/questions/29599209/how-to-build-a-release-version-binary-in-go

- running single file scripts without using go modules? Per william's mail
  https://blog.golang.org/go116-module-changes

- type safe data in templates:
  https://philipptanlak.com/web-frontends-in-go/

- safely closing written files:
  https://www.joeshaw.org/dont-defer-close-on-writable-files/

- current best practices for making favicons:
  https://stackoverflow.com/q/2268204
  https://news.ycombinator.com/item?id=25520655
  Simplest thing to do is a 32x32px PNG, rename it to `favicon.ico` and add tag:
  <link rel="shortcut icon" type="image/png" href="/favicon.ico">

- tiniest "SEO" using simple html elements in a page:
  https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML
  https://developers.google.com/search/docs/advanced/crawling/special-tags
  Seems to only depend on one tag (not sure about other engines):
  <meta name="description" content="SEO friendly description of page">
  https://ogp.me/
  Made by facebook and hopefully used by others (TODO: verify this!):
  <meta property="og:type" content="website or article" />
  <meta property="og:title" content="page title" />
  <meta property="og:url" content="full page url" />
  <meta property="og:image" content="page logo" />
  <meta property="og:description" content="optional page description" />

- easiest way to make a css only dark mode:
  https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme
  simple tool to toggle scheme in firefox:
  https://stackoverflow.com/questions/56401662/firefox-how-to-test-prefers-color-scheme/60481298#60481298
