---
categories:
- Linux
- Software
date: "2006-06-07T09:12:04Z"
published: true
tags:
- python
- spam
- spambayes
- dovecot
- imap
- pop3
- mail filtering
title: Spam filtering with SpamBayes
---

Alright, so I've been getting more and more spam in recent weeks, and
they've been getting harder and harder to build basic filter rules for.

My mail works in a pretty round-about way:\
I have multiple POP accounts all over the place, which have sort of
accumulated over the years. It becomes a bit of a mission to always set
up and check all these accounts, so what I have now is a small Python
script that connects to each of the servers, grabs the mail, sorts them
based on some simple filters (like, containing a \[mailinglist\] type
subject), and places them within a Maildir structure based on that
sorting. In addition, it does the same thing for deciding if it should
delete a message - extremely basic spam filtering rules can be set up to
check out certain headers for possible spam flags, etc.

The downloaded mail is then served via IMAP, using the [Dovecot mail
server](http://www.dovecot.org/). The great thing about that, is then
every time I re-install any of the machines I use for mail access, or
install a new one, I instantly have all my neatly sorted folders, all my
mail from all my accounts, and only one IMAP account I need to set up.

Anyway, basically, the spam filtering of the above system was rather
lame, so I went on the hunt for something a little more useful. Enter
[SpamBayes](http://spambayes.sourceforge.net/) - a mail proxy
application written in Python.

It's already "in Debian", so installing was as fun as always (*aptitude
install spambayes*), after which I only needed to start the service, and
then it's off to a browser to configure it. Actually there wasone step
before that - since I'm running this on my server, and SpamBayes is
meant for use by a single user on their own PC, it doesn't allow
connections do it's browser-based configuration from other hosts. Which
is a bit of a problem when running a server which I have no interaction
with beyond a command shell. Thanks to Lynx I was able to configure it
to allow connections from my local network.

For starters, you need to tell it which POP3 servers you want to connect
to, and assign local ports to each one, which will be stand-ins for port
110 when connecting to servers. The interface for this is a bit
troublesome however, requiring you to enter each server into a single
input field, separated by commas. The associated ports for each server
are then entered into another input field in the same manner. It took me
a while to get both the fields synced due tot he number of servers I
intended using.

Next up, I fed it a few emails for training (saved emails out of
Thunderbird as EML files, and these can be uploaded to the server for
training via the browser interface) both 'ham' and spam.

Once it knew the basics, I simply updated the list of servers in my
Python script to "localhost", and whichever port each one was set to.
Shortly thereafter, mail started passing through the system. Most of it
was identified as "unsure", as it hadn't seen enough examples of ham or
spam yet. Quite smartly, it keeps a record of each message that's passed
through, and you can easily train ham or spam from these.

Around 50 mails later, it was identifying almost every message
perfectly. I'm going to leave it running for a day or two more, training
everything that arrives, then I'll just add a single filter to my mail
fetching script, looking at the "X-Spambayes-Classification" header for
"spam" (delete), or "ham" take no action.

I'm quite happy with this setup, looks like it'll work quite well :D.
