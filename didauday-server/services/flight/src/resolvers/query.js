const resolvers = {
  Query: {
    flights: async (parent, { filter, pagi }, { mongo }, info) => {
      const current = pagi && pagi.current || 1;
      const limit = 10;

      const filter_data = filter ? { ...filter } : null;

      let where = filter_data ? {
        start_location: filter_data.from_airport,
        end_location: filter_data.to_airport,
        date_start: filter_data.depature_date,
      } : {};

      const pipeline = [
        { $match : where },
        {
          $lookup:
            {
              from: "airports",
              localField: "start_location",
              foreignField: "airport_code",
              as: "start_location"
            }
       },
       { $unwind: '$start_location' },
       {
        $lookup:
          {
            from: "airports",
            localField: "end_location",
            foreignField: "airport_code",
            as: "end_location"
          }
      },
      { $unwind: '$end_location' },
      {
        $lookup:
          {
            from: "providers",
            localField: "provider",
            foreignField: "code",
            as: "provider"
          }
      },
      { $unwind: '$provider' },
    ]

      let flights = [];
      let flightTotal = 0;
      try {
        flights = await mongo.Flight.aggregate(pipeline)
          .limit(limit)
          .skip((current - 1)*limit);
        flightTotal = await mongo.Flight.countDocuments(where);
      } catch(error) {
        console.log(error);
        throw 'Don\'t get flights. Please try again later';
      }

      return {
        _meta: {
          current,
          limit: flights.length,
          total: flightTotal,
        },
        data: flights,
      };
    },
    flight: async (parent, { flight_id }, { mongo }, info) => {
      let flight = null;
      try {
        flight = await mongo.Flight.findById(flight_id);
      } catch(error) {
        throw 'Don\'t get flight . Please try again later';
      }
      return flight;
    },
    airports: async (parent, args, { mongo }, info) => {
      let airports = [];
      const pipeline = [
        { $match : {} },
        {
          $lookup:
            {
              from: "cities",
              localField: "city",
              foreignField: "zipcode",
              as: "city"
            }
       },
       { $unwind: '$city' },
    ]
      try {
        airports = await mongo.Airport.aggregate(pipeline);
      } catch(error) {
        airports = [];
        throw 'Don\'t get airports. Please try again later';
      }

      return {
        _meta: {
          current: 1,
          limit: airports.length,
          total: airports.length,
        },
        data: airports,
      };
    },
  },
};

export default resolvers;
