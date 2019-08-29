import mongoose from 'mongoose';

const { Schema } = mongoose;

const AirportSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  airport_code: {
    type: String,
    required: true,
  },
  city: {
    type: Number,
    ref: 'City',
    required: true,
  },
});

export default mongoose.model('Airport', AirportSchema);

