const resolvers = {
  Query: {
    allCouponCodes: (parent, _, { mongo }, info) => {
      return [];
    }
  },
};

export default resolvers;
