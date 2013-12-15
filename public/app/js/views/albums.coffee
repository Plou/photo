albums_template = require '../templates/albums.html'

class AlbumView extends Backbone.Marionette.ItemView
  tagName: 'div'
  template: albums_template

module.exports = class AlbumsView extends Backbone.Marionette.CollectionView
  itemView: AlbumView