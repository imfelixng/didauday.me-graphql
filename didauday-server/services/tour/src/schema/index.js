import {
  gql
} from 'apollo-server';

const tourSchema = gql `

  extend type Query {
    tour(data: TourInput!): Tour
    tours(filter: TourFilter, pagi: TourPagi): [Tour]!
  }

  extend type Mutation {
    createTour(data: CreateTourInput!): Tour!
  }

  type Tour @key(fields: "_id") {
    _id: ID!
    name: String!
    duration: String!
    tour_type: String!
    group_size: Int!
    price: Float!
    language_tour: String!
    description: String!
    images: [String!]!
    rate: Float!
    num_review: Int!
    departure_day: String!
    city: [City!]!
    itineraries: [Itinerary!]!
    available: Int
    owner: Profile!
    createdAt: String!
    updateAt: String!
  }

  type Itinerary {
    _id: ID!
    place: Place!
    description: String!
    image: String!
  }

  type City @key(fields: "_id") {
    _id: ID!
  }

  type Place @key(fields: "_id") {
    _id: ID!
  }

  extend type Profile @key(fields: "_id") {
    _id: ID! @external
  }

  input TourInput {
    tour_id: ID!
  }

  input TourFilter {
    keyword: String
    start_day: Int
    end_day: Int
    min_price: Int
    max_price: Int
    review_score: [Int]!
  }

  input TourPagi {
    current_page: Int
    limit: Int
    total: Int
  }

  input CreateTourInput {
    name: String!
    duration: String!
    tour_type: String!
    group_size: Int!
    price: Float!
    language_tour: String!
    description: String!
    images: [String!]!
    departure_day: String!
    city: [City!]!
    itineraries: [Itinerary!]!
  }

`;

export default tourSchema;