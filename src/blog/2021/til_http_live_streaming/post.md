---
title: "TIL: HTTP Live Streaming"
short: Streaming media with HLS
published: 2021-06-20
tags:
- til
- hls
---

[HTTP Live Streaming](https://en.wikipedia.org/wiki/HTTP_Live_Streaming) is a protocol developed by Apple and it allows
you to (you guessed it) streaming audio/video media over HTTP. And it has, apparently, pretty widespread support in most
of the major web browsers, servers and content delivery networks.

So I guess that's how iTunes/VLC/Plex/Kodi/et al. has implemented their streaming? Never heard of it before, but it looks
pretty cool.

And it looks really easy to implement with the help of [FFmpeg](https://en.wikipedia.org/wiki/FFmpeg):

        ffmpeg -i movie.mp4 -c:v libx264 -preset veryfast -hls_time 10 -f hls test.m3u8

This command takes an input file, splits it up into 10 second long segments, writes them to disk as `.ts` files and adds
the file names to a `.m3u8` playlist.

To serve this playlist on a web page, you could add this HTML:

        <video src="http://example.com/path/to/playlist.m3u8" height="300" width="400">

Then you just serve all the segments, playlist file and the page itself with a regular web server and boom!
Live streaming!

## References

- [Apple's reference docs](https://developer.apple.com/streaming/)
- [Tuning options for H.264](https://trac.ffmpeg.org/wiki/Encode/H.264)
