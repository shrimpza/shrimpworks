---
categories:
- Development
date: "2016-05-07T00:00:00Z"
published: true
tags:
- PHP
- Eve Online
- Out of Eve
title: Out of Eve 3.0 released
---

{{< img src=title.png class=image-center >}}

After almost exactly two years since the last release of Out of Eve,
[here is version 3.0.](https://github.com/shrimpza/outofeve/releases/tag/outofeve-3.0-citadel)

As may be noted from the release note, the main goal of this release is to
catch everything up with the current state of EVE, it's API, and the static
data dump.

Along the way some new stuff was also added an improved, like the new menu
system which allows access to all your characters, so there's no need to switch
between them and then view detail pages, and the introduction of `memcached`
caching, which stores and retrieves entities loaded from the static database
dump, reducing page load times and database accesses (a single page load may
result in hundreds of individual MySQL queries).

I'm rather pleased with this release, and it seems a lot more solid than most
before.

I've also got the [public Out of Eve website](https://outofeve.com/) back up,
now featuring HTTPS courtesy of [Letsencrypt](https://letsencrypt.org/), at
last.
