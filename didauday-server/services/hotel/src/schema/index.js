import {
  gql
} from 'apollo-server';

const tourSchema = gql `

  extend type Query {
    hotel(hotel_id: ID!): Hotel
  }

  type Hotel @key(fields: "_id") {
    _id: ID!
    name: String!
    description: String!
    rate: Float
    num_review: Int
    address: String!
    city: City!
    facilities: [Facility!]!
    images: [String!]!
    rules: [Rule!]!
    location: Location!
    rooms: [Room]!
    owner: Profile!
    isOpen: Boolean
    createdAt: String!
    updateAt: String!
  }

  type Room @key(fields: "_id") {
    _id: ID!
    name: String!
    square: Float!
    status: TypeRoom
    rate: Float
    num_review: Int
    beds: Int!
    adults: Int!
    children: Int!
    price: Float!
    description: String!
    images: [String!]!
    amenities: [Amenity!]!
    hotel: Hotel!
    createdAt: String!
    updateAt: String!
  }

  type Facility {
    _id: ID!
    icon: String!
    name: String!
    status: Boolean
    createdAt: String!
    updateAt: String!
  }

  type Rule {
    _id: ID!
    name: String!
    content: String!
    createdAt: String!
    updateAt: String!
  }

  type Amenity {
    _id: ID!
    icon: String!
    name: String!
    status: Boolean
    createdAt: String!
    updateAt: String!
  }

  extend type Location @key(fields: "_id") {
    _id: ID @external
  }

  extend type Profile @key(fields: "_id") {
    _id: ID! @external
  }

  extend type City @key(fields: "_id") {
    _id: ID! @external
  }

  enum TypeRoom {
    AVAILABLE
    NOT_AVAILABLE
  }

  enum TypeLocation {
    POINT
  }

`;

export default tourSchema;