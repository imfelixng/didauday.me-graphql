const resolvers = {
  Query: {
    checkProfile: () => {
      return {
        is_complete: false,
      }
    }
  },
  Profile: {
    __resolveReference(object) {
      return {
        ...object,
        paypal: "12345"
      }
    }
  }
};

export default resolvers;
