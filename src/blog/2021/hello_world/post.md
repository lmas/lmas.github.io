---
title: Hello world
published: 2021-06-12
short: Introduction and documentation of this site
tags:
- web design
- documentation
---

## About
Hello world! I'm Alex and this is my cave.

I write open source software and run a couple of linux/freebsd servers as a hobby. Mostly it's web-related stuff.
Recently decided to learn how to draw to be more creative and "artsy", but it's still too early for me to show anything
worth showing. *I guess I have to make a self portrait one day and put it on this page* :)

I'm also getting started on this blog, mostly for myself and for the sake of writing itself. It will just be a simple
space to gather all the geeky notes, references, technical documentation and whatever else that might pop up in my
head, so in other words it's mostly just a personal but public archive.

Another idea I've had rolling around in my head for a while is to keep a daily log of short and interesting "TIL" notes,
or "Today I learned" (aka trivia). Probably not daily.. but I think it could be fun anyway. And it could work as a
good source of new blog topics in the future, if I might need some inspiration.

And well, who knows? The archive might end up as a work portfolio too, if I end up with any good content (:

Enough day dreaming, on to the details of the blog itself and how it was built and designed.

**(I should warn you, the rest of this introducing post will just be a short rambling with a lot of link spam and random
technical references that I've looked up while working on the site)**

## Site source

It's all just static "web" files with content mostly generated from [commonmark](https://commonmark.org/) formatted
pages. I wrote my own generator, [called dumblog](https://github.com/lmas/dumblog), to do this for me.
Why? Because [Hugo](https://gohugo.io/), [Jekyll](https://jekyllrb.com/) and related tools felt a bit too bloated and
complicated for my own taste. I also love to roll my own solutions and learn about new stuff.

*Local [reference page for commonmark](/blog/2021/commonmark/index.html), conveniently showing off all the formatting.*

The whole source for this site can be found on [Github](https://github.com/lmas/larus.se), so it's just easier to go
browse that if you want any details.

Some references for the more common (or not) static files semi expected to be found on a web server:

- [robots.txt](http://www.robotstxt.org/) is of course a must for playing nice with the indexing bots and crawlers.
- [sitemap.xml](https://en.wikipedia.org/wiki/Site_map) offers further help to the search engines.
- [security.txt](https://securitytxt.org/) might encounter automated "security researchers", so it's mostly for fun.
- [humans.txt](https://humanstxt.org/) kind of the same deal and it's cute, so why not.
- [feed.xml](https://en.wikipedia.org/wiki/Atom_(Web_standard)) is pretty standard for blog/news feeds. RSS/Atom is not dead.

## Web design

I'm sticking with plain html/css templates and only use [vanilla-js](http://vanilla-js.com/) for the more optional and
totally not required eye candy. I feel accessibility is pretty important (and good karma) too, so a couple of easy tricks
from a [beginner's guide](https://bootcamp.uxdesign.cc/beginners-guide-to-web-accessibility-514644750b0f) is nice.

I think black-on-white text is too harsh on the eyes sometimes, so I wanted to pick some yellow-ish background colour.
Enter [Cosmic latte](https://en.wikipedia.org/wiki/Cosmic_latte). Lower it's brightness to about 25% and you get a black
foreground colour for the text, voilà!
It's got great [contrast ratio](https://contrast-ratio.com/#%23403E3A-on-%23FFF8E7) for accessibility and it works
pretty good for dark mode too using
[prefers-color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme).

I also wanted a [responsive web design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
([intro](https://alistapart.com/article/responsive-web-design/), [basics](https://web.dev/responsive-web-design-basics/))
using [flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/), so the pages would fit both regular computer
screens and tiny phones. While googling I also stumbled upon using a maximum width of [960px](https://960.gs/)
(nevermind the grid things).

As for the typography, I picked [Lato](https://www.latofonts.com/) for the regular text content,
[Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono) for code and finally
[Library 3 AM](https://www.fontsquirrel.com/fonts/library-3-am) for the flickering neon sign logo. Just my own personal
preferences. And [neon signs](https://duckduckgo.com/?q=neon+sign&ia=images&iax=images) a pretty cool...

Finally I added some basic [social media](https://ogp.me/) and
[content description](https://developers.google.com/search/docs/advanced/crawling/special-tags) metatags so the site
will show nice display boxes, whenever it would be shared on social media or showing up in a search engine.

## Site validation

After I'm done building the site and it's up and running on a host, I would of course like to have it verified it looks
and feels like a good-behaving citizen of the web. Accessibility and standards compliance is, again, pretty important.
The validators I ran was:

- https://www.ssllabs.com/ssltest/
- https://validator.w3.org/unicorn/ (all-in-one HTML/CSS/Feed validation)
- https://www.webpagetest.org/easy (site performance, security and [lighthouse](https://web.dev/measure/) reports)
- https://metatags.io/ (previews for social media)
- https://search.google.com/test/mobile-friendly
- https://validator.w3.org/checklink

Simple stuff, really, although I had to run them manually. Sometime in the future I would like to replace them with
offline CLI tools instead, so they can be backed into the CI and run automagically on each build.

*But what was the results?*

Well, the site had some accessibility issues and I had to fix the most glaring ones:

- Using `<nav>` for the navigation menu.
- Re-enabling the link decorations (underlines) again (oops).
- Removing the `text-shadow` property from the logo animation fixed some ugly rendering time.
- Fix text pop-in while using custom fonts, by adding `font-display: swap` (less noticeable text "wiggle").

Other than that it looked pretty good!

## Automatic deployments

Automation is always great and fun! But it can be so much work and twiddling with the knobs... I wanted to utilize
[Github Actions](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
and had to struggle for a couple of days, experimenting and retesting a lot, but I finally managed to get everything
right and somewhat clean.

I tried to keep the scripts contained in the makefile as much as possible, so if I wanted to change CI in the future
there would be less work converting. Then I set up Github specific triggers (schedule, push on master branch or manually)
and let it run the build scripts for me, automagically. The resulting build output is pushed to a new, empty "orphan"
branch with a separate commit history to keep everything clean. Finally a secret deployment URL is hit, which causes my
hosting provider to download the latest build and deploy it to the CDN.

Now then, most of the struggles I had was caused by the Github specific settings, as I had no way to run and test them
locally before pushing the commits. Took a lot of back and forth testing on a separate repo.. And it won't do automatic
deletion of files, so I'll have to find some solution to either trigger cache resets at the hosting provider or trimming
out "missing" files from the build output (when compared to the sources).

## Content hosting
As for hosting, I've been eyeing [Render](https://render.com/) to host the files on their free tier. You get SSL for
free, content is hosted on a CDN and most importantly, they **don't require any special permissions for accessing your
Github account or the repo**. Other free hosting providers (like [Netlify](https://www.netlify.com/) or
[Vercel](https://vercel.com/)) seems to require a lot of unnecessary permissions, ugh!

*(I feel like I should clarify I have no affiliation with Render. I'm just a new customer.)*

Anyway, Render was pretty simple to set up. All I had to do was create a new static site, point it to the repo and build
branch, add custom domain names and some extra HTTP headers for security. Deploy and it was up, nice.

Buut... It wasn't completely pain free. Apparently I hit some bug when I was adding (and twiddling) the domains which
caused duplicate entries to show up? An mail to the support and they eventually fixed it. And I think I caused myself a
redirection loop, which got caught in the cache for an hour. I was also getting response times around 400ms but found
out the CDN (at least for the free tier) was using a couple of servers from Fastly, located in the US.. Not optimal.
But I'll let it run for a while and see how things will perform.

*Why not just host on Github?*

Nah, I feel like I'm already depending too much on them for hosting my repos. And there's always a risk you might get
a ban, for example by hosting content that breaks their TOS (not that I plan to!). That would be disastrous for an
open source developer! There's also been quite a few Github outages thanks to ddos'ing and other faults.

Although I'm whining about Github, I still host my repos there, so don't read into my words too much heh.

*Or just self host?*

Been there, done that and it's of course the most preferable way to host. But you lose the CDN (unless you make your
own). And it's more work taking care of the host itself. Might want to investigate renting a VPS again when budgeting
isn't of too much a concern. And building a CDN/load balancing proxy could be good exercise.

Or I'll just pay for some static hosting in the EU. We'll see.

## Monitoring and alerting

For now I'm only relying on Render's traffic monitoring (which just shows you the amount of data per day), while uptime
and response times are being logged on the free tier of [OnlineOrNot](https://onlineornot.com). It's pretty basic but
it logs the most important stats for a week. And I get email alerts whenever the site is being taken down by the CDN.

But I really want some more detailed web traffic logs so I could get a measurement of what pages are the most visited,
from what countries, bot usage etc. Most of it harmless, privacy wise. And most often it's logged by the web servers
anyways. I don't want to use some JS analytics though, as they tend to end up invading your privacy (eww) and blocked
by most ad blocking by default. Another reason to pay for a hosting provider in the EU I guess.

## Writing style

Alright.
So far it's just been a bunch of technical nonsense (as a reference for myself, mind you) that I'm fairly comfortable
with already. But now I'm instead stuck with the pleasurable problem of producing content!
In [english prose](https://en.wikipedia.org/wiki/Prose) nonetheless!

Well this is a completely whole new experience for me, as I haven't been doing much writing before (besides code).
I should also mention I'm not a native speaker of english, so things like grammar will probably look a bit funky at
times.

To get started, I should probably lay down the foundation of a "style guide" (kind of like
[news style](https://en.wikipedia.org/wiki/News_style)?
[article publishing](https://en.wikipedia.org/wiki/Article_(publishing))?).

**General**
- I'm European so British english should be used (and spelling correction obviously)
- Hard, documented references is king (works pretty good for Wikipedia)
- Value correctness, stability and security over performance, magic and other clever hacks in code
- No bullshit like click bait headlines or contributing to [SEO poisoning](https://en.wikipedia.org/wiki/Spamdexing)

## Conclusion

Phew, that's it for the *tiny* site introduction and documentation. A lot of work goes into making a new site from
scratch while also trying to keep up to date with the current, modern standards and recommendations (hence the huge
amount of links in this post, sorry).

*This post should be updated over time, when more content is added or other changes are being done.*

## Updates

**2021-06-17:**
- Added notes about accessibility and social media metatags.
- Added site validation, automatic deployments and monitoring & alerts section.
- Updated content hosting section with new experiences.
- Fixed misc. issues with text and styling.
