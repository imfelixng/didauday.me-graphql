const resolvers = {
  Query: {
    auth: () => "ngquangan",
    me: () => {
      return {
        _id: "1234",
        firstname: "An1",
        lastname: "Nguyen1",
        email: "12345@1",
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
