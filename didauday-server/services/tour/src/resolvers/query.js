const resolvers = {
  Query: {
    tours: async (parents, { filter, pagi }, { mongo }, info) => {
      let tours = [];
      try {
        tours = await mongo.Tour.find();
      } catch (error) {
        throw new Error(error.message);
      }
      return tours;
    },
    tour: async (parents, { data: { tour_id } }, { mongo }, info) => {
      let tour = null;
      try {
        tour = await mongo.Tour.findById(tour_id);
      } catch (error) {
        throw new Error(error.message);
      }
      return tour;
    }
  },
};

export default resolvers;
