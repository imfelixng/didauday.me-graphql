import { isAuth } from '../middlewares/is-auth';

const resolvers = {
    Mutation: {
        createTour: async (parent,
            {
                data
            },
            {
                req,
                mongo
            },
            info
        ) => {
            let user = null;
            try {
                user = await isAuth(req);
            } catch (error) {
                throw new Error(error.message);
            }

            const newTour = new mongo.Tour(
                {
                    ...data,
                    available: data.group_size,
                    owner: user.uid,
                }
            );

            let tourCreated = null;
            try {
                tourCreated = await newTour.save();
            } catch (error) {
                console.log(error);
                throw 'Can\'t create new tour. Please try again later';
            }

            if (!tourCreated) {
                throw 'Can\'t create new tour. Please try again later';
            }

            return tourCreated;
        },
        updateTour: async (parent,
            {
                tour_id,
                data
            },
            {
                req,
                mongo
            },
            info
        ) => {
            let user = null;
            try {
                user = await isAuth(req);
            } catch (error) {
                throw new Error(error.message);
            }

            let tourUpdated = null;
            try {
                tourUpdated = await mongo.Tour.findByIdAndUpdate(tour_id, { ...data }, { new: true });
            } catch (error) {
                console.log(error);
                throw 'Can\'t update tour. Please try again later';
            }

            if (!tourUpdated) {
                throw 'Can\'t update tour. Please try again later';
            }
            
            return tourUpdated;
        },
        deleteTour: async (parent,
            {
                tour_id,
            },
            {
                req,
                mongo
            },
            info
        ) => {
            let user = null;
            try {
                user = await isAuth(req);
            } catch (error) {
                throw new Error(error.message);
            }

            let tourDeleted = null;
            try {
                tourDeleted = await mongo.Tour.findByIdAndRemove(tour_id);
            } catch (error) {
                console.log(error);
                throw 'Can\'t delete tour. Please try again later';
            }

            if (!tourDeleted) {
                throw 'Can\'t delete tour. Please try again later';
            }

            return tourDeleted;
        },
    },
};

export default resolvers;
  