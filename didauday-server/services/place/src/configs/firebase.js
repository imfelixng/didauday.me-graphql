import serviceAccount from "./keys/serviceAccountKey.json";

import admin from 'firebase-admin';

const fbAdmin = admin.initializeApp(
    {
    credential: admin.credential.cert(serviceAccount),
    databaseURL: 'https://didauday.firebaseio.com'
    }
);

export {
    fbAdmin,
}