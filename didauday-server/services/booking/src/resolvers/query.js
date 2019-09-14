const resolvers = {
  Query: {
    allBookings: (parent, _, { mongo }, info) => {
      return [];
    }
  },
};

export default resolvers;
