const resolvers = {
  Query: {
    reviews: (parent, { }, { mongo }, info) => {
      return [];
    }
  },
};

export default resolvers;
