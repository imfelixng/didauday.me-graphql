import {
  gql
} from 'apollo-server';

const tourSchema = gql `

  extend type Query {
    tour(tour_id: ID!): Tour
    tours(filter: FilterTourInput, pagi: PagiTourInput): [Tour]!
  }

  extend type Mutation {
    createTour(data: CreateTourInput!): Tour!
    updateTour(tour_id: ID!, data: UpdateTourInput!): Tour!
    deleteTour(tour_id: ID!): Tour!
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
    departure_day: Int!
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

  extend type City @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Place @key(fields: "_id") {
    _id: ID! @external
  }

  extend type Profile @key(fields: "_id") {
    _id: ID! @external
  }

  input FilterTourInput {
    keyword: String
    start_day: Int
    end_day: Int
    min_price: Int
    max_price: Int
    review_score: [Int]!
  }

  input PagiTourInput {
    current_page: Int
    limit: Int
    total: Int
  }

  input ItineraryInput {
    place: ID!
    description: String!
    image: String!
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
    departure_day: Int!
    city: [ID!]!
    itineraries: [ItineraryInput!]!
  }

  input UpdateTourInput {
    name: String!
    duration: String!
    tour_type: String!
    group_size: Int!
    price: Float!
    language_tour: String!
    description: String!
    images: [String!]!
    departure_day: Int!
    city: [ID!]!
    itineraries: [ItineraryInput!]!
  }

`;

export default tourSchema;