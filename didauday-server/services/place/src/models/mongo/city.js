import  mongoose from 'mongoose';

const { Schema } = mongoose;

const citySchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  zipcode: {
    type: Number,
    required: true,
  },
  country: {
    type: String,
    required: true,
  },
  location: {
    type: {
      type: String,
      enum: ['Point'],
      default: 'Point',
    },
    coordinates: {
      type: [Number],
      required: true,
    },
  },
  image: {
    type: String,
    default: 'uploads/img_placeholder.png',
  },
});

citySchema.index({ location: '2dsphere' });

export default mongoose.model('City', citySchema);