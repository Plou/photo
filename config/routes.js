module.exports = function(app){

    //home route

    var images = require('../app/controllers/images');
    var albums = require('../app/controllers/albums');
    app.get('/', images.index);
    app.get('/images', images.index);
    app.get('/images/:id', images.one);
    app.post('/images', images.new);
    app.put('/images/:id', images.put);
    app.delete('/images/:id', images.delete);
    app.get('/images/:id/albums', images.byAlbum);

    app.get('/', albums.index);
    app.get('/albums', albums.index);
    app.get('/albums/:id', albums.one);
    app.post('/albums', albums.new);
    app.put('/albums/:id', albums.put);
    app.delete('/albums/:id', albums.delete);
    app.get('/albums/:id/images', albums.oneWithImages);
};
