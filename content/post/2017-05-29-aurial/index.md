---
categories:
- Development
date: "2017-05-29T00:00:00Z"
published: true
tags:
- Music
- JavaScript
- React
- Subsonic
title: Aurial, HTML5 Subsonic Music Player
---

{{< img src=2017-05-29-aurial.png class=image-left >}}

I have finally decided to [release version 1.0](https://github.com/shrimpza/aurial/releases) of [Aurial](https://github.com/shrimpza/aurial), my implementation of a music player/client for the [Subsonic](http://subsonic.org/) music server.

I started this around two years ago, some time after switching my primary desktop from Windows to Linux, and I really missed [foobar2000](https://www.foobar2000.org/) - it has been my primary music player ever since. Unfortunately I have an irrational aversion to using Wine to run Windows applications, and none of the native music players on Linux felt good to me. As I already ran a Subsonic music server, I thought I'd just make use of that.

The existing browser-based clients for Subsonic were either too basic, or the state of their code and some implementation features made me uncomfortable. I just wanted a nice music player that allowed me to browse my collection similar to how I did in foobar2000 (using Subsonic's ID3 tag based APIs, rather than the directory-based browsing offered by other clients), perhaps manage playlists, make ephemeral queues, and importantly, scrobble played tracks.

Podcasts, videos, and other things some clients support don't interest me at all, and are a bit out of scope of a foobar2000-like client I believe.

Aurial allows me to build a music player the way I prefer to browse, manage and play music (which admittedly, is quite heavily influenced by my prior foobar200 configuration and usage habits).

{{< img src="2017-05-29-aurial_shot.png" thumb=800x alt="aurial" class="image-centre full-width" >}}

This was my first attempt at a [React](https://facebook.github.io/react/) application, and it started off simply enough, with JSX transpiling and stuff happening directly in the browser. At some point [Bable](https://babeljs.io/) was no longer available for browsers, which led to my adoption of [Webpack](https://webpack.js.org/) (and eventually Webpack 2) for producing builds.

This also led to things like needing some sort of CI, and I've recently begun producing builds via [TravisCI](https://travis-ci.org/shrimpza/aurial) which automates building the application, and [deploying it to GitHub Pages](https://shrimpza.github.io/aurial/), which I think is pretty neat.

I also got to play with HTML5's `<audio/>` a bit, as the player library I was using previously had some reliance on Flash, and was occasionally tricky to coax into using HTML rather than that. The result is infinitely smaller and less complex audio playback implementation (it's amazing how much easier life is when you ignore legacy support).

Anyway, altogether it's been fun, and as I'm using it constantly, it's always evolving bit by bit. Hopefully someone else finds it useful too.
