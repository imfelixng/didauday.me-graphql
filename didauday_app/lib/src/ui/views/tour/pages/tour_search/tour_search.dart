import 'dart:io';

import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_webservice/places.dart';

class TourSearch extends StatefulWidget {
  @override
  _TourSearchState createState() => _TourSearchState();
}

class _TourSearchState extends State<TourSearch> {
  @override
  Widget build(BuildContext context) {
    final String kGoogleApiKey = Platform.isAndroid
        ? DotEnv().env['GOOGLE_MAP_KEY_ANDROID']
        : DotEnv().env['GOOGLE_MAP_KEY_IOS'];
    GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/tour/search/filter');
            },
            child: Icon(Icons.filter_list),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextField(
                readOnly: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  hintText: 'Input destination name',
                  prefixIcon: Icon(Icons.search),
                ),
//              onTap: () async {
//                Prediction p = await PlacesAutocomplete.show(
//                    context: context,
//                    apiKey: kGoogleApiKey,
//                    onError: (e) {
//                      print(e.errorMessage);
//                    },
//                    mode: Mode.overlay, // Mode.fullscreen
//                    language: "vn",
//                    components: [new Component(Component.country, "vn")]);
//                if (p != null) {
//                  // get detail (lat/lng)
//                  PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
//                  print(detail.result.geometry.location);
//                  print(p.description);
//                }
//              },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          )
                        ]),
                    margin: EdgeInsets.only(bottom: index != 19 ? 15 : 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              image: DecorationImage(
                                image: NetworkImage(ImageMock.img_tour),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 150 - 20,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey[400],
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Da Nang, Viet Nam')
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Text(
                                  'New York: Museum of Modern Art',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  RatingBar(
                                    initialRating: 3.5,
                                    itemSize: 20,
                                    allowHalfRating: true,
                                    tapOnlyMode: true,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text('12 reviews'),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '\$ 50',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '\$100',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      '-50%',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
