import { gql } from 'apollo-server';

const authSchema = gql`
  extend type Query {
    auth: String!
    me: Profile!
  }

  extend type Profile @key(fields: "_id") {
    _id: ID! @external
    paypal: String
  }

  type AuthPayload {
    token: String!
    userInfo: Profile!
  }

  type Mutation {
    register: AuthPayload!
  }

  input RegisterInput {
    email: String!
    password: String!
  }

`;

export default authSchema;
