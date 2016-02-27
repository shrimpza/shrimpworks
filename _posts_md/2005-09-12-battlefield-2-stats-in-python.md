--- layout: post status: publish published: true title: Battlefield 2
Stats in Python author: display\_name: Shrimp login: shrimp email:
shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/ author\_login:
shrimp author\_email: shrimp@shrimpworks.za.net author\_url:
http://shrimpworks.za.net/ wordpress\_id: 41 wordpress\_url:
http://malcolm.shrimpworks.za.net/\~shrimp/blog/?p=41 date: '2005-09-12
09:55:22 +0200' date\_gmt: '2005-09-12 07:55:22 +0200' categories: -
Gaming - Development tags: - python - Battlefield 2 - Stats ---

Yes, so everyone's obsessed with checking their BF2 stats these days ;).

Anyway, I wanted to give my [Supybot](http://www.supybot.net) IRC bot
("Nooblet" on Shadowfire) the ability to check my own and other people's
stats whenever they felt like it. I came up with something like this:

``` {.prettyprint}
import urllib2
from string import split
from time import time

# the columns you want to request data for. comma-seperated string.
info = 'per*,cmb*,twsc,cpcp,cacp,dfcp,kila,heal,rviv,rsup,rpar,tgte,dkas,dsab,cdsc,rank,cmsc,kick,kill,deth,suic,ospm,klpm,klpr,dtpr,bksk,wdsk,bbrs,tcdr,ban,dtpm,lbtl,osaa,vrk,tsql,tsqm,tlwf,mvks,vmks,mvn*,vmr*,fkit,fmap,fveh,fwea,wtm-,wkl-,wdt-,wac-,wkd-,vtm-,vkl-,vdt-,vkd-,vkr-,atm-,awn-,alo-,abr-,ktm-,kkl-,kdt-,kkd-'

# this is my BF2 ID. You can also query the stats server with "nick" rather than "pid", but I've had problems with some characters
pid = '43595724'

opener = urllib2.build_opener()
opener.addheaders = [('User-agent', 'GameSpyHTTP/1.0')]  # otherwise GameSpy's servers will block your request
webData = opener.open('http://bf2web.gamespy.com/ASP/getplayerinfo.aspx?pid=%s&info=%s&nocache=%s'%(pid,info,round(time()))).read()

statsData = split(webData, "\n")

cols = split(statsData[3], "\t")
data = split(statsData[4], "\t")

stats = dict(zip(cols, data))

# you now have a nice dictionary with a few hundred bits of stats data.
print "%s has %s kills and %s deaths and a score of %s" % (stats['nick'],stats['kill'],stats['deth'],stats['scor'])
```

Thanks to korpse and mithrandi for showing me the "zip" funtion. It
takes the list from the first parameter, and uses those values as keys
in a dictionary, the values from the second parameter are then used as
values in that dictionary. I was using map(None, keyList, valueList),
but zip seems cleaner.

Anyway, if you're looking for more info on stats querying, try the [BF2
Technical Info
wiki](http://bf2.fun-o-matic.org/index.php?title=BF2_Statistics), or
check out [SaladFork's Guide to Creating a BF2 Stat
Signature](http://www.totalbf2.com/forums/showthread.php?t=17936) -
although it's in PHP, he does give a nice [list of column
names](http://www.totalbf2.com/forums/showthread.php?t=17936#3.3) and
their meanings, you can also grab lists of ranks, weapons, vehicles,
etc.

***Update:** Also see: [Battlefield Stats in
PHP](http://shrimpworks.za.net/2005/10/17/battlefield-2-stats-in-php/)*

**Updated:** Since this was written, some things changed with the stats
system, and the GameSpy application requires you to pass a bunch of
columns you want info for. This can help customise the data you get
back, so you only request what you need. I've included all the columns
in the **info** variable, which you can customise. Make sure it contains
only valid columns, or you won't get any data back at all.

As above, for info on what all the columns etc. mean, check out the [BF2
Technical Wiki](http://bf2.fun-o-matic.org/index.php/BF2Stats).
