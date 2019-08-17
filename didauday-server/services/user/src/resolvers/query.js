import {
  isAuth
} from '../middlewares/is-auth';

const resolvers = {
  Query: {
    checkProfile: async (parent, args, {
      req, mongo
    }, info) => {
      let user = null;
      try {
        user = await isAuth(req);
      } catch (error) {
        throw new Error(error.message);
      }

      if (user) {
        const { uid } = user;
        let profile = null;
        try {
          profile = await mongo.Profile.findOne({
            uid,
          });
        } catch (error) {
          console.log(error);
          return {
            is_complete: false,
          }
        }

        if (!profile) {
          return {
            is_complete: false,
          }
        }

        if (!profile.is_complete) {
          return {
            is_complete: false,
          }
        }
        
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