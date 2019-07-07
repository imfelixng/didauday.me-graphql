import { merge } from 'lodash';

import tourResolver from './tour.js.js';

const rootResolvers = {};

const resolvers = merge(rootResolvers, tourResolver);

export default resolvers;
