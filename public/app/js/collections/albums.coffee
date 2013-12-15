AlbumsModel = require '../models/albums.coffee'

module.exports = class AlbumsCollection extends Backbone.Collection
  model: AlbumsModel
  url : () ->
    if @.id
      if @.images
        '/albums/' + @.id + '/images'
      else '/albums/' + @.id
    else '/albums'

