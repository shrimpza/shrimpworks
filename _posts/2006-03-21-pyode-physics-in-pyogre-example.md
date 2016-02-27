---
layout: post
status: publish
published: true
title: PyODE physics in PyOgre example
date: '2006-03-21 13:17:15 +0200'
categories:
- Gaming
- Development
tags:
- python
- Physics
- Ogre
- PyOgre
- ODE
- PyODE
---

Guess it shouldn't have taken so long for me to get around to doing
this, but at least it's done now.

Attached to this post you'll find a zip file, containing a small example
application which allows you to spawn PyODE physics-enabled cubes with
the middle mouse button into a
[PyOgre](http://www.ogre3d.org/wiki/index.php/PyOgre) world. You can
then bounce and roll the cubes around by holding the left or right mouse
buttons.

The code is fairly straight-forward, and I've included quite a number of
comments. Should be easy enough to follow what's going on if you've been
through the PyOgre tutorials.

A note of performance and stability - you can safely spawn loads of
cubes as long as there are not too many collisions going on at once
(after around 50 cubes, things start to get really sluggish if there are
too many inter-cube collisions going on). In practice though, I doubt
you'd need that many collisions happening at any one time. Also, If you
make a large pile of cubes, lift them all up, and let them fall down
together, it seems to bomb out as there are too many collisions
happening when they all land on top of eachother at once. I haven't
debugged this very much, so I'm not sure yet if it's a ODE limitation,
or something bad I'm doing in the code. If anyone works it out, I'd be
interested to know.

Please don't ask for advice on stuff like per-polygon collisions,
terrain collision and the like, I have not really messed with this
beyond the state of this example. Once you get the basics going after
checking out the example, I'm sure a few questions shot off at the
[PyOgre Forums](http://www.ogre3d.org/phpBB2addons/viewforum.php?f=3)
would turn up more useful results than asking me :).

Have fun ;).
