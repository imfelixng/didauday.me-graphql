import { ApolloServer, AuthenticationError } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';

import typeDefs from './schema';
import resolvers from './resolvers';


const PORT = process.env.PORT || 5002;

const server = new ApolloServer({
  schema: buildFederatedSchema([
    {
      typeDefs,
      resolvers
    }
  ]),
  context: async ({ req }) => {
    return { req };
  },
});

server.listen({ port: PORT, path: '/graphql' }).then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
