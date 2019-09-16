import moment from 'moment';

import {
    getTicketOneWay
} from './get-flight-from-url';

import {
    convertMoneyToUSD
} from './convert-money';

import Flight from '../models/mongo/flight';
import City from '../models/mongo/city';
import Airport from '../models/mongo/airport';
import Provider from '../models/mongo/provider';

import airports from '../data/mock/airport';

const saveTicketToDB = async (tickets) => {
    console.log('Crawl data start!');
    const asyncArr = tickets.map(async (ticket) => {
      const providerItem = await Provider.findOne({ code: ticket.provider_code });
      const startLocationItem = await Airport.findOne({ airport_code: ticket.start_location_code });
      const endLocationitem = await Airport.findOne({ airport_code: ticket.end_location_code });

      const data = {
        ...ticket,
        provider: providerItem._id,
        start_location: startLocationItem.airport_code,
        end_location: endLocationitem.airport_code,
      }

      return Flight.findOneAndUpdate(
        { flight_id: ticket.flight_id },
        data,
        { upsert: true },
      );
    });

    try {
      await Promise.all(asyncArr);
    } catch (error) {
      console.log('Save to db failed');
    }

  };
  
  const getDataOneWay = async () => {
    let count = 0;
    for (let i = 0; i <= 30; i += 1) {
      if (moment().add(i, 'days').get('date') === 1) {
        break;
      }
      count = i;
    }
  
    for (let i = 0; i <= count; i += 1) {
      const date = moment().add(i, 'days').format('DD/MM/YYYY');
      const arrDate = date.split('/');
      const flightDate = {
        day: arrDate[0],
        month: arrDate[1],
        year: arrDate[2],
      };
  
      for (let j = 0; j < airports.length; j += 1) {
        for (let k = 0; k < airports.length; k += 1) {
          if (airports[j].airport_code !== airports[k].airport_code) {
            const airportsObj = {
              from: airports[j].airport_code,
              to: airports[k].airport_code,
            };
  
            let rawTickets = [];
            try {
              rawTickets = await getTicketOneWay(flightDate, airportsObj);
            } catch (error) {
              rawTickets = [];
            }

            let tickets = rawTickets.map((ticket) => {
              if (ticket.connectingFlightRoutes.length === 1) {
                const segment = ticket.connectingFlightRoutes[0].segments[0];
  
                const start_location_code = ticket.connectingFlightRoutes[0].departureAirport;
                const end_location_code = ticket.connectingFlightRoutes[0].arrivalAirport;
                const date_start = moment(`${segment.departureDate.day}/${segment.departureDate.month}/${segment.departureDate.year}`, 'DD/MM/YYYY').valueOf() / 1000;
                const date_end = moment(`${segment.arrivalDate.day}/${segment.arrivalDate.month}/${segment.arrivalDate.year}`, 'DD/MM/YYYY').valueOf() / 1000;
                
                const time_start = {
                  hour: parseInt(segment.departureTime.hour, 10),
                  minute: parseInt(segment.departureTime.minute, 10),
                };
                const time_end = {
                  hour: parseInt(segment.arrivalTime.hour, 10),
                  minute: parseInt(segment.arrivalTime.minute, 10),
                };
                const price = parseInt(convertMoneyToUSD(parseInt(ticket.desktopPrice.amount, 10)));
                const provider_code = segment.airlineCode;
                const flight_id = ticket.flightId;
                const name = `${start_location} -> ${end_location}`;
                return {
                  start_location: start_location_code,
                  end_location: end_location_code,
                  date_start,
                  time_start,
                  date_end,
                  time_end,
                  price,
                  provider_code,
                  flight_id,
                  name
                };
              }
            });
            tickets = tickets.filter(ticket => ticket != null && (typeof ticket !== 'undefined'));
  
            if (tickets.length > 0) {
              try {
                await saveTicketToDB(tickets);
              } catch (error) {
                console.log("Save failed");
              }
            }
          }
        }
      }
    }
  };

const saveDataToDB = async (model, datas, type) => {
  let asyncArr = [];

  if (type === 'city') {
    asyncArr = datas.map(data => {
      const where = {
        "provider": {
          code: data.code
        },
        "city": {
          zipcode: data.zipcode
        },
        "airport": {
          airport_code: data.airport_code,
        }
      }
      return model.findOneAndUpdate(where[type], data, { upsert: true });
    });
  }

  if (type === 'provider') {
    asyncArr = datas.map(data => {
      const where = {
        "provider": {
          code: data.code
        },
        "city": {
          zipcode: data.zipcode
        },
        "airport": {
          airport_code: data.airport_code,
        }
      }
      return model.findOneAndUpdate(where[type], data, { upsert: true });
    });
  }

  if (type === 'airport') {
    asyncArr = datas.map(async (data) => {
      const where = {
        "provider": {
          code: data.code
        },
        "city": {
          zipcode: data.zipcode
        },
        "airport": {
          airport_code: data.airport_code,
        }
      }
      const cityItem = await City.findOne({ zipcode: data.city_zipcode });
      if (cityItem) {
        const dataItem = {
          ...data,
          city: cityItem._id,
        }
        return model.findOneAndUpdate(where[type], dataItem, { upsert: true });
      }
      return null;
    });
  }


  try {
      await Promise.all(asyncArr);
      console.log('Success ' + type);
  } catch (error) {
    console.log(error);
      console.log('Create failed');
  }
}

const crawlFlightData = async () => {
    console.log('Begin crawl');
    clearCollection(Flight);

    try {
        await getDataOneWay();
    } catch (error) {
        console.log("Get data failed");
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