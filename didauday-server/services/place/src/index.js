import { ApolloServer } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';

import './configs/db/mongo';

import typeDefs from './schema';
import resolvers from './resolvers';

import City from './models/mongo/city';
import Place from './models/mongo/place';

const PORT = process.env.PORT || 5001;

const mongo = {
  City,
  Place
}

const server = new ApolloServer({
  schema: buildFederatedSchema([
    {
      typeDefs,
      resolvers
    },
  ]),
  context: async ({ req }) => {
    return {
      req,
      mongo
    };
  },
});

server.listen({ port: PORT, path: '/graphql' }).then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
