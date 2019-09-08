import { fbAdmin } from '../configs/firebase';

const isAuth = async (req) => {
    const authHeader = req.headers.authorization || '';
    const token = authHeader ? authHeader.split(' ')[1] : '';

    if (!token || token === '') {
        throw new Error('Authentication is required');
    }

    console.log(token);

    let decodedToken = null;
    try {
        decodedToken = await fbAdmin.auth().verifyIdToken(token);
    } catch (error) {
        console.log(error);
        throw new Error('Authentication is required');
    }

    return decodedToken;
}

export {
    isAuth
}
