ImagesModel = require '../models/images.coffee'

module.exports = class ImagesCollection extends Backbone.Collection
  model: ImagesModel
  url : () ->
    if @.id then '/images/' + @.id else '/images'

