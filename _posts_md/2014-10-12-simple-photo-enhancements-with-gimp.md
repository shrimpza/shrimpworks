--- layout: post status: publish published: true title: Simple photo
enhancements with GIMP author: display\_name: Shrimp login: shrimp
email: shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/
author\_login: shrimp author\_email: shrimp@shrimpworks.za.net
author\_url: http://shrimpworks.za.net/ wordpress\_id: 586
wordpress\_url: http://shrimpworks.za.net/?p=586 date: '2014-10-12
22:04:21 +0200' date\_gmt: '2014-10-12 20:04:21 +0200' categories: -
Linux - Software tags: - photos - Tutorials - Linux - GIMP ---

So, being stuck without access to Photoshop and my regular Windows PC
has taught me a little about [GIMP](http://gimp.org/) -- basically it's
exactly the same as Photoshop with a less slick UI :D.

Also, since I haven't really written anything tutorial-ish in many many
years, so this is as much about brushing up on those skills as anything
else.

This is a guide for quick and simple photo enhancement using GIMP.

[](){#more}[](){#more-586}

***NOTE:** I find GIMP infinitely more usable in Single Window Mode.
Enable this by toggling the "Single Window Mode" option in the "Window"
menu.*

Firstly, I like to take a billion pictures of my subject or scene at the
highest reasonable resolution the camera supports - provide maximum
amount of data to manipulate (preferably RAW, though this example
assumes a JPEG source file). I try to keep [The Rule of
Thirds](https://en.wikipedia.org/wiki/Rule_of_thirds) in mind - though
it's more like a *guideline* than actual an actual rule (see what I did
there?), since the first step of my post-processing procedure will
normally tweak the image focus somewhat.

Here's my source 4:3 image for this example (totally unruley):

[![Source
image](http://shrimpworks.za.net/wp-content/uploads/2014/10/00-source.jpg){.aligncenter
.size-full .wp-image-587 width="600"
height="450"}](http://shrimpworks.za.net/wp-content/uploads/2014/10/00-source.jpg)

### 1. Cropping

![Selection](http://shrimpworks.za.net/wp-content/uploads/2014/10/01-selection2.png){.alignright
.size-full .wp-image-597 width="177" height="247"} I start with
cropping, since it gives me an idea of the focus of my image, and
narrows down some of the colour data which has to be considered in
future steps. I also like to convert my images to 16:9 aspect ratio, for
better full-screen viewing.

GIMP's ![Selection
Tool](http://shrimpworks.za.net/wp-content/uploads/2014/10/01-selection-tool.png){.alignnone
.size-full .wp-image-600 width="23" height="21"} *Rectangle Select*
allows simple definition of an aspect ration, and just for fun, allows
you to turn on a thirds grid. Set your selection options, define yout
selection, and from the menu, select "*Image*" -&gt;
"![Crop](http://shrimpworks.za.net/wp-content/uploads/2014/10/01-crop.png){.alignnone
.size-full .wp-image-602 width="23" height="18"} *Crop to Selection*",
to execute cropping.

[![Selection](http://shrimpworks.za.net/wp-content/uploads/2014/10/02-selection.jpg){.aligncenter
.size-full .wp-image-592 width="600"
height="442"}](http://shrimpworks.za.net/wp-content/uploads/2014/10/02-selection.jpg)

### 2. Levels

Next up, some colour tweaks. I start with the Levels tool, found in the
"*Colors*" -&gt;
"![Levels](http://shrimpworks.za.net/wp-content/uploads/2014/10/03-levels-tool.png){.alignnone
.size-full .wp-image-603 width="21" height="18"} *Levels*" menu.

![Levels](http://shrimpworks.za.net/wp-content/uploads/2014/10/03-levels.png){.aligncenter
.size-full .wp-image-605 width="367" height="416"}

As far as this lot's concerned, I have no idea what I'm doing, but
pulling the little triangles around generally results in a better
looking image. Basically, dragging the left-most (Black) one inwards
will darken the image - colours below the selected level will be
rendered black. The right-most (White) one will brighten the image -
colours above the selected level will be rendered white.

The middle one (Grey) sets the mid-point - more to the right will darken
the image (more levels are on the "dark" side of the scale), more to the
left will lighten the image (more levels are on the "light" side of the
scale).

Your level tweaks will vary depending on your source image. I prefer to
pull both black and white in slightly, rather than plating with the
Brightness/Contrast tool, and move grey a little toward the white side
(darken the image), since most digital shots appear very washed out at
their default levels.

A very important toggle in this window is the "*Preview*" checkbox.
Adjust your levels, and toggle it on/off to see the difference between
your source and tweaked image. You are essentially discarding image data
here, so use with care.

My image now looks as follows (changes are subtle!):

[![Post
levels](http://shrimpworks.za.net/wp-content/uploads/2014/10/04-post-levels.jpg){.aligncenter
.size-full .wp-image-606 width="600"
height="337"}](http://shrimpworks.za.net/wp-content/uploads/2014/10/04-post-levels.jpg)

### 3. Hue and Saturation

![Hue and
Saturation](http://shrimpworks.za.net/wp-content/uploads/2014/10/06-hue-sat.png){.alignright
.size-full .wp-image-611 width="360" height="206"} An optional last stop
as far as colourising goes, is a subtle hue and saturation tweak to
bring out any extra colour in the image.

Whip out the "*Colors*" -&gt; "![Hue and
Saturation](http://shrimpworks.za.net/wp-content/uploads/2014/10/05-hue-sat-tool.png){.alignnone
.size-full .wp-image-610 width="19" height="18"} *Hue and Saturation*"
menu option, and following the same process of adjustment and toggling
of the "*Preview*" option, you'll likely want to increase the
*Saturation* of the *Master* channel a little - this increases the
vibrance of colours in the image. Tweaks to *Lightness* may also be in
order. *Hue* is less useful in most cases - it basically shifts colours
through the spectrum, resulting in some "funky" effects.

In my example, I also increased the *Saturation* of the green channel,
to bring out the trees in the background a little.

[![Post Hue and
Saturation](http://shrimpworks.za.net/wp-content/uploads/2014/10/07-post-hue-sat.jpg){.aligncenter
.size-full .wp-image-613 width="600"
height="337"}](http://shrimpworks.za.net/wp-content/uploads/2014/10/07-post-hue-sat.jpg)

### 4. Vignette

I guess this one may be a little controversial, and is entirely
optional. It does not work on all images, and is not always appropriate.
For my uses, it generally involves slightly darkening the edges of the
image, to pull focus inwards a little.

I'm not aware of any built-in effects to achieve this, so we can do it
quite easily manually.

![Vignette](http://shrimpworks.za.net/wp-content/uploads/2014/10/07-vignette-base.jpg){.alignright
.size-full .wp-image-614 width="330" height="185"} Add a new solid black
layer above your source photo. Then using the *Ellipse Select* tool,
create a large ellipse selection just inside the bounds of the entire
image. With the black layer selected in the *Layers* panel, press
*Delete*. You should see a result as per the image on the right.

![Vignette
Blur](http://shrimpworks.za.net/wp-content/uploads/2014/10/08-vignette-blur.jpg){.alignright
.size-full .wp-image-615 width="330" height="186"} Next, clear the
ellipse selection, and with the black layer still selected in the Layers
panel, select "*Filters*" -&gt; "*Blur*" -&gt; "*Gaussian Blur*" from
the menu. Increase the *Blur Radius* option dramatically (in my example
image of 3500px by 2000px, I needed a value of 400px). Apply, and you
should get out something as per the example on the right.

![Layer
Mode](http://shrimpworks.za.net/wp-content/uploads/2014/10/09-layer-setting.png){.alignright
.size-full .wp-image-617 width="193" height="168"} Finally, we tweak the
layer mode (drop-list at the top of the *Layers* list in the *Layers*
panel). For a dark/shadow vignette as in this example, the "*Overlay*"
mode, along with some redution in opacity works best.

To preview before and after, toggle visibility of the vignette layer by
clicking the small eye icon next to the layer. This should give you a
good idea of whether your changes are improving the image, or just
ruining it :D.

Final example image:

[![Final
image](http://shrimpworks.za.net/wp-content/uploads/2014/10/10-post-vignette.jpg){.aligncenter
.size-full .wp-image-618 width="600"
height="337"}](http://shrimpworks.za.net/wp-content/uploads/2014/10/10-post-vignette.jpg)

Origial image for reference:

[![Source
image](http://shrimpworks.za.net/wp-content/uploads/2014/10/00-source.jpg){.aligncenter
.size-full .wp-image-587 width="600"
height="450"}](http://shrimpworks.za.net/wp-content/uploads/2014/10/00-source.jpg)

Have fun, and remember to always try to keep your enhancements subtle,
unless gaudy effects, high contrast or blown-out colours suite your
scene :D
