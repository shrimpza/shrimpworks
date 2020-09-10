---
categories:
- Development
- Software
date: "2006-05-28T21:53:35Z"
published: true
tags: []
title: PHP Image Browser and Download Stats
---

Created two very basic scripts this past week:

The first, a basic **Image Browser**:

Basically, I really hate trying to set up and use normal image
publishing/gallery software. Something like
[Gallery](http://gallery.sf.net/) is pretty nice and feature packed, but
for putting a photo of your cat online, it's pretty much a mission, with
users, permissions, logins, galleries, categories, grouping, keywords,
thumbnail options, etc, etc. I just want to upload a JPEG and say that's
the end of it, but still have ti browsable with some thumbnails that
didn't take me 10 minutes to create in Photoshop.

Anyway, yar. So I made this script. It's actually a pair of scripts. A
basic browser interface that simply goes through a directory, finds all
images, links to them, and shows thumbnails of them via the second
script - a basic thumbnail generator.

So 'installation' is simply dropping this pair of scripts into the
directory you want to publish your images from, and it's done. Any
sub-directories will be navigable, so you can use them as 'categories'
if you'd like. Since the thumbnails are generated on the fly as needed,
there's no database or anything, and adding a new image is as simple as
dropping the file into your image directory.

The second script, is a **Download Tracker**:

Extremely simple again, simply does a count of hits on any file passed
to the `file.php` script. The files can be located anywhere on the
system (so if you *really* don't want people getting at your files
without going through the counter, they can be outside of your www
published path).

Again, I was going for simplicity here, so there's no massive upload
manager UI, or snazzy hit monitoring UI, or a 5000 table MySQL database.
It keeps track of the hits by simply storing them in a regular PHP
array, and then serializing this array to a file. Next time the file it
requested, the hit log file is loaded, then unserialized into the array,
the array is updated and serialized again. :). So you'll need to make
sure the `files.log` file is writable by the web server (or the whole
directory the tracker files are in). It also requires PHP5, unless you
write replacement functions for `file_get_contents()` and
`file_put_contents()` on earlier PHP versions.

Link to a file as follows:
`http://my-site.za.net/file.php?installer.exe`, or even
`http://my-site.za.net/file.php?path/to/document.pdf`

You can then view the hits and things via the `file_stats.php` which
outputs a very basic tabular representation of the stats the hit log
tracks.

Both of these packages' code is pretty well documented, so if anything,
they may be educational so you can build more exciting versions of
these. However, as they are, they serve my needs, but just thought I'd
share anyway ;).

Usage instructions are also within the code.
