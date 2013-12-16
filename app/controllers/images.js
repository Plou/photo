var mongoose = require('mongoose'),
  Images = mongoose.model('Images');

exports.index = function(req, res){
  Images.find(function(err, images){
    if(err) throw new Error(err);
    res.json(images);
  });
};
exports.allWithAlbums = function(req, res){
  Images.find().populate('albums').exec( function(err, images){
    if(err) throw new Error(err);
    res.json(images);
  });
};

exports.one = function(req, res){
  Images.findOne({ _id: req.params.id}, function(err, image){
    if(err) throw new Error(err);
    res.json(image);
  });
};
exports.oneWithAlbums = function(req, res){
  Images.findOne({ _id: req.params.id}).populate('albums').exec( function(err, image){
    if(err) throw new Error(err);
    res.json(image);
  });
};

exports.new = function(req, res){
  new Images(req.body).save();
  res.end();
};

exports.put = function(req, res){
  Images.update({ _id: req.params.id}, req.body, {safe:true, multi:false}, function(err, image){
    if(err) throw new Error(err);
  });
  res.end();
};

exports.delete = function(req, res){
  Images.remove({ _id: req.params.id});
  res.end();
};