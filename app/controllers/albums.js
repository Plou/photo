var mongoose = require('mongoose'),
  Albums = mongoose.model('Albums');
  Images = mongoose.model('Images');

exports.index = function(req, res){
  Albums.find(function(err, albums){
    if(err) throw new Error(err);
    res.json(albums);
  });
};

exports.one = function(req, res){
  Albums.findOne({ _id: req.params.id}, function(err, album){
    if(err) throw new Error(err);
      res.json(album);
  });
};
exports.oneWithImages = function(req, res){
  Albums.findOne({ _id: req.params.id}, function(err, album){
    if(err) throw new Error(err);
    Images.find({ album_id: album._id}, function(err, images){
      if(err) throw new Error(err);
      album.images = images;
      res.json(album);
    });
  });
};

exports.new = function(req, res){
  new Albums(req.body).save();
  res.end();
};

exports.put = function(req, res){
  Albums.update({ _id: req.params.id}, req.body, {safe:true, multi:false}, function(err, album){
    if(err) throw new Error(err);
  });
  res.end();
};

exports.delete = function(req, res){
  Albums.remove({ _id: req.params.id});
  res.end();
};