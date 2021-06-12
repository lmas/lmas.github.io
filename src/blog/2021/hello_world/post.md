---
title: Hello world
published: 2021-06-01
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

It's all just **static "web" files** with content mostly generated from [commonmark](https://commonmark.org/) formatted pages. I wrote my own
generator, [called dumblog](https://github.com/lmas/dumblog), to do this for me. Why? Because [Hugo](https://gohugo.io/), [Jekyll](https://jekyllrb.com/) and related tools felt a bit too bloated and
complicated for my own taste. I also love to roll my own solutions and learn about new stuff.

*TODO: explain how the public files are built using github actions.*

*Local [reference page for commonmark](/blog/2021/commonmark/index.html), conveniently showing off all the formatting.*

The whole source for this site can be found on [Github](https://github.com/lmas/larus.se), so it's just easier to go browse that if you want any details.

Some references for the more common (or not) static files semi expected to be found on a web server:

- [robots.txt](http://www.robotstxt.org/) is of course a must for playing nice with the indexing bots and crawlers.
- [sitemap.xml](https://en.wikipedia.org/wiki/Site_map) offers further help to the search engines.
- [security.txt](https://securitytxt.org/) might encounter automated "security researchers", so it's mostly for fun.
- [humans.txt](https://humanstxt.org/) is cute, why not.
- [feed.xml](https://en.wikipedia.org/wiki/Atom_(Web_standard)) is pretty standard for blog/news feeds. RSS/Atom is not dead.

## Web design

I'm sticking with plain html/css templates and only use [vanilla-js](http://vanilla-js.com/) for the more optional and totally not required eye candy.

I think black-on-white text is too harsh on the eyes sometimes, so I wanted to pick some yellow-ish background colour.
Enter [Cosmic latte](https://en.wikipedia.org/wiki/Cosmic_latte). Lower it's brightness to about 25% and you get a black foreground colour for the text, voilà!
It's got great [contrast ratio](https://contrast-ratio.com/#%23403E3A-on-%23FFF8E7) for accessibility and it works pretty good for dark mode too using [prefers-color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme).

I also wanted a [responsive web design](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design) ([intro](https://alistapart.com/article/responsive-web-design/), [basics](https://web.dev/responsive-web-design-basics/)) using [flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/), so the pages would fit both regular computer screens
and tiny phones. While googling I also stumbled upon using a maximum width of [960px](https://960.gs/) (nevermind the grid things).

As for the typography, I picked [Lato](https://www.latofonts.com/) for the regular text content, [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono) for code and finally [Library 3 AM](https://www.fontsquirrel.com/fonts/library-3-am) for the
flickering neon sign logo. Just my own personal preferences. And [neon signs](https://duckduckgo.com/?q=neon+sign&ia=images&iax=images) a pretty cool...

*TODO: note about minimal SEO*

## Content hosting
As for hosting, I've been eyeing [Render](https://render.com/) to host the files on their free tier. You get SSL for free, content is hosted on
a CDN and most importantly, they **don't require any special permissions for accessing your Github account/repo**.
Other free hosting providers (like [Netlify](https://www.netlify.com/)) seems to require a lot of unnecessary permissions, ugh!

I'm not so sure about Render's web-visitor-stats reporting though. Think it might be a bit too light, but we'll see...
I also feel like I should clarify I have no affiliation with them. It's just a good looking offer, for me, with my most
wanted features at this time.

> Why not just host on Github?

Nah, I feel like I'm already depending too much on them for hosting my repos. And there's always a risk you might get
a ban, for example by hosting content that breaks their TOS (not that I plan to!). That would be disastrous for an
open source developer! There's also been quite a few Github outages thanks to ddos'ing and other faults.

Although I'm whining about Github, I still host my repos there and run some periodical scripts on [Github Actions](https://docs.github.com/en/actions),
so don't read into my words too much heh.

> Or just self host?

Been there, done that and it's of course the most preferable way to host. But you lose the CDN (unless you make your
own), and it's more work taking care of the host itself. Might want to investigate renting a VPS again, in the future,
when budgeting isn't of too much a concern. And building a CDN/load balancing proxy could be good exercise.

*TODO: make a note in the future about how hosting has gone.*

## Content verification

After I'm done building the site and it's up and running on a host, I would of course like to have it verified it looks
and feels like a good-behaving citizen of the web. Accessibility and standards compliance is pretty important in my book.

*TODO: Once we're live I'll update this section with the list of verification tools used and the experience with them.*

## Writing style

So far it's just been a bunch of technical nonsense (as a reference for myself, mind you) that I'm fairly comfortable
with already. But now I'm instead stuck with the pleasurable problem of producing content! In [english prose](https://en.wikipedia.org/wiki/Prose) nonetheless!

Well this is a completely whole new experience for me, as I haven't been doing much writing before, besides code.
I should also mention I'm not a native speaker of english, so things like grammar will probably look a bit funky at times.

Alright, to get started I should probably lay down the foundation of a "style guide" (kind of like [news-writing style](https://en.wikipedia.org/wiki/News_style)?)
of [writing an article](https://en.wikipedia.org/wiki/Article_(publishing)):


**General**
- I'm European so British english should be used (and spelling correction obviously)
- Hard, documented references is king (works pretty good for Wikipedia)
- Value correctness, stability and security over performance, magic and other clever hacks in code
- No bullshit like click bait headlines or contributing to [SEO poisoning](https://en.wikipedia.org/wiki/Spamdexing)

*TODO: to be updated over time when I get more writing experience.*

## Conclusion

That's it for the tiny introduction and blog documentation. Sorry about all the link spam, but I need my references.

*This post should be updated over time, when more content is added or other changes are being done.*
