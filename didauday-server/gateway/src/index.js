const { ApolloServer } = require("apollo-server-express");
const { ApolloGateway, RemoteGraphQLDataSource } = require("@apollo/gateway");
const express = require("express");

const tourUrl = process.env.TOUR_URL || "http://localhost:5001/graphql";
const userUrl = process.env.USER_URL || "http://localhost:5002/graphql";
const flightUrl = process.env.FLIGHT_URL || "http://localhost:5003/graphql";
const placeUrl = process.env.PLACE_URL || "http://localhost:5004/graphql";
const hotelUrl = process.env.HOTEL_URL || "http://localhost:5005/graphql";
const reviewUrl = process.env.REVIEW_URL || "http://localhost:5006/graphql";
const favoriteUrl = process.env.FAVORITE_URL || "http://localhost:5007/graphql";
const discountUrl = process.env.DISCOUNT_URL || "http://localhost:5008/graphql";
const bookingUrl = process.env.BOOKING_URL || "http://localhost:5009/graphql";

const PORT = process.env.PORT || 5000;

const services = [
  {
    name: "tour",
    url: tourUrl
  },
  {
    name: "user",
    url: userUrl
  },
  {
    name: "flight",
    url: flightUrl
  },
  {
    name: "place",
    url: placeUrl
  },
  {
    name: "hotel",
    url: hotelUrl
  },
  {
    name: "review",
    url: reviewUrl
  },
  {
    name: "favorite",
    url: favoriteUrl
  },
  {
    name: "discount",
    url: discountUrl
  },
  {
    name: "booking",
    url: bookingUrl
  },
];

const gateway = new ApolloGateway(
  {
    serviceList: services,
    buildService: ({ name, url }) => {
      return new RemoteGraphQLDataSource({
        url,
        willSendRequest({ request, context }) {
          request.http.headers.set('authorization', context.authorization);
        },
      });
    },  
  }
);

(async () => {
  const { schema, executor } = await gateway.load();

  const server = new ApolloServer({
    schema,
    executor,
    tracing: true,
    context: ({req}) => {
      return {
        authorization: req.headers.authorization,
      }
    }
  });
  const app = express();

  app.get("/services", (req, res) => res.send(services));
  server.applyMiddleware({ app, path: "/graphql" });

  app.listen(PORT, () =>
    console.log(`🚀 Server ready at http://localhost:5000`)
  );
})();
