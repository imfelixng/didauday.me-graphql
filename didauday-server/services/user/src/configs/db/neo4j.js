import Neode from 'neode';
import Profile from '../../models/neo4j/profile';

console.log(process.env.NEO4J_HOST);

const instance = new Neode.fromEnv().with({
    Profile,
});;

console.log("Connect neo4j db success");

export default instance;