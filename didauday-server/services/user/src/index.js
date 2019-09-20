import { ApolloServer } from 'apollo-server';
import { buildFederatedSchema } from '@apollo/federation';
import { Prisma } from 'prisma-binding';
const http = require('http');

const fs = require('fs');

import typeDefs from './schema';
import resolvers from './resolvers';

const PORT = process.env.PORT || 5002;

const file = fs.createWriteStream("schema.graphql");

http.get(process.env.PRISMA_SCHEMA_URL, function(response) {
  response.pipe(file).once('finish', () => {
    const prisma = new Prisma({
      typeDefs: 'schema.graphql',
      endpoint: process.env.PRISMA_URL,
      //secret:  'thisismysupersecret',
    });
    
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
          prisma
        };
      },
    });
    
    server.listen({ port: PORT, path: '/graphql' }).then(({ url }) => {
      console.log(`🚀 Server ready at ${url}`);
    });
  });
});