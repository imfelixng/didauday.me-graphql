import { merge } from 'lodash';

import authResolver from './auth.js';

const rootResolvers = {};

const resolvers = merge(rootResolvers, authResolver);

export default resolvers;
