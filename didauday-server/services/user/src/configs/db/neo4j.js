import Neode from 'neode';

let instance = null;

try {
    instance = new Neode.fromEnv();
} catch (err) {
    throw new Error(err);
}

console.log("Connect neo4j db success");

export default instance;