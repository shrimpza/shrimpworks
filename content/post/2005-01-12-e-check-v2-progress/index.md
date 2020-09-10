---
categories:
- Development
date: "2005-01-12T19:39:48Z"
published: true
tags: []
title: E-Check v2 progress
---

Well today I got multiple accounts working as well as writing/reading
to/from a config file thanks to the ConfigParser module.

Improved the body retrieval in the MailBox class so it doesn't die when
there's an attachment or some other weird part of a multipart message.
Also on the GUI side of things needed to sort out some problems with
different character sets, so now non-ASCII messages are encoded to
iso-8859-1as needed.

There seems to be some problem now with the message list box returning
the incorrect message selection, so trying to preview the last message
in the list results in the first one being previewed... heh.

Todo: Fix list problems, selecting of messages for deletion.
