// Example model

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var ImagesSchema = new Schema({
  title: String,
  type: String,
  albums: [{ type: Schema.Types.ObjectId, ref: 'Albums' }],
});

ImagesSchema.virtual('date')
  .get(function(){
    return this._id.getTimestamp();
  });
ImagesSchema.set('toJSON', {
   virtuals: true
});
mongoose.model('Images', ImagesSchema);