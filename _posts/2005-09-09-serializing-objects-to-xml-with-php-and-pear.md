---
layout: post
status: publish
published: true
title: Serializing objects to XML with PHP and PEAR
date: '2005-09-09 16:01:38 +0200'
categories:
- Development
- Work
tags:
- PHP
- PEAR
- XML
---

I decided it might be a good idea, from a debugging and administrative
point of view, to save the reports people were viewing in my application
at work. Since users are distributed all over the country, and I have to
communicate with them over the phone with on-the-spot problems, it's
hard and very time consuming to get them to tell me all the parameters
etc they're using to generate a report which they are having problems
with (mostly, the data looks like something they weren't expecting).

Anyway, I thought saving the exact report they are viewing is much
easier for me to simply call up while someone's on the phone, than doing
the whole 'which options did you use?' thing.

Option one was saving each report to a PDF file on the server, but,
that's pretty inflexable, and also, people can view more than just PDF
files with my reporting options (emails can be send direct, zip files
can be downloaded, and data can be downloaded in csv format), so that
wouldn't always work out.

So I looked into serializing the actual report object used to generate
any of the above report types, since that object contains absolutely all
data, totals, titles, info, etc.. Unfortunately, PHP's built-in
`serialize()` and `unserialize()` functions don't work too well with complex
data structures (arrays within classes, multi-dimentional arrays, etc,
etc), and I couldn't really work around all that without writing a few
GBs of code onto my report class.

SO, I turned to XML. As it turns out, the [PEAR](http://pear.php.net)
'suite' of scripts contains a rather useful [XML serialization class
-XML_Serializer](http://pear.php.net/package/XML_Serializer), which can
turn any data structure into an XML string, and for reading those
strings back to usable PHP variables and objects.

It's really quite simple:

```php
$object = new SomeClass();
$object->var1 = "Hello World";
$object->etc();

$serializer = &new XML_Serializer(array("indent" => "  ", "typeHints" => true));
$serializer->serialize($object);
$xml = $serializer->getSerializedData();
```

`$xml` now contains the full definition of `$object` in XML. You can write
`$xml` to a file, save it in a database, whatever you like.

You can then come back later, and load the file/database record/etc into
a string, and deserialize it...

```php
$unserializer = &new XML_Unserializer();
$unserializer->unserialize($xml);
$object2 = $unserializer->getUnserializedData();

echo $object2->var1;
$object2->etc();
```

Quite fun actually :D. You can obviously do a lot of error checking, and
other things, but that's just the basics.
