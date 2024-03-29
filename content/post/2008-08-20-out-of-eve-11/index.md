---
categories:
- Gaming
- Development
date: "2008-08-20T20:27:30Z"
published: true
tags:
- PHP
- Eve Online
- Out of Eve
title: Out Of Eve 1.1
---

As mentioned previously, I just wanted to outline a few plans for a new
[Out Of Eve](http://www.outofeve.com/) version, mostly for my own
reference, as I'm finding it much easier to work toward goals which are
actually written down/typed up (lol?).

Obviously first order of business is Empyrean Age compatibility. A
number of table and field names have changed and require some code
updates. Lots of icons have been added and updated, so I would also like
to make use of those. Unfortunately a number of images are actually
missing in the EA icon dump (drones, rookie ships), so a simple drop-in
replacement doesn't works so well.

Another essential requirement, which should probably have been included
in the original release, is encrypted API keys. My plan is to simply
encrypt and decrypt these with a simple key file stored elsewhere in the
filesystem - away from the usual configuration file, database and
published www documents, so if any of that is compromised, without the
key file, the API keys are useless to anyone snooping them. This also
requires a method to automatically update existing unencrypted API keys.

Another handy feature would be the introduction of Atom feeds for market
and journal transactions. My initial idea was an entry for each new
transaction, however anyone doing a lot of trading would find their feed
reader overloaded quite quickly. The obviously better solution is to
just generate entries with all transactions since the last feed poll
(taking into account API caching delays as well). I know I'd find this
one particularly useful.

Actually that's all :-). If all goes well, it should be releasable by
the end of the weekend.
