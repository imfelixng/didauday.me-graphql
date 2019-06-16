import { ApolloServer } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';

import typeDefs from './schema/tour.js';
import resolvers from './resolvers';

const PORT = process.env.PORT || 5001;

const server = new ApolloServer({
  schema: buildFederatedSchema([
    {
      typeDefs,
      resolvers
    }
  ]),
});

server.listen({ port: PORT, path: '/graphql' }).then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
