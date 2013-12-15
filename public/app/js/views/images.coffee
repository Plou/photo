images_template = require '../templates/images.html'

class ImageView extends Backbone.Marionette.ItemView
  tagName: 'div'
  template: images_template

module.exports = class ImagesView extends Backbone.Marionette.CollectionView
  itemView: ImageView