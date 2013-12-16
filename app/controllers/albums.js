var mongoose = require('mongoose'),
  Albums = mongoose.model('Albums');

exports.index = function(req, res){
  Albums.find(function(err, albums){
    if(err) throw new Error(err);
    res.json(albums);
  });
};

exports.allWithImages = function(req, res){
  Albums.find().populate('images').exec( function(err, albums){
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
  Albums.findOne({ _id: req.params.id}).populate('images').exec( function(err, album){
    if(err) throw new Error(err);
    res.json(album);
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