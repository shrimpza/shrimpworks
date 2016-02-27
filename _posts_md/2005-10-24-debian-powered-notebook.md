---
layout: post
status: publish
published: true
title: Debian Powered Notebook
date: '2005-10-24 00:06:33 +0200'
categories:
- Linux
- Work
- Software
tags:
- Debian
- Notebooks
- Laptops
---

Yay, on Friday, I decided to take the plunge, and install Debian on my
laptop. I've always wanted to try working in a Linux desktop
environment, considering I do practically no Delphi development any
more, everything's either PHP or Python. Since Debian has plenty of
support for both of these, it seemed quite ideal.

I'm not dumping the existing Windows install though, so I had to
partition my drive. Now, partitioning drives is about the most
nerve-racking thing I've ever done, no matter what software I'm using,
no matter how little data I stand to lose, I'm always scared as hell
something will go wrong. Doubly so on this laptop since I use it
constantly for work, and it's the default installation HP put on, which
I'm not really eager to bugger up. Luckily, that all went smoothly
though :D.

When it came to installing Debian though, I had a problem with the
netinst installer I was using, in that a package or two would not
install due to missing some authentication files or something. So, since
[that installer](http://www.debian.org/devel/debian-installer/) didn't
work, it was suggested that I try an older [Sarge
installer](http://www.us.debian.org/releases/sarge/debian-installer/)
and upgrade to the Unstable branch from there.

As expected, that installation went without issue. Unfortunately I just
had to try my best to keep the machine cool while waiting for the
installation to complete and the ACPI applications to kick in so the
fans would do their thing. Thanks [Korpse](http://kaydash.za.net/) for
warning me about that in advance ;).

So anyway, after the base installation was done, it was trivial (as I
have come to expect from Debian,) to get Gnome, X.org and GDM installed
and running. Apache, PHP and the rest were even easier. I was very
pleased to see that the Firebird SQL server (open source'd Interbase
fork thingey) was available in Debian right away, so I plonked that in
as well. All that was left was to install Subversion, and check out my
work stuff. Once done, I was 100% ready for work :D.

There are a few things not working yet - I haven't had much luck with
the wireless LAN. Gnome's wireless LAN configuration applet thing is
missing WPA-PSK authentication options (which I've configured my
wireless AP to use), it only supports WEP. I also can't seem to get the
WPA tools (wap\_supplicant) to work correctly. Based on the output I'm
getting though, it \*looks\* like it's connecting to the access point -
it manages to find the AP's MAC address and everything just fine, and it
reports the authentication was successful, but beyond that, I can't
actually ping anything, and all traffic still seems to be trying to go
through eth0 (wired LAN) rather than eth1 (wireless). Guess I need to
learn a bit more about Linux networking... heh.

Another thing that's not quite working is Bluetooth. Again, it \*seems\*
to be working, the hardware is detected, and is working fine. My phone
can pair with the laptop fine, using the PIN I've defined, but I can't
seem to transfer files or anything in either direction. I'll admit that
I haven't played with this much yet, but I'm not really sure where to go
next. I haven't even tried looking into infra-red yet :).

And yes, I do use all these things, that's why I spent so much on this
laptop :P.

I also haven't installed the ATI drivers yet, it looks like it's going
to be a bit of a mission on it's own though.

Along the way I've also discovered some interesting new applications I
haven't seen or heard of before.
[gDesklets](http://gdesklets.gnomedesktop.org/) seem like a nice way to
waste some CPU time and memory if you like to keep your desktop busy.
[Beep Media Player](http://www.sosdg.org/~larne/w/BMP_Homepage) seems
like a very nice alternative to XMMS, seems a lot more stable, and the
general feel integrates better with Gnome.
[RapidSVN](http://rapidsvn.tigris.org/) looks like it's trying to be a
nice enough SVN front-end, however I find the good old command-line a
lot more friendly and efficient (and it crashes less).
[Sylpheed](http://sylpheed.good-day.net/en/) is a rather nice little
mail client, and works well as an alternative to Thunderbird - assuming
you're unhappy with Thunderbird though.
[ibWebAdmin](http://www.ibwebadmin.net/) is a neat web-based tool for
managing your Interbase databases, not as feature-packed or good looking
as phpMyAdmin, but it does what it needs to do pretty well.

All that's left now is to give it a shot at work tomorrow, and see how
it all goes :).
