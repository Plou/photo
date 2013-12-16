images_template = require '../templates/images.html'

module.exports = class ImageView extends Backbone.Marionette.ItemView
  tagName: 'div'
  className: 'image'
  template: images_template