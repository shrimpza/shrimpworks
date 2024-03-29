---
categories:
- Development
date: "2005-01-01T19:39:02Z"
published: true
tags: []
title: E-Check v2
---

Okay well I've been working on this for a while now - a new version of
my aging "E-Check" application.

Brief into to E-Check: It's a small utility that allows you to preview
your POP3 mail accounts before downloading their contents into your
email client. If there's a message you don't particularly like the look
of, you can select it and have it deleted before it ever reaches your
Inbox.

E-Check was written in Delphi 3 using the Indy (at that time it was
knows as Winshoes) suite of networking components. There are currently a
number of problems on Windows XP, and of corse, it doesn't run on
anything but Windows.

I'm re-writing it as modular as possible in Python. Currently I have a
very nice "MailBox" class that connects and collects headers of all mail
messages on the server. Extracting information from each of these
messages is extremely basic, just call MailBox.GetSubject(msg\_id) for
example returns the subject of the message requested. Yes, I know Python
has a whole suite of email utilities (and I am in fact making use of a
couple of the functions/objects it provides - thanks mithrandi), but this
seems (to me anyway) a much more simplified way of managing and
accessing email messages, plus you get the whole 'mailbox' effect...

Anyway, with that class doing it's own thing, I can pretty much plug it
into any GUI. Web-based mailbox previews? How about checking your mail
via a WAP device? "Python for Delphi" would allow me to re-make it
almost the same as it is now (bound to Windows still though). At the
moment, I'm running with wxPython though. Had a bit of trouble getting
to grips with sizers and stuff, but now I'm building most of the GUI by
hand (tried loads of builders and things) and it's working out pretty
well indeed. Cross-platform too.

To-to for right now: Multiple account support and saving/loading config
info to/from file.
