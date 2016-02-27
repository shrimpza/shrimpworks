--- layout: post status: publish published: true title: Broken Apper on
Debian Unstable/Sid author: display\_name: Shrimp login: shrimp email:
shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/ author\_login:
shrimp author\_email: shrimp@shrimpworks.za.net author\_url:
http://shrimpworks.za.net/ wordpress\_id: 461 wordpress\_url:
http://shrimpworks.za.net/?p=461 date: '2013-09-14 12:08:42 +0200'
date\_gmt: '2013-09-14 10:08:42 +0200' categories: - Random tags: -
Debian - Linux ---

All of my Debian desktop installs running KDE received an update a month
or two ago which rendered the "Apper" package management application
broken, failing with the following error:

    Unable to open database read-only: Database action 'prepare dependency insert 
    statement' failed: table dependencies has no column named items_installed

The solution is to delete the Listaller cache DB:

    rm -r /var/lib/listaller/db/

The cache will be recreated automatically with the expected structure on
the next run of Apper (or other PackageKit type thing).
