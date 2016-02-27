--- layout: post status: publish published: true title: SmoothWall
author: display\_name: Shrimp login: shrimp email:
shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/ author\_login:
shrimp author\_email: shrimp@shrimpworks.za.net author\_url:
http://shrimpworks.za.net/ wordpress\_id: 33 wordpress\_url:
http://malcolm.shrimpworks.za.net/\~shrimp/blog/?p=33 date: '2005-07-29
10:04:41 +0200' date\_gmt: '2005-07-29 08:04:41 +0200' categories: -
Rants - Linux - Work - Software tags: \[\] ---

I must say, I'm rather dissapointed with my "SmoothWall experience" so
far. I've been tasked with setting up a SmoothWall firewall/proxy
machine at work, and from what I've read, it's like the best thing since
sliced bread.

Unfortunately I cannot agree.

The installation tends to go fine, it partitions the hard disk by
itself, installs fairly fast, then steps through a simple setup
'wizard'. Here we are prompted if we want to enable or disable ADSL.
Now, I want SmoothWall to connect via our ADSL line. BUT, it seems the
developer's idea of "ADSL" is in fact "USB ADSL Modem".

Anyway, after figuring that one out, and after much shuffeling of
subnets and IPs between the router, SmoothWall, and my PC, I finally get
it to use the router as a gateway. I try visiting some sites - DNS
lookups fail. I take a look in all the log options on SmoothWall, and
find the firewall is blocking DNS traffic, and is trying to route
everything through the same ("Green") NIC, rather than the second
("Red") one.

Sooo, turns out I can fix this by running the "setup" tool again, and
'pretending' to change the IPs, so it resets everything (re-writes the
firewall rules maybe?). Cool, everything's working again. Not quite.

Seems after that, the proxy magically stops working alltogether, so from
the web interface, I just disable it, and re-enable it. Cool,
everything's working now. Riiiiight.

A few hours later, suddenly the internet is dead. Hmm, seems the
firewall is blocking all traffic again and routing though the same NIC.
Sooo, I repeat the whole IP change/reset, proxy reset, etc, and
everything's cool.

A few hours later I find myself repeating the whole procedure again.

This is seriously lame, having to practically reboot the entire machine
every few hours. So I think maybe I'll try to set up a PPPoE connection.
So I go and configure the router correctly, test 'dialing up' with my
machine in XP, all's cool. Now to set up SmoothWall. Running the setup
tool again lets me set the "Red" interface to "PPPoE", and that seems
done. Now where do I put my username and password to dial up?

Aparrently the "ppp settings" page of the web GUI is where it's done.
Now excuse my ignorance, but this looks like a modem dial-up page,
asking for phone numbers, which COM port my modem is on, etc, etc. A bit
of searching around the rather un-helpful support forums, reveals that
this is indeed where you need to configure PPPoE usernames and
passwords. Just leave all settings alone except for login details.

I give it a shot, tell it to connect, nothing happens. Check the logs,
and not surprisingly, it's trying to connect via ttyS0 (COM1).

Now, aparrently there's supposed to be an option to select the correct
interface in the drop-list where you select which port your modem is on,
on the "PPP Settings" page, but for some magical reason this does not
exist for me.

Unfortunately their forums are also not very helpful it seems, and even
after composing a [very descriptive help
request](http://community.smoothwall.org/forum/viewtopic.php?t=14705), I
get a rather sarcastic "RTFM" response for a subject not covered in the
manual.

Basically the manuals are not up to scratch, the support forums are full
of leetbois, the options in both the setup tool and web UI are obscure,
and the whole thing is bloody useless, needing a darn reboot every few
hours. WTF.

I'd love to send the whole thing to hell, but unfortunately I have to
get it to work. **\*sigh\***
