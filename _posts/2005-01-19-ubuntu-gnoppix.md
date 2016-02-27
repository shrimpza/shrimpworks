---
layout: post
status: publish
published: true
title: Ubuntu &#038; Gnoppix
date: '2005-01-19 19:51:35 +0200'
categories:
- Rants
- Linux
tags: []
---

So I thought I'd try out the highly praised Ubuntu Linux. I thought to
myself, what better way to try than with their LiveCD - no need to mess
up any existing setups.

Anyway so I downloaded the ISO, and after burning the CD, noticed it had
a Windows auto-run feature. So I ran it, and was presented with a nice
little winow asking if I'd like to install Windows versions of
OpenOffice.org, AbiWord, Audacity, Gimp, PDFCreator, Thunderbird or
Firefox. That struck me as rather odd for a CD that's supposed to be
convincing you Linux is better ("Hey! No need to convert to Linux, just
check out all this cool Windows software!").

So I'm thinking oooookay, so I decide to try out the Linux bit of the
disc. Everything boots up nicely, nice little GUI boot loader with a
couple of options presented in easy-to-use menus, nice splash image
hiding all the auto-detection of hardware and genreral stuff that goes
on at boot time (pressing Esc kills the splash image so you can check
that everything's okay in the background). Once it booted up into Gnome,
everything looked cool. Nice default desktop setup, theme, etc. I
realised at this point that my router had DHCP disabled, so Ubunto had
me offline. There's a 'Network Setup' option in the "Actions" menu,
which presented me with a nice little wizard for IP, DNS, gateway, etc
options. Upon completeing this wizard and closing the application
however, nothing would work at all. Icons on the panel did not launch
applications, and neither did anything in the application menu. I'd have
restarted X, but with LiveCDs, they seem to terminate and reboot as soon
as X shuts down.

So anyway, I restarted the whole thing, but with the router's DHCP
enabled. Everything worked cool, the applications on the CD all worked
as expected. At some point I entered the Network Setup again and needed
another reboot though. Seems as soon as that is run it kills the
setup...

It's a very minimal system though, nothing really useful on it beyond
OpenOffice.org - and who uses a LiveCD to do their general word
processing. It even had Synaptic - but it prevents you from installing
software or even updating the packages list.

I also tried Gnoppix, which is based off the Ubuntu LiveCD, but it
suffered the same network configuration application problem, as well as
lacking any interesting software. It also included all the Windows
software Ubuntu had. In fact the only real difference I saw between
Gnoppix and Ubuntu was the boot up splash image. Most of Gnoppix is
still 'branded' as Ubuntu.

I think if they dumped the Windows software from these CDs, they'd be
able to load on a LOT of extra Linux software to impress potential users
more, as well as making it more useful as a general-use LiveCD.

The only thing that would make me want to install a proper Ubuntu system
at some later date at the moment would be the fact that it's a full
desktop installation out-the-box, with the ability to install anything
else on demand thanks to it's Debian base.

For the moment I'll be sticking to Knoppix when I need Linux-on-the-go,
which it loaded with tons of useful and fun stuff (pity about KDE,
though).
