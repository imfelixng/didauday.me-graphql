export default {
    _id: {
        type: 'string',
        primary: true,
        index: true,
    },
    email: {
        type: 'string',
    },
    firstname: {
        type: 'string',
    },
    lastname: {
        type: 'string',
    },
    birthday: {
        type: 'string',
    },
    avatar: {
        type: 'string',
    },
    gender: {
        type: 'string',
    },
    address: {
        type: 'string',
    },
    phone_number: {
        type: 'string',
    },
    role: {
        type: 'number',
    },
    live: {
        type: 'relationship',
        relationship: 'LIVES',
        direction: 'out',
        properties: {
            since: {
                type: 'localdatetime',
                default: () => new Date,
            },
        },
    },
    createdAt: {
        type: 'datetime',
        default: () => new Date,
    },
    updateAt: {
        type: 'datetime',
        default: () => new Date,
    }
};
