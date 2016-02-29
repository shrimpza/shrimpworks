---
layout: post
status: publish
published: true
title: Physics with PyODE
date: '2005-12-29 00:00:16 +0200'
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

My idea for implimenting non-physics physics into my little game
framework didn't work out too well, so I gave in and took a look around
for options.

It seems only ODE is available to Python, via
[PyODE](http://pyode.sf.net/). Not many [open source] physics engines
seem to have Python bindings, which I find rather odd.

As it turns out, it isn't actually all that of a mission to get ODE and
Ogre working together, and the results I've got so far are quite
acceptable. I can spawn loads of cubes (of varying sizes) and throw them
around the scene and they bounce and jump around in a suitable fasion.

<div align="center">

![PyODE and PyOgre playing nicely](/wp-content/ode_thumb.jpg)

</div>

I haven't tried with balls or polygon-accurate stuff yet, that's next on
the to-do list. I also intend writing a short how-to for PyODE and
PyOgre integration at some point, as I was a little confused to start
with, not knowing quite where or how to begin, and there is no
PyODE/PyOgre example code floating around to reference.

*EDIT: Example using PyODE and PyOgre now available -
<{% post_url 2006-03-21-pyode-physics-in-pyogre-example %}>*
