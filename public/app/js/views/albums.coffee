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
      offset = $album.offset().top + $album.height()
      duration = 300
      if $album.prevAll('.album.active').index() >= 0 && $album.prevAll('.album.active').offset().top < $album.offset().top
        offset -= 190

      if $album.siblings('.album.active').index() >= 0 &&  $album.siblings('.album.active').offset().top == $album.offset().top
        duration = 0
        $album
          .css(
            "transition": "none"
          )
      else
        $album
          .css(
            "transition": ".3s 0 all"
          )
      $album.find('.images')
        .css(
          top: Math.round offset
        )
        .fadeIn(duration)
      $album
        .addClass('active')
        .siblings()
        .removeClass('active')
        .find('.images').hide()
  initSlideShow: (e) ->
    e.preventDefault()
    e.preventDefault()
    @.slideshowView = new SlideshowView content: $(e.target).closest('.images').html()
