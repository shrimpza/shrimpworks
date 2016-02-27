---
layout: post
status: publish
published: true
title: DynaBar - dynamic userbars!
date: '2005-12-18 23:55:46 +0200'
categories:
- Random
- Development
tags:
- images
- userbars
- PHP
- Signatures
- GD2
---

***Update**: [DynaBar 2 is
available](http://shrimpworks.za.net/2006/08/07/dynabar-2-more-dynamic-userbars/),
the download link below is out of date.*

Finally got around to making a proper release of something :).

Presenting DynaBar, a PHP script which can create dynamic images through
the use of plugins, inspired by the [Userbars.com](http://userbars.com/)
website.

I thought it would be cool to be able to have userbars with dynamic data
in them, stuff like game server status, stats, etc., etc. to make them a
little more exciting. I also wanted to learn a bit more about PHP's
image manipulation, so this proved a good oppertunity for that.

Basically, the whole thing works off a plugin system, which lets you
drop in a PHP script (the plugin), set up a config file (the userbar),
and link to an image. DynaBar then goes about loading the plugin,
requesting it's data (so it goes off and collects stats, or whatever),
and building the final image (putting on the \[optional\] scanline
effect, glossy shine, and layering the text data from the plugin on all
of that).

I've also created a small designer script, which allows you or any users
to create new userbars using plugins or whatever, with their own images
and content, in a simple wizard-like interface. The end result is
ready-to-use forum or HTML code. :).

Here are some examples, using plugins included in the package:

![](http://omg.shrimpworks.za.net/dev/dynabar/show/shrimp_clan.png)\
Simple, plain text (nothing dynamic about it).

![](http://omg.shrimpworks.za.net/dev/dynabar/show/shrimp_lastfm.png)\
This one queries [LastFM](http://www.last.fm/user/Shrimpza/) for which
song I've played most recently in my media player.

![](http://omg.shrimpworks.za.net/dev/dynabar/show/shrimp_bf2tracker.png)\
Finally, here we have Battlefield 2 stats, coming from [BF2Tracker's
clan XML feed](http://bf2tracker.com/thread.php?threadid=6625).

Grab the download from the bottom of this post. Please read the README
in the doc/ directory.
