import './configs/db/mongo';

import { crawlFlightData } from './helpers/crawl-data-func';

import schedule from 'node-schedule';
 
schedule.scheduleJob('0 0 * * *', function(){
    crawlFlightData();
});