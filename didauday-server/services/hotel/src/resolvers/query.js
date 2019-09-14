const resolvers = {
  Query: {
    hotel: (parent, { hotel_id }, { mongo }, info) => {
      return null;
    }
  },
};

export default resolvers;
