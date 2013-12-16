AlbumsModel = require '../models/albums.coffee'

module.exports = class AlbumsCollection extends Backbone.Collection
  model: AlbumsModel
  url : () ->
    if @.id
      '/albums/' + @.id
    else '/albums'

