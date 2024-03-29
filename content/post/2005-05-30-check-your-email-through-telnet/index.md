---
categories:
- Random
- Linux
date: "2005-05-30T20:42:23Z"
published: true
tags:
- Linux
- Console
- Terminal
- Telnet
- Email
title: Check your email through Telnet
---

Ok so this is a little trick I picked up a few years ago when I
developed the first version of ECheck and I started learning the POP3
protocol. It's come in very handy when I'm away from my email client and
don't want to receive email anywhere and fragment my mailbox by
spreading it across a few machines.

Firstly, this'll work on both Linux and Windows systems, with no extra
software needed (assuming most Linux distros come with a Telnet client
by default).

It's a pretty useful thing everyone with an email account should know
;-).

Firstly, open a command prompt, and execute the following:

```sh
$ telnet <your.mail.server> 110
```

would obviously be replaced by the address (IP or hostname) of your POP3
server.

If you connect, you should be presented with a welcome message and a
"*+OK*" message. You then enter the following commands to log in,
replacing the contents of the "" with your details:

```
user <your@username>   pass <password>
```

After which, you should be greeted by another "*+OK*" assuming you
managed to log in. If you make a typo, just send the line with the type
- you usually cannot backspace and correct mistakes. Issue the correct
command again.

Now that you're in, let's see your messages. To see how many messages
and how big each of your messages is, send the following:

```
list
```

Once again a "*+OK*" line should be shown, followed by a very simple
list of message IDs and file sizes (in bytes). Let's preview a message,
shall we?

```
top <id> <lines>
```

The headers for message , followed by up to number of lines from the
message will be spammed to your console. You can find both the
"*Subject:*" and "*From:*" header lines to decipher who the message is
from and what it's about. Of course you can also read the body...

Hmm? This message is junk mail or spam? Want to delete it before it hits
your inbox?

```
dele <id>
````

... will delete the message with ID . It's important to note that the
message IDs are maintained - so if you delete message 1, message 2 will
not fall into 1's place. It'll remain 2 for the remainder of the
session.

If you've deleted the wrong message, all it not lost. You can 'reset'
the mailbox status to how it was when you first connected:

```
rset
```

And once you're done mucking around, disconnect nicely:

```
quit
```

It's also worth noting that the commands are all case-insensitive,
though I'm sure the 'correct' way of doing it would be to use all caps
for commands, the server doesn't seem to mind either way.

Have fun...
