fs = require('fs');

exports.handle = function(req, res){
  var w = fs.createWriteStream('fileTest.txt');

  console.log(req.body.images);
  w.on('end', function(e) {
    console.log(e);
  });

  req.pipe(w);


};