--- 
layout: page 
status: publish 
published: true 
title: DynaBar
date: '2006-08-07 22:35:26 +0200'
---

### Update 14 April 2013:

*This project hasn't been maintained or updated since original release.
It's possible it still works out-the-box with an appropriate PHP
configuration, however your mileage may vary. It's still here mostly for
archive and reference purposes.*

------------------------------------------------------------------------

A userbar is a small image (350x19) typically used in the 'signatures'
of forum (the phpBB, vBulletin, etc type) users, to show their support
for software, hardware, food, pretty much anything.

DynaBar adds another dimension to userbars, as it generates them
dynamically from plugins (a small PHP script which determines the text
displayed on the userbar).

This allows users to show all kinds of real-time information in their
userbar signature images, such as game statistics, weather, their
currently playing song, random texts, etc, etc.

Features
--------

-   Userbar content is completely dynamic, and can be generated from
    information available in real-time.
-   All content is provided via a simple plugin system, plugins are easy
    to create and can return any information, and gather that
    information from any source.
-   Complete interactive userbar designer, allowing users to create
    their own userbars quickly and easily, using any available plugins,
    and a host of visual options. As you work, a preview is updated so
    you see the results of your changes instantly.
    Cross-browser compatible.
-   Once generated, userbars are cached (each plugin can define it's own
    cache timeout), saving bandwidth and server resources.
-   Userbar browser, showig all userbars created with DynaBar, and
    presenting simple HTML and Forum cut-and-paste code.
-   Ability for users to create animated/rotating userbar "groups".
    String multiple userbars into a single animated one, still
    maintaining it's dynamic DynaBar content.
-   No database or other advanced back-ends required.
-   Simple setup - dump the scripts onto your server, set some directory
    permissions, and you're ready to go. No direct server access or
    administrative interaction required.
-   PHP 4 and PHP 5 compatible. (individual plugins may have more
    specific requirements).
-   Suitable for installations on community websites, as an extra
    'service' for users. Plugins are simple enough to enable webmasters
    to create custom content for their community/site quickly
    and easily.

Default plugins
---------------

These plugins are part of the default DynaBar 2 installation. If you've
created a plugin and would like linkage, please leave a comment.

- **Battlefield 2** - Fetches various player stats directly from the Battlefield 2 stats servers.
- **Fortune** - When running on a Linux or BSD server with the fortune application
    installed, can generate random furtunes.
- **Hamachi** - Displays the status of a Hamachi user (<http://hamachi.cc/>)
- **QStat** - When running on a Linux server with the Quakestat application
    installed, can show various live game-server stats, including
    current map, player load, server name and IP.
- **Quotes** - Randomly chooses from 10 user-defined plain-text quotes/messages.
- **RSS** - Display the latest headline from a valid RSS feed. PHP5 only.
- **LastFM (Scrobbler)** - Show the most recently played music track of a LastFM user.
    (<http://last.fm/>)
- **LastFM Artist Sloganizer** - Choose from a LastFM user's top 10 artists and Sloganize it.
- **Sloganizer** - Uses the Sloganizer service/website to randomly generate a custom
    slogan (<http://www.sloganizer.net/en/>)
- **User Spy (Spy)** - Displays various information about the user viewing the userbar.
    Will tell a person their IP, browser and operating system.
- **Text** - Show a plain-text user-defined string.
- **TrackMania** - Can show the global or national rank, and score of a
    TrackMania player. (<http://www.trackmanianations.com/>)
- **Uptime** - When run on a Linux/BSD/Unix server, will show the server's uptime.
- **XFire** - Get information from an XFire user's profile. Uses code from
    <http://customsigs.free.fr/> to collect the profile data.
    (<http://www.xfire.com/>)

Demo
----

[Check out the demo.](http://dynabar.shrimpworks.za.net/designer/)
[Browser and group
creator.](http://dynabar.shrimpworks.za.net/designer/browse.php)

Please only use this demo installation as a test for creating userbars
and exploring DynaBar features and functionality. Don't link to images
created here from forum signatures or similar. Thanks.

Download
--------

[Download DynaBar 2.](/assets/projects/dynabar/dynabar2.zip)

See the included README in the "docs" directory for additional
installation and usage information.
