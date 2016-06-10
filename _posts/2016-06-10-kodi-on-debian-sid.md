---
layout: post
status: publish
published: true
title: Kodi and Steam on Debian Sid
categories:
- Linux
- Software
- Gaming
tags:
- Debian
- Kodi
- HTPC
- Steam
excerpt_separator: <!--more-->
---

![](/assets/posts/2016-06-10-debian-kodi-steam.png){: .image-right}

I recently went through the process of reinstalling the media PC connected to my
TV, which I use to run Kodi for movies and TV, and Steam in Big Picture mode,
which allows me to stream Windows-only games from my desktop to the couch.

I thought it would be useful to describe my setup and the process to achieve it,
in case anyone else is interested in creating their own custom Kodi/Debian/Steam
builds.

<!--more-->


### The Setup

The PC is a several-years-old "Xtreamer" box, which is a small form-factor media
PC with a dual-core Atom CPU, NVidia mobile graphics, 4GB RAM, a 32GB SSD and a
built-in IR received for remotes. An XBox 360 controller is connected via USB
wireless adapter for gaming.

The ethernet port fried in a storm some time ago, so it now uses a USB ethernet
adapter.

All media is stored on a shared server elsewhere, and the machine was running
XBMCBuntu for several years.


### Installing Debian

To keep things as light-weight as possible, I've gone with a fairly simple and
bare-bones installation. Also, since this is a multimedia machine, I would like
it to remain fairly up-to-date, so I'm going with Debian Unstable (Sid).

Since I need the USB ethernet adapter to work, I decided to go with an [ISO image
which includes non-free firmware](http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/).
Since I'm also going to be installing Nvidia's proprietary drivers, there's no
point trying to stick to the 100% free and open model here.

After Debian's installed, a few additional packages to make life easier are
required: `vim` and `sudo`.

I like to use `sudo` as a general Good Practice, rather than just doing
everything as root. Add your non-root user to the `sudo` group:

`$ adduser username sudo`

You can now log in as a normal user.

The next step is to upgrade the installation to the latest (sid). This is done
my editing `/etc/apt/sources.list` and changing `stretch`, `jessie` or whatever
default release name is listed to `sid`. Also enable `non-free` and `contrib`
sources at the same time.

After an `aptitude update` and `aptitude dist-upgrade`, a quick reboot makes
sure everything's clean and ready for the next step.


### Installing a desktop

A display manager is required in order to launch Kodi and other applications in
a graphical environment. I've selected `lightdm` since it's intended to be a
light-weight alternative to GDM (from Gnome), KDM (from KDE) and the like.

Since we also intend launching multiple applications (switching between Kodi and
Steam at the least), we'll also need a "desktop" environment (a Window Manager
in Linux-land). Again, the simplest lightest one will do the trick here, since
the intent is to not actually use it as a desktop per se.

For this, I'm using `openbox`.

After those are installed, you may want to reboot, to ensure you actually get a
graphical login prompt, and after login, see an extremely basic desktop (right-
click to open a simple menu to do simple things).

Now is a good time to install and configure the Nvidia drivers. Thankfully
this process is fairly simple these days. Begin by installing and running
`nvidia-detect`, which suggests which driver package you need to install for
for particular GPU (unfortunately, there are now legacy and "current" driver
packages).

Following installation of the recommended driver, also install and run
`nvidia-xconfig`, which will configure X to use the proprietary driver for you.

Another reboot should show you the Nvidia splash screen when the graphical
environment initialises.

At this point you can either switch to one of the terminal windows via
`Ctrl+Alt+F1/F2`/etc, or install `openssh-server` and perform the remaining
configuration remotely (the latter is much easier).


### Nicer looking startup

You might also want to install `plymoth` at this point, which replaces all the
text information at startup with a graphical splash screen. See the
[Plymouth page](https://wiki.debian.org/plymouth) of the Debian Wiki for
configuration instructions.

Additionally, while making changes to the boot process, the 5 second delay
before Grub begins launching Linux may be eliminated by changing `GRUB_TIMEOUT`
to `0` in `/etc/default/grub`, followed by running `update-grub2`.

Finally, a login prompt on a media PC is completely useless, so you should
configure LightDM to automatically log in a user. This is achieved by editing
`/etc/lightdm/lightdm.conf`. Inside the `[Seat:*]` section, uncommment and set
the value of `autologin-user`.

Another quick reboot will confirm your Grub, Plymouth and LightDM configuration.
Note that once you're automatically logged in now, the desktop is black, rather
than having a default wallpaper.


### Installing Kodi, configuring sound and remotes

The very latest version of Kodi is easily installable via the official `kodi`
package - no extra downlods or custom builds needed.

You will also need to install `alsa` and `alsa-utils`. After installing, run
`alsamixer` and use the arrow keys to select outputs and adjust volumes.
Pressing `m` will toggle mute on specific outputs. `esc` will exit.

You can now test Kodi by launching it from a console or remotely:

`$ DISPLAY=:0 kodi`

It should launch in full-screen, and play sounds if you move between menu items
with the keyboard or mouse. Double-check the audio configuration at this time as
well.

If you have a remote, you will need to install and configure `lirc`, which I can
only describe as the most "open source" package I've used in a very long time.
A lot of trial and error led me to the following configuration (thankfully, I
have the fairly common MCE (Media Centre Edition) remote):

- Copy `/usr/share/lirc/remotes/mceusb/lircd.conf.mceusb` to
`/etc/lirc/lircd.conf` (change the source remote file based on your own model).
- Modify `etc/lirc/hardware.conf`:
  - set `DRIVER=default`
  - set `DEVICE=/dev/lirc0`
- Restart the `lirc` service.

If you have Kodi running while doing this, you will have to restart it. I gather
that it only looks for a running/working `lirc` instance on startup.

Once I had the above settings working, Kodi responded to all button presses as
expected, with no further configuration on that end. You mileage may and
probably will vary.


### Installing and configuring Steam, Xbox controller

Follow the instructions to
[enable 32bit architecture and install Steam on the Debian wiki](https://wiki.debian.org/Steam).
I also needed to install the `libgl1-nvidia-glx:i386` package before Steam would
start.

You can test that it runs by executing from a console or remotely:

`DISPLAY=:0 steam -bigpicture`

After the initial Steam download, it should launch in full-screen Big Picture
mode.

Next up, we need PulseAudio for Steam. Unfortunately Kodi prefers `alsa` and
Steam prefers `pulseaudio`, so we need to do some juggling between the two.

Install the `pulseaudio` package, and then modify the following in
`etc/pulse/client.conf`:

- set `autospawn = no`
- set `daemon-binary = /bin/true`

This prevents Pulse from starting up at boot time, allowing us to start it up
and terminate it only when required for Steam.

Test it out by doing the following:

- Restart
- run `pulseaudio --start`
- run Steam as per the command shown earlier
- In Steam settings, reconfigure the audio (I find it helps to enable/turn up
    ambient sounds during this process as you can hear it working)
- Close Steam and run `pulseaudio -k`
- run Kodi, make sure audio settings are still correct and that sounds are
    happening.

The final step in the Steam setup process if required, is to install the XBox
controller driver. This can be done by simply installing `xboxdrv`. Your
controller should be able to control Kodi and Steam once installed.


### Kodi auto-start, final touches

To finally tie it all together, Kodi should be set up auto-start. This is done
quite easily by creating `~/.config/openbox/autostart` for the auto-login user,
and adding the following: `kodi &`

Now, if you restart the PC it should whizz past Grub, show you a graphical boot
splash, automatically log in a user, and launch Kodi, ready to start doing
multimedia things.

For launching Steam, there may be Kodi Program add-ons available, or you may
use on of the more generic launcher add-ons.

For my purposes with the PulseAudio setup described here, I created my own
launcher add-on, which you may find useful with the above configuration.

- [Steam Launcher Add-on](/assets/files/steam.zip)
- [Firefox Launcher Add-on](/assets/files/firefox.zip)
- [Minecraft Launcher Add-on](/assets/files/minecraft.zip)

All the above may be installed by going into Settings -> Add-ons and selecting
to install from a .zip file. Once installed they appear in the Programs menu.

The source for all of these is
[available on GitHub](https://github.com/shrimpza/kodi-addons), should you wish
to make your own modifications.
