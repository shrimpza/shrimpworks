---
layout: page
status: publish
published: true
title: Monster Hunt
date: '2013-04-14 13:55:40 +0200'
---

***14 April 2013 Update:** I am reproducing the original Monster Hunt
website here for archiving and future reference purposes. The whole
website has been reproduced on a single page, in sections below. As an
addendum, more Monster Hunt related downloads can be found at
[UT-Files.com](http://ut-files.com/index.php?dir=GameTypes/MonsterHunt/).*

*Additionally, the [Monster Hunt Source code]({% post_url 2006-02-05-monster-hunt-source-code-release %})
was released in February 2006.*

{% youtube yz6lJwUSkmo %}

----

![](/assets/projects/monster-hunt/title.jpg){: .image-center}

----

# About![About](/assets/projects/monster-hunt/about.jpg){: .image-right}

Monster Hunt is a team based modification for Unreal Tournament
comprising of two new game types, Monster Hunt and Monster Arena.

In Monster Hunt, you and your team of hunters (humans or bots) must work
your way through the level while killing everything that stands in your
way. Monsters you'll face range from the tiny but deadly Pupae, to slimy
Sliths that spew blobs of slime at you, to the huge stone-throwing
Titans.

Monster Hunt is the perfect blend of multiplayer and single single
player, single player in the sense that the levels and style of Monster
Hunt are very much like that of a single player game, but the team based
gameplay gives it a great multiplayer feel.

Players must work as a team to survive, players on their own will be
overpowered by the monsters and sent back to the beginning of the level.
Players shouldn't grab all the health and ammo as they come to it, it
should be shared out amongst the players who need it most, or you could
let one player grab lots of health and pick-ups and he can then charge
the monsters to weaken them, the other players following. All this also
adds a bit of strategy to the gameplay.

Monster Arena is very differant from Monster Hunt, in Monster Arena, you
and your team aren't batteling your way through the level to get to the
boss at the end, rather you are faced with one extremely powerful
monster that must be killed.

-----

# Screenshots![screens](/assets/projects/monster-hunt/screens.jpg){: .image-right}

Here are a few screenshots from some of the maps that come with Monster
Hunt:

<br />


{% gallery photos %}
  monster-hunt/
{% endgallery %}

-----

# Downloads![download](/assets/projects/monster-hunt/download.jpg){: .image-right}

Here, you'll be able to download the latest versions of Monster Hunt:

***Latest full version:***

[Monster Hunt release 5](/assets/projects/monster-hunt/monsterhunt500.zip) - UMOD - 6 278 KB

***Latest patches/updates:***

[Monster Hunt release 5 update 3](/assets/projects/monster-hunt/monsterhunt503.zip) - ZIP - 346 KB

-----

# Mapping for Monster Hunt![mapping](/assets/projects/monster-hunt/mapping.jpg){: .image-right}

***Monster Hunt***

-   Before you start on a map, open the MonsterHunt.u package in the
    class-browser so you have access to all the Monster
    Hunt-specific stuff.
-   Maps should be more of a single player style, but make sure there
    are enough pickups for all the players and that there's enough space
    for a group of players to move around in.
-   Boss monsters should be in large spacious areas, the players must be
    able to concentrate on defeating the monsters and not have to worry
    about the surrounding architecture.
-   Make an escape route for the players to run through and place a
    MonsterEnd trigger (found in the classe-browser: Triggers -&gt;
    Trigger -&gt; MonsterEnd) where the players will run to end
    the level.
-   If you want to add bot support to your map (very highly
    recommended), you can use the MonsterWaypoint actor (found in the
    classe-browser: Keypoint -&gt; MonsterWaypoint). Just put the
    MonsterWaypoint actors wherever you want a bot waypoint to be, like
    near a button or a lever, or just along the path through the level.
    Set it's Position property to tell the bots in which order the
    waypoints must be visited. Set the first one at 1, the next at 2,
    then 3, and so on. You can also enter the Event tag of a particular
    actor so when the bot gets to the waypoint, something can be
    triggered to happen.
-   Be sure to add lots of PlayerStarts at the beginning of the level to
    make sure the players don't telefrag each other when the round
    starts - about 12-18 will be enough for a normal size map.
-   You can implement simple puzzles for the players to solve along the
    way, but don't use too many as players will probably get frustrated.
-   Feel free to use as many special effects as you like, in this style
    of game, the players will really take note an think "How'd they do
    that???" :-)
-   Remember that there is no Translocator, so don't make any situations
    where it's needed to progress.
-   The difficulty of the map is important, start with relatively weak
    monsters and as players progress through the level, use stronger and
    stronger enemies.
-   Make sure your Boss monster is pretty strong, players will be
    disappointed it only takes a few shots to kill it.
-   Don't put any monsters near to where the players will start, they'll
    all be slaughtered as soon as they spawn.
-   Environmental hazzards (slime, lava, huge drops, etc.) are great,
    but make sure the boss monster(s) can't fall in, or it'll spoil the
    fun of defeating them.
-   Don't give the players the best guns at the beginning, or they'll
    mow through the monsters too easily.
-   Use the MonsterEvent (under Triggers &gt; SpecialEvent) to display
    messages for the players, everything has already been
    pre-configured, just type the message and connect it to a trigger.
-   Set the boss monster's bIsBoss to True so the player can get extra
    points for killing him.

***Monster Arena***

-   The same rules that apply to Monster Hunt maps apply to Monster
    Arena maps as well, but there are a few more things to keep in mind:
-   Make sure you create a small protected area somewhere in the map
    that the players can safely spawn in, you can even seal it off by
    using a door.
-   You should provide the players with some guns in the protected area
    but don't give them too many and make sure the weapons suit the
    arena and the monster to be killed.
-   Place as much health and ammo around the arena as you like.
-   Give the players lots of place to move in, and make sure the boss
    can't get stuck anywhere.
-   Place a MonsterArenaEnd trigger in the map (found in the classes
    browser: Triggers -&gt; Trigger -&gt; MonsterEnd
    -&gt; MonsterArenaEnd) and set an Event for the boss and set the Tag
    of the MonsterArenaEnd to corrospond with the boss' Event.
    (IMPORTANT! - Make sure you add the trigger in the centre of the map
    using the Top View)

-----

# Credits![credits](/assets/projects/monster-hunt/credits.jpg){: .image-right}

***Programming, maps, graphics, website & help files:***

-   Kenneth "Shrimp" Watson

***Playtesters:***

-   BikerBob
-   Wipeout
-   DuckMan
-   _Tuke

***Special thanks:***

-   Valkyrie
-   Albert Reed (Also worked on the HeadHunters mod)
-   Beppo (lead coder for Infiltration)
-   JohnMcL (lead coder for Warbots)
-   UsAaR33 (creator of OldSkool)
-   Epic Games
-   and everyone at UnrealZA

-----

# News![news](/assets/projects/monster-hunt/news.jpg){: .image-right}

#### 28 September 2002

I have released the final patch for Monster Hunt. This fixes most bugs
and problems with the previous release, and I think it's in a good
enough state to retire in :-).

You can find the link on the Downloads page.

Have fun with it... Now that it's fixed up you're going to be faced with
hundreds more monsters than in the previous release :-)

#### 31 January 2002

Nothing is really happening at the moment, and nothing's likely to
happen for quite a while. When Unreal II comes out, I hope to make
Monster Hunt II for it. It should be pretty fun :-). It's also a bit of
a bonus for MH that U2 won't ship with any co-op gametype, so MH should
fill the void for a few players who were hoping for co-operative play in
Unreal II.

Meanwhile, there have been a lot of people asking which versions they
should get, and which patches, so here's a quick list of the files you
need to play Monster Hunt:

Monster Hunt release 5 (6.2MB) - The most recent 'full version' of
Monster Hunt. Also avaliable in a non-UMOD version.\
Monster Hunt release 5 update 2 (0.4MB) - Fixes all multiplayer problems
with life limits, HUD displays and a few more, as well as fixes a bug
which caused the game to crash in R5 update 1.\
Gomorra (0.2MB) - A music track required for MA-RocketArena I forgot to
include in the R5 package...

All these files are also available on the Downloads page.

If you want some new maps to play, take a look at the Maps page where
you can download some user-created maps. Please keep in mind that a few
of these were made for older versions of the mod which didn't have the
AI features of the latest version, so bots may not respond as expected.

Don't forget to check out the German MonsterHunt.de site, as they have a
growing map collection as well as a number of tutorials available. If
you have made an MH map, you can send it to them and they will host it
for you on their site as well.

Lastly, pop into the forums from time to time for a little chat-chat
:-).

#### 12 January 2002

A new Monster Hunt fan site has been launched!

The site is in German but I know there are a lot of German MH fans out
there so that shouldn't be a problem at all.

It's still pretty new, so it may seem a little empty, but I'm sure the
guys over there will fill it up in no time :-)

- http://www.monsterhunt.de

#### 27 December 2001

Is seems as though the forum is back up and running again.

Let's hope it stays like that now ;-)

#### 24 December 2001

The forum seems to be down for the time being... I have no idea when
it'll be back :-(

Sorry...

#### 23 December 2001

The forum is now up and running :-)

Have fun posting away as usual.

#### 22 December 2001

New site up! Everything's in working order, except the forum which I'm
having a little trouble uploading at the moment.

Other than that, everything is normal, with slight changes to layout in
the maps and downloads sections.

Hopefully I'll have that forum working in a little while...

#### 22 December 2001

I have just started this new site, hopefully it'll be finished later
today and I can put it on-line.
