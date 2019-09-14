import {
  gql
} from 'apollo-server';

const tourSchema = gql `

  extend type Query {
    flights(filter: FilterFlightInput, pagi: PagiFlightInput): FlightsPayload!
    flight(flight_id: ID!): Flight!
    airports: AirportsPayload!
  }

  type Flight @key(fields: "_id") {
    _id: ID!
    name: String!
    start_location: AirPort!
    end_location: AirPort!
    time_start: TimeFlight!
    time_end: TimeFlight!
    price: Float!
    date_start: String!
    date_end: String!
    provider: Provider!
    flight_id: String!
    createdAt: String!
    updatedAt: String!
  }

  type AirPort {
    _id: ID!
    name: String!
    airport_code: String!
    city: City!
    createdAt: String!
    updatedAt: String!
  }

  type TimeFlight {
    _id: ID!
    hour: Int!
    minute: Int!
    createdAt: String!
    updatedAt: String!
  }

  type Provider {
    _id: ID!
    name: String!
    code: String!
    createdAt: String!
    updatedAt: String!
  }

  extend type City @key(fields: "_id") {
    _id: ID! @external
  }

  type FlightsPayload {
    _meta: Pagination!
    data: [Flight]!
  }

  type AirportsPayload {
    _meta: Pagination!
    data: [AirPort]!
  }

  type Pagination {
    current: Int!
    limit: Int!
    total: Int!
  }

  input FilterFlightInput {
    from_airport: String!
    to_airport: String!
    depature_date: Int!
    seat_type: String
  }

  input PagiFlightInput {
    current: Int
  }

`;

export default tourSchema;