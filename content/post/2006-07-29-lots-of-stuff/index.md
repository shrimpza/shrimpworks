---
categories:
- Random
- Development
date: "2006-07-29T14:00:45Z"
published: true
tags:
- DynaBar
- userbars
- UnWheel
- python
- dosage
- django
title: Lots of stuff
---

Hmmmmm, long time no update. That's not to say I haven't been busy
recently.

Last month, we released "[UnWheel
R5](http://unwheel.beyondunreal.com/)", which seems to have become the
(hopefully) final release. I'm pretty happy with it at the moment, all
the major bugs are gone, multiplayer is working wonderfully and the
online record system is churning records around at a mean rate (and
those records still need a monthly rotation system applied, so still
some work to be done there). I still haven't decided if I want to do
this all again in Unreal Torunament 2007 or not :).

Elsewhere, I've been playing around with
[DynaBar]({{< relref "2005-12-18-dynabar-dynamic-userbars" >}}),
and it's grown a **lot**. The plugin system has been tweaked to allow
better customisation options from the developer side, as well as having
options added to improve the user interaction side of things. There are
a whole crapload of other options available as well, multiple layers
(supporting PNG graphics with alpha transparency), different scanline
styles, text prefixes and suffixes, better caching options, etc. In
addition, you can choose to have the background be a gradient blending
between any two colours, horizontal or vertical, and you can create
"groups", which is a bunch of userbars animated (with fading/blending
between bars), and they all remain fully dynamic. Speaking of dynamic,
I've also added a whole load of plugins, from XFire, to more Last.FM
options, to Battlefield 2 and TrackMania, and even RSS headlines and
live game server status via Qstat.

[I've put up a test system
here](http://dynabar.shrimpworks.za.net/designer/) as a sort of sandbox,
so feel free to try out all the options and plugins, and if you have any
suggestions or ideas for plugins, please let me know. In addition to the
designer, [there's a browser
available](http://dynabar.shrimpworks.za.net/designer/browse.php), which
lets you easily build the animated groups mentioned above. Also, it all
works with Internet Explorer now, which I didn't bother fixing with the
previous version (wasn't meant to be such a "big" project :)). Source
code package will be available as soon as some more testing is done.

In addition, I've been re-writing my online
[Dosage](http://slipgate.za.net/dosage/)-powered comic viewer - Injector
- **again**, this time it's going fully "Web 2.0" (ZOMG!), so
everything's quite nice and quick. This project still needs a bit of
work on the administration and installation side of things before it can
see a release.

Aside from all that, I've also been slowly building a new UnrealZA site,
using the [Python-powered Django
framework](http://www.djangoproject.com/). It really is a wonderful
thing. Please excuse me for a minute while I run away from a horde of
crazy, twisted, Nevow fans (among others). Anyway, I'll happily
recommend Django any day of the week to anyone looking for a Python web
framework.

I've also decided I don't like the look of this site anymore, so I guess
that's another thing to go on my to-do list for the near future.
