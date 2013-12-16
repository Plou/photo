AlbumView = require '../views/album.coffee'
SlideshowView = require '../views/slideshow.coffee'

module.exports = class AlbumsView extends Backbone.Marionette.CollectionView
  tagName: 'div'
  className: 'albums'
  itemView: AlbumView
  events:
    "click .image > a": "initSlideShow"
    "click .album > a": "showImages"

  showImages: (e) ->
    e.preventDefault()
    $album = $(e.target).closest('.album')
    if $album.hasClass('active')
      $album
      .removeClass('active')
      .find('.images').hide()
    else
      $album.find('.images').show()
      $album
        .addClass('active')
        .siblings()
        .removeClass('active')
        .find('.images').hide()

  initSlideShow: (e) ->
    e.preventDefault()
    e.preventDefault()
    @.slideshowView = new SlideshowView content: $(e.target).closest('.images').html()
