// Example model

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var ImagesSchema = new Schema({
  title: String,
  type: String,
  album_id: String,
});

ImagesSchema.virtual('date')
  .get(function(){
    return this._id.getTimestamp();
  });
ImagesSchema.set('toJSON', {
   virtuals: true
});
mongoose.model('Images', ImagesSchema);