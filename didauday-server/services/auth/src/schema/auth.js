import { gql } from 'apollo-server';

const authSchema = gql`
  # A post entry
  type Post @key(fields: "id") {
    id: Int!
    # The posts' title
    title: String
    # The posts' actual content
    content: String
  }

  type Query {
    all: [Post]
  }
`;

export default authSchema;
