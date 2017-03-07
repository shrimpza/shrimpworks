---
layout: post
status: draft
published: false
title: Pre-Processing Images with JavaScript Before Uploading
categories:
- Development
tags:
- JavaScript
- PHP
excerpt_separator: <!--more-->
---

The title's quite silly unfortunately, but I was recently doing some experimentation with uploading images to CouchDB directly from a browser. I needed to scale the images before storage, and since I was talking directly to the CouchDB service without any kind of in-between API services or server-side scripts, needed a way to achieve this purely on the client.

Thanks to modern APIs available in browsers, combined with a Canvas, it's actually reasonably simple to process a user-selected image prior to uploading it to the server.

<!--more-->
