// Example model

var mongoose = require('mongoose'),
  Schema = mongoose.Schema;

var AlbumsSchema = new Schema({
  title: String,
  author: String,
  images: [{ type: Schema.Types.ObjectId, ref: 'Images' }],
});

AlbumsSchema.virtual('date')
  .get(function(){
    return this._id.getTimestamp();
  });
AlbumsSchema.set('toJSON', {
   virtuals: true
});
mongoose.model('Albums', AlbumsSchema);
