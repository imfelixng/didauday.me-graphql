import {
  gql
} from 'apollo-server';

const bookingSchema = gql `

  extend type Query {
    allBookings: [Booking]!
  }

  type Booking {
    _id: ID!
    booking_list: [BookingItem!]!
    total_price: Float!
    buyer: Profile!
    status: Boolean
    is_choose: Boolean
    paymentID: String!
    payerID: String
    token_paypal: String!
    url_paypal: String!
    createdAt: String!
    updateAt: String!
  }

  type BookingItem {
    _id: ID!
    type_booking: TypeBooking!
    price: Float!
    coupon_code: String
    is_checkout: Boolean
    room: Room
    flight: Flight
    tour: Tour
    date_start: String
    date_end: String
    customers: [Customer!]!
    quantity: Int!
    createdAt: String!
    updateAt: String!
  }

  type Customer {
    _id: ID!
    email: String!
    lastname: String!
    firstname: String!
    phone_number: String!
    createdAt: String!
    updateAt: String!
  }

  extend type Profile @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Flight @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Room @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Tour @key(fields: "_id") {
    _id: ID! @external
  }

  enum TypeBooking {
    FLIGHT
    HOTEL
    TOUR
  }

`;

export default bookingSchema;