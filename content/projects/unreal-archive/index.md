---
published: true
title: Unreal Archive
lang: [Java]
description: A persistent archive of user-created Unreal and Unreal Tournament content.  
refs:
 - https://unrealarchive.org/
 - https://github.com/unreal-archive
---

> [Unreal Archive Post]({{< relref "2019-03-16-unreal-archive" >}})

{{< gallery >}}

Unreal Archive is an initiative to gather up, index, and catalogue
as much Unreal, UT99 and UT2004 (and hopefully soon Unreal Torunament 3) 
content as possible. So far, we have 
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
  plain HTML pages. This ensures no dependence on having to host a website
  with any dependency on any sort of back-end service beyond the simplest of 
  HTTP servers. specific pains have been taken to ensure it works well with
  `file://` local resources as well, so it doesn't even need to be hosted!
- written in Java - largely because I know it well enough to do this, but also
  because it's not going anywhere soon, so the indexing and site generation
  capabilities will remain in action for a long time.
- data stored as YAML files - a fairly simple format that's also easily human-
  readable. in 30 years when all the YAML parsers have died, if someone looks
  at these files, they'll be easy to write new parsers for, if that's ever
  needed.
- the "database" is Git - easy to distribute amongst many people, and since
  this is primarily an archive, the data does not change rapidly enough to
  require anything more real-time.
- built-ino mirroring functionality to either download the entire file base, 
  or to transfer it to any compatible S3 bucket store, and contribute 
  mirror links back to the main Archive.
- the entire project is "licensed" under [UNLICENSE](https://unlicense.org/), 
  with the intent of it being as absolutely open as possible, for as long as
  possible.
