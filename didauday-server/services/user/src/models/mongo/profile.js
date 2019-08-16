import mongoose from 'mongoose';

const { Schema } = mongoose;

const profileSchema = new Schema({
  uid: {
    type: String,
    require: true,
  },
  email: {
    type: String,
    require: true,
  },
  firstname: {
    type: String,
    required: true,
  },
  lastname: {
    type: String,
    required: true,
  },
  birthday: {
    type: Number,
    required: true
  },
  avatar: {
    type: String,
    default: '/uploads/img_avatar_placeholder.png',
  },
  gender: {
    type: String,
    enum: [ "MALE", "FEMALE" ]
  },
  address: {
    type: String,
    required: true,
  },
  phone_number: {
    type: String,
    required: true,
  },
  role: {
    type: Number,
    ref: 'Role',
    enum: [0, 1, 2],
  },
  email_paypal: {
    type: String,
  },
}, { timestamps: true });

export default mongoose.model('Profile', profileSchema);