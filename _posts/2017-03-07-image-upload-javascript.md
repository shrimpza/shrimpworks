---
layout: post
status: draft
published: true
title: Client-Side Processing of Images with JavaScript Before Uploading
categories:
- Development
tags:
- JavaScript
- PHP
excerpt_separator: <!--more-->
---

The title's quite silly unfortunately, but I was recently doing some experimentation with uploading images to [CouchDB](https://couchdb.apache.org/) directly from a browser. I needed to scale the images before storage, and since I was talking directly to the CouchDB service without any kind of in-between API services or server-side scripts, needed a way to achieve this purely on the client.

Thanks to modern APIs available in browsers, combined with a Canvas, it's actually reasonably simple to process a user-selected image prior to uploading it to the server without the need for any third-party libraries or scripts.

<!--more-->

In the simple example below, as soon as the user selects an image using the file input, we use a [`FileReader`](https://developer.mozilla.org/en-US/docs/Web/API/FileReader) to load the image data, which then hands the data to an [`Image`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/Image). As soon as the image has loaded, it creates a [`Canvas`](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API), copies itself onto the canvas, and (for this example) simply draws some text over everything.

When the image has been sufficiently manimulated in the browser, the canvas is converted to a [`Blob`](https://developer.mozilla.org/en-US/docs/Web/API/Blob), placed into a [`FormData`](https://developer.mozilla.org/en-US/docs/Web/API/FormData) instance, and uploaded to a basic server-side script via the [`Fetch`](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) API.

This example's usage of drawing a text "watermark" over the selected image is incredibly basic, but the Canvas API is farirly comprehensive, allowing you to do everything from simply scaling the image for the purposes of thumbnail generation, to more in-depth image processing (use all the free image processing power on client machines, rather than post-processing these images on your servers).

In fact, there's no need to use source images - you could generate images entirely in the browser and simply upload those using the same methods.

Here's the client-sode code. Afterward is also a simple PHP script for the purposes of this example, to accept the uploaded image.

```html
<!-- upload.html -->
<!DOCTYPE html>
<html>

<script type="text/javascript">

window.onload = function() {

  // when the user selects an image
  document.getElementById("image").addEventListener("change", function(e) {
    var image = e.target.files[0]; // assumes single selection

    // draw a watermark over the image, and when we get the result back, upload it immediately
    addWatermark(image, function(img) {
      var form = new FormData();
      form.append("image", img.blob, img.fileName); // create a form field "image" with the upload data and original file name

      // post the file to our server script
      fetch('upload.php', {
        method: 'POST',
        body: form
      })
      .then(function(r) {
        // simply display the result from the server
        r.text().then(function (text) {
          alert(text);
        });
      })
    });
  });

  var addWatermark = function(file, callback) {
    // the user-selected image will be loaded into this image
    var img = new Image();

    // when it's loaded, we can perform any kind of processing we need on it
    img.onload = function() {
      // create the canvas so we can draw stuff
      var canvas = document.createElement('canvas');
      var ctx = canvas.getContext('2d');

      // for our purposes, scale the canvas to match the source image
      canvas.width = img.width;
      canvas.height = img.height;

      // draw the source image on the canvas
      ctx.drawImage(img, 0, 0, img.width, img.height);

      // just draw some watermark text over the image
      // we could do anything else the canvas allows us to do (which is a lot)
      ctx.font = "40px sans-serif";
      ctx.fillStyle = '#666';
      ctx.fillText("The watermark or something", 40, 40);

      // convert the canvas to a Blob, and call a callback so the caller can do something with it
      canvas.toBlob(function(blob) {
        callback({
          blob: blob,
          fileName: file.name
        });
      }, file.type);
    }

    // the file reader triggers the whole process, once it's loaded from the user's selected image
    var fileReader = new FileReader();
    fileReader.onload = function(e) {
      // setting the image source will trigger the image.onload event above
      img.src = e.target.result;
    };

    // load the file data
    fileReader.readAsDataURL(file);
  }
}

</script>

<body>

  Select image to upload:
  <input type="file" name="image" id="image" accept="image/*" />

</body>
</html>

```

```php
<!-- upload.php -->
<?php

if (isset($_FILES["image"])) {
    $check = getimagesize($_FILES["image"]["tmp_name"]);

    if ($check !== false) {
        $targetFile = "/tmp/" . basename($_FILES["image"]["name"]);
        if (move_uploaded_file($_FILES["image"]["tmp_name"], $targetFile)) {
            echo "File stored at " . $targetFile;
        } else {
            echo "Failed to store image";
        }
    } else {
        echo "File is not an image";
    }
} else {
    echo "No image to upload";
}

?>

```
