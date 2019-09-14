import { merge } from 'lodash';

import queryResolver from './query.js.js';
import mutationResolver from './mutation.js.js';

const rootResolvers = {};

const resolvers = merge(rootResolvers, queryResolver, mutationResolver);

export default resolvers;
