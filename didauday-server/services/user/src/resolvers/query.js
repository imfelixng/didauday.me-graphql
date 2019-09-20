import {
  isAuth
} from '../middlewares/is-auth';

import * as helps from '../helpers/firebase';

const resolvers = {
  Query: {
    checkProfile: async (parent, args, {
      req,
      prisma,
    }, info) => {
      let user = null;
      try {
        user = await isAuth(req);
      } catch (error) {
        throw new Error(error.message);
      }

      if (user) {
        console.log(prisma.exists.Profile);
        const { uid } = user;
        let profile = null;
        try {
          profile = await prisma.exists.Profile({
            uid,
          });
        } catch (error) {
          console.log(error);
          profile = null;
        }

        console.log(profile);

        if (!profile || profile && !profile.is_complete) {
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