---
published: true
title: myTube
date: '2006-10-27 22:01:28 +0200'
lang: [PHP5, Python]
description: Front-end for `yotube-dl` for downloading videos from YouTube
---

> **Update 14 April 2013:**
>
> This project hasn't been maintained or updated since original release,
> it likely no longer functions. It's still here for archival and reference
> purposes.

------------------------------------------------------------------------

myTube is a simple web-based YouTube clip downloader and converter.
You paste the URL to the YouTube clip you want to download, and it
downloads the video using the Python-powered
[youtube-dl](http://www.arrakis.es/~rggi3/youtube-dl/), then converts
it to MPEG which can be played in your media player of choice, via
ffmpeg. It then offers the converted file for download.

{{< img src=mytube.png thumb=500x class="image-center" alt="myTube" >}}

Features
--------

-   Easy install, just dump the scripts on your server.
-   Previously downloaded/converted clips are always browsable and
    available, so you don't need to do the conversion process again.
-   If a duplicate clip is downloaded, the conversion process is skiped
    and the already converted video is served.
-   Web 2.0 styling including fake AJAX!

Download
--------

[Download]({{< resource mytube.zip >}})
