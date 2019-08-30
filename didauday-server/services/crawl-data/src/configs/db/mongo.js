import  mongoose from 'mongoose';

mongoose.connect(`${process.env.MONGO_URL}/${process.env.MONGO_DB_NAME}`, {useNewUrlParser: true, useFindAndModify: false});

export default mongoose;