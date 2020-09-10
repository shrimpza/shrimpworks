---
categories:
- Development
- Software
date: "2006-10-27T21:52:42Z"
published: true
tags:
- python
- PHP
- Video
- YouTube
title: myTube - Web-based YouTube downloader
---

Heh, I guess there are already plenty of tools out there which do this
sort of thing already (never seen them personally, but then I've never
looked either, heh), but this only took me half an evening to throw
together anyway.

Basically, it's a Python (uses
[youtube-dl](http://www.arrakis.es/~rggi3/youtube-dl/)) and PHP-powered
web-based YouTube video downloader and converter, you just stick in the
URL to a YouTube clip you want to save, and it will download it and
offer it for download as an MPEG which you can save on your PC and play
in all it's low-quality glory whenever you want.

Basically it automates the following, which can be run on any Linux PC:

`# youtube-dl.py -o myvid.flv http://www.youtube.com/watch?v=123abc # ffmpeg -i myvid.flv -ab 56 -ar 22050 -b 500 -s 320x240 myvid.mpeg`

As an added benefit, it stores a complete history of downloaded clips,
so you and others can re-download them at any time without having to do
the whole fetch/convert process over again. Plus it uses a nifty fake
AJAX waiting effect :P.

Requires Linux with ffmpeg, Python 2.4+, and PHP 4.3+.
