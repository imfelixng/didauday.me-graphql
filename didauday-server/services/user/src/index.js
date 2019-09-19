import { ApolloServer } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';
import { Prisma } from 'prisma-binding';

import typeDefs from './schema';
import resolvers from './resolvers';

import './configs/db/mongo';

import Profile from './models/mongo/profile';
import Role from './models/mongo/profile';

const PORT = process.env.PORT || 5002;

const mongo = {
  Profile,
  Role,
}

const prisma = new Prisma({
  typeDefs: process.env.PRISMA_SCHEMA_URL,
  endpoint: process.env.PRISMA_URL,
  //secret:  'thisismysupersecret',
});

console.log(prisma);

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
      mongo,
      prisma
    };
  },
});

server.listen({ port: PORT, path: '/graphql' }).then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});
