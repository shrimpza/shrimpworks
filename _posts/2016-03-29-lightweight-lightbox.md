---
layout: post
status: publish
published: true
title: 'Lightweight Lightbox'
categories:
- Development
tags:
- JavaScript
excerpt_separator: <!--more-->
---

It seems surprisingly difficult to find a simple lightbox implementation which
doesn't rely on jQuery. I wanted something simple for this site, but did not
want to have to re-do any HTML, so came up with a basic JavaScript and CSS
solution.

This also turned out to be a useful lesson in "modern" jQuery-less DOM
manipulation. I found [10 Tips for Writing JavaScript without jQuery](http://tutorialzine.com/2014/06/10-tips-for-writing-javascript-without-jquery/)
quite useful in this regard.

For the Lightbox/pop-up itself, the [Pure CSS Lightbox](http://codepen.io/gschier/pen/HCoqh)
by [Gregory Schier](http://schier.co/) served as an excellent reference and
starting point.

<!--more-->

Since the code's pretty small, I'm just going to dump it all here.

In summary, it works by selecting all `<a ...>` elements on the page  which have
links to image files (the assumption is these are links to larger images), and
attaches a `click` event listener to go to a hidden lightbox element and set
it's image source to the link target.

This way, a client not supporting JavaScript will experience the same behavior
as before, while JS-enabled clients will have the lightbox, hopefully keeping
everyone happy.

You can try this out by viewing one of the galleries on this site.

```javascript
(function() {

  var lightbox; // lightbox parent element
  var img;      // image element

  document.addEventListener('DOMContentLoaded', function () {
    this.initialise();
  }.bind(this));

  /**
   * Create the lightbox and image elements, and add them to the body
   * of the document.
   */
  this.initialise = function() {
    this.lightbox = document.createElement('a');
    this.img = document.createElement('img');

    this.lightbox.setAttribute('href', '#_');
    this.lightbox.setAttribute('id', 'lightbox');
    this.lightbox.classList.add('lightbox');
    this.lightbox.appendChild(this.img);

    document.getElementsByTagName('body')[0].appendChild(this.lightbox);

    /* now we can look for image links on the page */
    this.scanImages();
  }

  /**
   * Search through all links to images on the page. Any image link will
   * have it's target appear in the lightbox, if Javascript is available,
   * otherwise it will function as a normal link, still supporting middle-
   * clicking et al.
   */
  this.scanImages = function() {
    /* find links to png, jpg and gif images */
    var links = document.querySelectorAll('a[href$=".png"], a[href$=".jpg"], a[href$=".gif"]');

    /* for each link attach a click handler to set the image location and
       show the lightbox */
    Array.prototype.forEach.call(links, function(l) {
      l.addEventListener('click', function(e) {
        e.preventDefault();
        this.setImage(l.href);

        document.location = '#lightbox';
      }.bind(this));
    }.bind(this));
  }

  /**
   * Set the image element source to the provided URL.
   */
  this.setImage = function(img) {
    this.img.setAttribute('src', img);
  }

})();
```

And the accompanying CSS styles:

```css
.lightbox {
	display: none;

	position: fixed;
	z-index: 999;
	width: 100%;
	height: 100%;
	text-align: center;
	top: 0;
	left: 0;
	background: rgba(0,0,0,0.8);
}

.lightbox img {
	max-width: 90%;
	max-height: 90%;
	margin-top: 2%;
}

.lightbox:target {
	outline: none;
	display: block;
}
```

Just include both of these in your site/page, for instant lightbox magic.
