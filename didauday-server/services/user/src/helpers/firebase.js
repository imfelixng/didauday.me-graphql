import { fbAdmin } from '../configs/firebase';

const getUserByEmail = async (email) => {
    let user = null;
    try {
        user = await fbAdmin.auth().getUserByEmail(email);
    } catch (error) {
        user = null;
    }
    return user;
}

export {
    getUserByEmail,
}

