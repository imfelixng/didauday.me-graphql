const resolvers = {
  Query: {
    city: async (parent, { city_id }, { mongo }, info) => {
      let city = null;

      try {
        city = await  mongo.City.findById(city_id);
      } catch (error) {
        throw new Error('City not found!');
      }

      if (!city) {
        throw new Error('City not found!');
      }

      return city;
    },
    cities: async (parent, { filter, pagi }, { mongo }, info) => {
      const current = pagi && pagi.current || 1;
      const limit = 10;

      const filter_data = filter ? { ...filter } : null;

      let where = filter_data ? {
        keyword: filter_data.keyword,
      } : {};
      
      let cities = [];
      let citiesTotal = 0;
      try {
        cities = await mongo.City.find(where)
          .limit(limit)
          .skip((current - 1)*limit);
          citiesTotal = await mongo.City.countDocuments(where);
      } catch (error) {
        cities = [];
        citiesTotal = 0;
      }

      return {
        _meta: {
          current,
          limit: cities.length,
          total: citiesTotal,
        },
        data: cities,
      }
    },
    place: async (parent, { place_id }, { mongo }, info) => {
      let place = null;

      try {
        place = await  mongo.Place.findById(place_id);
      } catch (error) {
        throw new Error('Place not found!');
      }

      if (!place) {
        throw new Error('Place not found!');
      }
      
      return place;
    },
    places: async (parent, { filter, pagi }, { mongo }, info) => {
      const current = pagi && pagi.current || 1;
      const limit = 10;

      const filter_data = filter ? { ...filter } : null;

      let where = filter_data ? {
        keyword: filter_data.keyword,
        city: filter_data.city
      } : {};
      
      let places = [];
      let placesTotal = 0;
      try {
        places = await mongo.Place.find(where)
          .limit(limit)
          .skip((current - 1)*limit);
          placesTotal = await mongo.Place.countDocuments(where);
      } catch (error) {
        places = [];
        placesTotal = 0;
      }

      return {
        _meta: {
          current,
          limit: places.length,
          total: placesTotal,
        },
        data: places,
      }
    }
  },
};

export default resolvers;
