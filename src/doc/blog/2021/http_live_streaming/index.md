---
title: HTTP Live Streaming
date: 2021-06-20
---

HTTP Live Streaming is a protocol originally developed by Apple and it allows you to stream A/V media over HTTP.

And it has, apparently, pretty widespread support in most of the major web browsers,
servers and content delivery networks.
So I guess that's how iTunes/VLC/Plex/Kodi/et al. has implemented their streaming?
Never heard of it before, but it looks pretty cool.

It looks really easy to implement with the help of [FFmpeg]:

    ffmpeg -i movie.mp4 -c:v libx264 -preset veryfast -hls_time 10 -f hls test.m3u8

This command takes an input file, splits it up into 10 second long segments,
writes them to disk as `.ts` files and adds the file names to a `.m3u8` playlist.

To serve this playlist on a web page, you could add this HTML:

    <video src="http://example.com/path/to/playlist.m3u8" height="300" width="400">

Then you just serve all the segments, playlist file and the page itself with a regular web server.

And boom! Live streaming!

[FFmpeg]: https://en.wikipedia.org/wiki/FFmpeg

# References

- [Wikipedia](https://en.wikipedia.org/wiki/HTTP_Live_Streaming)
- [Apple's reference docs](https://developer.apple.com/streaming/)
- [Tuning options for H.264](https://trac.ffmpeg.org/wiki/Encode/H.264)
