---
layout: post
status: publish
published: true
title: Using FindBugs with Ant
date: '2015-06-29 19:23:53 +0200'
categories:
- Random
tags: []
---

![](http://findbugs.sourceforge.net/buggy-sm.png) I've been meaning to
do some posts on setting up a Java build process using Apache's
[Ant](https://ant.apache.org/) and [Ivy](https://ant.apache.org/ivy/),
but never really get that far.

I'm a fan of allowing build dependencies (beyond the actual Ant binary
itself) download automagically as part of the build, rather than
requiring the developer to download and install a bunch of different
tools and then orchestrating them via Ant. Essentially you should be
able to install Ant, grab the code of something you want to build, and
execute it.

To this end I have spend many hours trying to get the
[FindBugs](http://findbugs.sourceforge.net/) static analysis tool and
it's requirements downloaded as Ivy dependencies as is possible with
most tools, but gave up due to some rather weird and seemingly
hard-coded dependency paths and file names within the FindBugs project.

Therefore I gave up and just have it downloading using an [Ant "get"
task](https://ant.apache.org/manual/Tasks/get.html), which feels a bit
brute-force, but sometimes you need to compromise. Here's my solution,
presented as an all-in-one Ant target:

[](){#more}[](){#more-789}

``` {.prettyprint}


    
    
    
    
    

    
    
    
    
    
    

    
    
        
            
        
        
    

    
    
        
    
    

    
    
    
        
        
        
    
```
