---
layout: post
status: publish
published: true
title: Unit Conversion API
date: '2015-01-04 19:02:18 +0200'
categories:
- Development
- Software
tags:
- PHP
- API
- conversion
---

I wanted to add a unit conversion plugin to
[ZOMB](https://github.com/shrimpza/zomb) and would really have liked to
use an off-the-shelf existing API, but because this didn't seem to exist
in a nice hosted format already - I had to make it :).

The [Units API](https://shrimpza.github.io/units-api) is written in PHP,
and is intended to provide an extremely simple and easy-to-use HTTP API
for the conversion between various units of measure. Usage documentation
is available on the project's Github page.

I'm also hosting a publicly usable version, at the following URL, so
hopefully next time someone needs this they don't need to reinvent the
wheel (again, refer to documentation linked above for usage):

- <http://tools.shrimpworks.za.net/units-api/convert.php>

As an aside, this project served as my first introduction to
[PHPUnit](http://phpunit.de/)for PHP unit testing, and CI is once again
provided by [Drone.io](https://drone.io/github.com/shrimpza/units-api)
which has performed admirably. Design-wise, it was another exercise in
defining the public-facing API before a line of code was written, which
served as an excellent guide and source of documentation as I worked on
it (plus, there's no need to worry about writing documentation when
you're done :D).
