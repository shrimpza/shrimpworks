---
categories:
- Gaming
- Software
date: "2005-10-10T17:34:12Z"
published: true
tags:
- VPN
- Serious Sam 2
- networking
- Hamachi
- LAN
- WAN
title: Hamachi, easy VPN
---

A few weeks ago, the Serious Sam 2 demo was release, and my clan, the
[Avatars](http://www.avatars.co.za/), and I were dying to try out the
co-op, since we had played the previous game though together (although
some shocking networking code made it near impossible), and were rather
looking forward to SS2.

Unfortunately however, the demo's internet play functionality was rather
broken. After some digging on various forums looking for a solution,
someone found a rather useful little utility -
[Hamachi](http://www.hamachi.cc/).

Hamachi is basically a very simple VPN system, which behaves pretty much
like an instant messaging client. When you install it, you're run
through a very informative little tutorial to get you started. During
the process, you're assigned an IP in the 5.5.x.x range - though I'm not
entirely sure where the range starts or ends, we all got IPs like that -
and a new Hamachi network connection is created under Windows. You may
then join or create as many private or public networks as you like.

Members on the network can ping each other on their "Hamachi IPs", they
can browse shares, and copy files backwards and forwards (shares even
end up showing up in your "My Network Places" eventually), send messages
back and forth, etc. And of course in our case, it registers in games as
a LAN connection, so you can easily play any multiplayer game with LAN
support, without the need for the person hosting the game to mess with
their firewalls, routers, port forwarding, etc.

There is a Linux binary available, however I couldn't get this to work
on my Debian Sid server, there were various tunneling problems, which
are a bit beyond my networking skills to resolve.

In general though, the possibilities are pretty endless. Anything you
can do an a LAN, you can securely and easily do with Hamachi, on a
network spanning the world if you really wanted.

"Oops, I just printed my bank statement to Joe in Australia's printer!"
