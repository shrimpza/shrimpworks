---
categories:
- Development
- Software
date: "2014-12-14T15:19:34Z"
published: true
tags: []
title: Project Update - ZOMB
---

{{< img src="2014-12-14-zomb-web.png" thumb=740x alt="zomb-web" class="image-center full-width" >}}

As mentioned, [I've resurrected an old
idea]({{< relref "2014-12-01-a-new-old-thing" >}} "A New (Old) Thing"),
and began work on it as a bit of a learning/practice exercise. I think
it's working out rather well.

The primary application itself, [hosted on GitHub
here](https://github.com/shrimpza/zomb), is essentially complete,
barring the ability to persist your plugin configuration (pfft, who
needs to store things anyway).

Some stuff learned along the way:

**API-driven development:**

Designing the external-facing API (actually defining and completely
documenting the exact request and response data structures, not just
"there will be a request that does things and a response that looks
something like X") was a huge help. Defining the API allows you to see
how the system will actually be used up-front before writing a single
line of code, and allows you to easily spot gaps and shortcomings. Once
done, the "user documentation" becomes the same documentation I used to
implement the back-end, which made it incredibly easy.

**Git:**

Still learning, getting more comfortable with it. IntelliJ IDEA has
excellent built-in Git support out-the-box, and although painful to use
in a Windows shell (it's basically Bash, inside cmd.exe), I'm getting
more used to the Git CLI.

**Free/online continuous integration:**

Initially, I started off using [Travis-CI](https://travis-ci.org/). This
requires you to store a ".travis.yml" file within the root of your Git
repository which I was rather uncomfortable with (I don't like
"external" metadata type things hanging around in my source repository).
As an alternative, I've switched to using
[Drone.io](https://drone.io/github.com/shrimpza/zomb), which just
"feels" like a nicer solution. It also has additional features like the
ability to store artefacts for download, or publish your artefacts to
external services or servers - so you could have successful builds
automatically deploy the latest binaries.

**Persistence/Storage:**

Persistence is hard, so once you start a service up, it should run
indefinitely so you never need to write anything to disk. Sigh. Also,
this part was not designed at all up-front, and my flailing around
trying to get a workable solution is evidence of the need for proper
design and planning before jumping in with code.

Aside from that, there are additional projects which were spawned:

**[zomb-web](https://github.com/shrimpza/zomb-web)**

The first front-end for ZOMB. A simple single-page HTML UI. Had some
good practice remembering how to HTML and Javascript here...

**[zomb-plugins](https://github.com/shrimpza/zomb-plugins)**

A growing collection of plugins for ZOMB. At present, they're all PHP
(again, refreshing old skills...) and pretty simple. Currently, there's
*time* (simple current time/time-zone conversion), *lastfm* (see what
someone's currently listening to, find similar artists), *weather*
(current and forecast conditions for a given city) and *currency*
(simple currency conversion).

None of the above cannot be achieved without a simple web search, so
next up I'd like to create a CLI client - weather updates in your
terminal!
