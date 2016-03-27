
(function() {

  var lightbox;
  var img;

  document.addEventListener('DOMContentLoaded', function () {
    this.initialise();
  }.bind(this));

  this.initialise = function() {
    this.lightbox = document.createElement('a');
    this.img = document.createElement('img');

    this.lightbox.setAttribute('href', '#');
    this.lightbox.setAttribute('id', 'lightbox');
    this.lightbox.classList.add('lightbox');
    this.lightbox.appendChild(this.img);

    document.getElementsByTagName('body')[0].appendChild(this.lightbox);

    this.scanImages();
  }

  this.scanImages = function() {
    var links = document.querySelectorAll('a[href$=".png"], a[href$=".jpg"], a[href$=".gif"]');

    Array.prototype.forEach.call(links, function(l) {
      l.addEventListener('click', function(e) {
        e.preventDefault();
        this.setImage(l.href);

        document.location = '#lightbox';
      }.bind(this));
    }.bind(this));
  }

  this.setImage = function(img) {
    this.img.setAttribute('src', img);
  }

})();