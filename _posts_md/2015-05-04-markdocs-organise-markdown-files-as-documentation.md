--- layout: post status: publish published: true title: Markdocs -
organise Markdown files as documentation author: display\_name: Shrimp
login: shrimp email: shrimp@shrimpworks.za.net url:
http://shrimpworks.za.net/ author\_login: shrimp author\_email:
shrimp@shrimpworks.za.net author\_url: http://shrimpworks.za.net/
wordpress\_id: 767 wordpress\_url: http://shrimpworks.za.net/?p=767
date: '2015-05-04 19:29:01 +0200' date\_gmt: '2015-05-04 17:29:01 +0200'
categories: - Development tags: \[\] ---

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

[![Screen Shot 2015-05-02 at
10.21.35](http://shrimpworks.za.net/wp-content/uploads/2015/05/Screen-Shot-2015-05-02-at-10.21.35-1024x661.png){.aligncenter
.size-large .wp-image-768 width="560"
height="361"}](http://shrimpworks.za.net/wp-content/uploads/2015/05/Screen-Shot-2015-05-02-at-10.21.35.png)

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
