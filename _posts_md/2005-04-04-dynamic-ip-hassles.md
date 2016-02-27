--- layout: post status: publish published: true title: Dynamic IP
hassles author: display\_name: Shrimp login: shrimp email:
shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/ author\_login:
shrimp author\_email: shrimp@shrimpworks.za.net author\_url:
http://shrimpworks.za.net/ wordpress\_id: 22 wordpress\_url:
http://malcolm.shrimpworks.za.net/\~shrimp/blog/?p=22 date: '2005-04-04
20:29:46 +0200' date\_gmt: '2005-04-04 18:29:46 +0200' categories: -
Random - Development - Linux tags: \[\] ---

Dunno if anyone would have noticed but the site was blinking on and off
last week, with dynamic DNS issues.

I've been using an application which runs as a service on my Windows
machine, but it seems to often give up if it can't get a new IP or the
udate fails, and sometimes it just doesn't bother even trying :-).

Anyway I slapped up a quick Python script to be run from a cron job at 5
minute intervals to check a website which provides my IP (like
<http://checkip.dyndns.org>), grab the first IP it finds, and updates my
ZoneEdit account with the new IP.

Seems to have been running reliably the past few days now.

I've dumped it on the Files page if anyone would like to give it a go.
It's set up for ZoneEdit, but I'm sure it's easy to adapt to other
services as well.
