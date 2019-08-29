import rp from 'request-promise';

const getTicketOneWay = async (flightDate, airports) => {
  const payload = {
    clientInterface: 'desktop',
    data:
      {
        currency: 'VND',
        destinationAirportOrArea: airports.to,
        flightDate: { ...flightDate },
        locale: 'en_VN',
        newResult: true,
        numSeats: {
          numAdults: '1',
          numChildren: '0',
          numInfants: '0',
        },
        seatPublishedClass: 'ECONOMY',
        seqNo: null,
        sortFilter: {
          filterAirlines: [],
          filterArrive: [],
          filterDepart: [],
          filterTransit: [],
          selectedDeparture: '',
          sort: null,
        },
        sourceAirportOrArea: airports.from,
        searchId: null,
        usePromoFinder: false,
        useDateFlow: false,
      },
    fields: [],
  };

  const options = {
    method: 'POST',
    uri: 'https://www.traveloka.com/api/v2/flight/search/oneway',
    body: payload,
    headers: {
      'content-type': 'application/json',
      'x-domain': 'flight',
      cookie: '__flash={}; _ga=GA1.2.1691088660.1547885749; G_ENABLED_IDPS=google; ajs_user_id=null; ajs_group_id=null; _gcl_au=1.1.71061295.1547885750; ajs_anonymous_id=%2222cd0cec-44f6-485d-b616-235075147875%22; __ssid=2b0aea1d065aa080eeed784e7a3e193; cto_lwid=2c92f225-9868-47d5-a006-9cad2d48279e; ab-testingGroup.testingWebTreatmentA=testingWebControlA; ab-testingGroup.testingWebTreatmentB=testingWebControlB; ab-testingGroup.testingMWebTreatmentA=testingMWebDefaultA; ab-testingGroup.testingMWebTreatmentB=testingMWebDefaultB; ab-flight.international-roundtrip=existing; ab-payment.paymentflow=existing; ab-promoBanner.promoNewExperience=promoNewExperience1; ab-userGroup.dora_id_mweb=current; tv-pnheader=1; _gid=GA1.2.1817038044.1548215244; _gac_UA-29776811-1=1.1548220108.Cj0KCQiAm5viBRD4ARIsADGUT26vuxBwJlr3k7SC-GNwaCZTkONZX4A0xXRUhNDDnba5prIwJ5n01_IaAlRCEALw_wcB; _gcl_aw=GCL.1548220108.Cj0KCQiAm5viBRD4ARIsADGUT26vuxBwJlr3k7SC-GNwaCZTkONZX4A0xXRUhNDDnba5prIwJ5n01_IaAlRCEALw_wcB; selectedCurrency=VND; tv-repeat-visit=true; useDateFlow=false; usePromoFinder=null; flightSourceAirport=HAN; flightDestinationAirport=SGN; flightNumOfAdults=1; flightNumChildren=0; flightNumInfants=0; flightSeatClassType=ECONOMY; flexibility=0; tvs=aHiviipoLebGMEC5qT/rF2AASlrq0ThlTbE/jXVznJHKYR93HL1Ufbx5Xjko0dRGMDFc3WZ3PEUseupxXPYmfG45C5CRsA9qK3xgDGOv5AWFaPkdLGbRkqJFuV0RPWFqbY95iDWxCvaH/AgGMjI9DRcIQrJFnRdMHDaWLO1gEMVgkPtbOBKVLM8yxFYEDO4m3jW7f6f85zK7XA1xLrLbn3wpMY91AYFzJ6h8za/vSrnqDlY26eY/bwMK2Y7r9t1q; _fbp=fb.1.1548343147306.1397234857; flightFlightType=ROUNDTRIP; accomSuccessLoginConfirmation=0; flightDepartureDate=25-01-2019; flightReturnDate=27-01-2019; lux_uid=154834929733525934; _gat_UA-29776811-1=1; tvl=UgjrHQI29GvRLMAgFICqOm9OGr8RQzQItpJjjkaJuskHUhJKz+1BoXpjQ8ko3dXyk80RpZKLILpx/JKJCLVRUOBHnJjlZ5PhnYlmGXelOyICiBH4xHlH/j2zQoQB/adoykRHHrUFFsJh6IsDe223WWuJlTPIoD9abqH+9elXCiSLgVBH9waRbnwHAK6BUhhkHP/nk76YFDUXpPXhqbigNrHbhvngWsWKDtY3owB6lIAgy8wa9wwDBf3ht/xgDQAYRlv3hvKL2CDJjjw/ZIlNpQ==',
    },
    json: true,
  };

  return rp(options);
};

const getTicketReturn = async (flightDates, airports) => {
  const payload = {
    clientInterface: 'desktop',
    data: {
      airportOrAreaCodes: [airports.from, airports.to],
      currency: 'VND',
      destinationAirportOrArea: airports.to,
      dates: [...flightDates],
      flightDate: { ...flightDates[1] },
      locale: 'vi_VN',
      newResult: true,
      numSeats: {
        numAdults: '1',
        numChildren: '0',
        numInfants: '0',
      },
      seatPublishedClass: 'ECONOMY',
      seqNo: null,
      sortFilter: {
        filterAirlines: [],
        filterArrive: [],
        filterDepart: [],
        filterTransit: [],
        selectedDeparture: '',
        sort: null,
      },
      sourceAirportOrArea: airports.from,
      searchId: null,
      usePromoFinder: false,
      useDateFlow: false,
    },
    fields: [],
  };

  const options = {
    method: 'POST',
    uri: 'https://www.traveloka.com/api/v2/flight/search/return2w',
    body: payload,
    headers: {
      'content-type': 'application/json',
      'x-domain': 'flight',
      cookie: '__flash={}; _ga=GA1.2.1691088660.1547885749; G_ENABLED_IDPS=google; ajs_user_id=null; ajs_group_id=null; _gcl_au=1.1.71061295.1547885750; ajs_anonymous_id=%2222cd0cec-44f6-485d-b616-235075147875%22; __ssid=2b0aea1d065aa080eeed784e7a3e193; cto_lwid=2c92f225-9868-47d5-a006-9cad2d48279e; _gac_UA-29776811-1=1.1548220108.Cj0KCQiAm5viBRD4ARIsADGUT26vuxBwJlr3k7SC-GNwaCZTkONZX4A0xXRUhNDDnba5prIwJ5n01_IaAlRCEALw_wcB; _gcl_aw=GCL.1548220108.Cj0KCQiAm5viBRD4ARIsADGUT26vuxBwJlr3k7SC-GNwaCZTkONZX4A0xXRUhNDDnba5prIwJ5n01_IaAlRCEALw_wcB; _fbp=fb.1.1550315233058.801630045; liveagent_oref=https://www.traveloka.com/en-vn/flight; liveagent_vc=2; liveagent_ptid=64800fb8-2b8d-4ba1-aedc-89d4397b45c7; tv-pnheader=1; ab-testingGroup.testingWebTreatmentA=testingWebControlA; ab-testingGroup.testingWebTreatmentB=testingWebControlB; ab-testingGroup.testingMWebTreatmentA=testingMWebDefaultA; ab-testingGroup.testingMWebTreatmentB=testingMWebDefaultB; ab-flight.international-roundtrip=existing; ab-payment.paymentflow=existing; ab-promoBanner.promoNewExperience=promoNewExperience1; ab-userGroup.dora_id_mweb=current; _gid=GA1.2.26507276.1552976882; lux_uid=155298047844250154; tv-repeat-visit=true; isPriceFinderActive=null; dateIndicator=null; bannerMessage=null; displayPrice=null; flightSourceAirport=HAN; flightDestinationAirport=SGN; flightNumOfAdults=1; flightNumChildren=0; flightNumInfants=0; flightSeatClassType=ECONOMY; flexibility=0; tvs=aHiviipoLebGMEC5qT/rF2AASlrq0ThlTbE/jXVznJFNsbs8391SqNsKI0ZqRYWBlHxDiTscNEnC2v835EZ66BdRz0s5Atua4plQMkEHnHSFaPkdLGbRkqJFuV0RPWFqbY95iDWxCvaH/AgGMjI9DRcIQrJFnRdMHDaWLO1gEMVgkPtbOBKVLM8yxFYEDO4m3jW7f6f85zK7XA1xLrLbn3wpMY91AYFzJ6h8za/vSrnqDlY26eY/bwMK2Y7r9t1q; flightFlightType=ROUNDTRIP; _gat_UA-29776811-1=1; flightDepartureDate=23-03-2019; flightReturnDate=25-03-2019; datadome=1qeVhxoMgJ-BIF~a4_cfFG7R.PZB4o2eRMLKepNX9ae; tvl=UgjrHQI29GvRLMAgFICqOm9OGr8RQzQItpJjjkaJuskHUhJKz+1BoXpjQ8ko3dXyxpAK24XbABdBaOHB/NiEyKiSzxlsSgKv0t10QCnGGaEfL1I+nmKEdnTR5yo0cWBhBCM6k1w9pVn2uBI7kWMfXmuJlTPIoD9abqH+9elXCiTjv40vwJt7Ow61oTNYo3iTlzGw19mthDmpAv399wbARzwdE9LlHxksI46JfLkrajxb1DI/vNWOrIdiZpnql2a+Rlv3hvKL2CDJjjw/ZIlNpQ==',
    },
    json: true,
  };

  let data = null;

  try {
    data = await rp(options);
  } catch (error) {
    console.log(error);
  }

  if (!data) {
    return [];
  }

  return data.data.searchResults;
};

export {
  getTicketOneWay,
  getTicketReturn
}