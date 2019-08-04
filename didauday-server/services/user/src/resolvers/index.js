import { merge } from 'lodash';

import userResolver from './user.js';

const rootResolvers = {};

const resolvers = merge(rootResolvers, userResolver);

export default resolvers;
