---
categories:
- Development
date: "2016-03-20T00:00:00Z"
published: true
tags:
- Java
- Utilities
- Graphics
title: Image Halftone Processor
---

{{< img src=2016-03-17-halftone.png class="image-center ful-width" >}}

More a curiosity than an actual useful project, I just had an Idea I wanted to 
try out, and this is the result.

This Java application (or library, if you want to include it in your own 
project) simply takes a source image, a couple of optional parameters, and
outputs a new image with a [halftone](https://en.wikipedia.org/wiki/Halftone)-
like effect.

Briefly, works by stepping through the pixels of the source image at an interval
defined by the dot size specified, samples the brightness of that pixel, and
draws a circle onto the destination image, scaled according to the source pixel 
brightness.

For reference, take a look at the `java.awt` 
[`Graphics2D`](http://docs.oracle.com/javase/8/docs/api/java/awt/Graphics2D.html), 
[`Image`](http://docs.oracle.com/javase/8/docs/api/java/awt/Image.html) and 
[`BufferenImage`](http://docs.oracle.com/javase/8/docs/api/java/awt/image/BufferedImage.html) 
classes. It's really nice to half a whole bunch of image processing and drawing
capabilities available within the standard library, rather than needing to rely
on external things (as I recently discovered to be the case with Ruby - pretty
much *all* image processing is done via an ImageMagick dependency).

The source, documentation and a download are available from the 
[`image-halftone` GitHub project page](https://github.com/shrimpza/image-halftone/).