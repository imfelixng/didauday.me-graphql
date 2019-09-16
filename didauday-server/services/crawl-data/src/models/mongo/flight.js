import mongoose from 'mongoose';

const { Schema } = mongoose;

const FlightSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  start_location: {
    type: Schema.Types.ObjectId,
    ref: 'Airport',
    required: true,
  },
  start_location_code: {
    type: Number,
    required: true,
  },
  end_location: {
    type: Schema.Types.ObjectId,
    ref: 'Airport',
    required: true,
  },
  end_location_code: {
    type: Number,
    required: true,
  },
  time_start: {
    hour: Number,
    minute: Number,
  },
  time_end: {
    hour: Number,
    minute: Number,
  },
  price: {
    type: Number,
    required: true,
  },
  date_start: {
    type: Number,
    required: true,
  },
  date_end: {
    type: Number,
  },
  provider: {
    type: Schema.Types.ObjectId,
    ref: 'Provider',
    required: true,
  },
  provider_code: {
    type: String,
    required: false,
  },
  flight_id: {
    type: String,
    required: true,
  },
});

export default mongoose.model('Flight', FlightSchema);

