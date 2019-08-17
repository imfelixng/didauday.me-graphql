import { fbAdmin } from '../configs/firebase';

const getUserByUid = async (uid) => {
    let user = null;
    try {
        user = await fbAdmin.auth();
    } catch (error) {
        console.log(error);
        user = null;
    }
}

