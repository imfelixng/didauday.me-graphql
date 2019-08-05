const { ApolloServer } = require("apollo-server-express");
const { ApolloGateway } = require("@apollo/gateway");
const express = require("express");

const tourUrl = process.env.TOUR_URL || "http://localhost:5001/graphql";
const userUrl = process.env.USER_URL || "http://localhost:5002/graphql";

const PORT = process.env.PORT || 5000;

const services = [
  {
    name: "tour",
    url: tourUrl
  },
  {
    name: "user",
    url: userUrl
  }
];

const gateway = new ApolloGateway({ serviceList: services });

(async () => {
  const { schema, executor } = await gateway.load();

  const server = new ApolloServer({
    schema,
    executor,
    tracing: true,
    introspectionHeaders: {
      'auth-header': "please.add.me.to.schema.call"
    }
  });
  const app = express();

  app.get("/services", (req, res) => res.send(services));
  server.applyMiddleware({ app, path: "/graphql" });

  app.listen(PORT, () =>
    console.log(`🚀 Server ready at http://localhost:5000`)
  );
})();
