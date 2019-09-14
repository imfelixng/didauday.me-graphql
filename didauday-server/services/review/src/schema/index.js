import {
  gql
} from 'apollo-server';

const reviewSchema = gql `

  extend type Query {
    reviews: [Review]!
  }

  type Review @key(fields: "_id"){
    _id: ID!
    reviewer: Profile
    content: String!
    title: String!
    rate_star: Int!
    type: TypeReview!
    hotel: Hotel
    room: Room
    tour: Tour
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

  enum TypeReview {
    ROOM
    HOTEL
    TOUR
  }

`;

export default reviewSchema;