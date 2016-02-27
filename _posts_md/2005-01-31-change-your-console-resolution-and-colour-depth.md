--- layout: post status: publish published: true title: Change your
console resolution and colour depth author: display\_name: Shrimp login:
shrimp email: shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/
author\_login: shrimp author\_email: shrimp@shrimpworks.za.net
author\_url: http://shrimpworks.za.net/ wordpress\_id: 18
wordpress\_url: http://malcolm.shrimpworks.za.net/\~shrimp/blog/?p=18
date: '2005-01-31 20:22:42 +0200' date\_gmt: '2005-01-31 18:22:42 +0200'
categories: - Linux tags: - Linux - Console - Colours - Terminal ---

OK so not much is going on... Thought I might as well pass along some
general knowledge.

Changing the resolution of a Linux console is a fairly simple task (and
requires a reboot) and is generally a nice thing to do if you intend
using the console a lot.

Start off by logging in as root, and open your Grub menu file (mine is
in /boot/grub/menu.lst). Next, find the option that would normally boot
your Linux system (probably looks something like the following):

`kernel     /vmlinuz-2.6.8-1-386 root=/dev/hda3 ro`

Now, simply append to the end "vga=788", so it ends up looking something
like this:

`kernel     /vmlinuz-2.6.8-1-386 root=/dev/hda3 ro vga=788`

The "788" is a code which tells the console to be 800x600 with a 16bit
colour depth. Check out a table ot codes for all resolutions and colour
depths by clicking the "read more" link below this post.

Save the file, reboot, and enjoy :-).

For reference, here are some VGA codes:

       Colors ( depth) 640x480 800x600 1024x768 1280x1024 1600x1200
       ---------------+-------+-------+--------+---------+---------
       256    ( 8 bit)| 769    771     773      775       796
       32,768 (15 bit)| 784    787     790      793       797
       65,536 (16 bit)| 785    788     791      794       798
       16.8M  (24 bit)| 786    789     792      795       799
