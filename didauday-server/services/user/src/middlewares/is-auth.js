import serviceAccount from "./keys/serviceAccountKey.json";

import fbAdmin from 'firebase-admin';

fbAdmin.initializeApp(
    {
    credential: fbAdmin.credential.cert(serviceAccount),
    databaseURL: 'https://didauday.firebaseio.com'
    }
);

