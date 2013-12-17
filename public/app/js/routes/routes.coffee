ImagesView = require '../views/images.coffee'
ImagesCollection = require '../collections/images.coffee'
ImagesModel = require '../models/images.coffee'

AlbumsView = require '../views/albums.coffee'
AlbumsCollection = require '../collections/albums.coffee'
AlbumsModel = require '../models/albums.coffee'

module.exports = class Router extends Backbone.Router
  routes:
    '': 'home'
    'albums': 'albums'
    'albums/:id': 'albums'

    'images': 'images'
    'images/:id': 'images'


  home: () ->
    @.navigate 'albums', trigger: true

  albums: (id, images, image_id) ->
    albumsCollection = new AlbumsCollection
    if id?
      albumsCollection.id = id
    albumsCollection.url = albumsCollection.url() + '/images'

    albumsCollection.fetch
      success: (albums) =>
# DEV DEBUG
        # for ( i = 10; i > 2; i-- )
        #   albums[i] = albums[1]

        albumsView = new AlbumsView collection: albums
        publicApp.main.show(albumsView)
        albumsView.render()


  images: (id, albums, album_id) ->
    imagesCollection = new ImagesCollection
    if id?
      imagesCollection.id = id
    imagesCollection.url = imagesCollection.url() + '/albums'

    imagesCollection.fetch
      success: (images) =>
        imagesView = new ImagesView collection: images
        publicApp.main.show(imagesView)
        imagesView.render()