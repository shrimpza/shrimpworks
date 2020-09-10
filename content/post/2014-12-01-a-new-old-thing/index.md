---
categories:
- Development
- Software
date: "2014-12-01T07:17:47Z"
published: true
tags: []
title: A New (Old) Thing
---

(Re-)Introducing [ZOMB, an IRC bot
back-end](https://github.com/shrimpza/zomb), which I planned, started
work on some years ago, then promptly lost interest after it became
vagely usable.

The general idea of ZOMB (like "zomg", but it's a bot, not a god \[maybe
version 3\], and it sounds like "zombie" which is cool too) is to
provide a client interface-independent bot framework, where bot
functionality can be implemented in remotely hosted plugin
scripts/applications, unlike a traditional bot where normally you'd need
all the code running on one user's machine/server.

Being interface-independent means a ZOMB client (the thing a user will
use to interact with ZOMB) may be an IRC bot, a CLI application, or a
web page. Since I've been less active on IRC than I'd like lately, the
additional options would be useful to me personally, but since almost
nobody uses IRC at all any more, ZOMB should hopefully be useful outside
of that context.

So how does ZOMB work? From a user's point of view, it's exactly like a
traditional bot - you issue a query consisiting of the plugin you want
to execute, the command to call, along with command arguments. For
example, you'd ask a ZOMB bot:

```
> weather current johannesburg
```

Where "weather" is the plugin, "current" is a command provided by the
weather plugin, and "johannesburg" is an argument. In response to this,
ZOMB would provide you a short text result, something like this:

```
> The weather in Johannesburg is currently 22 degrees and partly cloudy
```

In the background, ZOMB looked at the input, found that it knew of the
"weather" plugin, and made an HTTP request to the remote plugin service
passing the command and arguments along. The plugin then did what it
needed to do to resolve the current weather conditions for Johannesburg,
and returned a result, which ZOMB in turn returned to the requesting
client.

As always, a new project provides some practice/learning opportunities:

-   API driven development<br />
    I know what I want ZOMB to be able to to, so I began by defining the
    client and plugin APIs, around which the rest of the design
    must fit. I normally write a bunch of code, then stick an API on top
    of it, but trying it the other way around this time. Seems to
    be working.
-   Test driven development<br />
    just to keep practicing :-)
-   Git and Github<br />
    since we're hopefully going to be using Git at work in the near
    future, best to get some practice in.
-   [Custom Ant and Ivy build scripts](https://github.com/shrimpza/antscripts)<br />
    I like Ant and Ivy and need to practice configuring and maintaining
    them from scratch.
-   [Travis-CI](https://travis-ci.org/shrimpza/zomb)<br />
    continuous integration for Github projects, since it's cool to have
    a green light somewhere showing that stuff's not broken, and I've
    never used any CI stuff outside of work.
-   More granular commits<br />
    committing smaller changes more often - I don't know if this is a
    good thing or not, but seeing how it works out
-   All on Windows<br />
    I haven't really built a proper project on Windows for years :D

