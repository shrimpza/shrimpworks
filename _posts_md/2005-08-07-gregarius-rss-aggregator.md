---
layout: post
status: publish
published: true
title: Gregarius RSS Aggregator
date: '2005-08-07 19:05:56 +0200'
categories:
- Software
tags: []
---

Thanks to a link [mithrandi](http://mithrandi.za.net/blog/) posted in
IRC, I've discovered this rather useful tool.

[Gregarius](http://gregarius.net/) is a web-based RSS/RDF/ATOM feed
aggregator (oops, I didn't copy/paste that from their homepage :P) which
you can install on your own server, and manage as you like.

Setup was a breeze, I just checked out the latest version from their
Subversion repo, copied the files over to /var/www, and created a MySQL
database. First visit to your Gregarius URL prompts for database access
settings, and creates the tables and everything for you.

It has an extremely clean interface, I suspect in fact that it's highly
influenced by WordPress (their "devlog" using WordPress further
convinces me), but that's beside the point. It's extremely easy to
manage categories, add feeds (it automatically fetches a "favicon.ico"
file if one's available as well), etc. I got my whole installation and
10 feeds all setup within around 10 minutes.

It presents the feed items nicely enough, sorted by date, with links to
the full versions, as well as descriptions/summaries. It also keeps
track of items's you've left unread, making it easy to come back to them
later. Another helpful feature is the ability to search within the feeds
it's downloaded and stored, allowing you to pull up any item at any
time, I've already found this quite useful.

All-in-all, a pretty great little package. It sure beats Thunderbird's
RSS reader hands down. If you subscribe to any feeds, have the ability
to host it (just PHP and MySQL required), and 10 minutes to set it up,
throw away your existing RSS readers and get your own Gregarius
aggregaror up and running :).
