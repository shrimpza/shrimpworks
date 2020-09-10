---
categories:
- Linux
- Gaming
date: "2018-02-23T00:00:00Z"
split: true
published: false
tags:
- Debian
- Linux
- Unreal Tournament
- UT2004
title: Running Unreal Tournament 2004 on Linux
---

{{< img src=ut-logo.png class=image-right >}}

- get files
- installer https://liflg.org/?catid=6&gameid=17 - patched to 3396
- extract installer: `file.run --target /tmp/ut2004 --keep --noexec`
- untar `linux-amd64.tar.gz` into UT dir
- install `libstdc++5`
- edit UT2004.ini, enable opengl, fix display resolution
- add file `System/cdkey`
- run with `padsp ut2004-bin`
