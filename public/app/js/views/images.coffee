images_template = require '../templates/images.html'

class ImageView extends Backbone.Marionette.ItemView
  tagName: 'li'
  template: images_template

module.exports = class ImagesView extends Backbone.Marionette.CollectionView
  el: '[data-view="images"]'
  itemView: ImageView