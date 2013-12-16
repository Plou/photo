module.exports = function(app){

    //home route

    var images = require('../app/controllers/images');
    app.get('/images', images.index);
    app.get('/images/albums', images.allWithAlbums);
    app.get('/images/:id', images.one);
    app.get('/images/:id/albums', images.oneWithAlbums);

    app.post('/images', images.new);
    app.put('/images/:id', images.put);
    app.delete('/images/:id', images.delete);


    var albums = require('../app/controllers/albums');
    app.get('/albums', albums.index);
    app.get('/albums/images', albums.allWithImages);
    app.get('/albums/:id/images', albums.oneWithImages);
    app.get('/albums/:id', albums.one);

    app.post('/albums', albums.new);
    app.put('/albums/:id', albums.put);
    app.delete('/albums/:id', albums.delete);




    //Home route
    var index = require('../app/controllers/index');
    app.get('/', index.render);

};
