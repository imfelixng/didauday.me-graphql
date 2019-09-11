const mongoose = require('mongoose');

const { Schema } = mongoose;

const placeSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  location: {
    type: {
      type: String,
      enum: ['Point'],
      required: true,
    },
    coordinates: {
      type: [Number],
      required: true,
    },
  },
  address: {
    type: String,
    required: true,
  },
  city: {
    type: String,
    ref: 'City',
    required: true,
  },
  images: {
    type: [String],
    default: ['uploads/img_placeholder.png'],
  },
});

placeSchema.index({ location: '2dsphere' });

module.exports = mongoose.model('Place', placeSchema);