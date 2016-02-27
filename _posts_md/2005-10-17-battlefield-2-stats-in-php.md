---
layout: post
status: publish
published: true
title: Battlefield 2 Stats in PHP
date: '2005-10-17 14:08:03 +0200'
categories:
- Gaming
- Development
tags:
- PHP
- Battlefield 2
- Stats
---

I've had a couple of questions regarding my [Battlefile 2 Stats in
Python](http://shrimpworks.za.net/2005/09/12/battlefield-2-stats-in-python/)
post, and how it may be possible to do the same in PHP, so I thought I'd
add an update for that.

Simple PHP code for Battlefield 2 Stats retrieval:

``` {.prettyprint}
    ini_set("user_agent","GameSpyHTTP/1.0");

    $info = "per*,cmb*,twsc,cpcp,cacp,dfcp,kila,heal,rviv,rsup,rpar,tgte,dkas,dsab,cdsc,rank,cmsc,kick,kill,deth,suic,ospm,klpm,klpr,dtpr,bksk,wdsk,bbrs,tcdr,ban,dtpm,lbtl,osaa,vrk,tsql,tsqm,tlwf,mvks,vmks,mvn*,vmr*,fkit,fmap,fveh,fwea,wtm-,wkl-,wdt-,wac-,wkd-,vtm-,vkl-,vdt-,vkd-,vkr-,atm-,awn-,alo-,abr-,ktm-,kkl-,kdt-,kkd-";

    $pid = '43595724';
    $data = file("http://bf2web.gamespy.com/ASP/getplayerinfo.aspx?pid=".$pid."&info=".$info);

    $stats = array_combine(explode("\t", $data[3]), explode("\t", $data[4]));

    printf("%s has %s kills and %s deaths and a score of %s", $stats['nick'], $stats['kill'], $stats['deth'], $stats['scor']);
```

Note that if you're not using PHP5, you'll need to add the following
drop-in replacement for the "array\_combine" function:

``` {.prettyprint}
    function array_combine($keys, $vals) {
        $i = 0;
        foreach ($keys as $key) {
            $newarray[trim($key)] = trim($vals[$i++]);
        }
        return $newarray;
    }
```

It's also important to note that while at the time of writing this, this
method of retrieving stats works, EA, DICE and GameSpy are supposedly
working on a new XML-based stats system for BF2.

**Updated:** Since this was written, some things changed with the stats
system, and the GameSpy application requires you to pass a bunch of
columns you want info for. This can help customise the data you get
back, so you only request what you need. I've included all the columns
in the **\$info** variable, which you can customise. Make sure it
contains only valid columns, or you won't get any data back at all.

For info on what to do with the stats, and what all the columns etc.
mean, check out the [BF2 Technical
Wiki](http://bf2.fun-o-matic.org/index.php/BF2Stats).
