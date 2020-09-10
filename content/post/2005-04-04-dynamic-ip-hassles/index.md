---
categories:
- Random
- Development
- Linux
date: "2005-04-04T20:29:46Z"
published: true
tags: []
title: Dynamic IP hassles
---

Dunno if anyone would have noticed but the site was blinking on and off
last week, with dynamic DNS issues.

I've been using an application which runs as a service on my Windows
machine, but it seems to often give up if it can't get a new IP or the
update fails, and sometimes it just doesn't bother even trying :-).

Anyway I slapped up a quick Python script to be run from a cron job at 5
minute intervals to check a website which provides my IP (like
<http://checkip.dyndns.org>), grab the first IP it finds, and updates my
ZoneEdit account with the new IP.

Seems to have been running reliably the past few days now.

I've dumped it on the Files page if anyone would like to give it a go.
It's set up for ZoneEdit, but I'm sure it's easy to adapt to other
services as well.
