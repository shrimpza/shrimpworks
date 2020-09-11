---
published: true
title: Aurial
lang: [JavaScript]
description: A browser client for streaming music from servers implementing the Subsonic API
---

> Forward: When Is switch to Linux full time, the one Windows application I 
> missed was [foobar2000](https://foobar2000.org/). None of the Linux music
> players really did what I wanted in a way I felt comfortable with.
>
> I already had a [Subsonic](http://subsonic.org/) server running with all my
> music, so decided to make use of that. Unfortunately at the time the 
> available browser-based clients all relied on Flash for playback, and were
> either too simplistic, or supported more stuff than I required (podcasts etc).
>
> Aurial is still my daily-driver music player.
>
> [Hosted on GitHub](https://github.com/shrimpza/aurial)

Aurial is a browser-based HTML/JavaScript client interface for streaming music
from [Subsonic](http://subsonic.org/), [Airsonic](https://airsonic.github.io/),
[Navidrome](https://www.navidrome.org/), or other software and services
implementing the Subsonic API, and does not require the use of a
Flash-based player or plugin.

Aurial's aim is to provide a simple, intuitive and straight-forward interface
to browse and play your music, and to be as easy to deploy as it is to
configure and use.

As such, it focuses exclusively on playback of your music library, and by
design does not support other media types, such as video, podcasts or internet
radio.


## Live Demo

- https://shrimpza.github.io/aurial/

The latest build is always deployed at the above URL, feel free to make use of
it for your own purposes, or play around with it prior to hosting your own copy.


## Download and Installation

For convenience, the latest automated build is available for download, so you
do not need to configure or set up a build environment (if you do want to build
it yourself, see the instructions below).

- [aurial.tgz](https://shrimpza.github.io/aurial/aurial.tgz)

To "install", simply extract the archive into a directory exposed via an HTTP
service (there's no need for any server-side scripting or database), and browse
to that location.

Configuration is done on the "Settings" tab of the main application interface.


## Screenshots

{{< img src=shot1.png thumb=500x class=image-center alt="Browsing the library">}}

{{< img src=shot2.png thumb=500x class=image-center alt="Playing some music">}}

{{< img src=shot3.png thumb=500x class=image-center alt="Playlist support">}}


## Building

The project is built via NPM and [Webpack](https://webpack.github.io/).

Install `npm` for your platform, and then execute the following in the project
root directory (alternatively, `yarn` may also be used):

```
$ npm install
$ npm run <watch|dist|start>
```

A `dist` directory will be produced containing the built output, which may be
served via an HTTP server and accessed via a web browser.

`watch` includes additional debug information, which may not be optimal for
production or general-use deployments, and produces a significantly larger
download; it recompiles code as changes are made. `dist` will produce
uglified and minified output suitable for "production" deployment. `start` will
run Aurial in Webpack's dev server on port 8080 (or next available port above
that), and allows automatic reloading of the page as code changes are made.