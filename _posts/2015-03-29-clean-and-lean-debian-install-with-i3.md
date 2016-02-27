---
layout: post
status: publish
published: true
title: Clean and Lean Debian Install with i3
date: '2015-03-29 09:33:28 +0200'
categories:
- Linux
- Work
- Software
tags: []
---

![](https://upload.wikimedia.org/wikipedia/commons/8/87/I3_window_manager_logo.png)
Recently, I've made the switch from KDE being my preferred Linux desktop
environment/window manager, to [i3](http://i3wm.org/), a tiling window
manager, for both my work and private development environments (my home
desktop is still Windows 7, since I do still game enough for it to
become painful to dual-boot - so I do most of my development within a VM
these days).

I really like it's absolutely minimal approach - essentially it does
nothing itself, it provides a simple window manager, and near limitless
configurability. This has proven an excellent learning experience for
me, since it's forced me to get a lot closer to system components
usually "hidden" behind sliders and widgets in KDE or Gnome, as well as
a host of alternatives to applications those environments provide by
default. It's also resulted in a much cleaner and faster system,
containing only the applications and services I actually want.

We recently installed fresh new desktop machines at work, so I thought
I'd share some of my setup, in case it's of some value to anyone else
(and my own future reference!). The following steps assume you know how
to operate a basic Debian system. I'm not going to go too deep into any
usage details for i3 either, since there's an [excellent user
guide](http://i3wm.org/docs/userguide.html) and [comprehensive FAQ
system](https://faq.i3wm.org/) which should answer any questions you may
have.

I'd also advocate using "aptitude" as an alternative to "apt-get" for
all package installations, updates and removals.

### The Basics

I always start off with a [Debian
"netinst"](https://www.debian.org/CD/netinst/). Post-install, this
provides an incredibly basic bare-bones OS with a few system utilities
(during the installation, de-select the pre-configured "Desktop", "Web
Server", "Mail Server", etc. options, just keep the "Standard System
Utilities").

First thing to to after installing is [install `sudo` and add your user
to the sudoers group](https://wiki.debian.org/sudo), to avoid having to
be root to get things done. Now's also a good time to install `vim`.

I also like seeing Aptitude's "visual preview" of changes when doing
package management, so to avoid having to call
`$ aptitude --visual-preview install ...` on every invocation, we can
edit root's aptitude config:

*/root/.aptitude/config:*

    Aptitude::CmdLine::Visual-Preview "true";

#### Upgrade to Unstable/Sid

Perhaps a bit reckless, but I've honestly never experienced any
crippling issues running Debian Unstable ("sid"). You'll only need to
modify /etc/apt/source.list and replace references to "wheezy" or
"testing" with "unstable" or "sid", and disable the updates and security
repositories, leaving you only the main deb and deb-src repositories
(I've enabled non-free and contrib, since I want to install FlashPlayer
and nVidia drivers later):

*/etc/apt/source.list:*

    deb http://cdn.debian.net/debian/ unstable main non-free contrib
    deb-src http://cdn.debian.net/debian/ unstable main non-free contrib

After saving the above changes, execute the following:

    $ sudo aptitude update
    $ sudo aptitude dist-upgrade

The `dist-upgrade` step will upgrade all installed packages to
whatever's newest in unstable.

### Desktop Install

With the base system as up-to-date as it can be, it's time to install
the desktop environment.

    $ sudo aptitude install xorg lightdm i3-wm i3status suckless-tools

After installation, I'd reboot and ensure a nice graphical login prompt
appears. After login, you'll be asked some initial i3 setup questions
(which are easy to change later) and land in the default i3 workspace.
Press Mod+Enter (Mod being whatever you selected in the aforementioned
setup questions - likely "windows" key, or Ctrl) to open a new terminal
window. It's probably `xterm`, which is sort of OK, but I switched to
`lxtermial` - it's nice and lightweight but still has a fair number of
configuration and convenience features (like URL detection - useful for
IRC).

If you install another terminal, and opening more terminals results in
more xterms rather than your installed terminal, do the following to set
your preferred option:

    $ sudo update-alternatives --config x-terminal-emulator

### Desktop Tweaks

Before digging too deep into installing additional software, it's a good
time to configure some additional options to make life a bit more
pleasant.

##### Look and Feel

In order to make sure your eyes are not offended by the default GTK
theme which you may end up seeing a lot of, set up the GTK theme and
icon theme:

*\~/.gtkrc-2.0:*

    include "/usr/share/themes/Adwaita/gtk-2.0/gtkrc"
    gtk-icon-theme-name="Adwaita"

In addition, I found it a lot cleaner and space-maximising to disable
i3's window titles and thin it's borders down, by addition the following
to *\~/i3/config*:

    new_window 1pixel
    new_float normal

##### py3status

Install `python-pip` via Aptitude, and then
`$ sudo pip install py3status`. I use
[py3status](https://github.com/ultrabug/py3status) since it provides
some nice additional modules, is more flexible, and is fully compatible
with the default i3status configuration. It's also a good time to check
out the [i3status configuration
documentation](http://i3wm.org/i3status/manpage.html) and do some
tweaks, since a couple of the default entries here are likely not too
useful.

##### Wallpaper

Randomised (of fixed if preferred) wallpapers can easily be achieved by
installing `feh` (which makes for a good i3-friendly picture viewer in
general) then adding the following to *\~/i3/config*:

    exec --no-startup-id feh --recursive --randomize --bg-fill ~/Pictures/wallpaper/

Incidentally, the [imgur wallpaper
gallery](https://imgur.com/r/wallpaper) is a good place to find some
wallpapers.

##### File Management

Sometimes a GUI file manager can be useful, and for this, a nice
light-weight alternative to the bigger desktops' Nautilus and Dolphins
is PCManFM, installed as `pcmanfm`.

A nice companion application for (compressed) archive management is
`xarchiver`. You may need to install additional tools (such as `zip`,
`unzip`, `unrar-free`, etc, depending on the files you commonly work
with).

### Conclusion

The entire setup to this point should not have taken more than 1-2
hours, depending on download speeds (really, most time is spent just
waiting for downloads...), so you can get this kind of environment
running with minimal effort and downtime.

I haven't included anything about multimedia, custom key bindings, lock
screens, or others here, but there are loads of other resources around
which can fill you in on those and the myriad ways you can configure
your i3 environment.

Your next step, if you're new to i3, should probably be to take a read
through the [i3 user guide](http://i3wm.org/docs/userguide.html), which
is impressively comprehensive.
