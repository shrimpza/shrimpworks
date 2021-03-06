---
categories:
- Development
- Work
date: "2005-05-18T20:36:30Z"
published: true
tags: []
title: Some PHP resources
---

I've been adding some nifty things to my PHP project at work (cellphone
starter pack invoicing, usage tracking \[big bro is watching you earn
him money every time you use your pre-paid airtime :P\], etc). It's got
a lot of pretty nice features. Using client-side JavaScript, it actually
pretty much behaves as a normal desktop application, only it lags like
hell when you visit other pages (slow web server :P).

Anyway, I can't claim I've written all the snazzy features myself
unfortunately. Due to time and pressure I've been relying on good old
Open Source to help me out. There's actually a helluva lot of stuff out
there to make things easier for just about anything you need to do...

-   **ADOdb** - <http://adodb.sourceforge.net/>

    Obviously the first thing to get going on any database-aware
    application, is to actually interact with the database. PHP has an
    Interbase module, with a whole bunch of Interbase functions. These
    all work fine, and there's really no problem with them. ADOdb
    however makes working with SQL databases so much easier. No need to
    remember PHP's randomly named module functions, and it gives you
    access to a huge assortment of database drivers (of corse all
    dependent on normal PHP modules). It's even available for Python
    now!
-   **Smarty** - <http://smarty.php.net/>

    Next you'd presumably like a fancy presentation for
    your application. You have three options here - painfully output
    every single line of HTML manually through your code, create
    yourself a template engine/language, or use Smarty. Smarty is a
    Template Engine, which lets you define ".tpl" files which are
    bascally just HTML files with a couple of variable placeholders and
    smarty function calls. But it's not just the simplicity of creating
    a Smarty instance, assigning variables to it, and then just calling
    display(), it's the functions you can put into your template files.
    Looping through customer listings, building tables or drop lists,
    check lists, etc, etc, etc. One of the most useful things I've found
    is the ability to define your own smarty functions, allowing you to
    add custom functionality to your templates and the output
    they generate.
-   **PHP pdf / PDFClass** - <http://ros.co.nz/pdf/>

    One of the requirements of this project was that reports had to be
    generated in user and printer friendly PDF format. At first I looked
    into the option of having Smarty generate tabular reports, and get
    an HTML to PDF processor (there are several PHP options available)
    to turn my HTML into the PDFs required. Unfortunately, for the most
    part, these converters are heavily buggy, and didn't give me very
    much control at all over the output (ok, I had full control over the
    output, but things like page headers and footers, page numbering,
    etc, etc are required for nice reports). Anyway, so I set about
    using PHP's PDF functions. Unfortunately, that turned out rather
    risky across different versions of PHP, and was generally a pain to
    work with. Enter this package. It doesn't require any of PHP's PDF
    modules, so it's free from cross-version and cross-platform bugs
    and stuff. It also has a bunch of nice functions for headers,
    footers, tables, etc. It also provides the option to save the output
    to disk, output direct to browser, or plop the output into memory
    where I can play with it. I've built a very nice reporting class
    around this package.
-   **Code 3 of 9 Barcode Generator** -
    <http://www.sid6581.net/cs/php-scripts/barcode/>

    Another requirement of the system is the ability to group multiple
    items into a single item. From the code side of things, it's fairly
    simple, but to users, trying to manage these million boxes of
    starter packs and remembering or creating their own codes for these
    boxes would obviously be rather difficult. Anyway, I though it'd be
    nice to offer a barcode people can print and stick to the boxes.
    Enter this little script. Couldn't be easier to use, and with the
    help of a little Javascript, users can even scale the barcodes up
    and down (by dynamically reloading the image, not just changing the
    dimensions and possibly corrupting it) before printing.
-   **PHPMailer** - <http://phpmailer.sourceforge.net/>

    I'm using this for sending my PDF reports via email. It allows you
    to easily attach files, or file content (so I don't need to save the
    PDF's to temp files before attaching, just attach the output
    directly from script). Also supports SMTP, so no need to rely on
    PHP's mail configuration.

I'm also using a nifty little ZIP lib that allows me to zip my in-memory
PDF reports, and send them direct to the browser for downloadable
reports (since a normal PDF will open in the browser). Unfortunately
there's no readme or author URL in the source :)

I did get it from PHPClasses.org though, which has quickly become by
first stop for anything I need in a hurry that I couldn't be bothered,
or don't have time to write myself. Nice rating system and "top 10"s
filter out the good stuff instantly, making finding stuff really simple.
I highly recommend it to any PHP developers.
