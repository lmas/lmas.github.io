---
title: CSS simple image background
date: 2023-06-14
---

A nice, simple way of producing colourful backgrounds for single images,
for example while showing cover art or profile pictures,
can be done by reusing the image itself as a background,
but heavily blurred.
I learned this trick from [Tao of Mac].

The HTML is stupid simple:

    <div class="cover" id="some_id">
        <img src="path_to_img">
    </div>

The CSS is a bit longer but it's mostly aligning things,
the interesting part is the `:before` rules:

    .cover > img {
        border-radius: 5px;
        filter: drop-shadow(0px 10px 10px black);
    }
    .cover {
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        position: relative; /* Prevent ".cover:before" from moving outside this container */
    }
    .cover:before {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: -1; /* Don't hide child elements behind this one */
        content: ""; /* Required for showing the background */
        background-repeat: no-repeat;
        background-position: center;
        background-size: 100vw 100vh;
        filter: blur(50px);
    }
    #some_id:before {
        /* This property could be put directly in the above rule,
        but it was seperated out so all of the above rules could be kept generalised and easily resued.
        There isn't a way to reuse HTML properties of child elements, using plain CSS. */
        background-image: url("path_to_img");
    }

These two blocks of code can then produce the following result
(with some extra code for demonstration pruposes):

<style>
.cover > img {
    border-radius: 5px;
    filter: drop-shadow(0px 10px 10px black);
}
.cover {
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
}
.cover:before {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    z-index: -1;
    content: "";
    background-repeat: no-repeat;
    background-position: center;
    background-size: 100vw 100vh;
    filter: blur(50px);
}

/* Extra fluff for the demo */
.columns {
    display: flex;
    flex-flow: row wrap;
    justify-content: space-around;
}
.columns div {
    padding: 50px;
}
#red:before {
    background-image: url("fish.jpg");
}
#green:before {
    background-image: url("kelp.jpg");
}
#blue:before {
    background-image: url("ocean.jpg");
}
</style>
<span class="columns">
<div class="cover" id="red">
    <img src="fish.jpg">
    <p>Photo by <a href="https://unsplash.com/photos/Gv-Cx3_clZ4">David Clode</a>.</p>
</div>
    <div class="cover" id="green">
        <img src="kelp.jpg">
        <p>Photo by <a href="https://unsplash.com/photos/4IyllFjr3Rw">Shane Stagner</a>.</p>
    </div>
    <div class="cover" id="blue">
        <img src="ocean.jpg">
        <p>Photo by <a href="https://unsplash.com/photos/wc9avd2RaN0">Christoffer Engström</a>.</p>
    </div>
</span>

On the blog, the background was also rotated 180 degrees although it isn't explained why,
I guess it was for making it less obvious that the image was reused.
Making it less obvious doesn't matter that much for myself but was worth noting down anyway.

One thing I did want to do though was to increase the contrast between the image
and the background so that the image itself would stand out some more.
One way it could be done is by fiddling with the [HSL values] using plain CSS
or by using some other [CSS filter].

The blur effect can also be seen bleeding over the elements' containers
which might be unwanted and should be taken cared of,
but that have to be done some other day.

[Tao of Mac]: https://taoofmac.com/space/blog/2021/12/01/1920#the-pretty
[HSL values]: https://en.wikipedia.org/wiki/HSL_and_HSV
[CSS filter]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_filter_effects
