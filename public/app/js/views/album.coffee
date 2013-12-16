ImageView = require '../views/image.coffee'
albums_template = require '../templates/albums.html'

module.exports = class AlbumView extends Backbone.Marionette.CompositeView
  tagName: 'div'
  className: 'album'
  template: albums_template,
  itemView: ImageView,
  itemViewContainer: '.images'