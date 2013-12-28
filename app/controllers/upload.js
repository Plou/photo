fs = require('fs');

exports.handle = function(req, res){
  var w = fs.createWriteStream('fileTest.txt');
  var count = 1

  req.on('end', function(req) {
    console.log('BIM');
    w.end('end : '+count);
    res.end();
  });

  req.pipe(w, { end: false });
};