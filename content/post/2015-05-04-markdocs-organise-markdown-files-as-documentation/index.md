---
categories:
- Development
date: "2015-05-04T19:29:01Z"
published: true
tags: []
title: Markdocs - organise Markdown files as documentation
---

Here's a thing I've been wanting for a while now, and have been unable
to something to suite my needs (well, more *wants* than *needs*, I
guess). I end up generating a lot of text/documentation for various
things (both at home and work), normally spread around a little -
project descriptions and introductions in READMEs, APIs and design plans
in wikis, sometimes random files, etc, and wanted the ability to
consolidate these into collections that could be nicely presented,
either publicly or for team reference.

My preferred requirements, which were not met by existing solutions such
as [Sphinx](http://sphinx-doc.org/), [Read the
Docs](https://readthedocs.org/), [Beautiful
docs](http://beautifuldocs.com/) and [Daux.io](http://daux.io/) are:

-   No need to pre/post processing the input documents as a separate
    "compile" or parsing step
    -   Should use existing plain Markdown documents as input and format
        output at runtime only
-   Along with the above, the documents should be "live" - if I change
    the source file, I don't want to "recompile" my documentation pages,
    they should reflect changes by default
-   Not a hosted solution
    -   Particularly, something anyone can drop on a private server
        (work environment) or whatever they want to do with it
-   No server-side requirements beyond simple HTTP file serving
-   I may be out of the JavaScript development scene, but what's up with
    requiring users to use a dozen different build systems and
    dependency management frameworks to use your JavaScript app these
    days?
    -   Seriously, the attraction used to be that you could simply drop
        a couple of HTML, CSS and JS files in your www-root and magic
        came out. Get off my lawn!

My solution is [Markdocs](https://github.com/shrimpza/markdocs) - a
simple HTML and JavaScript application for organising individual
Markdown documents as a documentation collection.

{{< img src="2015-05-04-markdocs.png" thumb=800x alt="markdocs" class="image-center full-width" >}}

See the README on the [Markdocs GitHub
page](https://github.com/shrimpza/markdocs) for usage instructions.
Basically, you define the documents to include via a simple JSON file,
which is loaded at runtime. The required documents are then loaded using
[jQuery](https://jquery.com/), parsed at runtime with
[Marked](https://github.com/chjj/marked) right in the user's browser,
and a table of contents and the documents themselves are generated and
presented using a simple [Semantic UI](http://semantic-ui.com/)
interface.

At present it's perfectly usable, but there are still a couple of things
I want to improve and add, including suitable inter-document linking
(while not enforcing any magic link syntax - your stand-alone document
should still work as stand-alone documents) and ability to provide links
to the individual source documents as well as an "Edit" link (for
example, let you define a link to the editable document on GitHub).

Will update as it progresses.
