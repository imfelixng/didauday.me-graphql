import {
  isAuth
} from '../middlewares/is-auth';

const resolvers = {
  Query: {
    checkProfile: async (parent, args, {
      req
    }, info) => {
      let uid = null;
      try {
        uid = await isAuth(req);
      } catch (error) {
        throw new Error(error.message);
      }

      if (uid) {
        return {
          is_complete: true,
        }
      }

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