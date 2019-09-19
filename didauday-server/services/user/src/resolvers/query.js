import {
  isAuth
} from '../middlewares/is-auth';

import * as helps from '../helpers/firebase';

const resolvers = {
  Query: {
    checkProfile: async (parent, args, {
      req, mongo,
      prisma,
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
    },
    checkAccount: async (
      parent, { data }, ctx, info
    ) => {
      const { email } = data;
      let user = null;
      try {
        user = await helps.getUserByEmail(email);
      } catch (error) {
        user = null;
      }
      return {
        is_exist: user !== null,
      }
    }
  },
};

export default resolvers;