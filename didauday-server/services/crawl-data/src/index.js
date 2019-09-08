import mongoConnection from './configs/db/mongo';
import schedule from 'node-schedule';
import { crawlFlightData, saveDataToDB, clearCollection } from './helpers/crawl-data-func';

import Airport from './models/mongo/airport.js';
import Provider from './models/mongo/provider.js';
import City from './models/mongo/city.js';

import airports from './data/mock/airport.js';
import cities from './data/mock/city.js';
import providers from './data/mock/provider.js';


const j = schedule.scheduleJob('0 0 1 * *', function(){
    crawlFlightData();
});

(async () => {
    await mongoConnection;
    // clearCollection(Provider);
    // clearCollection(City);
    // clearCollection(Airport);

    crawlFlightData();
    saveDataToDB(Provider, providers);
    saveDataToDB(City, cities);
    saveDataToDB(Airport, airports);
})()
