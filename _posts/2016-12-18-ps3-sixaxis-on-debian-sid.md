---
layout: post
status: publish
published: true
title: PS3 Sixaxis with Bluetooth on Debian Sid
categories:
- Linux
- Software
- Hardware
tags:
- Debian
- bluetooth
- sixaxis
excerpt_separator: <!--more-->
---

![](/assets/posts/2016-12-18-sixaxis.png){: .image-right}

Continuing to [tweak]({% post_url 2016-12-16-lirc-and-kodi%}) my [Kodi setup]({% post_url 2016-06-10-kodi-on-debian-sid%}), I thought it would be fun to attempt connecting a PS3 Sixaxis controller to it, since the HTPC I'm using has built-in bluetooth.

Contrary to what most of the internet seems to say on the subject for Debian/Ubuntu systems, which seems to involve third-party tools and sometimes compiling things, I found the process much simpler on a modern system.

<!--more-->

Here are the basics (since this is an HTPC I'm configuring over SSH, this is all non-visual stuff):

- First, if you haven't used Bluetooth on the target system yet, make sure it's set up and working:
  - execute `lsusb` and verify the presence of a Bluetooth device, and that it's firmware is loaded (if not, you'll see `(No firmware)` next to it's name)
  - after making sure the device is available, install the `bluetooth` package via `apt-get` or `aptitude`
  - make sure the Bluetooth service is running with `systemctl status bluetooth.service`
  - as a quick test to make sure BT is working, turn on a bluetooth device and run `hcitool scan` to see if the PC finds it
- If you have working Bluetooth, the first step is to plug the Sixaxis controller into the PC using a USB cable and turn it on (hit the PS button). This will register/pair the controller.
  - to verify, you should be able to run `systemctl status bluetooth.service` again, and see notifications about the controller's connection.
- After pairing via USB, unplug the controller, hit the PS button again to power it on, and execute `bluetoothctl`.
  - You should see an entry like `[NEW] Device 00:00:00:00:00:00 PLAYSTATION(R)3 Controller` (where `00:00:00:00:00:00` is the mac address of your controller).
  - If you're seeing periodic entries like `[CHG] Device 00:00:00:00:00:00 Connected: yes/no`, execute the command `trust 00:00:00:00:00:00`, and it should flag the controller as a trusted device.
- Once done, you should have a working Bluetooth PS3 controller which you can use to control Kodi and play games with.

My steps are a bit verbose for (hopefully) clarity, but should take no more than 5 minutes and you shouldn't need to resort to the installation of 3rd party repositories or software, or compile anything yourself.
