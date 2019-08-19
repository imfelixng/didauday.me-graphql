import { ApolloServer } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';

import typeDefs from './schema';
import resolvers from './resolvers';

import './configs/db/mongo';
import neo4j from './configs/db/neo4j';

import Profile from './models/mongo/profile';
import Role from './models/mongo/profile';

const PORT = process.env.PORT || 5002;

const mongo = {
  Profile,
  Role,
}

const server = new ApolloServer({
  schema: buildFederatedSchema([
    {
      typeDefs,
      resolvers
    }
  ]),
  context: async ({ req }) => {
    return {
      req,
      neo4j,
      mongo
    };
  },
});

server.listen({ port: PORT, path: '/graphql' }).then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
