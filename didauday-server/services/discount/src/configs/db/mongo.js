import  mongoose from 'mongoose';

mongoose.connect(`${process.env.MONGO_URL}/${process.env.MONGO_DB_NAME}`, {useNewUrlParser: true, useFindAndModify: false})
.then(() => {
    console.log('Connect mongo db success');
})
.catch(err => {
    throw new Error(err);
});

export default mongoose;