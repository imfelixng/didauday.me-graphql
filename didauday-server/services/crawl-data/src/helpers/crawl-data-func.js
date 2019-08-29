import moment from 'moment';

import {
    getTicketOneWay
} from './get-flight-from-url';

import {
    convertMoneyToUSD
} from './convert-money';

import Flight from '../models/mongo/flight';

import airports from '../data/mock/airport';

const saveTicketToDB = async (tickets) => {
    saveDataToDB(Flight, tickets);
};

const getDataOneWay = async () => {
    let count = 0;
    for (let i = 0; i <= 30; i += 1) {
        if (moment().add(i, 'days').get('date') === 1) {
            break;
        }
        count = i;
    }

    for (let i = 1; i <= count; i += 1) {
        const date = moment().add(i, 'days').format('DD/MM/YYYY');
        const arrDate = date.split('/');
        const flightDate = {
            day: arrDate[0],
            month: arrDate[1],
            year: arrDate[2],
        };

        const asyncArr = [];

        for (let j = 0; j < airports.length; j += 1) {
            for (let k = 0; k < airports.length; k += 1) {
                if (airports[j].airport_code !== airports[k].airport_code) {
                    const airportsObj = {
                        from: airports[j].airport_code,
                        to: airports[k].airport_code,
                    };
                    asyncArr.push(getTicketOneWay(flightDate, airportsObj));
                }
            }
        }

        let tickets = [];
        try {
            tickets = await Promise.allSettled(asyncArr);
            console.log("Get OK");
        } catch (error) {
            console.log("Get failed");
        }

        tickets = tickets.filter(ticket => ticket !== null && typeof ticket !== 'undefined');
        tickets = tickets.map((data) => {
            if (data.data.searchResults.connectingFlightRoutes.length === 1) {
                const segment = data.data.searchResults.connectingFlightRoutes[0].segments[0];

                const start_location = data.data.searchResults.connectingFlightRoutes[0].departureAirport;
                const end_location = data.data.searchResults.connectingFlightRoutes[0].arrivalAirport;
                const date_start = moment(`${segment.departureDate.day}/${segment.departureDate.month}/${segment.departureDate.year}`, 'DD/MM/YYYY').format();
                const date_end = moment(`${segment.arrivalDate.day}/${segment.arrivalDate.month}/${segment.arrivalDate.year}`, 'DD/MM/YYYY').format();
                const time_start = {
                    hour: parseInt(segment.departureTime.hour, 10),
                    minute: parseInt(segment.departureTime.minute, 10),
                };
                const time_end = {
                    hour: parseInt(segment.arrivalTime.hour, 10),
                    minute: parseInt(segment.arrivalTime.minute, 10),
                };
                const price = parseInt(convertMoneyToUSD(parseInt(data.data.searchResults.desktopPrice.amount, 10)));
                const provider = segment.airlineCode;
                const flight_id = data.data.searchResults.flightId;
                const name = `${start_location} -> ${end_location}`;
                return {
                    start_location,
                    end_location,
                    date_start,
                    time_start,
                    date_end,
                    time_end,
                    price,
                    provider,
                    flight_id,
                    name
                };
            }
        });

        if (tickets.length > 0) {
            try {
                await saveTicketToDB(tickets);
                console.log("Save OK");
            } catch (error) {
                console.log("Save failed");
            }
        }
    }
};

const saveDataToDB = async (model, datas) => {
    const asyncArr = datas.map(data => {
        return model.create(data);
    });

    try {
        await Promise.all(asyncArr);
        console.log('Success');
    } catch (error) {
        console.log('Create failed');
    }
}

const crawlFlightData = async () => {
    console.log('Begin crawl');
    clearCollection(Flight);

    try {
        await getDataOneWay();
    } catch (error) {
        console.log(error.message);
    }
}

const clearCollection = async (model) => {
    try {
        await model.collection.drop();
    } catch(error) {
        model.createCollection();
    }
}

export {
    crawlFlightData,
    saveDataToDB,
    clearCollection
}