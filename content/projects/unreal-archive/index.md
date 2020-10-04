---
published: true
title: Unreal Package Lib
lang: [Java]
description: Library for reading Unreal Engine package data
refs:
 - https://github.com/shrimpza/unreal-package-lib
---

> [Hosted on GitHub](https://github.com/shrimpza/unreal-package-lib)

A small Java library for efficiently reading Unreal Engine packages.

Unreal Packages, are used by Unreal Engine games for packaging content such as
maps, textures, sounds, and the gameplay code itself.

Although the files all have different file extensions for organisation purposes
only (for example, .unr or .ut2 for maps, .utx for textures, .u for code), they
all have the same structure and are capable of holding the same content.

This implementation supports Unreal Engines 1 and 2, with support for Unreal 
Engine 3 in progress, and has been tested using content and assets from Unreal
(1998), Unreal Tournament (1999), and Unreal Tournament 2003/4 (2004). 

The implementation has focussed on supporting the above games for the purposes
of making data available for the Unreal Archive, however other games using the
Unreal Engine may Just Work, though some developers did introduce significant
customisations to their engine versions, so your mileage may vary from game to
game.   

Also provided via the `Umod` class is the ability to read and extract the 
contents of `.umod` installers, commonly used to distribute larger Unreal and
Unreal Tournament modifications and total conversions.

These can be combined with a `PackageReader` to support reading package 
contents directly from UMOD files without needing to unpack the individual
files first.

Finally, reading of Unreal Engine's `.int` and `.ucl` files is provided via the
`IntFile` class, which simplifies processing some of the non-INI file like
properties contained within these files.
