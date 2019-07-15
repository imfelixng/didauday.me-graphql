import { gql } from 'apollo-server';

const tourSchema = gql`

  type Profile @key(fields: "_id") {
    _id: ID!
    firstname: String!
    lastname: String!
    email: String!
  }

  # A post entry
  type Post @key(fields: "id") {
    id: Int!
    # The posts' title
    title: String
    # The posts' actual content
    content: String
  }

  type Identifier {
    # a unique hash to identify the running node process
    hash: String
  }

  # Queries from post service
  extend type Query {
    # List of all our posts
    allPosts: [Post]
    # A single post
    post(id: Int!): Post
    # infos identifying running process
    identifier: Identifier
  }
`;

export default tourSchema;
