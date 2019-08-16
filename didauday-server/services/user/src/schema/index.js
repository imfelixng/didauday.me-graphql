import { gql } from 'apollo-server';

const userSchema = gql`
  extend type Query {
    me: Profile!
    checkProfile: CheckProfilePayload!
  }

  extend type Mutation {
    UpdateProfile(data: UpdateProfileInput!): ProfilePayload!
  }

  # type
  type Profile @key(fields: "_id") {
    _id: ID!
    email: String!
    firstname: String!
    lastname: String!
    birthday: Int!
    gender: GenderType!
    address: String!
    phone_number: String!
    role: Role
    is_complete: Boolean
  }

  type Role @key(fields: "code"){
    _id: ID!
    code: Int!
    name: String!
  }

  # payload
  type ProfilePayload {
    user_info: Profile!
  }

  type CheckProfilePayload {
    is_complete: Boolean!
  }


  # input
  input UpdateProfileInput {
    firstname: String!
    lastname: String!
    birthday: Int!
    gender: GenderType!
    address: String!
    phone_number: String!
    role: Int
  }

  # enum
  enum GenderType {
    MALE
    FEMALE
  }

`;

export default userSchema;
