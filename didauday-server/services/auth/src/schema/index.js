import { gql } from 'apollo-server';

const authSchema = gql`
  type Query {
    auth: String!
  }

  type AuthPayload {
    token: String!
  }

`;

export default authSchema;
