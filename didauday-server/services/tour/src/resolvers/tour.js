import crypto from 'crypto';
import os from 'os';

import { find, filter } from 'lodash';

// generate a hah Guid to identify the current process
const parts = [os.hostname(), process.pid, +new Date()];
const hash = crypto.createHash('md5').update(parts.join(''));
const digest = hash.digest('hex');

// mock data
const posts = [
  {
    id: 1,
    authorId: 1,
    title: 'Cool first post',
    content: 'Hey, this is the first post from our post service'
  },
  {
    id: 2,
    authorId: 2,
    title: 'Cool second post',
    content: 'Hey, this is the second post from our post service',
    hash: digest
  },
  {
    id: 3,
    authorId: 2,
    title: 'Cool third post',
    content: 'Hey, this is the third post from our post service',
    hash: digest
  },
  {
    id: 4,
    authorId: 3,
    title: 'Cool fourth post',
    content: 'Hey, this is the fourth post from our post service',
    hash: digest
  }
];

// add some small resolvers
const resolvers = {
  Query: {
    allPosts: () => posts,
    post: (_, { id }) => find(posts, { id }),
    postsByAuthorId: (_, { authorId }) => filter(posts, { authorId: authorId }),
    identifier: () => ({
      hash: digest
    })
  },
  Post: {
    __resolveReference({ id }) {
      return find(posts, { id });
    },
    author: ({ authorId }) => ({ __typename: 'User', id: authorId })
  },
  User: {
    posts: ({ id }) => filter(posts, { authorId: id })
  }
};

export default resolvers;
