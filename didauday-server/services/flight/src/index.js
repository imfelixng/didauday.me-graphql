import { ApolloServer } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';

import './configs/db/mongo';

import typeDefs from './schema';
import resolvers from './resolvers';

import Flight from './models/mongo/flight';
import Airport from './models/mongo/airport';

const PORT = process.env.PORT || 5003;

const mongo = {
  Flight,
  Airport
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
