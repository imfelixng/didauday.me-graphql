import Neode from 'neode';
import Profile from '../../models/neo4j/profile';

let instance = null;
try {
    instance = new Neode.fromEnv().with({
        Profile,
    });;
} catch (error) {
    throw new Error(error);
}

console.log("Connect neo4j db success");

export default instance;