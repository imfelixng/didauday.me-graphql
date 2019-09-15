import {
  gql
} from 'apollo-server';

const placeSchema = gql `

  extend type Query {
    city(city_id: ID!): City!
    cities(filter: FilterCityInput, pagi: PagiCityInput): CitiesPayload!
    place(place_id: ID!): Place!
    places(filter: FilterPlaceInput, pagi: PagiPlaceInput): PlacesPayload!
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

  type Location @key(fields: "_id") {
    _id: ID
    type: TypeLocation!
    coordinates: [Float!]!
  }

  type CitiesPayload {
    _meta: Pagination!
    data: [City]!
  }

  type PlacesPayload {
    _meta: Pagination!
    data: [Place]!
  }

  type Pagination {
    current: Int!
    limit: Int!
    total: Int!
  }

  input FilterCityInput {
    keyword: String
  }

  input PagiCityInput {
    current: Int!
  }

  input FilterPlaceInput {
    keyword: String
    city: ID,
  }

  input PagiPlaceInput {
    current: Int
  }

  enum TypeLocation {
    POINT
  }

`;

export default placeSchema;