import mongoose from 'mongoose';

const { Schema } = mongoose;

const ProviderSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  code: {
    type: String,
    required: true,
  },
});

export default mongoose.model('Provider', ProviderSchema);