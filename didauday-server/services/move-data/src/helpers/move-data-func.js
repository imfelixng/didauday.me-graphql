import instance from '../configs/db/neo4j';
import Profile from '../models/mongo/profile';

const moveDataPerson = async () => {
    console.log('Running...');
    let profiles = [];
    try {
        profiles = await Profile.find({});
    } catch (error) {
        console.log(error);
        profiles = [];
    }

    const asyncProfiles = profiles.map(profile => {
        const _id = profile._id.toString();
        return instance.merge('Profile', {
            _id: _id,
            email: profile.email,
            firstname: profile.firstname,
            lastname: profile.lastname,
            birthday: profile.birthday,
            avatar: profile.avatar,
            gender: profile.gender,
            address: profile.address,
            phone_number: profile.phone_number,
            role: profile.role,
            createdAt: profile.createdAt,
            updateAt: profile.updateAt,
        });
    });

    let results = [];

    try {
        results = await Promise.all(asyncProfiles)
    } catch (error) {
        console.log(error);
        results = [];
    }

    console.log(results);

}

export {
    moveDataPerson
}