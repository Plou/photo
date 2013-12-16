module.exports = class AlbumsModel extends Backbone.Model
  url : () ->
    if @.id
      '/albums/' + @.id
    else
      '/albums'

  defaults : {}