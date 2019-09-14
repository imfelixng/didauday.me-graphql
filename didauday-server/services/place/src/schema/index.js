import {
  gql
} from 'apollo-server';

const placeSchema = gql `

  extend type Query {
    city(city_id: ID!): City
    cities(filter: FilterCityInput, pagi: PagiCityInput): [City]!
    place(place_id: ID!): Place
    places(filter: FilterPlaceInput, pagi: PagiPlaceInput): [Place]!
  }

  type City @key(fields: "_id") {
    _id: ID!
    name: String!
    zipcode: Int!
    country: String!
    location: Location!
    image: String
    createdAt: String!
    updateAt: String!
  }

  type Place @key(fields: "_id") {
    _id: ID!
    name: String!
    location: Location!
    address: String!
    city: City!
    images: [String]!
    createdAt: String!
    updateAt: String!
  }

  type Location {
    _id: ID!
    type_location: TypeLocation!
    coordinates: [Float!]!
    createdAt: String!
    updateAt: String!
  }

  input FilterCityInput {
    keyword: String
  }

  input PagiCityInput {
    current_page: Int
    limit: Int
    total: Int
  }

  input FilterPlaceInput {
    keyword: String
    city: ID,
  }

  input PagiPlaceInput {
    current_page: Int
    limit: Int
    total: Int
  }

  enum TypeLocation {
    POINT
  }

`;

export default placeSchema;