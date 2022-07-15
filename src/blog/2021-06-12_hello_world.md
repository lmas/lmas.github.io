---
title: Hello world
date: 2021-06-12
abstract: Introduction and documentation of this site
toc: true
banner: ./bg-hello_world.jpg
banner-alt: Flying seagulls in a blue skye.
banner-author: Darya Dobrovolskaya
banner-source: https://unsplash.com/photos/7OwdK-lXf6E
---

*Updated 2022-07-13 with new content that reflects current setup.*

Hello world! I'm Alex.

I write open source software and have ran various Linux/FreeBSD servers as a hobby for myself for the last 10 years.
Mostly it's been web-related stuff, services and random tinkering.

I decided to getting started on this blog as a personal space for myself,
as a way for me to better gather all the geeky notes, references, technical documentation and whatever else that I
might tinker with.

Let's get started with how I built this site.




# Site source

It's all just static "web" files with content mostly generated from simple [Markdown] files.
The initial version of the blog was running on my home made tool, but I decided to instead replace it with [Pandoc]
to cut down on future maintenance costs.

The whole source for this site can be found on [Github], so it's just easier to go browse that if you want any details.

Some references for the more common (or not) static files semi expected to be found on a web server:

- [robots.txt]: Tell any indexing bots and other crawlers to play nice.
- [sitemap.xml]: Offers a convenient map of the site to search engines and their bots.
- [feed.xml]: Allows humans to subscribe to the blog. RSS/Atom is not dead.
- [security.txt]: Quick info for "security researchers" scanning the web.
- [humans.txt]: Quick info for "other developers" spelunking the web.

[Markdown]: http://larus.se/blog/2021-06-13_markdown_reference.html
[Pandoc]: https://pandoc.org/
[Github]: https://github.com/lmas/lmas.github.io
[robots.txt]: http://www.robotstxt.org/
[sitemap.xml]: https://en.wikipedia.org/wiki/Site_map
[security.txt]: https://securitytxt.org/
[humans.txt]: https://humanstxt.org/
[feed.xml]: https://en.wikipedia.org/wiki/Atom_(Web_standard)




# Web design

I'm sticking with plain html/css templates written by hand and only ever use [vanilla-js] when I absolutely need a
specific, interactive thing.
[MDN] has great resources for looking up all three specifications and [Can I use...] can show browser compatibility.

To better fit all kinds of screens today, it's a good idea to adopt responsive web design.
Here's a few resources for that:

- https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design
- https://alistapart.com/article/responsive-web-design/
- https://web.dev/responsive-web-design-basics/
- https://css-tricks.com/snippets/css/a-guide-to-flexbox/

While at it, one might as well add some easy tricks for improved site accessibility. It's good karma.

- https://developer.mozilla.org/en-US/docs/Learn/Accessibility/HTML
- https://www.w3.org/WAI/tutorials/page-structure/
- https://bootcamp.uxdesign.cc/beginners-guide-to-web-accessibility-514644750b0f

When the basic page structure is in place, it's time to add a theme and colours.

<embed type="image/svg+xml" src="./color_theme.svg" />

The first two colours I switch between background/font depending on [prefers-color-scheme], i.e. a simple dark mode.
They also got a nice, smooth [contrast-ratio] between them which improves accessibility and maybe late night reading.
The last colour is simply for flair.

As for the typography, I used to have custom fonts loaded but recently decided to remove them and instead let the
browser pick one from a [web safe] list.
Saves bandwidth for everyone and any reader browsing the site can enjoy their own custom font if they have one set.

[vanilla-js]: https://vanilla-js.com/
[MDN]: https://developer.mozilla.org/en-US/
[Can I use...]: https://caniuse.com/
[prefers-color-scheme]: https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme
[contrast-ratio]: https://contrast-ratio.com/#%23313137-on-%23FFFEF7
[web safe]: https://www.w3schools.com/cssref/css_fonts_fallbacks.asp




# Artwork

I wanted to spice things up a little with some art here and there.
Currently I'm trying out showing small banners on the blog posts, with a sleek size of 960px by 100px.

A good place for finding photos online has been [Unsplash] which has a fair amount of quality works,
with a very permissive license.
And when the need for home made art is called for, these open source tools have been helpful:

- [Inkscape]: For creating vector art.
- [Krita]: For editing and creating raster art (and has a helpful page for [saving to the web]).
- [peek] and [scrot]: Records GIFs and takes screen shots, respectively.
- [optipng] and [jpegtran]: Optimizes and shrinks file sizes of PNG/JPEG files.

[Unsplash]: https://unsplash.com/
[Inkscape]: https://inkscape.org/
[Krita]: https://krita.org/en/
[saving to the web]: https://docs.krita.org/en/tutorials/saving-for-the-web.html
[peek]: https://github.com/phw/peek
[scrot]: https://github.com/resurrecting-open-source-projects/scrot
[optipng]: http://optipng.sourceforge.net/
[jpegtran]: https://github.com/libjpeg-turbo/libjpeg-turbo


# Site validation

When the site is finally built and running on some host, it's time to run a bunch of validators against it.
Accessibility and standards compliance is, again, pretty important to comply with as a good-behaving citizen of the web.
At least in my own opinion.

The validators I ran was:

- [W3C Unicorn]: The all in one HTML/CSS/Feed validator.
- [W3C Link Checker]: Finds missing or broken links. It also shows forbidden links blocked by robots.txt.
- [Google's Mobile Friendly Test]: Reports on mobile friendliness and shows possible issues.
- [Toptal's Colorblind Filter]: Shows how colour-blind people might experience a page (coloured links tends to disappear).
- [Google's web.dev]: Gives you a Lighthouse report and scores a page's performance, accessibility and SEO.
- [Mozilla's Observatory]: Inspects and scores the HTTP headers and TLS certs for security issues.

Easy web-based tools, really, although you have to manually run them yourself every time.
In the future it would be a good idea to replace them with some kind of offline CLI tools instead,
so the tests could be run automagically on each build.

[W3C Unicorn]: https://validator.w3.org/unicorn/
[W3C Link Checker]: https://validator.w3.org/checklink
[Google's Mobile Friendly Test]: https://search.google.com/test/mobile-friendly
[Toptal's Colorblind Filter]: https://www.toptal.com/designers/colorfilter
[Google's web.dev]: https://web.dev/measure/
[Mozilla's Observatory]: https://observatory.mozilla.org/




# Content hosting

I've previously been hosting my content on [Render] for free which has been fine.
But I really wanted to simplify things and instead started to host my content 100% on Github for now.

With [Actions] one can set up automatic deployments pretty easily,
but it can be quite messy to set up right and requires some tweaking.
Finally managed to set up automatic content builds though, updated blog content will be rebuilt and deployed whenever
I push new changes and the news feeds updates automagically each day by itself. Perfect.

Once that's done though it's just a few clicks to set up [Pages] once and you got free content hosting via Githubs CDN.
Easy peasy. Although I'm missing the option to set custom HTTP headers.

I would prefer to self host on a rented VPS, sometime in the future, with all the freedom that enables.
But for now it's a nice setup that's very low maintenance and budget friendly.

[Render]: https://render.com/
[Actions]: https://docs.github.com/en/actions
[Pages]: https://docs.github.com/en/pages




# Monitoring and alerting


[OnlineOrNot] tracked the site uptime in the past for me and it worked fine.
But I realised I didn't really care that much about it.
Most of the time it was up at 100% (per week) and once or twice the CDN went down for an hour.
But that didn't really affect myself in a noticeable way so I simply dropped that service.

Still would prefer to have web server logs to measure traffic, but that's only doable while self hosting I guess.

I did bite the bullet and started to use [GoatCounter] for some free JS analytics.
Don't really like the idea of using JS for analytics, it tends to log too much device information that's mostly
useless for me.
I still want hints about my traffic though, so let's see how that goes...

[OnlineOrNot]: https://onlineornot.com
[GoatCounter]: https://www.goatcounter.com/



# Conclusion

So, to summarise everything up.
It's been pretty easy to write plain HTML/CSS templates, generating content with Pandoc and hosting it on Github.
It's free and low maintenance.
And it just works™.

Alright, that's everything for now.
