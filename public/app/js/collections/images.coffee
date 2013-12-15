ImagesModel = require '../models/images.coffee'

module.exports = class ImagesCollection extends Backbone.Collection
  model: ImagesModel
  url : () ->
    if @.id
      if @.albums
        '/images/' + @.id + '/albums'
      else '/images/' + @.id
    else '/images'

