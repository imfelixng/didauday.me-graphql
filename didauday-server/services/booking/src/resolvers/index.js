import { merge } from 'lodash';

import queryResolver from './query.js';
import mutationResolver from './mutation.js';

const rootResolvers = {};

const resolvers = merge(rootResolvers, queryResolver, mutationResolver);

export default resolvers;
