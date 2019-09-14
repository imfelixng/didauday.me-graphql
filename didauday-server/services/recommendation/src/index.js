import { ApolloServer } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';

import './configs/db/mongo';

import typeDefs from './schema';
import resolvers from './resolvers';

import Tour from './models/mongo/tour';

const PORT = process.env.PORT || 5005;

const mongo = {
  Tour,
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
