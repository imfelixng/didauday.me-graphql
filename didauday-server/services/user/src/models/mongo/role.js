import mongoose from 'mongoose';

const { Schema } = mongoose;

const roleSchema = new Schema({
  code: {
    type: Number,
    default: 2,
  },
  name: {
    type: String,
    required: true,
  },
}, { timestamps: true });

module.exports = mongoose.model('Role', roleSchema);