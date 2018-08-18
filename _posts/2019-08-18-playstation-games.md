---
layout: post
status: publish
published: true
title: Dumping PlayStation discs on Linux
categories:
- Linux
- Gaming
tags:
- PlayStation
---

I recently wanted to play original set of Metal Gear Solid games, but since I'm
now lacking any PlayStation hardware, thought I'd try out emulation.

I'm quite a fan of [RetroArch](http://www.retroarch.com/), and that has a 
[suitably good core for PS1](https://docs.libretro.com/library/beetle_psx/) 
gameplay, and provides some pretty good upscaling and other nice options and
optimisations, rendering via Vulkan.

PS2 emulation still seems to really only be available via 
[PSCX2](https://pcsx2.net/), though it seems pretty solid and dispite being 
32-bit and still running an OpenGL renderer.

PS3 emulation via [RPCS3](https://rpcs3.net/), at time of writing, still has a
way to go for most games - in my case missing Metal Gear Solid IV support is a
bit of a downer in particular.

Anyway, so to use any of these systems, you're going to need to either stick 
physical discs into ye olde optical drives, or dump those discs to files for
easy switching and managing.

> Note: In both cases below, remember to `umount` the discs first. Multi-disc 
> games will also need some manual script rejigging.

Both of the following scripts should be invoked using:

```
$ ./dump-psx.sh GameName
```

Here's a simple Bash script for dumping/ripping your PlayStation 1 games 
([download][ps1]). This requires installation of package `cdrdao`.

```
#!/bin/bash

GAMEFILE="$1/$1"

mkdir "$1"

cdrdao read-cd --read-raw --datafile "$GAMEFILE.bin" --device /dev/cdrom --driver generic-mmc-raw "$GAMEFILE.toc"
toc2cue "$GAMEFILE.toc" "$GAMEFILE.cue"
```

And here's the process for dumping/ripping PlayStation 2 games
([download][ps2]). This requires installation of package `genisoimage`.

```
#!/bin/bash

GAMEFILE="$1/$1"

mkdir "$1"

BLK_SIZE=$(isoinfo -d -i /dev/cdrom | grep -i -E 'block size' | sed 's/[^0-9]*//')
VOL_SIZE=$(isoinfo -d -i /dev/cdrom | grep -i -E 'volume size' | sed 's/[^0-9]*//')

dd if=/dev/cdrom of="$GAMEFILE.iso" bs=$BLK_SIZE count=$VOL_SIZE
```

[ps1]: /assets/posts/2018-08-18-playstation-games/dump-ps1.sh
[ps2]: /assets/posts/2018-08-18-playstation-games/dump-ps2.sh
