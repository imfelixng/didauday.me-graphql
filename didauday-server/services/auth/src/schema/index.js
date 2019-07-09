import { gql } from 'apollo-server';

const authSchema = gql`
  type Query {
    auth: String!
  }
`;

export default authSchema;
