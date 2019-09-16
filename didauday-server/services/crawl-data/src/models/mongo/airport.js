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
    type: Schema.Types.ObjectId,
    ref: 'City',
    required: true,
  },
  city_zipcode: {
    type: Number,
    required: true,
  },
});

export default mongoose.model('Airport', AirportSchema);

