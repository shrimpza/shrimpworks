---
date: "2016-03-10T00:00:00Z"
title: Website update
---

Yup. It looks different. For the first time in over 11 years, this website is not being built 
dynamically by PHP scripts.

I've jumped on the static site generation bandwagon, and after taking a look at several options 
(primarily [Hugo](http://gohugo.io/) and [Nikola](https://www.getnikola.com/)), and decided to
settle on [Jekyll](https://jekyllrb.com/). At the end of the day the easiest to install and get 
started with won, basically (which I found amusing for a Ruby project, for some reason).

There are a couple of reasons for wanting to change. Primarily, it seems every second day I read 
about some new Wordpress exploit wiping out sites left right and centre. It's just another point of
admin to update things all the time, which I could do without. Additionally, I'm tired of bots
smashing into the admin login page all day. While it doesn't *really* impact me all that much, it's
just something that bothers me.

The myriad plugins "required" to manage comment spam, the aforementioned login attempts, galleries, 
links, etc. all provide their own potential security issues, and all need to be regularly
updated (assuming their authors didn't abandon them years ago).

Finally, I wanted to do some custom design (yes, I'm not fantastic at it), but the thought of 
building mixed HTML and PHP templates for Wordpress horrifies me.

For the conversion, I used the [Jekyll Wordpress](http://import.jekyllrb.com/docs/wordpress/) 
migration process, which resulted in a bit of a mess, followed by conversion from HTML to Markdown 
using [Pandoc](http://pandoc.org/), which did an excellent job. Over several days I had to clean up 
and reformat most pages, rebuild the galleries, redesign everything, etc., but I feel the result is 
worth it.

The full source code (plugins, config, assets, posts etc) are 
[available in GitHub](https://github.com/shrimpza/shrimpworks/) if anyone wants to steal anything.
