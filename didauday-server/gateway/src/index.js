const { ApolloServer } = require('apollo-server-express');
const { ApolloGateway } = require('@apollo/gateway');
const express = require('express');

const tourUrl = process.env.TOUR_URL || 'http://localhost:5001/graphql';

const services = [
  {
    name: 'tour',
    url: tourUrl
  }
];

const gateway = new ApolloGateway({ serviceList: services });

(async () => {
  const { schema, executor } = await gateway.load()

  const server = new ApolloServer({
    schema, executor,
    tracing: true
  })
  const app = express()

  app.get('/services', (req, res) => res.send(serviceList))
  server.applyMiddleware({ app, path: '/graphql' })

  app.listen(5000, () => console.log(`🚀 Server ready at http://localhost:5000`))
})()