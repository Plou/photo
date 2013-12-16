ImageView = require '../views/image.coffee'

module.exports = class ImagesView extends Backbone.Marionette.CollectionView
  tagName: 'div'
  className: 'images'
  itemView: ImageView