import { merge } from 'lodash';

import tourResolver from './tour.js';

const rootResolvers = {};

const resolvers = merge(rootResolvers, tourResolver);

export default resolvers;
