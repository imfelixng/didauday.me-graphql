const mongoose = require('mongoose');

const { Schema } = mongoose;

const tourSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
        },
        duration: {
            type: String,
            required: true,
        },
        tour_type: {
            type: String,
            required: true,
        },
        group_size: {
            type: Number,
            default: 1,
        },
        price: {
            type: Number,
            default: 0,
        },
        language_tour: {
            type: String,
            required: true,
        },
        description: {
            type: String,
            required: true,
        },
        images: {
            type: [String],
            required: true,
        },
        rate: {
            type: Number,
            default: 0,
        },
        num_review: {
            type: Number,
            default: 0,
        },
        departure_day: {
            type: Date,
            required: true,
        },
        city: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'City',
        },
        itineraries: {
            type: [
                {
                    place: {
                        type: mongoose.Schema.Types.ObjectId,
                        ref: 'Place',
                        required: true,
                    },
                    description: {
                        type: String,
                        required: true,
                    },
                    image: {
                        type: String,
                        required: true,
                    },
                },
            ],
            required: true,
        },
        available: {
            type: Number,
            required: true,
        },
        owner: {
            type: String,
            ref: 'Profile',
            required: true,
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model('Tour', tourSchema);