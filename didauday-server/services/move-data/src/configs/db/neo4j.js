import Neode from 'neode';
import Profile from '../../models/neo4j/profile';

export default new Neode.fromEnv().with({
    Profile,
});