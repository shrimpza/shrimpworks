---
categories:
- Gaming
- Development
date: "2005-12-26T17:14:34Z"
published: true
tags:
- Ogre
- PyOgre
- Game Development
- Game Engines
- Irrlicht
- Modeling
- Wings 3D
title: Game Development Stuff
---

It seems as though the guys at work are seriously looking into the
option of doing some game development next year some time, and they've
been busy checking out various engines and frameworks to help with this.
Despite being the only person at work who plays games seriously, and my
[history of developments on the Unreal
engine](http://unreal.co.za/shrimp/), I haven't really been included
much with what's going on.

However, since game development (of any kind) is the number one thing
I'd like to be doing with my life (**NOT** point of sale systems!!),
I've decided to involve myself anyway :D.

I have been playing around with a couple of game and physics engines
(games being discussed are potentially vehicle-based), and
[Irrlicht](http://irrlicht.sourceforge.net/) particularly seems rather
nice. [Korpse](http://kaydash.za.net/) however, suggested I take a look
at [Ogre](http://www.ogre3d.org/). I was very pleasently surprised to
find the [PyOgre project](http://www.ogre3d.org/wiki/index.php/PyOgre),
which exposes about everything Ogre can do, to Python (you don't even
need the Ogre SDK, it works completely on it's own), and seems very well
supported. I'm a lot more comfortable with Python than I am with C++ :).

The only down side, is that Ogre is not a complete game engine, but
rather simply a graphics engine. Meaning, I'll have to work out how to
add sound, physics, advanced input options (Ogre does support keyboards
at least), etc on my own. There are a lot of options available for all
of those, so I'm not really worried about it at the moment.

I've begin putting together a bit of a basic framework for myself,
trying to base how things work around how UnrealScript works and
interacts with classes and objects. It's working out pretty cool, thanks
again to Python.

As a test project, I've decided to put together a sort of basic World
War II flight sim. All you need really is a model, some terrain, and
basic flight physics (which I plan on simulating without the use of a
physics engine, in a similar fasion to how I did some stuff in Unreal
Tournament \[pre-Karma\]).

Since the scripting is going well, I decided to take a shot at a quick
model. I came across [Wings 3D](http://www.wings3d.com/) -- a simple
"subdivision modeler". Basically you start off with whatever primitive
shape (cube, spheres, cylinder, etc) you think will suit what you're
going to build, and stretch and warp it into the final product. I've
never modeled like this before, but it works surprisingly well.

After 2 hours work, I got the following result from a 16-sided cylinder:

{{< img src="bomber.png" class="image-center full-width" >}}

There are quite a number of rather ugly polygons, but it was a learning
experience :).
