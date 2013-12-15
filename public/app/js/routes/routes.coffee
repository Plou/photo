ImagesView = require '../views/images.coffee'
ImagesCollection = require '../collections/images.coffee'
ImagesModel = require '../models/images.coffee'

module.exports = class Router extends Backbone.Router
  routes:
    '': 'welcome'
    'images': 'images'
    'images/:id': 'images'

  welcome: () ->
    @.images()

  images: (id) ->
    imagesCollection = new ImagesCollection
    if id?
      imagesCollection.id = id

    imagesCollection.fetch
      success: (images) =>
        imagesView = new ImagesView collection: images
        publicApp.main.show(imagesView)
        imagesView.render()

