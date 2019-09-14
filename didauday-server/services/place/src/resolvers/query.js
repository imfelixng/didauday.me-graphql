const resolvers = {
  Query: {
    city: async (parent, { city_id }, { mongo }, info) => {
      return null;
    },
    cities: async (parent, { filter, pagi }, { mongo }, info) => {
      return [];
    },
    place: async (parent, { place_id }, { mongo }, info) => {
      return null;
    },
    places: async (parent, { filter, pagi }, { mongo }, info) => {
      return [];
    }
  },
};

export default resolvers;
