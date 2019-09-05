import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:didauday_app/src/ui/views/tour/pages/tour_detail/widgets/dialog_info.dart';
import 'package:didauday_app/src/ui/views/tour/pages/tour_detail/widgets/place_map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TourDetail extends StatefulWidget {
  @override
  _TourDetailState createState() => _TourDetailState();
}

class _TourDetailState extends State<TourDetail> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(16.0544, 108.2022);
  final Set<Marker> _markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers..add(
        Marker(
          markerId: MarkerId('non_nuoc_da_nang'),
          position: LatLng(16.0045, 108.2618),
        ),
      )
        ..add(
          Marker(
            markerId: MarkerId('linh_ung_da_nang'),
            position: LatLng(16.1003, 108.2779),
          ),
        )
        ..add(
          Marker(
            markerId: MarkerId('ba_na_da_nang'),
            position: LatLng(15.9977, 107.9881),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: CarouselSlider(
                        autoPlay: true,
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                height: 400,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      ImageMock.img_tour,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back, color: Colors.white,),),
                            Icon(Icons.favorite, color: Colors.red),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Two Hour Walking Tour of Manhattan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on, color: Colors.grey[500],),
                          SizedBox(
                            width: 10,
                          ),
                          Text('New York, United States',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20,),
                        decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.grey),
                              bottom: BorderSide(color: Colors.grey),
                            )
                        ),
                        child: Wrap(
                          runSpacing: 10,
                          children: <Widget>[
                            Container(
                              width: (MediaQuery.of(context).size.width - 20) / 2,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    size: 40,
                                    color: Colors.blue[400],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Duration',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('10 hours',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width - 20) / 2,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    size: 40,
                                    color: Colors.blue[400],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Tour type',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Specific Tour',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width - 20) / 2,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.people,
                                    size: 40,
                                    color: Colors.blue[400],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Group Size',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('10 People',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width - 20) / 2,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.chat,
                                    size: 40,
                                    color: Colors.blue[400],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Languages',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('VN',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Itinerary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 300,
                        color: Colors.green,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Place\'s location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 200,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                          ),
                          myLocationButtonEnabled: false,
                          mapToolbarEnabled: false,
                          onTap: (latLng) {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (BuildContext context) {
                                  return PlaceMapView();
                                },
                                fullscreenDialog: true
                            ));
                          },
                          markers: _markers,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300], width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: '3.2', style: TextStyle(fontSize: 30)),
                                  TextSpan(text: '/5'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Very Good', style: TextStyle(fontSize: 16,),),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: 'Based on ', style: TextStyle(fontSize: 16)),
                                  TextSpan(text: '3 reviews', style: TextStyle(color: Colors.blue,)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]),
                                )
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.account_circle, size: 48,),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('An Nguyen Quang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                    RatingBar(
                                                      initialRating: 4,
                                                      itemSize: 20,
                                                      itemBuilder:
                                                          (context, _) =>
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.amber,
                                                          ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Good', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Best choise'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Text('22/09/2019', style: TextStyle(fontSize: 16),),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey[300]),
                                  )
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.account_circle, size: 48,),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('An Nguyen Quang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                    RatingBar(
                                                      initialRating: 4,
                                                      itemSize: 20,
                                                      itemBuilder:
                                                          (context, _) =>
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.amber,
                                                          ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Good', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Best choise'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Text('22/09/2019', style: TextStyle(fontSize: 16),),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey[300]),
                                  )
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.account_circle, size: 48,),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('An Nguyen Quang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                    RatingBar(
                                                      initialRating: 4,
                                                      itemSize: 20,
                                                      itemBuilder:
                                                          (context, _) =>
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.amber,
                                                          ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Good', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Best choise'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Text('22/09/2019', style: TextStyle(fontSize: 16),),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/tour/detail/reviews');
                              },
                              child: Text('View all reviews',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'You might also like',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 350,
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 250,
                                    margin: EdgeInsets.only(
                                        right: index != 2 ? 20 : 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(3, 3),
                                          blurRadius: 6,
                                        )
                                      ]
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 180,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      ImageMock
                                                          .img_tour),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                BorderRadius.only(
                                                    topLeft: Radius
                                                        .circular(
                                                        5),
                                                    topRight: Radius
                                                        .circular(
                                                        5)),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              child: Container(
                                                padding: EdgeInsets
                                                    .symmetric(
                                                  vertical: 5,
                                                  horizontal: 10,
                                                ),
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      topRight: Radius
                                                          .circular(
                                                          5)),
                                                ),
                                                child: Text(
                                                  '-20%',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomLeft: Radius
                                                    .circular(5),
                                                bottomRight:
                                                Radius.circular(
                                                    5)),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 20,
                                                    color: Colors
                                                        .grey[300],
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Đà Nẵng, Việt Nam',
                                                    style: TextStyle(
                                                      color: Colors
                                                          .black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'American Parks Trail end Rapid City',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                ),
                                                maxLines: 2,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  RatingBar(
                                                    initialRating: 4.5,
                                                    itemSize: 20,
                                                    allowHalfRating:
                                                    true,
                                                    itemBuilder:
                                                        (context, _) =>
                                                        Icon(
                                                          Icons.star,
                                                          color:
                                                          Colors.amber,
                                                        ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text('12 reviews')
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons
                                                            .access_time,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('6 days')
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .end,
                                                    children: <Widget>[
                                                      Text(
                                                        '\$500',
                                                        style:
                                                        TextStyle(
                                                          color: Colors
                                                              .red,
                                                          decoration:
                                                          TextDecoration
                                                              .lineThrough,
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        'From \$400',
                                                        style:
                                                        TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    blurRadius: 5,
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('\$500',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'From  ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                            TextSpan(text: '\$400',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            constraints: BoxConstraints(
                              maxHeight: 220,
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Text('-20%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(text: 'From  ',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              TextSpan(text: '\$500',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ),
                                              TextSpan(text: '  \$400',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(CupertinoPageRoute(
                                            builder: (BuildContext context) {
                                              return DialogInfo();
                                            },
                                            fullscreenDialog: true
                                        ));
                                      },
                                      color: Colors.deepOrange,
                                      child: Text('Check', style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Date',
                                      hintText: 'Chọn ngày khởi hành'
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Person',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        RaisedButton(
                                          color: Colors.blue,
                                          onPressed: () {

                                          },
                                          child: Text('-',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('1',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        RaisedButton(
                                          color: Colors.blue,
                                          onPressed: () {

                                          },
                                          child: Text('+',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    color: Colors.deepOrange,
                    child: Text('BOOK NOW', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
