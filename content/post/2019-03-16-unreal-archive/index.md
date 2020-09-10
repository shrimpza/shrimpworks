---
categories:
- Development
- Gaming
date: "2019-03-16T00:00:00Z"
published: true
tags:
- Unreal Tournament
- Unreal
title: Unreal Archive
---

{{< img src=2019-03-16-unreal-archive.png alt="Unreal Archive" class=image-right >}}

Over the past several months, I've been working on a project to provide a
place to catalogue and preserve the vast amounts of user-created content the 
Unreal and Unreal Tournament community has been creating over the past 20+ 
years. 

This has resulted in the [Unreal Archive](https://unrealarchive.org/).

While it may seem a silly cause to invest so much time (and money) into, this
stuff directly influenced the lives of myself and thousands of others. I would
certainly not be in the profession I'm in, driving my car, living in my house,
if not for the direct influence of working on Unreal Tournament maps, mods and
community, and personal websites.

This stuff made many of us who we are today, and a lot of it has already been
lost in time. The internet may not ever forget, but it certainly misplaces 
things in ways it can't be found again.

A lot of content _is_ in fact mirrored in various places on the internet, but
it can be hard to download, as people generally don't appreciate you mirroring
100s of gigabytes off their shared hosting.

Thus, the Unreal Archive is an initiative to gather up, index, and catalogue
as much Unreal, UT99 and UT2004 content as possible. So far, we have 
[maps](https://unrealarchive.org/maps/),
[map packs](https://unrealarchive.org/mapspacks/), 
[voices](https://unrealarchive.org/voices/), 
[skins](https://unrealarchive.org/skins/), 
[mutators](https://unrealarchive.org/mutators/), 
[player models](https://unrealarchive.org/models/), as well as support for
things such as 
[patches, updates and drivers](https://unrealarchive.org/patches-updates/) as
well as a (currently very empty) section for 
[written documents](https://unrealarchive.org/documents/) with the intent of 
providing guides, tutorials, manuals, and other related documented knowledge
which also seems to get lost and forgotten.

The tech stack and some of the decisions involved may seem odd, but in keeping
with the theme of longevity, preservation, and the general ease of losing 
things on the internet, these are some of my motivations:

- statically generated content - the website is generated as a collection of
  plain HTML pages. this ensures no dependence on having to host a website
  with any dependency on any sort of back-end service beyond the simplest of 
  HTTP servers. specific pains have been taken to ensure it works well with
  `file://` local resources as well, so it doesn't even need to be hosted!
- written in Java - largely because I know it well enough to do this, but also
  because it's not going anywhere soon, so the indexing and site generation
  capabilities will remain in action for a long time.
- data stored as YAML files - a dead simple format that's also easily human-
  readable. in 30 years when all the YAML parsers have died, if someone looks
  at these files, they'll be easy to write new parsers for, if that's ever
  needed.
- the "database" is Git - easy to distribute amongst many people, and since
  this is primarily an archive, the data does not change rapidly enough to
  require anything more real-time.
- the entire project is "licensed" under [UNLICENSE](https://unlicense.org/), 
  with the intent of it being as absolutely open as possible, for as long as
  possible.
 
As I'm collecting a lot of the data for the archive directly from the pieces 
of content themselves, a large part of implementing this also involved figuring
out the Unreal Package data formats. Thankfully there are still several 
references for this hanging around, and many people have made their research
on the topic public.

I've released a separate [Unreal Package Library](https://github.com/shrimpza/unreal-package-lib/)
(Java) which some people may find useful. I'm using it to read map information,
such as authors, player counts, titles, etc, export images such as screenshots 
and player portraits, as well as for parsing Unreal's INT and UPL metadata 
files (more-or-less glorified INI files).

[All the code for the project is up on GitHub](https://github.com/unreal-archive/),
as is the content database.
