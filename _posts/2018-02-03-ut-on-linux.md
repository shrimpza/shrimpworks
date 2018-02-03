---
layout: post
status: published
published: true
title: Running Unreal Tournament 99 on Linux (part 1)
categories:
- Linux
- Gaming
tags:
- Debian
- Linux
- Unreal Tournament
excerpt_separator: <!--more-->
---

![](/assets/posts/2018-02-03-ut-on-linux/ut-logo.png){: .image-right}

With all the talk of Unreal Tournament 4 possibly being cancelled one of these
days, due to Epic's runaway success with Fortnite, I've decided there's really
no reason to not be playing UT99.

Thus, we set about trying to run it on modern hardware, with a modern Linux 
installation.

As much as this is about setting things up on Linux, it's also partially my own
attempt at some knowledge preservation, as a lot of this stuff ends up being 
forgotten or lost over time (it's been almost 20 years! a lot of the old sites
and things you expect to find this info on simply do not exist anymore :()

This is part one of two, and will focus on installing and running the game 
using Wine.

<!--more-->

## Part One - Wine

You more than likely don't have a CD/DVD-ROM any more, so you Steam is the 
obvious first port of call. Simply installing Steam via `winetricks` will
thereafter allow you to log into your Steam account, and install _Unreal 
Tournament: Game of the Year_ edition.

As usual, the details given here are Debian-specific, but you
should be able to translate everything to your distribution of choice.

Some notes about my system setup, which may provide insight into some 
prerequisites:

- Debian Sid/Unstable 64bit
- I have a native working Steam installation, which implies multi-arch setup
   with various i386 libraries already installed to support Steam 
   (see [the Debian wiki][debian-steam])
- Non-free Nvidia driver 384.111 (see [the Debian wiki][debian-nvidia])
- Using PulseAudio
- I am using Wine 3.0

### Installing with Steam under Wine

- [Install wine][wine-install]
- Get the latest [`winetricks`][winetricks]:

  ```bash
  $ wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
  $ chmod +x winetricks
  $ sudo mv winetricks /usr/local/bin
  ```
- Create a new `WINEPREFIX` for UT:

  ```bash
  $ WINEPREFIX=~/.wine/ut wineboot -i
  ```
- Install Steam (I chose to install it to `C:\Steam` for ease of use):

  ```bash
  $ WINEPREFIX=~/.wine/ut winetricks steam
  ```
- Once Steam is installed, launch it and install Unreal Tournament GOTY
- Download the [Enhanced OpenGL Renderer][ogl-render-win] version 3.7 
  ([mirror download][utglr37.zip]), extract `OpenGLDrv.dll` and place it into 
  `~/.wine/ut/Games/Steam/steamapps/common/Unreal Torunament/System/`, 
  overwriting the existing file.
    - This fixes things like brightness adjustment and supports things like 
      decals and detail textures, providing much better visuals.
- At this point, I could not get the game to start up and show me the initial
  renderer selection, so I had to edit the `System/UnrealTournament.ini` file
  first, to make use of the OpenGL renderer. Open the file in a text editor, 
  and set the following:

  ```properties
  [Engine.Engine]
  GameRenderDevice=OpenGLDrv.OpenGLRenderDevice
  RenderDevice=OpenGLDrv.OpenGLRenderDevice
  ```
  - If the game does start for you and launches the first-run renderer 
    selection window, choose "Show all devices" in that window and choose
    "OpenGL Support".
- After this, launch the game in Steam, and away you go.
- To adjust the FPS cap (vsync is forced on by default), modify 
  `UnrealTournament.ini` again with the following (where 200 is something not
  insane):
  
  ```properties
  [OpenGLDrv.OpenGLRenderDevice]
  FrameRateLimit=200
  SwapInterval=0
  ```
  `SwapInterval` is pretty much "Vsync", with options of `-1` (driver select),
  `0` (off), or `1` (on). A `FrameRateLimit` value is *required*, or the game 
  will execute as fast as possible, and be unplayable (think old DOS games 
  being played on a PC with the Turbo button on).

There are some downsides to running via Wine, especially with a manually 
managed Wine install like this. In particular it's simply unpleasant to have
to deal with the paths involved when modifying your `User.ini` and the
aforementioned `UnrealTournament.ini`, although some simple symlinks and 
scripts should make it easier.

I have found that often the game fails to launch successfully via Steam, and I
have to find and kill the `UnrealTorunament.exe` process and try again.

Running the game through Steam also obviously requires you to start up a
dedicated Steam instance every time you play.

None of these problems are unresolvable, so at this point, we have a reasonably 
working UT install suitable, suitable for installing mods and maps into, 
playing online and offline, etc. and should last us for the next 20 years.

Part two will use this Wine installation to create a native Debian install
so we can free ourselves of the need for Steam, and create a cleaner running
environment.

[debian-steam]: https://wiki.debian.org/Steam
[debian-nvidia]: https://wiki.debian.org/NvidiaGraphicsDrivers
[wine-install]: https://wiki.winehq.org/Debian
[winetricks]: https://github.com/Winetricks/winetricks
[ogl-render-win]: http://www.cwdohnal.com/utglr/
[utglr37.zip]: /assets/posts/2018-02-03-ut-on-linux/utglr37.zip