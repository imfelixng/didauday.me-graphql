import {
  gql
} from 'apollo-server';

const reviewSchema = gql `

  extend type Query {
    allFavorites: [Favorite]!
  }

  type Favorite {
    _id: ID!
    type_favorite: TypeFavorite!
    favoritor: Profile
    hotel: Hotel
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

  extend type Tour @key(fields: "_id") {
    _id: ID! @external
  }

  enum TypeFavorite {
    HOTEL
    TOUR
  }

`;

export default reviewSchema;