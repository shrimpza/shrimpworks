---
layout: post
status: publish
published: true
title: E-Check v2 progress
date: '2005-01-12 19:39:48 +0200'
categories:
- Development
tags: []
---

Well today I got multiple accounts working as well as writing/reading
to/from a config file thanks to the ConfigParser module.

Imporved the body retreival in the MailBox class so it doesn't die when
there's an attachment or some other weird part of a multipart message.
Also on the GUI side of things needed to sort out some problems with
different character sets, so now non-ASCII messages are encoded to
iso-8859-1as needed.

There seems to be some problem now with the message list box returning
the incorrect message selection, so trying to preview the last message
in the list results in the first one being previewed... heh.

Todo: Fix list problems, selecting of messages for deletion.