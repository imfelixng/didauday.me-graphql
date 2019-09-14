const resolvers = {
  Query: {
    allFavorites: (parent, _, { mongo }, info) => {
      return [];
    }
  },
};

export default resolvers;
