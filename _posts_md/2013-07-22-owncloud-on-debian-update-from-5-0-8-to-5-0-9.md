--- layout: post status: publish published: true title: ownCloud on
Debian update from 5.0.8 to 5.0.9 author: display\_name: Shrimp login:
shrimp email: shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/
author\_login: shrimp author\_email: shrimp@shrimpworks.za.net
author\_url: http://shrimpworks.za.net/ wordpress\_id: 418
wordpress\_url: http://shrimpworks.za.net/?p=418 date: '2013-07-22
10:20:58 +0200' date\_gmt: '2013-07-22 08:20:58 +0200' categories: -
Random tags: \[\] ---

\*Update 1\* - one minor upgrade later, and they're back to the previous
configuration in `/usr/share/owncloud`. Joy. Guess I'll give it up.

\*Update 2\* - ok, so unfortunately I didn't give up, and wow 5.0.10 is
back in `/var/www/`. Double-you tee eff.

I've been trying out hosting my own ownCloud instance on one of my
Debian servers, and it's mostly gone pretty well, using their official
apt repositories.

On around the 17th of July however, ownCloud published an update from
version 5.0.8 to version 5.0.9 which completely broke the system as they
changed where everything was installed to. I thought Id write up a
couple of pointers to getting things up and running again, if you've
suffered the same problem.

Firstly, the application itself has moved from `/usr/share/owncloud/` to
a more conventional `/var/www/owncloud/`. This means you'll have to
update any Apache config you might have done to get it accessible. They
removed the original `/etc/apache2/conf.d/owncloud.conf`, so if you were
relying on that, you'd have to create something new and correct in
`/etc/apache2/sites-available/` and symlink it in
`/etc/apache2/sites-enabled/`.

Next, the config configuration has also changed. Previously, the
`owncloud/config/` directory used to be a symlink to `/etc/owncloud/`,
but now they have provided an actual config directory within the
ownCloud installation. I removed this directory, and created a symlink
to `/etc/owncloud/` as `/var/www/owncloud/config/`

Once that's all set up, you should be able to load ownCloud in your
browser and it should perform an upgrade on the DB. In my case, the
upgrade process got stuck in a loop, I presume it's setting a cookie
that is not being cleared correctly. The "solution" was to restart my
browser.

When you log in thereafter, all your stuff should be present as it were
pre-upgrade.

It's probably also a good idea to make regular backups of
`/usr/share/owncloud/data/` - thank goodness this wasn't wiped out with
the rest of the previous install location.
