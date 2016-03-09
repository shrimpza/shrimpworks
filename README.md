# [ShrimpWorks](http://shrimpworks.za.net/)

This is my website source, which is meant to be built by [Jekyll](http://jekyllrb.com/).

### Notes

#### Build Requirements

- `sudo aptitude install imagemagick ruby2.2-dev`
- `sudo gem install jekyll jekyll-paginate mini_magick`
- `jekyll build`
- `rsync -vrzh _site/* user@host:/path/to/www`

#### Collections

This uses Jekyll's [collections](https://jekyllrb.com/docs/collections/) for the following:

- *gallery* - photo galleries, pages stored in `_gallery`
- *projects* - pages stored in `_projects`

#### Assets

All static files stored within `assets` directory, as follows:

- `files` - random small files, not associated with a project, typically attached to a post
- `gallery` - each subdirectory represents a gallery. a `thumbs` directory will be auto-generated when the site is built, containing thumbnails of everything in `gallery`
- `links` - social/link icons for the links collection in the footer
- `posts` - images and things inserted into posts
- `projects` - subdirectories group collections of files per project
- `smileys` - smilify plugin smiley themes (currently custom EmojiOne)

#### Plugins

Currently the following plugins are in use:

- GalleryTag - based on https://github.com/internaut/JekyllGalleryTag (with a few custom changes)
- YouTube - https://github.com/pibby/jekyll-youtube
- Smilify - https://github.com/SaswatPadhi/jekyll_smilify (with several custom changes)

To see the changes, just look at the commit history for the contents of `_plugins`.
