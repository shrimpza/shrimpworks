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
