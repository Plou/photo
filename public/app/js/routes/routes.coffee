ImagesView = require '../views/images.coffee'
ImagesCollection = require '../collections/images.coffee'
ImagesModel = require '../models/images.coffee'

AlbumsView = require '../views/albums.coffee'
AlbumsCollection = require '../collections/albums.coffee'
AlbumsModel = require '../models/albums.coffee'

module.exports = class Router extends Backbone.Router
  routes:
    '': 'welcome'
    'images': 'images'
    'images/:id': 'images'
    'images/:id/:albums': 'images'
    'albums': 'albums'
    'albums/:id': 'albums'
    'albums/:id/:images': 'albums'

  welcome: () ->
    @.images()

  images: (id, albums) ->
    imagesCollection = new ImagesCollection
    if id?
      imagesCollection.id = id
    if albums? && albums == 'albums'
      imagesCollection.albums = true

    imagesCollection.fetch
      success: (images) =>
        imagesView = new ImagesView collection: images
        publicApp.main.show(imagesView)
        imagesView.render()


  albums: (id, images) ->
    albumsCollection = new AlbumsCollection
    if id?
      albumsCollection.id = id
    if images? && images == 'images'
      albumsCollection.images = true

    albumsCollection.fetch
      success: (albums) =>
        albumsView = new AlbumsView collection: albums
        publicApp.main.show(albumsView)
        albumsView.render()

