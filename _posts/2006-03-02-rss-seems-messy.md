---
layout: post
status: publish
published: true
title: RSS seems messy
date: '2006-03-02 16:47:50 +0200'
categories:
- Development
- Rants
tags:
- RSS
- MagpieRSS
- syndication
---

Heh :D

So I've started work on my own small RSS aggregator for some or other
web project I may or may not actually complete. And no, it's nothing
like
[Gregarius]({% post_url 2005-08-07-gregarius-rss-aggregator %}),
it's more of an 'internal function' of a larger project.

So anyway, after checking out the various RSS version specs and things,
I hunted down as many feeds as I could to get an idea of the kinds of
data I'm going to end up sifting through.

Wow. Despite the fact that there are standards out there doesn't seem to
mean much. Nearly every feed is a world apart from the next one, either
throwing in millions of useless custom tags, renaming standard tags to
some other random thing that made sense to the author and nobody else,
leaving out loads of actual useful information, mixing and matching the
specs as they feel the urge, and a million other randomnesses.

Anyway, on the way to making sense of it all, I fed some of them through
[MagpieRSS](http://magpierss.sf.net/), which actually does a fairly
reasonable job of making them a bit more sane. Still, I have to guess a
lot of fields and things, and pretty much hope for the best.

At the moment, people's RSS feeds generally seems more psychotic than
some of their use of HTML.
