AlbumView = require '../views/album.coffee'

module.exports = class AlbumsView extends Backbone.Marionette.CollectionView
  tagName: 'div'
  className: 'albums'
  itemView: AlbumView

