module.exports = class ImagesModel extends Backbone.Model
  url : () ->
    if @.id
      '/albums/' + @.id
    else
      '/albums'
  defaults : {}