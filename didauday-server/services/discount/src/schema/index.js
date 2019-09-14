import {
  gql
} from 'apollo-server';

const discountSchema = gql `

  extend type Query {
    allCouponCodes: [CouponCode]!
  }

  type Discount {
    _id: ID!
    name: String!
    type_discount: TypeDiscount!
    percent: Float!
    creater: Profile!
    hotel: Hotel
    room: Room
    tour: Tour
    date_start: String!
    date_end: String!
    status: Boolean
    createdAt: String!
    updateAt: String!
  }

  type CouponCode {
    _id: ID!
    type_couponcode: TypeCouponCode!
    hotel: Hotel
    room: Room
    tour: Tour
    percent: Float!
    prefix_code: String!
    creater: Profile
    date_start: String!
    date_end: String!
    quantity: Int!
    available: Int
    status: Boolean
    createdAt: String!
    updateAt: String!
  }

  extend type Profile @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Hotel @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Room @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Tour @key(fields: "_id") {
    _id: ID! @external
  }

  enum TypeCouponCode {
    ALL
    HOTEL
    ROOM
    TOUR
  }

  enum TypeDiscount {
    ALL
    HOTEL
    ROOM
    TOUR
  }

`;

export default discountSchema;